# Quill — operator guide

Quill is Vivek's content management workspace. It helps him draft, track, and publish content for LinkedIn and X (Twitter).

**This file is for the dev/operator agent — me (Claude Code) — when working at the repo root.** It does NOT contain content voice rules. Those live in `content-workflow/CLAUDE.md` and only auto-load when working inside that subdirectory.

## Two modes

| Mode | Working directory | Purpose |
|------|------------------|---------|
| **Building Quill** | `Quill/` (root) | Fix scripts, evolve schemas, edit commands, change structure |
| **Using Quill** | `Quill/content-workflow/` | Draft, research, publish content. Voice rules auto-load here. |

If the user is drafting content from the root, suggest `cd content-workflow/` and restart so the voice rules load.

## Repo layout

```
Quill/
├── CLAUDE.md                    # this file — dev/operator
├── README.md                    # how Vivek uses Quill
└── content-workflow/            # the content app itself
    ├── CLAUDE.md                # voice + pillars (auto-loads when cwd is here)
    ├── voice.md                 # detailed voice doc
    ├── pillars.md               # 4 content pillars
    ├── stack.md                 # Vivek's tech stack (for specificity)
    ├── never-say.md             # banned phrases
    ├── overrides/               # platform-specific Vivek deltas
    ├── sources.md               # research watchlist
    ├── ideas/inbox.md           # raw idea capture
    ├── linkedin/                # drafts + published + index.json ledger
    ├── twitter/                 # drafts + published + index.json ledger
    ├── commands/                # reusable prompt templates
    └── scripts/                 # new-draft.sh, publish.sh
```

## Conventions when editing Quill itself

- Don't add files Vivek didn't ask for. Quill is small on purpose.
- Filename convention for drafts: `YYYY-MM-DD-kebab-heading.md` with frontmatter.
- `index.json` is the source of truth for what's been published. Scripts must update it atomically.
- Bash scripts are POSIX-friendly; target zsh on macOS but avoid bash-only syntax where easy.
- Never write to `published/` directly; only `publish.sh` should move files there.

## What this file is NOT

Not the voice guide. Not the pillar list. Not the posting rules. Those exist deliberately one directory deeper so they don't pollute dev work.
