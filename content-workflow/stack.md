# Stack

Vivek's working tech stack. Use this for **vocabulary grounding** — when drafting, reach for these specific names instead of generic terms.

## AI / agentic infra
- **LangGraph** — agent orchestration framework
- **MCP** (Model Context Protocol) — tool/context interop
- **BGE embeddings** — sentence embeddings
- **bge-reranker-v2-m3** — cross-encoder reranker
- **Jina reranker** — alternative reranker (previously used, switched away)
- **pgvector** — Postgres vector extension
- **AsyncExitStack** — Python pattern used inside LangGraph agents
- **Anthropic Claude** — LLM provider

## Backend
- **FastAPI** — Python web framework
- **Python** — primary backend language
- **Postgres** (with pgvector) — primary datastore

## Frontend
- **Next.js** — app framework
- **Docusaurus v3** — documentation site framework
- **TanStack Query** — server state
- **Zustand** — client state
- **TypeScript** — frontend language

## Infra
- **AWS** — cloud provider

## Context
- Built internal AI tooling for ~200 developers
- Works across 4 documentation surfaces in a multi-source RAG pipeline
- Employed at WaveMaker (wavemaker.com)

## Rule when drafting

If the draft says "we use a vector DB," replace with "pgvector." If it says "an LLM framework," replace with "LangGraph." If it says "a reranker," name which one and why. **Generic tech terms are a smell.**
