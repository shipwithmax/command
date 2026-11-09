# Cloudflare secrets: the binding pattern

> A reference pattern for keeping secrets off your disk once your code is
> deployed. Written for Cloudflare Workers and Pages Functions. AWS Secrets
> Manager, GCP Secret Manager, Vercel and Render env vars work the same way.
>
> Part of the secrets rule in [`docs/secrets.md`](../../docs/secrets.md).

---

## Why bindings beat `.env` for deployed code

A `.env` file lives on disk. Anything that can read your disk can read it:
your AI agent, a backup tool, a script you forgot about. For local work you
accept that trade, with the outside-the-folder secrets pattern and the agent
read blocks in `docs/secrets.md`.

For **deployed** code you don't have to make that trade. Cloudflare stores the
secret encrypted and hands it to your code at runtime. Your code reads
`env.SECRET_NAME`. An agent browsing your repo sees the name, never the value.

## The flow

### 1. Set the secret with wrangler

```bash
cd ventures/<your-worker>/
wrangler secret put ANTHROPIC_API_KEY
# wrangler asks for the value. Paste it once. Never write it to a file.
```

One per environment if you have several:

```bash
wrangler secret put ANTHROPIC_API_KEY --env production
wrangler secret put ANTHROPIC_API_KEY --env staging
```

### 2. Read it through the binding

```js
export default {
  async fetch(request, env, ctx) {
    const key = env.ANTHROPIC_API_KEY;
    // injected at runtime, never loaded from disk
  },
};
```

In a Pages Function:

```js
export const onRequest = async ({ env, request }) => {
  const key = env.ANTHROPIC_API_KEY;
};
```

### 3. Never put a secret in `[vars]`

`[vars]` in `wrangler.toml` (or `vars` in `wrangler.jsonc`) is **plain text and
committed**. Use it only for things that are safe to publish.

```toml
# OK
[vars]
PUBLIC_API_URL = "https://api.example.com"
FEATURE_NEW_UI = "true"

# NO: this commits your key in plain text
# [vars]
# ANTHROPIC_API_KEY = "sk-ant-..."
```

### 4. Local dev uses `.dev.vars`

`wrangler dev` reads local secrets from `.dev.vars` in the worker folder. The
kit's `.gitignore` already covers `.dev.vars` and `.dev.vars.*`. Check yours
does too.

Add `.dev.vars` to your agent read blocks as well (the example settings in
[`tools/hooks/`](../hooks/) already do).

## List, rotate, delete

```bash
wrangler secret list                    # names only, never values
wrangler secret put ANTHROPIC_API_KEY   # rotate: paste the new value
wrangler secret delete ANTHROPIC_API_KEY
```

A rotated value takes effect on the next request.

## Databases and storage: bind the resource, not a password

For D1, R2 and KV you bind the resource itself. There is no connection string
to leak.

```toml
[[d1_databases]]
binding = "DB"
database_name = "my-db"
database_id = "<your-database-id>"

[[r2_buckets]]
binding = "FILES"
bucket_name = "my-bucket"

[[kv_namespaces]]
binding = "CACHE"
id = "<your-namespace-id>"
```

```js
const rows = await env.DB.prepare("SELECT * FROM notes").all();
const file = await env.FILES.get("path/to/file.png");
const hit  = await env.CACHE.get("session:abc");
```

Resource IDs are not secrets, but they do identify your account. Keep them out
of public repos and out of your command folder if it is public.

## When you still need a `.env`

Local CLI tools, build scripts and dev servers still need secrets on your
machine. Use the outside-the-folder pattern from
[`docs/secrets.md`](../../docs/secrets.md). Don't put a `.env` in the repo "just
for convenience."

## Checklist

- [ ] Secrets set with `wrangler secret put`, never in `[vars]`
- [ ] `.dev.vars` gitignored and in your agent read blocks
- [ ] No keys or connection strings in `wrangler.toml` / `wrangler.jsonc`
- [ ] Code reads `env.SECRET_NAME`, never a file path
- [ ] `wrangler secret list` shows what you expect: nothing missing, nothing stale
- [ ] Deploys are run by you, not the agent (see [`docs/agent-autonomy.md`](../../docs/agent-autonomy.md))
