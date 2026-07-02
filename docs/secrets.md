# Secrets handling — non-negotiable

> This is the one rule with no exceptions. Read it once; live by it forever.

**Secrets never live inside this folder.** No API keys, passwords, `.env` files,
private keys, or OAuth tokens — ever. The `.gitignore` blocks common patterns
(`.env`, `*.pem`, `*.key`, `credentials*`, `secrets*`) as a safety net, but the
real protection is the habit: **secrets live outside.**

## Why this matters more than it sounds

1. **Git history is forever.** Commit a token once, delete it in the next commit,
   and it's *still* in history — anyone who clones any past commit gets it. Public
   repos get scraped for tokens within minutes by bots.
2. **AI agents read your folder.** If your AI can read the folder, it can
   accidentally include a credential in a summary, a log, or a message to someone
   else. Keep secrets outside and that whole class of leak is impossible.
3. **Fast rotation.** When a key is compromised you want to rotate it in one
   place, now — not hunt through scattered repos.
4. **OS-enforced permissions.** A folder at `~/<your-name>-secrets/` with
   `chmod 700` is owner-only, enforced by the operating system.
5. **Git is the wrong tool for keys.** You don't want a *history* of every key
   you've used. You want the current one, in one place, easy to rotate.

## The pattern

```
~/<your-name>-secrets/                  (chmod 700, owner-only)
├── README.md                            (documentation — fine to read)
├── secrets.env                          (chmod 600, owner-only)
└── .gitignore                           (ignores everything, even if you git init here)
```

Load a secret at the moment of use, via shell substitution — never `cat`,
`echo`, or paste it into a transcript:

```bash
export ANTHROPIC_API_KEY=$(grep '^ANTHROPIC_API_KEY=' ~/<your-name>-secrets/secrets.env | cut -d'=' -f2-)
```

Treat every API key like a password. Because it is one.
