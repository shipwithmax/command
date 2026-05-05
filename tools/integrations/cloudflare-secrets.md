# Cloudflare secrets — the binding pattern

> Pattern for keeping deployed secrets off your filesystem entirely. Recommended for Workers, Pages Functions, and anything else running on Cloudflare.

---

## Why bindings beat `.env` for deployed code

A `.env` file lives on disk. Anything with filesystem access — your AI agent, a process you forgot was running, a backup tool — can read it. For local dev, that's a tradeoff you accept (with the secrets folder + agent path block pattern documented in `CLAUDE.md`).

For **deployed** code, you don't need to make that trade. Cloudflare stores the secret encrypted, injects it at runtime, and never writes it to disk in your project. Your code reads it via the binding (`env.SECRET_NAME`). The agent browsing your repo sees `env.ANTHROPIC_API_KEY` — it does not see the value.

This is the default for any deployed code in this template.

---

## The flow

### 1. Set the secret via wrangler (one-time per env)

```bash
cd ventures/<your-worker>/
wrangler secret put ANTHROPIC_API_KEY
# wrangler prompts for the value — paste it once, never write it to a file
```

For multiple environments:

```bash
wrangler secret put ANTHROPIC_API_KEY --env production
wrangler secret put ANTHROPIC_API_KEY --env staging
```

### 2. Read it in code via the binding

```js
export default {
  async fetch(request, env, ctx) {
    const key = env.ANTHROPIC_API_KEY;
    // use it — it was injected at runtime, not loaded from disk
  }
}
```

In a Pages Function:

```js
export const onRequest = async ({ env, request }) => {
  const key = env.ANTHROPIC_API_KEY;
  // ...
};
```

### 3. Never declare the secret as a `var` in `wrangler.toml`

`[vars]` entries are **plaintext and committed**. Use `[vars]` only for non-sensitive config (feature flags, public URLs). Use `wrangler secret put` for anything sensitive.

```toml
# wrangler.toml — OK
[vars]
PUBLIC_API_URL = "https://api.example.com"
FEATURE_FLAG_NEW_UI = "true"

# wrangler.toml — DO NOT do this
# [vars]
# ANTHROPIC_API_KEY = "sk-ant-..."     # ← committed plaintext, NO
```

### 4. Local dev — use `.dev.vars` (gitignored)

For `wrangler dev`, secrets come from `.dev.vars` in the worker directory. This file is gitignored by Cloudflare's default templates, but verify your `.gitignore` covers it:

```
# wrangler dev local secrets
.dev.vars
.dev.vars.*
```

Same content shape as `.env`:

```
ANTHROPIC_API_KEY=sk-ant-...
RESEND_API_KEY=re_...
```

The agent path block in your `CLAUDE.md` should also list `.dev.vars` patterns so agents don't read them locally.

---

## Listing and rotating secrets

```bash
# List secrets (names only — values never displayed)
wrangler secret list

# Rotate
wrangler secret put ANTHROPIC_API_KEY     # paste new value when prompted
# Old value is replaced immediately. Worker picks up the new value on next request.

# Delete
wrangler secret delete ANTHROPIC_API_KEY
```

---

## R2, D1, KV — same idea, different binding name

For databases and object storage, you bind the *resource itself*, not a secret string:

```toml
# wrangler.toml
[[d1_databases]]
binding = "DB"
database_name = "my-db"
database_id = "abc-123-..."

[[r2_buckets]]
binding = "ASSETS"
bucket_name = "my-bucket"

[[kv_namespaces]]
binding = "CACHE"
id = "def-456-..."
```

Then in code:

```js
const result = await env.DB.prepare("SELECT * FROM users").all();
const obj = await env.ASSETS.get("path/to/file.png");
const cached = await env.CACHE.get("session:abc");
```

No connection strings on disk, no credentials in code. Auth is handled by Cloudflare's IAM between your worker and the resource.

---

## When you still need a `.env`

Local CLI tools, build scripts, dev servers, anything running outside a Cloudflare Worker — those still need secrets at the OS level. Use the `~/<your-name>-secrets/secrets.env` pattern from the main `CLAUDE.md`, with the agent path block enforcing read-blocks. Don't put a `.env` in the repo "just for local convenience."

---

## Quick checklist

- [ ] Secrets set via `wrangler secret put`, not `[vars]`
- [ ] `.dev.vars` gitignored AND listed in agent path block
- [ ] No connection strings or API keys in `wrangler.toml`
- [ ] Code reads from `env.SECRET_NAME`, never from `process.env` or a file path
- [ ] `wrangler secret list` matches what you expect — no orphan secrets, no missing ones
