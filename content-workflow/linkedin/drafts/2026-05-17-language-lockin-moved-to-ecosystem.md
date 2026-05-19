---
date: 2026-05-17
pillar: lessons
topics: [language-lockin, ecosystem, python, rag]
status: draft
platform: linkedin
heading: The language lock-in didn't disappear, it moved
visual:
  type: d2
  source: assets/diagrams/2026-05-17-language-lockin-moved-to-ecosystem.d2
  file: assets/diagrams/2026-05-17-language-lockin-moved-to-ecosystem.png
---

Simon Willison's coding-agents-killed-language-lock-in argument is right about the code. It misses where the lock-in moved.

A year ago I'd have said the same: pick the best language for now, agents will help you migrate later. Six months of building agentic systems changed my mind.

The code is the cheap part. Python has LangGraph, dspy, ragas, llama-index, a working RAG eval story. TypeScript has fragments. Go and Rust have almost none.

An agent can port my FastAPI handlers to Fiber over a weekend. It can't port the maturity of an eval framework that hasn't been written yet.

Cost of switching languages dropped. Cost of switching ecosystems didn't.

If you've moved an agentic system off Python, what broke first?

#AIEngineering #AgenticAI

## First comment
Context: Simon Willison's May 14 post on coding agents reducing language lock-in. https://simonwillison.net/
