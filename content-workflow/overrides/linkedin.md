# LinkedIn — Vivek-specific overrides

The `linkedin-posts` skill handles platform mechanics (char limits, hooks, algorithm). This file is for **Vivek's deltas only.**

## Length mapping (by pillar)

| Pillar | Target chars |
|--------|-------------|
| Architecture breakdown | 600–900 |
| Lessons from shipping | 400–700 |
| Trend take | 600–1000 |
| Behind the build | 800–1200 |

These override the skill's generic "1300–1600 sweet spot." Vivek's audience prefers tighter.

## Posting schedule

- **Best days:** Tuesday or Wednesday
- **Best time:** 8:00–10:00 AM IST
- **Golden hour:** Vivek stays online for 30–60 min after posting to reply to early comments. Don't suggest posts at times he can't be online.

## Hashtags

- Maximum 3. Always at the end of the post.
- Default tag pool: `#LangGraph` `#RAG` `#AIEngineering` `#MCP` `#AgenticAI` `#LLM` `#pgvector`
- Pick 2–3 that match the post's actual topic. Don't add tags that aren't relevant.

## Links

- **Never** in the post body. The skill says this; it remains the hardest rule.
- If a link is needed, the draft must include a `## First comment` section with the link + a one-line context.

## Closing

- Always end with a genuine question. Not a CTA.
- The question must be answerable by a peer engineer in 1–2 sentences.
- Bad: "What do you think?" / "Has anyone else faced this?" (too generic)
- Good: "If you've shipped a reranker swap in prod, did you A/B against the old one or just cut over?"

## Format rules

- Short paragraphs (1–2 sentences each). Big walls of text die on mobile.
- One blank line between paragraphs.
- Bullets allowed only if the post is a list-of-findings (Lessons pillar). Never for narrative posts.
- No carousels by default. If a topic genuinely needs visuals, flag it and ask Vivek before drafting.

## Pillar-specific notes

- **Architecture breakdown:** Always include at least one number, name, or benchmark. Without specificity it becomes generic.
- **Lessons from shipping:** Must contain an "I was wrong about X" or "what I'd do differently" moment.
- **Trend take:** First sentence should NOT be the news summary. Lead with the engineering angle; let the news be context.
- **Behind the build:** OK to be longer (up to 1200). Pace it like a short story — setup, complication, resolution, takeaway.
