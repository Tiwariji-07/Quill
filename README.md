# Quill

A personal content workspace for drafting, tracking, and publishing LinkedIn, X, and Medium posts. Engineered for one user (Vivek), opinionated about voice and pillars, built on Claude Code.

Quill is the **drafting engine**. The control plane — pipeline, ideas, sources, scheduling, and metrics — lives in the Notion "Content Engine" workspace. Quill reads work from Notion, drafts in Vivek's voice, and pushes drafts back. (Notion database queries are Enterprise-gated, so recency/pillar analytics run on the local `index.json` cache.)

It also supports managed brand/page workspaces for projects that should not use Vivek's personal voice, such as Talk Beyond Code.

## How to use

### The daily command (your one entry point)

```bash
cd content-workflow/
claude "$(cat commands/daily.md)"
```

Quill checks cadence, scans news (if you opt in), pulls open ideas from the Notion pipeline, proposes 0–5 candidates, and asks if anything is worth drafting today. If yes, it interviews you (for own-work pillars) or drafts directly (for trend takes). If nothing lands, it logs the "no post today" reason and exits. Run this every morning.

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

# When you want a long-form Medium deep dive
claude "$(cat commands/draft-medium.md)
Topic: how we built a multi-source RAG service with RRF + streaming citations"

# To score an existing draft
claude "$(cat commands/voice-check.md)
Draft: <paste or filename>"
```

### Managed pages

Talk Beyond Code lives under `content-workflow/pages/talkbeyondcode/`.

Use this for LinkedIn company page content, podcast launch planning, page profile notes, brand rules, and the page-specific publishing ledger.

```bash
cd content-workflow/

# Scaffold a company page draft
./scripts/new-draft.sh linkedin "episode 1 launch" --page talkbeyondcode

# Guided LinkedIn company page draft
claude "$(cat commands/draft-page-linkedin.md)
Page: talkbeyondcode
Topic: episode 1 launch"
```

Page drafts are saved to:

```text
pages/talkbeyondcode/linkedin/drafts/
```

Published page posts are tracked in:

```text
pages/talkbeyondcode/linkedin/index.json
```

### Publishing
After editing a draft in your editor:
```bash
./scripts/publish.sh linkedin drafts/2026-05-20-rag-pipeline.md
```
Moves the file to `linkedin/published/` and updates `linkedin/index.json`. Works the same for `twitter` and `medium`:
```bash
./scripts/publish.sh medium drafts/2026-06-20-multi-source-rag.md
```

For Talk Beyond Code:

```bash
./scripts/publish.sh linkedin drafts/2026-06-12-episode-1-launch.md --page talkbeyondcode
```

This moves the file inside `pages/talkbeyondcode/linkedin/` and updates that page's `index.json`.

### Weekly review
```bash
claude "$(cat commands/weekly-review.md)"
```
Reads the index.json ledgers, reports pillar balance, suggests next 2 posts.

## File layout

See `CLAUDE.md` at the root.

## Two-mode design

- Working at `Quill/` root → dev mode (no voice rules loaded)
- Working at `Quill/content-workflow/` → content mode (voice rules auto-loaded)
