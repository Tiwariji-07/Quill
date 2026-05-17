# Quill

A personal content workspace for drafting, tracking, and publishing LinkedIn and X posts. Engineered for one user (Vivek), opinionated about voice and pillars, built on Claude Code.

## How to use

### The daily command (your one entry point)

```bash
cd content-workflow/
claude "$(cat commands/daily.md)"
```

Quill checks cadence, scans news (if you opt in), pulls inbox items, proposes 0–5 candidates, and asks if anything is worth drafting today. If yes, it interviews you (for own-work pillars) or drafts directly (for trend takes). If nothing lands, it logs the "no post today" reason and exits. Run this every morning.

### Direct commands (when you know what you want)

```bash
# When you have a specific idea already
claude "$(cat commands/draft-linkedin.md)
Topic: switching from Jina reranker to bge-reranker-v2-m3"

# When you want the bot to interview you
claude "$(cat commands/interview.md)"

# When you've got nothing and need just ideas
claude "$(cat commands/idea-generator.md)"

# When news drops and you want a research pass
claude "$(cat commands/research-news.md)"

# To score an existing draft
claude "$(cat commands/voice-check.md)
Draft: <paste or filename>"
```

### Publishing
After editing a draft in your editor:
```bash
./scripts/publish.sh linkedin drafts/2026-05-20-rag-pipeline.md
```
Moves the file to `linkedin/published/` and updates `linkedin/index.json`.

### Weekly review
```bash
claude "$(cat commands/weekly-review.md)"
```
Reads both index.json files, reports pillar balance, suggests next 2 posts.

## File layout

See `CLAUDE.md` at the root.

## Two-mode design

- Working at `Quill/` root → dev mode (no voice rules loaded)
- Working at `Quill/content-workflow/` → content mode (voice rules auto-loaded)
