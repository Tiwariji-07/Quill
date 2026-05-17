# Voice

Vivek's content voice in one line: **engineer first, creator second.**

## Principles

1. **Specific beats vague, always.**
   - Bad: "We improved our RAG pipeline."
   - Good: "We swapped Jina reranker for bge-reranker-v2-m3 after hitting their 60 req/min ceiling at 3 AM during a demo prep."

2. **Real decisions, real tradeoffs.**
   - Don't write what worked. Write what worked, what didn't, and why you chose between them.

3. **No hype. Ever.**
   - No "🚀 game-changer." No "AI is changing everything." No "excited to share."
   - See `never-say.md`.

4. **Conversational, not formal.**
   - Write like you'd explain it to a smart colleague over coffee, not like a corporate blog.
   - Contractions are fine. Half-sentences for emphasis are fine.

5. **First person. Direct.**
   - "I built X." "We hit Y." Not "Engineers can leverage..."

6. **The reader is a peer.**
   - Default audience: another engineer who builds agentic AI / RAG systems and would notice if you got something wrong.

## What good looks like

> Spent three days chasing a retrieval quality bug. The fix was a 2-line change to chunk overlap. The lesson wasn't about chunking — it was about how I was measuring retrieval quality wrong for the first two days. NDCG@5 lied to me because my eval set was too homogeneous.

Why it works: specific number, specific tool (NDCG@5), real self-criticism, the *insight* is about measurement not about chunking, no fluff.

## What bad looks like

> Excited to share that we made our RAG pipeline 2x better! Here are 5 lessons I learned about embedding models. AI is changing how we build software. 🚀 What do you think?

Why it fails: hype opener, no specifics, generic listicle frame, hashtag-bait question.

## Hook discipline

The first line is everything. On LinkedIn the first 210 characters are visible before "See more." On X the first 50 characters decide if anyone reads the rest.

Good hooks for Vivek:
- A specific finding: *"bge-reranker-v2-m3 is 3x slower than Jina on cold start but 40% more accurate on our eval set."*
- A confession: *"I spent 3 days debugging the wrong thing."*
- A counterintuitive claim: *"Most RAG pipelines fail at retrieval, not generation."*

Bad hooks for Vivek:
- Generic question: *"Have you ever wondered..."*
- Vague promise: *"Here's what I learned this week..."*
- Setup that delays the point: *"So I was working on a project recently and..."*

## Ending discipline

LinkedIn: end with a genuine question. Not a CTA. Not "comment YES if you agree." A real question that someone with relevant experience would actually want to answer.

X: end with the point landing hard. No question needed. If it's a thread, the last tweet is the takeaway, not "thanks for reading."

## Sound human, not LLM

The biggest tell that something was AI-generated is not vocabulary, it's *cadence and structure*. Avoid these patterns in any generated draft:

1. **Em dashes (—) and en dashes (–).** Never. See `never-say.md`. Use periods, commas, or parentheses. This rule is non-negotiable; em dashes are the loudest LLM tell.
2. **"It's not X, it's Y."** Banned construction. Also "X isn't just Y, it's Z." Both feel synthetic on sight.
3. **Three-item parallel lists in a sentence.** "It's specific, it's grounded, it's honest." Pick one. Humans rarely write tidy triplets.
4. **Symmetric paragraphs.** Three paragraphs of similar length, each with one idea, each ending on a punchline. Real writing is uneven.
5. **The summary closer.** "Bottom line:" / "In short:" / "TL;DR:" at the end of a short post. If the post is short, no summary is needed.
6. **Hedging stack.** "I think maybe perhaps it could be the case that..." Just say what you think.
7. **Adverb buildup.** "Surprisingly, interestingly, importantly..." Drop them. The fact is interesting or it isn't.
8. **Even rhythm.** Mix short sentences with longer ones. Fragments are fine. Sometimes a one-word reaction is the right line.
9. **Generic insight closer.** "The real lesson here is..." If the lesson needs that signal, the post hasn't earned it.

When in doubt, read the draft out loud. If it sounds like a TED talk, it's wrong. If it sounds like Vivek typing in Slack at 11 PM after debugging something, it's right.

## Minimal emoji

Default to **zero emoji** in any draft. The rare exception is a functional marker inside an actual checklist. Never decorative. See `never-say.md` for the hard ban list.

## The pillar question to ask before drafting

"Which pillar is this?" — see `pillars.md`. If it doesn't fit cleanly into one, the draft is probably trying to do too many things. Split it.
