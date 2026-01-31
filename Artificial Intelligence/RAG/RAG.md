# RAG (Retrieval Augmented Generation)

AI-powered search that finds information and uses it to generate better answers.

## What is RAG?

Think of RAG like a **librarian helping you write a report**:

1. **Retrieve** – The librarian finds relevant books from the library
2. **Augment** – They hand you the useful passages
3. **Generate** – You write a better report using those sources

Without RAG, AI answers from memory (which can be outdated or wrong). With RAG, AI looks things up first—like a student who checks their notes before answering.

---

## Keyword Search

The simplest search method: find documents containing the exact words you typed.

**Analogy:** Like using Ctrl+F on a document—it finds exact matches, nothing more.

### When Keyword Search Works Best

| Scenario | Why It Works |
|----------|--------------|
| Medical terms ("COVID-19") | Precise terminology needs exact matches |
| Legal documents | Specific case numbers, statute names |
| Technical codes | Error codes, product IDs |

### When Keyword Search Falls Short

| Scenario | The Problem |
|----------|-------------|
| "Alien movie" | Only finds "Alien", misses similar films like "E.T." |
| "Happy songs" | Can't understand mood or meaning |
| Typos or synonyms | "Car" won't find "automobile" |

---

## Key Takeaway

> Keyword search is fast and reliable for exact matches. But when you need understanding (not just matching), you need smarter techniques—that's where semantic search comes in.
