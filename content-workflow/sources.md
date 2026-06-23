# Research watchlist → moved to Notion

> **Canonical sources now live on the Notion "Sources to scrape" page** (inside the Content Engine workspace), including the curated X handle list. Add or edit sources there, not here. This file is kept only as a thin offline pointer so it does not drift from Notion.

## How Quill should use this

When running research (`commands/research-news.md` or the `daily.md` loop):

1. `fetch` the Notion **Sources to scrape** page first. It groups sources by purpose: primary signal (papers & releases), curation & analysis, practitioner blogs, community pulse (HN, Reddit, the curated X list), and Vivek's own work.
2. WebFetch the web sources from that page; identify items from the last 7 days.
3. Filter to Vivek's pillars: agents/MCP, RAG, software engineering craft, ecosystem takes, plus his own work.
4. Return a digest of 5–8 items: source + date + 1-line summary + suggested Vivek-angle.
5. Land worthwhile angles as `Idea` rows in the Notion Content Pipeline (that is the control plane), tagged to a pillar.

**Constraint:** Notion database queries are Enterprise-gated, but the Sources page is a normal page and `fetch`es fine.

**X note:** Quill cannot read X directly without auth. The curated handles to watch live on the Notion Sources page; when something interesting drops there, Vivek pastes the post/URL manually. Don't pretend to know what's trending on X.
