#!/usr/bin/env bash
# guard-placement.sh  (OPTIONAL)
#
# A Claude Code "PreToolUse" hook for the Write and Edit tools. It keeps the
# shape of this folder stable:
#
#   - no new files at the root, except the ones listed below
#   - no new top-level folders, except the ones listed below
#
# CLAUDE.md already asks your agent to follow these rules. This hook enforces
# them. When it blocks a write, the agent sees a suggested place instead.
#
# Safe by default:
#   - It never writes, moves or deletes anything. It only says yes or no.
#   - It only looks at writes inside this folder. Everything else passes.
#   - Editing a file that already exists always passes. Only new files and
#     new folders are checked.
#   - It does nothing until you wire it up. See tools/hooks/README.md.
#
# To allow a new root file or top-level folder, add it to the lists below (and
# write down why in log.md).

set -u

ALLOWED_ROOT_FILES="CLAUDE.md AGENTS.md MEMORY.md index.md log.md README.md LICENSE"
ALLOWED_TOP_DIRS="inbox wiki ventures missions strategy cadence atlas templates tools compute docs archive"

INPUT="$(cat)"

PY_GET='
import json, sys
d = json.load(sys.stdin)
for k in sys.argv[1].strip(".").split("."):
    d = d.get(k, "") if isinstance(d, dict) else ""
print(d if isinstance(d, str) else "")
'

json_field() { # $1 is a path like .tool_input.file_path
  if command -v jq >/dev/null 2>&1; then
    printf '%s' "$INPUT" | jq -r "$1 // empty" 2>/dev/null && return 0
  fi
  if command -v python3 >/dev/null 2>&1; then
    printf '%s' "$INPUT" | python3 -c "$PY_GET" "$1" 2>/dev/null && return 0
  fi
  # Last resort: a plain text match. Good enough for ordinary file paths.
  local key="${1##*.}"
  printf '%s' "$INPUT" | tr '\n' ' ' \
    | sed -n -E "s/.*\"$key\"[[:space:]]*:[[:space:]]*\"([^\"]*)\".*/\1/p"
}

FILE="$(json_field .tool_input.file_path)"
ROOT="${CLAUDE_PROJECT_DIR:-}"
[ -z "$ROOT" ] && ROOT="$(json_field .cwd)"
[ -z "$FILE" ] || [ -z "$ROOT" ] && exit 0

real_path() { # resolve symlinks in the part of a path that already exists
  local p="$1" rest=""
  while [ ! -d "$p" ] && [ "$p" != "/" ]; do
    rest="/${p##*/}$rest"
    p="${p%/*}"
    [ -z "$p" ] && p="/"
  done
  printf '%s%s' "$(cd "$p" 2>/dev/null && pwd -P)" "$rest"
}

ROOT="${ROOT%/}"
REL=""
case "$FILE" in "$ROOT"/*) REL="${FILE#"$ROOT"/}" ;; esac
if [ -z "$REL" ]; then
  # The folder may be reached through a symlink. Compare real paths too.
  REAL_ROOT="$(cd "$ROOT" 2>/dev/null && pwd -P)"
  REAL_FILE="$(real_path "$FILE")"
  if [ -n "$REAL_ROOT" ]; then
    case "$REAL_FILE" in "$REAL_ROOT"/*) REL="${REAL_FILE#"$REAL_ROOT"/}" ;; esac
  fi
fi
[ -z "$REL" ] && exit 0          # not inside this folder
[ -e "$FILE" ] && exit 0         # editing something that already exists

in_list() { # $1 word, $2 list
  local w
  for w in $2; do [ "$w" = "$1" ] && return 0; done
  return 1
}

case "$REL" in
  */*)
    TOP="${REL%%/*}"
    case "$TOP" in .*) exit 0 ;; esac            # .obsidian, .claude, .git
    [ -d "$ROOT/$TOP" ] && exit 0                # folder already exists
    in_list "$TOP" "$ALLOWED_TOP_DIRS" && exit 0
    printf 'BLOCKED by tools/hooks/guard-placement.sh. "%s/" would be a new top-level folder, and the folder set is fixed. Use an existing folder (not sure? inbox/), or ask the captain to add it to the list.\n' "$TOP" >&2
    exit 2
    ;;
  *)
    case "$REL" in .*) exit 0 ;; esac            # dotfiles
    in_list "$REL" "$ALLOWED_ROOT_FILES" && exit 0
    printf 'BLOCKED by tools/hooks/guard-placement.sh. No new files at the root. Suggested path: inbox/%s (see "Where new files go" in CLAUDE.md).\n' "$REL" >&2
    exit 2
    ;;
esac
