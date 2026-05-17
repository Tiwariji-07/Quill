# Content pillars

Four pillars. Every post fits into exactly one. If you can't pick, the draft is unfocused.

---

## 1. Architecture breakdown

**What it is:** Something Vivek built, decomposed. The specific decisions, the tradeoffs, the actual implementation.

**Tone:** Technical depth. Concrete. Defensible.

**Example topics:**
- "How I structured a multi-source RAG pipeline across 4 documentation surfaces"
- "Why bge-reranker over Jina — and what the migration cost"
- "Circuit breaker patterns inside a LangGraph agent — the actual code"
- "pgvector vs Pinecone for 500+ docs: what we benchmarked"

**Format hint:** Text post, 600–900 chars. No carousel. End with a genuine question.

**Test:** If a senior engineer reads it, can they sketch the system on a napkin? If not, it's too vague.

---

## 2. Lessons from shipping

**What it is:** Decisions, tradeoffs, mistakes, and what Vivek would do differently. Not tutorials. Reflections.

**Tone:** Conversational. Honest about what went wrong.

**Example topics:**
- "We hit Jina's rate limits at the worst time. Here's what we switched to."
- "Three things I got wrong about embedding models before shipping."
- "The AsyncExitStack pattern saved our LangGraph agent."

**Format hint:** Short text post, 400–700 chars. One idea per post.

**Test:** Is there a moment where the post says "I was wrong about X"? If not, it's probably too clean to be true.

---

## 3. Trend take

**What it is:** Something happened in the AI space → Vivek's engineering angle on what it means.

**Tone:** Opinionated. Grounded in implementation, not hype.

**Example topics:**
- New model drops → "What this means for RAG architectures"
- MCP spec update → adoption take
- LangGraph release → how it changes agent design patterns

**Format hint:** 600–1000 chars on LinkedIn, 1–3 tweets on X. Hook in line 1. Source link in comments (LinkedIn) or as reply tweet (X).

**Test:** Does the take add something a generic news summary wouldn't? If not, skip it.

---

## 4. Behind the build

**What it is:** The human layer. What it's like to build these systems day to day.

**Tone:** Personal, first-person, slightly longer. Story-shaped.

**Example topics:**
- "Spent 3 days debugging retrieval quality. The fix was embarrassingly simple."
- "What building an internal AI tool for 200 devs taught me about DX."
- "How I research a new AI infra decision before committing."

**Format hint:** 800–1200 chars on LinkedIn. Strong hook. Pace it like a short story.

**Test:** Would someone who's never met Vivek finish reading and feel like they know him a bit better? If not, it's too detached.

---

## Pillar balance target

In any 30-day window, rough mix:
- Architecture breakdown: 25%
- Lessons from shipping: 35%
- Trend take: 25%
- Behind the build: 15%

Lessons + Behind > Architecture + Trend overall — Vivek's edge is the reflective, hands-on perspective, not pure technical depth (which gets crowded fast).
