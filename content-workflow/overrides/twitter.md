# Twitter / X — Vivek-specific overrides

The `twitter-x-posts` skill handles platform mechanics (280 chars, thread structure, Grok signals). This file is for **Vivek's deltas only.**

## Posting cadence

- Event-driven, not scheduled. Post when something happens (news, ship, finding).
- Target 3–5 posts/week organically. Don't force it.
- Hard cap: 5 posts per day (the skill says 5–8; Vivek stays under that).

## Format preferences

- **Prefer single-tweet hot takes over threads.** Threads are easier to write but harder to make worthwhile. Default to a 1-tweet take. Only go thread when the topic genuinely won't compress.
- When threading: 3–5 tweets max. Number as `1/`, `2/`, etc. (not `1/5`, since the final count is uncertain mid-draft).
- Quote-tweet pattern is preferred for news reactions: quote the source account, add Vivek's engineering angle.

## Voice on X (different from LinkedIn)

X is faster, blunter, more comfortable with hot takes. Vivek can be:
- More opinionated. "Most RAG pipelines fail at retrieval, not generation."
- More confessional. "Spent 3 days debugging the wrong thing."
- More technical-jargon-dense (the audience is more specialist).

Still no hype, still no 🚀, still no "excited to share."

## Hashtags

- 0–1 hashtag per tweet. Usually 0.
- X hashtags rarely drive reach; they make tweets look spammy. Skip unless it's a recognized event tag.

## Links

- Skill notes external links cut reach ~50%. Put links in a reply tweet, not the main post.
- For news reactions, quote-tweet the source instead of linking — same effect, no penalty.

## Closing

- No closing question needed (unlike LinkedIn).
- The last line should be the hardest-hitting line. Don't soften it with a "thoughts?"

## Patterns that work for Vivek

- **Hot take:** One punchy claim, optionally followed by 2–3 lines of reasoning. Example: *"Most RAG pipelines fail at retrieval, not generation. The reranker is doing more work than the LLM. Change my mind."*
- **Quick finding:** *"Just tested bge-reranker-v2-m3 vs Jina on our eval set: +40% NDCG@5, 3x slower on cold start. Tradeoff worth it for us, maybe not for you."*
- **Reaction:** Quote-tweet a big account, add the engineering angle in your text.
- **Mini-lesson:** One thing learned this week, 3 sentences.

## Anti-patterns

- Don't write 5-tweet threads when 1 tweet would do.
- Don't open with "🧵👇" or "Thread time" or "Buckle up."
- Don't use "Hot take:" as a literal prefix — just make the take hot.
- Don't reply-bait with "Agree?" or "Thoughts?"
