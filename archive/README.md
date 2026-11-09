# archive/

**Done or parked.** Where finished work goes to rest. Nothing here is deleted,
just out of the way.

Suggested layout (create folders as you need them):

```
archive/
├── ventures/<name>/     ← a closed or paused venture, with a closeout note
├── missions/            ← finished missions, if you want them out of missions/
└── inbox/YYYY-MM/       ← processed captures you don't want in inbox/ anymore
```

When you archive a venture, add a short closeout to its `README.md`: when, why,
what was delivered, and what the relationship looks like going forward.

Wiki pages for archived things stay in `wiki/`, with `status: archived`, so
links keep working and your AI still knows the history.

This folder is gitignored in the public kit (except this README). If your copy
is a **private** repo, remove the `archive/*` lines from `.gitignore`.
