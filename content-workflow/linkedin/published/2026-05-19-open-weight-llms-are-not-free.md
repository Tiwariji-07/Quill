---
date: 2026-05-19
pillar: trend
topics: [open-weight-llms, inference-cost, gpu-economics, kimi-k2, wavemaker-ai]
status: published
platform: linkedin
heading: Open-weight LLMs are not free
visual:
  type: chart
  primary: assets/diagrams/2026-05-19-open-weight-cost-paths.png
  secondary: assets/charts/2026-05-19-open-weight-llm-6yr-tco.png
---

Open-weight LLMs are free to download. Running them is not.

We've been costing open-weight options for WaveMaker AI, our internal coding harness. Kale Bryce's TCO breakdown matched what we were seeing.

One person, 6 years at $200/mo: $14,400.

Rent one H100 from a NeoCloud at $2.20/hr, 8 hours weekdays: $27,456 over 6 years. Buy at $30K plus power and PUE 2.0 cooling: ~$37,400. Rent vs own lands in the same band.

Kimi K2 Thinking (1T params, 32B active) needs a DGX H100: ~$400K full TCO over 6 years. Break-even vs subscription is about 28 people on one box. Those 28 split leftover VRAM for KV cache. On 640GB, roughly 2,850 tokens per person before eviction.

GPU spend only beats subscription when concurrent usage amortizes a box that costs more than a house.

If you've stood up open-weight inference for a real user base, what was your actual breakeven concurrent-user count?

#LLM #AIEngineering

## First comment
Source video (Kale Bryce's Code): https://www.youtube.com/watch?v=SmYNK0kqaDI

## Notes
- Pillar: trend take, with a thin WaveMaker AI framing to ground it in real work
- Length: ~889 chars (trend-take target 600–1000). Trimmed rent/buy merge, Kimi paragraph, dropped "honest read" closer
- Visuals: two options produced
  - PRIMARY (1st slide): D2 diagram at assets/diagrams/2026-05-19-open-weight-cost-paths.d2 — title-card style "Open-weight LLMs are not free" with 3 cost paths. Render at play.d2lang.com with --theme=200
  - SECONDARY (optional 2nd slide): matplotlib bar chart at assets/charts/2026-05-19-open-weight-llm-6yr-tco.png — same data, more rigorous form
- If posting only one image, use the D2 diagram. It's the hook.
- All numbers from Kale Bryce video transcript; internal Wavemaker deck numbers deliberately not used
