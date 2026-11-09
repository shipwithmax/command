#!/usr/bin/env bash
# guard-commands.sh  (OPTIONAL)
#
# A Claude Code "PreToolUse" hook for the Bash tool. Before your agent runs a
# shell command, this script checks it against a short list of risky patterns.
#
#   BLOCK   force push, broad recursive delete
#   BLOCK   push to main, deploys, reading secret files, printing secrets
#           from the environment, destructive git, destructive SQL,
#           uploading a local file with curl
#   LOG     every block, plus pushes to other branches
#   ALLOW   everything else, silently
#
# A block is not a ban. The agent sees the reason and stops. If you really
# mean it, you run the command yourself in your own terminal.
#
# Safe by default:
#   - It never runs, edits or deletes anything. It reads the command, decides,
#     and appends one line to a log file that lives outside this folder.
#   - It does nothing until you wire it up. See tools/hooks/README.md.
#   - It reads its input with jq or python3 when you have them, and with a
#     plain text match when you don't. If even that fails, it scans the raw
#     text. That can cause a false block. It can't cause a missed one.
#   - It adds about a tenth of a second to each shell command.
#   - Long token-like strings are masked before anything is written to the log.
#
# Settings (optional, as environment variables):
#   COMMAND_GUARD_LOG          log file. Default: ~/.claude/command-guard.jsonl
#   COMMAND_GUARD_ALLOW_MAIN_IN
#                              space-separated folders where pushing straight
#                              to main is fine because nothing deploys from
#                              them, for example your command folder.
#
# Edit the patterns below to fit your stack. Keep the list short. A guard that
# blocks too much gets switched off.

set -u

LOG_FILE="${COMMAND_GUARD_LOG:-$HOME/.claude/command-guard.jsonl}"
ALLOW_MAIN_IN="${COMMAND_GUARD_ALLOW_MAIN_IN:-}"
S='[[:space:]]'

INPUT="$(cat)"

# --- read the command -------------------------------------------------------

PY_GET='
import json, sys
d = json.load(sys.stdin)
for k in sys.argv[1].strip(".").split("."):
    d = d.get(k, "") if isinstance(d, dict) else ""
print(d if isinstance(d, str) else "")
'

raw_field() { # plain-text fallback: $1 is a key like command or cwd
  printf '%s' "$INPUT" | tr '\n' ' ' \
    | sed -n -E "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"(([^\"\\\\]|\\\\.)*)\".*/\\1/p" \
    | sed -e 's/\\n/\
/g' -e 's/\\"/"/g' -e 's/\\\\/\\/g'
}

json_field() { # $1 is a path like .tool_input.command
  if command -v jq >/dev/null 2>&1; then
    printf '%s' "$INPUT" | jq -r "$1 // empty" 2>/dev/null && return 0
  fi
  if command -v python3 >/dev/null 2>&1; then
    printf '%s' "$INPUT" | python3 -c "$PY_GET" "$1" 2>/dev/null && return 0
  fi
  raw_field "${1##*.}"
}

COMMAND="$(json_field .tool_input.command)"
CWD="$(json_field .cwd)"
[ -z "$CWD" ] && CWD="$(pwd)"

if [ -n "$COMMAND" ]; then
  # Drop whole-line comments so a note that only mentions a command is not
  # treated as running it.
  SCAN="$(printf '%s\n' "$COMMAND" | grep -vE '^[[:space:]]*#')"
  [ -z "$SCAN" ] && exit 0
elif printf '%s' "$INPUT" | grep -q '"command"'; then
  # There is a command we could not read. Scan the raw text instead.
  SCAN="$(printf '%s' "$INPUT" | tr '"' ' ')"
else
  exit 0
fi

# --- helpers ----------------------------------------------------------------

has()  { printf '%s' "$SCAN" | grep -qE  "$1"; }
hasi() { printf '%s' "$SCAN" | grep -qiE "$1"; }

mask() {
  sed -E -e 's/[A-Za-z0-9_+=-]{24,}/[masked]/g' \
         -e 's/(_KEY|_TOKEN|_SECRET|PASSWORD)=[^[:space:]"]+/\1=[masked]/g'
}

json_escape() {
  printf '%s' "$1" | tr '\t\r' '  ' | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' \
    | awk 'NR > 1 { printf "\\n" } { printf "%s", $0 }'
}

log_event() { # $1 action, $2 reason
  mkdir -p "$(dirname "$LOG_FILE")" 2>/dev/null || return 0
  local ts text
  ts="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  text="${COMMAND:-$SCAN}"
  text="$(printf '%s' "$text" | head -c 2000 | mask)"
  printf '{"time":"%s","action":"%s","reason":"%s","cwd":"%s","command":"%s"}\n' \
    "$ts" "$1" "$2" "$(json_escape "$CWD")" "$(json_escape "$text")" \
    >> "$LOG_FILE" 2>/dev/null || true
}

block() { # $1 short reason (logged), $2 message for the agent
  log_event BLOCK "$1"
  printf 'BLOCKED by tools/hooks/guard-commands.sh (%s). %s\n' "$1" "$2" >&2
  exit 2
}

main_allowed_here() {
  local p
  for p in $ALLOW_MAIN_IN; do
    p="${p%/}"
    case "$CWD" in "$p"|"$p"/*) return 0 ;; esac
  done
  return 1
}

STOP='(^|[;&|(]|[[:space:]])'   # start of a command word

# --- always blocked ---------------------------------------------------------

if has "git$S+push([[:space:]].*)?$S(--force(-with-lease)?|-f)([[:space:]=]|$)" \
   || has "git$S+push([[:space:]].*)?$S\+[[:alnum:]]"; then
  block "force push" "Force push rewrites shared history. Never via the agent."
fi

if has "${STOP}rm$S+(-[[:alnum:]-]+$S+)*(-[[:alnum:]]*[rR][[:alnum:]]*|--recursive)$S+(-[[:alnum:]-]+$S+)*(/|~|\\\$HOME|\\\$\{HOME\}|\*|\.\.?($S|/?$))"; then
  block "broad recursive delete" "Recursive delete on an absolute, home, wildcard or parent path. Use a specific relative path, or run it yourself."
fi

# --- blocked, run it yourself if you mean it --------------------------------

PUSH_MAIN=0
if has "git$S+push([[:space:]].*)?(^|[^[:alnum:]_/.-])(main|master)([^[:alnum:]_/.-]|$)"; then
  PUSH_MAIN=1
elif has "git$S+push($S+(-u|--set-upstream|-v|--verbose|origin))*$S*($|[;&|])"; then
  BRANCH="$(git -C "$CWD" symbolic-ref --short HEAD 2>/dev/null || true)"
  case "$BRANCH" in main|master) PUSH_MAIN=1 ;; esac
fi
if [ "$PUSH_MAIN" -eq 1 ]; then
  if main_allowed_here; then
    log_event ALLOW "push to main (folder is in COMMAND_GUARD_ALLOW_MAIN_IN)"
  else
    block "push to main" "Main is production. Push a branch and open a pull request instead."
  fi
fi

if has "wrangler$S+(deploy([^[:alnum:]-]|$)|versions$S+deploy|pages$S+(deploy|publish)|rollback)" \
   || has "vercel($S+deploy)?$S+(.*$S)?--prod" \
   || has "netlify$S+deploy$S+(.*$S)?--prod" \
   || has "${STOP}(fly|flyctl|firebase)$S+deploy" \
   || has "${STOP}(npm|pnpm|yarn|bun)$S+(run$S+)?deploy([^[:alnum:]-]|$)"; then
  block "deploy" "This changes what is live. Deploys are the captain's call."
fi

SECRET_FILE='(\.env(\.[[:alnum:]_-]+)?|\.dev\.vars|\.pem|\.key|\.p12|\.pfx|id_rsa|id_ed25519|credentials[[:alnum:]_.-]*|auth\.json|secrets\.env)'
if has "${STOP}(cat|less|more|head|tail|bat|nl|strings|base64|xxd|od|open|code|vi|vim|nano|emacs|grep|rg|awk|sed|cp|scp|source|\.)$S+(.*[[:space:]/=\"'])?[[:alnum:]_.-]*${SECRET_FILE}([[:space:]\"';|&)]|$)"; then
  block "secret file" "Agents never read credential files. Open it yourself if you need to."
fi

if has "${STOP}(env|printenv|set|export$S+-p)$S*($|[;&|>])" \
   || has "${STOP}printenv$S+[A-Z0-9_]*(KEY|TOKEN|SECRET|PASSWORD)" \
   || has "${STOP}(echo|printf)$S.*\\\$\{?[A-Z0-9_]*(KEY|TOKEN|SECRET|PASSWORD)"; then
  block "secrets in environment" "Printing environment variables can put keys in the transcript."
fi

if has "git$S+(reset$S+(.*$S)?--hard|clean$S+(.*$S)?-[[:alnum:]]*f|checkout$S+(--$S+)?\.($S|$)|restore$S+(.*$S)?\.($S|$))"; then
  block "destructive git" "This throws away uncommitted work. Run it yourself if you are sure."
fi

SQL_END="$S*([;\"'\`]|\$)"
if hasi "DROP$S+(TABLE|DATABASE|SCHEMA)$S" \
   || hasi "TRUNCATE$S+(TABLE$S+)?[[:alnum:]_.\"\`]+$SQL_END" \
   || hasi "DELETE$S+FROM$S+[[:alnum:]_.\"\`]+($SQL_END|$S+WHERE)"; then
  block "destructive SQL" "Deleting data is the captain's call. Run it yourself after a backup."
fi

if has "curl$S+(.*$S)?(-T$S|--upload-file|(-F|--form)$S*[^[:space:]]*=@|(-d|--data|--data-binary|--data-raw|--data-urlencode)$S*@)"; then
  block "upload a local file" "Sending files to a URL needs the captain's OK (no exfiltration)."
fi

# --- allowed, but logged -----------------------------------------------------

if [ "$PUSH_MAIN" -eq 0 ] && has "git$S+push"; then
  log_event ALLOW "git push (not main)"
fi

exit 0
