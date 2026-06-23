# Quill — operator guide

Quill is Vivek's content management workspace. It helps him draft, track, and publish content for LinkedIn, X (Twitter), and Medium.

**This file is for the dev/operator agent — me (Claude Code) — when working at the repo root.** It does NOT contain content voice rules. Those live in `content-workflow/CLAUDE.md` and only auto-load when working inside that subdirectory.

## Two modes

| Mode | Working directory | Purpose |
|------|------------------|---------|
| **Building Quill** | `Quill/` (root) | Fix scripts, evolve schemas, edit commands, change structure |
| **Using Quill** | `Quill/content-workflow/` | Draft, research, publish content. Voice rules auto-load here. |

If the user is drafting content from the root, suggest `cd content-workflow/` and restart so the voice rules load.

## Notion is the control plane

Quill is the **drafting engine**, not the system of record. The **control plane is the Notion "Content Engine" workspace**: the content pipeline, ideas, sources watchlist, scheduling, and metrics all live and are managed there. Quill's job is to read work from Notion, draft in Vivek's voice, and push drafts back.

- **Positioning:** software engineer first, with deep applied-AI work. Applied AI (RAG, agents, MCP) is the major chunk, but software engineering craft (the `Eng craft` pillar) is core, not a side note.
- **Read constraint:** Notion database *queries* (SQL/view modes) are gated behind a Notion Enterprise plan and fail on this connector. Available ops: `search`, `fetch` by id/URL, and `create`/`update` pages. So Quill can pull a specific pipeline item and write a draft back, but cannot bulk-filter the database. Pillar-balance and recency analytics therefore stay in the local `index.json` cache.
- Don't duplicate Notion-owned state in the repo. `sources.md` and `ideas/inbox.md` are pointers/legacy, not sources of truth.

## Repo layout

```
Quill/
├── CLAUDE.md                    # this file — dev/operator
├── README.md                    # how Vivek uses Quill
└── content-workflow/            # the content app itself
    ├── CLAUDE.md                # voice + operating model (auto-loads when cwd is here)
    ├── voice.md                 # detailed voice doc
    ├── pillars.md               # personal content pillars
    ├── stack.md                 # Vivek's tech stack (for specificity)
    ├── never-say.md             # banned phrases
    ├── diagrams.md              # visual routing policy (sketch/mermaid/chart/table)
    ├── overrides/               # platform-specific Vivek deltas
    ├── sources.md               # POINTER to the Notion sources page (legacy/fallback)
    ├── ideas/inbox.md           # legacy idea log; canonical capture is Notion
    ├── assets/                  # charts/ and diagrams/ output for posts
    ├── linkedin/                # drafts + published + index.json (recency cache)
    ├── twitter/                 # drafts + published + index.json (recency cache)
    ├── medium/                  # long-form deep dives: drafts + published + index.json
    ├── pages/                   # managed brand pages (e.g. talkbeyondcode) — own drafts/published/index per page
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
