---
date: 2026-05-19
pillar: trend
topics: [open-weight-llms, inference-cost, gpu-economics, kimi-k2, wavemaker-ai]
status: draft
platform: linkedin
heading: Open-weight LLMs are not free
visual:
  type: chart
  primary: assets/diagrams/2026-05-19-open-weight-cost-paths.png
  secondary: assets/charts/2026-05-19-open-weight-llm-6yr-tco.png
---

Open-weight LLMs are free to download. Running them is not.

I've been costing out open-weight options for WaveMaker AI, our internal coding harness, and Kale Bryce's TCO breakdown lined up with what we were seeing. Worth sharing the math.

One person, 6 years of a $200/mo subscription: $14,400.

Same person renting one H100 from a NeoCloud at $2.20/hr, 8 hours a day, weekdays only: $27,456. Run it 24/7: $38,544.

Buy the H100 outright at $30K, add power (350W, 24/7) and PUE 2.0 cooling: ~$37,400 over 6 years. Roughly the same as just renting it.

Now try to actually serve a real open-weight model. Kimi K2 Thinking is 1T params, 32B active across 384 experts. Full precision needs 14 H100s just to fit in VRAM. Quantized to 4-bit, you still need 3 to 8. To get there you buy a DGX H100, ~$300K hardware, ~$400K full TCO over 6 years. Break-even vs subscription is 28 people sharing one box.

And those 28 people share whatever VRAM is left after the model loads. On a 640GB DGX serving Kimi K2, that's ~140GB for KV cache. At 1.7MB per token, the group splits about 80K tokens. Roughly 2,850 per person before someone gets evicted.

The honest read: the license is free, the inference is GPU rental, and the rental only beats subscription if your concurrency is high enough to amortize a card that costs more than a house.

If you've stood up open-weight inference for a real user base, what was your actual breakeven concurrent-user count?

#LLM #AIEngineering #AgenticAI

## First comment
Source video (Kale Bryce's Code): https://www.youtube.com/watch?v=SmYNK0kqaDI

## Notes
- Pillar: trend take, with a thin WaveMaker AI framing to ground it in real work
- Length: ~1280 chars. Down from 1450. Cut the "this is why frontier labs print money" paragraph
- Visuals: two options produced
  - PRIMARY (1st slide): D2 diagram at assets/diagrams/2026-05-19-open-weight-cost-paths.d2 — title-card style "Open-weight LLMs are not free" with 3 cost paths. Render at play.d2lang.com with --theme=200
  - SECONDARY (optional 2nd slide): matplotlib bar chart at assets/charts/2026-05-19-open-weight-llm-6yr-tco.png — same data, more rigorous form
- If posting only one image, use the D2 diagram. It's the hook.
- All numbers from Kale Bryce video transcript; internal Wavemaker deck numbers deliberately not used
