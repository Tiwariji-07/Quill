---
date: 2026-05-17
pillar: lessons
topics: [prompts, context-hub, langsmith, rag]
status: draft
platform: linkedin
heading: Prompts in code felt clean. Until it didn't.
---

For a year I believed prompts belonged in code. Versioned with the app, reviewed in PRs. It felt clean.

It stopped feeling clean when our multi-source RAG started sharing system instructions across surfaces. Same paragraph in three places. Someone edited one. Two went stale. A typo fix shipped as a deploy.

LangSmith Context Hub landed this week, and the pitch is exactly that diff: prompts as managed content, fetched at runtime, versioned outside the repo.

I was wrong to assume prompts-in-code would stay clean as agents started sharing fragments. The lock between prompt, eval set, and deploy cadence stops being simple fast.

If you've moved prompts out of your repo, what broke the discipline of re-running evals on every change?

#AIEngineering #LangSmith

## First comment
Context: LangSmith Context Hub announcement (2026-05-13). https://www.langchain.com/blog
