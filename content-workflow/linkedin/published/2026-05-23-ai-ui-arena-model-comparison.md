---
date: 2026-05-23
pillar: behind-the-build
topics: [ai-ui-arena, ui-generation, model-comparison, frontend-design-skills, react]
status: published
platform: linkedin
heading: AI UI Arena model comparison
---

Comparing AI-generated UIs from screenshots in memory is a bad eval, so I built a small arena for it.

Same brief. Same canvas. Six models. Three raw variants each.

I also kept the coding harness constant: every variant was generated inside Cursor, with the model as the main variable. That does not make it a perfect benchmark, but it removes one big source of noise.

The first pass has 18 pages generated without any frontend design skill loaded, including newer coding models from Cursor, Google, and xAI:

GPT-5.5
Claude Opus 4.7
Gemini 3.5 Flash
Gemini 3.1 Pro
Grok Build 0.1
Cursor Composer 2.5

The interesting part is how different the failures are.

Some models understand hierarchy but over-polish the page. Some get visual density right but miss product clarity. Some produce a clean first screen and then run out of ideas halfway down the page.

The site is React, TypeScript, Tailwind CSS, and Vite. Each model gets its own route, variant tabs, and a raw / with-skill toggle. The design-skill pass is still empty on purpose. I want the comparison to show the baseline first, then show what changes when the same model gets stronger frontend context.

That second pass is the part I am most curious about.

If you compare AI coding models for frontend work, do you judge the final screenshot first, or do you inspect the component structure before deciding?

#AIEngineering #LLM #Frontend

## First comment
Live site: https://ai-ui-arena.vercel.app/

Repo: https://github.com/Tiwariji-07/ai-ui-arena.git

## Media plan
- Primary media: upload a native 30-45 second screen recording. Start on the home page, click into 2-3 model pages, switch variant tabs, and briefly show the raw / with-skill toggle with the placeholder. Native video should be attached to the LinkedIn post, not linked.
- Backup media: if you do not want a video, attach 3 screenshots as images: home grid, one strong model variant, one contrasting model variant. Keep the first screenshot visually clean because it becomes the feed anchor.
- Link placement: do not put the site or GitHub URL in the post body. Put both in the first comment, exactly as above. If you want one link preview instead of native media, paste only the live site URL in the LinkedIn composer, let the preview load, then remove the URL from the body.
- Alt text: describe the arena and visible controls, for example: "AI UI Arena showing six model cards and variant comparison controls for generated landing pages."

## Notes
- Pillar: behind-the-build.
- Length: ~1,230 chars before hashtags.
- Hook: concrete personal reason plus specific object built.
- Suggested publish window: Tuesday or Wednesday, 8:00-10:00 AM IST, with 30-60 minutes free for replies.
