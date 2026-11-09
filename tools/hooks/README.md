# tools/hooks/ (optional)

**You don't need this folder to use `command`.** Skip it until you let an AI
agent run commands on your machine. Then come back.

`CLAUDE.md` *asks* your agent to follow the rules. Hooks *enforce* a few of
them. A hook is a small script your AI tool runs before it acts. If the script
says no, the action doesn't happen, and the agent sees why.

These two are written for **Claude Code**. Other tools have similar features
under other names. The scripts are plain bash, so they are easy to adapt.

| File | What it does |
|---|---|
| `guard-commands.sh` | Checks every shell command before it runs. Blocks force pushes, broad deletes, pushes to `main`, deploys, reading secret files, printing secrets, destructive git and SQL, and uploading local files with `curl`. Logs each block. |
| `guard-placement.sh` | Checks every new file the agent writes. Blocks new files at the root and new top-level folders, and suggests a better place. |
| `settings.example.json` | Wires both hooks up, and adds Claude Code's own rules that stop its file tools from reading `.env`, keys and your secrets folder. |

## Safe by default

- **Off until you turn them on.** Nothing runs until you copy the settings file in.
- **They only say yes or no.** Neither script edits, moves, deletes or sends anything.
- **The log stays outside this folder.** `guard-commands.sh` appends one line
  per block to `~/.claude/command-guard.jsonl`, with long token-like strings
  masked. Set `COMMAND_GUARD_LOG` to put it somewhere else.
- **A block is not a ban.** If you really mean it, run the command yourself in
  your own terminal. The point is that *you* decide, not the agent.

## Turn them on

From the root of your command folder:

```bash
mkdir -p .claude
cp tools/hooks/settings.example.json .claude/settings.json
chmod +x tools/hooks/*.sh
```

Then edit `.claude/settings.json`:

1. Change `~/your-name-secrets/**` to the real path of your secrets folder
   (see [`docs/secrets.md`](../../docs/secrets.md)).
2. Remove any line you don't want.

Start Claude Code in the folder and run `/status` to check the settings loaded.
Try it: ask the agent to run `cat .env`. It should be blocked.

Already have a `.claude/settings.json`? Merge the `permissions` and `hooks`
sections into it instead of copying over it.

## Two layers, on purpose

- **The `permissions.deny` rules** stop Claude Code's own file tools (Read,
  Grep, Glob) from opening secret files. They don't cover shell commands.
- **`guard-commands.sh`** covers the shell side: `cat .env`, `printenv`,
  `source .env`, and so on.

Neither one is perfect. Together with "secrets live outside this folder," they
make an accident unlikely. See [`docs/secrets.md`](../../docs/secrets.md).

## If your command folder is a git repo

The guard blocks pushes to `main` because, in most repos, `main` is what
deploys. Your command folder is usually different: nothing deploys from it, and
committing notes straight to `main` is normal. To allow that in this folder
only, set this before you start your AI tool:

```bash
export COMMAND_GUARD_ALLOW_MAIN_IN="$HOME/command"
```

Say so in `CLAUDE.md` too, so the agent knows the exception is on purpose.

## Tuning

- **Too many false blocks?** Edit the patterns in the script. A guard that
  blocks too much gets switched off, which is worse than a short list.
- **Need a new root file or folder?** Add it to the two lists at the top of
  `guard-placement.sh`, and log why in `log.md`.
- **Review the log** once a month, as part of the security check in
  [`cadence/monthly.md`](../../cadence/monthly.md). Repeated blocks usually
  mean a rule in `CLAUDE.md` is unclear.

## Requirements

`bash`, plus `jq` or `python3` if you have them (it falls back to a plain text
match if you don't). macOS and Linux work as is. On Windows, use WSL or Git
Bash.
