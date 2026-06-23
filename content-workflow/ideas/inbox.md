# Idea inbox (legacy / local scratch)

> **Canonical idea capture now lives in the Notion Content Pipeline** (Status = `Idea`). New ideas go there, not here. This file is kept for the historical daily notes below and as an offline scratchpad when Notion isn't handy.

## Format

One bullet per idea. Optionally tag with pillar.

```
- [lessons] the day i realized NDCG@5 was lying to me
- [arch] how the 4 doc surfaces share an embedding store but diverge on chunking
- [trend] new langgraph release — checkpointer changes matter for long-running agents
- [behind] the 3am rate-limit incident
```

## Inbox

<!-- add ideas below this line -->

- [arch] long-running agent state at scale: "checkpoint everything" doesn't hold up. Tied to LangGraph Delta Channels (2026-05-12).
- [lessons] context layer is the new prompt — what breaks when prompts live in code (LangSmith Context Hub, 2026-05-13)
- [trend] quick take on Delta Channels: state deltas matter for any agent that outlives a request
- [lessons] Simon's language lock-in argument is half-right; where it breaks for prod RAG (simonw 2026-05-14)

## Daily notes

2026-05-17 — drafted: Delta Channels state-not-size (X, trend) + language lock-in moved to ecosystem (LinkedIn, lessons) + prompts-in-code stopped feeling clean (LinkedIn, lessons). Killed earlier Delta Channels LinkedIn draft (no practitioner depth) and swapped in Context Hub angle. First Quill session. Two LinkedIn drafts on the same day overrode the one-per-platform rule by explicit ask. Published: Delta Channels state-not-size (X).
2026-05-23 — no post: cadence is healthy, published history is trend-heavy, and none of today's candidates landed strongly enough to force a LinkedIn draft.
