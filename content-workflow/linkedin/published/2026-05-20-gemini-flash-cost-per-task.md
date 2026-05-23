---
date: 2026-05-20
pillar: trend
topics: [gemini, agentic-coding, model-pricing, token-cost, developer-experience]
status: published
platform: linkedin
heading: Gemini Flash and cost per completed task
visual:
  type: diagram
  file: assets/diagrams/2026-05-20-gemini-flash-cost-per-task.png
---

Gemini 3.5 Flash is fast per token. That does not mean it is fast per agent task.

That difference matters more than the benchmark chart.

Gemini 2.5 Flash was priced at $0.30 input / $2.50 output per 1M tokens. Gemini 3.5 Flash is $1.50 input / $9.00 output per 1M tokens.

On paper, that is 5x input and ~3.6x output.

But agentic coding does not bill on paper. It bills on the full trajectory: planning, tool calls, retries, context recovery, patch generation, and the correction loop after a bad diff.

If the model thinks longer, emits more output tokens, or wanders through tool calls before landing the same refactor, the effective cost per completed task jumps even when token latency looks great.

That is why I am less interested in "Flash" as a latency label and more interested in cost per merged diff.

Fast tokens are useful. Finished work is the metric.

If you are using Gemini for coding agents, are you seeing lower cost per completed task, or just faster token streaming?

#AIEngineering #LLM #AgenticAI

## Notes
- Pillar: trend take.
- Length: ~990 chars before hashtags.
- Visual: use `assets/diagrams/2026-05-20-gemini-flash-cost-per-task.png`.
- Visual source script: `assets/diagrams/2026-05-20-gemini-flash-cost-per-task.py`.
- Source/context: adapted from the Google I/O / Gemini 3.5 Flash X thread.
