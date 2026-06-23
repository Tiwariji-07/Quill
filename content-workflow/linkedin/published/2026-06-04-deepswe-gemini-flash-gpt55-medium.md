---
date: 2026-06-04
pillar: trend
topics: [deepswe, gemini-3-5-flash, gpt-5-5, agentic-coding, benchmark]
status: published
platform: linkedin
heading: DeepSWE shows Gemini Flash cost per completed task
visual:
  type: images
  files:
    - /Users/vivekr_500340/.cursor/projects/var-folders-26-4n8nggnx6dl-qkv-xvtkz63c0000gp-T-a0422c7f-7828-405d-bbed-9d273f8c2b9a/assets/image-ee1c7c6d-d380-41dc-b87f-e053d6380073.png
    - /Users/vivekr_500340/.cursor/projects/var-folders-26-4n8nggnx6dl-qkv-xvtkz63c0000gp-T-a0422c7f-7828-405d-bbed-9d273f8c2b9a/assets/image-74d05b5c-8e15-4ed4-8165-5c6dabcb210b.png
    - /Users/vivekr_500340/.cursor/projects/var-folders-26-4n8nggnx6dl-qkv-xvtkz63c0000gp-T-a0422c7f-7828-405d-bbed-9d273f8c2b9a/assets/image-ea3202ef-5fce-45e0-806b-ea3b84e25f75.png
---

Gemini 3.5 Flash looks fast until you measure completed agent tasks.

That was the point of my earlier post. DeepSWE now gives a cleaner benchmark signal for it.

DeepSWE is built from 113 original long-horizon SWE tasks across 91 repos and 5 languages. Tasks are written from scratch, run through mini-swe-agent, and verified by behavior-focused tests.

That matters because older coding benchmarks are getting easier to game and harder to interpret.

On the May 30 snapshot, Gemini 3.5 Flash Medium scores 28% pass@1.

Average per task:

$7.42
17 minutes
189k output tokens

In the same all-effort chart, GPT-5.5 Medium is around 48% pass@1 while using roughly 10 minutes, under $3 per task, and about 20k output tokens.

That comparison surprised me because GPT-5.5 is the model I would normally put in the expensive bucket.

But for agentic coding, the bill is not the model label. It is the whole trajectory: tokens, tool calls, retries, and whether the diff actually lands.

Fast per token can still be slow per task.

If you are evaluating coding agents internally, do you track cost per completed task or just provider token pricing?

#AIEngineering #LLM #AgenticAI

## First comment

DeepSWE benchmark: https://deepswe.datacurve.ai/

DeepSWE GitHub repo: https://github.com/datacurve-ai/deep-swe

Earlier post this builds on: https://www.linkedin.com/posts/vr384_aiengineering-llm-agenticai-share-7463201806408380416-1VuK/

## Media plan

Attach the three DeepSWE screenshots as native images in this order: cost, time, output tokens.

Alt text: "DeepSWE benchmark charts comparing model pass rate against average cost, wall-clock time, and output tokens per task. Gemini 3.5 Flash Medium scores lower than GPT-5.5 Medium while using more cost, time, and output tokens."

## Notes

- Pillar: trend take.
- Length: ~1,170 chars before hashtags.
- Today: Thursday, June 4, 2026.
- Source checked: DeepSWE official page, updated May 30, 2026.
- Exact official table values for Gemini 3.5 Flash Medium: 28% +/- 4%, $7.42 average cost, 17m average time, 189k output tokens.
- GPT-5.5 Medium values are chart-read approximations from the all-effort images: ~48%, ~10m, <$3 average cost, ~20k output tokens.
- Avoid saying DeepSWE is "perfect." Say it is cleaner or more useful for this comparison because it uses original tasks, broad repo coverage, mini-swe-agent consistency, and behavior-focused verifiers.
