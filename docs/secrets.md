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

## `.gitignore` is a safety net, not a lock

This is the most common misunderstanding. `.gitignore` stops a file from being
**committed**. It does nothing to stop an AI agent from **reading** it. An agent
with access to your disk can open a gitignored `.env` as easily as any other
file.

So the real defense has three layers.

## Layer 1: secrets live outside the folder

```
~/<your-name>-secrets/                  (chmod 700, owner-only)
├── README.md                            (documentation — fine to read)
├── secrets.env                          (chmod 600, owner-only)
└── .gitignore                           (ignores everything, even if you git init here)
```

Load a secret at the moment of use, for one command, via shell substitution.
Never `cat`, `echo`, or paste it into a transcript:

```bash
ANTHROPIC_API_KEY=$(grep '^ANTHROPIC_API_KEY=' ~/<your-name>-secrets/secrets.env | cut -d'=' -f2-) my-tool
```

**Watch your shell environment.** Anything you `export` in your shell profile
"for convenience" is one `env` command away from your agent, and from there
one summary away from a transcript. Prefer per-command loading like the line
above over long-lived exports.

## Layer 2: tell the agent, then enforce it

**Tell it.** `CLAUDE.md` has an "Off-limits paths" block. Fill in the real
path of your secrets folder. That's the rule the agent reads.

**Enforce it.** Rules work most of the time. For secrets, add a lock:

- In **Claude Code**, `permissions.deny` rules such as `Read(**/.env)` stop its
  file tools from opening those files.
- A **hook** can stop shell commands like `cat .env` or `printenv`.

Both are set up for you, optional and off by default, in
[`tools/hooks/`](../tools/hooks/). Other tools have similar settings under
other names.

## Layer 3: deployed code uses platform secrets

For code that runs in the cloud, don't ship a `.env` at all. Store the secret
with your platform and read it at runtime:

- **Cloudflare:** `wrangler secret put NAME`, then `env.NAME` in your Worker.
  Full pattern: [`tools/integrations/cloudflare-secrets.md`](../tools/integrations/cloudflare-secrets.md).
- **AWS:** Secrets Manager plus IAM roles.
- **GCP:** Secret Manager.
- **Vercel, Render, Netlify:** encrypted environment variables in the dashboard.

A secret stored this way never touches a file an agent can browse. There's
nothing to leak.

## The IP carve-out

The folder is your context. That's a great trade for strategy, decisions,
customer notes and marketing: context that makes your AI sharper.

It's a bad trade for the things that *are* your moat:

- Inventions you haven't filed a patent for yet
- Trade-secret recipes, formulas or algorithms
- Non-public financial or deal information
- Anything you're under NDA to protect

Assume anything your agent reads could be seen by the model provider. Terms
differ on retention and review, so take the careful view. Keep moat-grade
material in a separate folder **outside** the agent-readable tree, list it in
the "Off-limits paths" block in `CLAUDE.md`, and block it the same way you
block secrets.

When it's unclear whether something is moat-grade, the agent asks before
saving it.

## Checklist

- [ ] Secrets folder outside this folder, `chmod 700`
- [ ] Real secrets path filled into "Off-limits paths" in `CLAUDE.md`
- [ ] No API keys exported in your shell profile
- [ ] (Optional) `tools/hooks/settings.example.json` copied to `.claude/settings.json`
- [ ] Deployed code reads platform secrets, not `.env` files
- [ ] Moat-grade material in a carve-out folder, also off-limits

Treat every API key like a password. Because it is one.
