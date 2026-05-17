# Research watchlist

Sources Quill should check when running `commands/research-news.md`. Tagged by relevance.

## AI news (check weekly)

| Source | URL | Tags |
|--------|-----|------|
| The Batch (deeplearning.ai) | https://www.deeplearning.ai/the-batch/ | news, weekly |
| Hugging Face blog | https://huggingface.co/blog | models, infra |
| LangChain blog | https://blog.langchain.dev/ | langgraph, agents |
| Anthropic news | https://www.anthropic.com/news | claude, mcp |
| Simon Willison | https://simonwillison.net/ | engineering, commentary |
| Latent Space | https://www.latent.space/ | infra, deep-dives |
| AI News (smol.ai) | https://news.smol.ai | news, weekly, aggregated |

## Papers & research

| Source | URL | Tags |
|--------|-----|------|
| arXiv cs.AI | https://arxiv.org/list/cs.AI/recent | papers, daily-skim |
| arXiv cs.LG | https://arxiv.org/list/cs.LG/recent | papers, daily-skim |
| Papers With Code | https://paperswithcode.com/ | implementations |

## Community signal

| Source | URL | Tags |
|--------|-----|------|
| Hacker News | https://news.ycombinator.com/ | community-reaction |
| GitHub trending Python | https://github.com/trending/python?since=weekly | what's-being-built |

## Twitter/X accounts to monitor

Quill cannot read X directly without auth. When something interesting drops, paste it manually. Accounts that consistently produce relevant signal:
- @karpathy
- @swyx
- @simonw
- @mckaywrigley
- @hwchase17 (LangChain)
- @LangChainAI

## How Quill should use this

When invoking `commands/research-news.md`:
1. WebFetch each "weekly" source (skip "daily-skim" unless asked).
2. Identify items from the last 7 days.
3. Filter to topics relevant to Vivek's pillars: agentic AI, RAG, LangGraph, MCP, embeddings, reranking, vector DBs, LLM infra.
4. Return a digest of 5–8 items max.
5. Each item: source + date + 1-line summary + suggested Vivek-angle (one sentence).

For X discourse: prompt Vivek to paste tweets/URLs manually. Don't pretend to know what's trending on X.
