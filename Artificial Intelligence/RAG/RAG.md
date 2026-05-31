# RAG (Retrieval Augmented Generation)

AI-powered search that finds information and uses it to generate better answers.

## What is RAG?

Think of RAG like a **librarian helping you write a report**:

1. **Retrieve** – The librarian finds relevant books from the library
2. **Augment** – They hand you the useful passages
3. **Generate** – You write a better report using those sources

Without RAG, AI answers from memory (which can be outdated or wrong). With RAG, AI looks things up first—like a student who checks their notes before answering.

---

# CH1: Preprocessing

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

## Text Processing

Exact matching is too strict. Searching "The Alien" shouldn't exclude "the alien", "Alien", or "Aliens".

**Analogy:** Like a smart assistant who knows you mean the same thing whether you say "running", "ran", or "runs".

### The Processing Pipeline

Clean up text so variations match the same keyword:

| Step | What It Does | Example |
|------|--------------|---------|
| **Lowercase** | Ignore capitalization | "The Matrix" → "the matrix" |
| **Remove punctuation** | Strip periods, commas, etc. | "Hello, world!" → "hello world" |
| **Tokenization** | Split into individual words | "the matrix" → ["the", "matrix"] |
| **Stop words** | Remove filler words (the, a, is) | ["the", "matrix"] → ["matrix"] |
| **Stemming** | Reduce words to their root | ["running", "jumping"] → ["run", "jump"] |

### Why Each Step Matters

| Without This Step | Problem |
|-------------------|---------|
| No lowercase | "Bear" and "bear" are different |
| Keep punctuation | "hello" and "hello!" don't match |
| No tokenization | Can't search individual words |
| Keep stop words | "The" clutters every result |
| No stemming | "watch" won't find "watching" |

---

## Punctuation

Simply remove all punctuation from text.

| Before | After |
|--------|-------|
| Boots the bear! | Boots the bear |
| The wonderful bear, Boots | The wonderful bear Boots |

> **Note:** Edge cases like hyphens (e.g., "sci-fi") may need special handling, but we'll keep it simple for now.

---

## Tokenization

Splitting text into smaller pieces called **tokens**.

**Analogy:** Like cutting a sentence into individual word magnets for a fridge.

| Input | Output |
|-------|--------|
| "The Matrix is a great movie!" | ["the", "matrix", "is", "a", "great", "movie"] |

We use **word-based tokenization** for keyword search. Since we already handled lowercase and punctuation, tokens come out clean.

> **Note:** LLM tokens are different—they don't map one-to-one with words. Don't confuse the two.

---

## Stop Words

Not all tokens are useful. **Stop words** are common words with little meaning—we remove them.

**Analogy:** Like filtering out "um" and "uh" from a conversation transcript.

| High-Value Tokens | Low-Value (Stop Words) |
|-------------------|------------------------|
| bear, panda, london, protector | a, the, is, of, in |

### Why Remove Them?

Without removal, meaningless matches pollute results:

| Query: "the bear" | Why It Matched |
|-------------------|----------------|
| "Jungle Bear" | matches "bear" ✅ |
| "The Terminator" | matches "the" ❌ |

Both match, but "Jungle Bear" is clearly more relevant. "The Terminator" only matched on a useless stop word.

---

## Stemming

Reduce words to their **root form** so variations match each other.

**Analogy:** Like recognizing that "ran", "running", and "runs" all mean the same action.

| Variations | Stem |
|------------|------|
| running, runs, ran | run |
| jumping, jumps, jumped | jump |
| watching, watches, watched | watch |

### Why Stem Words?

Without stemming, valid results get missed:

| Query: "running" | Problem |
|------------------|---------|
| "A River Runs Through It" | No match—"runs" ≠ "running" ❌ |
| "Run Baby Run" | No match—"run" ≠ "running" ❌ |

Both contain the concept, but different word forms prevent matches. Stemming fixes this.

---

## Key Takeaway

> Keyword search is fast and reliable for exact matches. Text processing makes it flexible enough to handle real-world messiness. But when you need understanding (not just matching), you need smarter techniques—that's where semantic search comes in.

---

# Summary

## What We Learned (In Plain English)

**RAG** is like having a research assistant. Instead of guessing answers, AI looks up information first, then gives you a better response.

**Preprocessing** is cleaning up text before searching—like organizing a messy closet so you can actually find things.

### The 5 Cleaning Steps

Think of searching like finding a recipe in a cookbook:

| Step | What It Does | Everyday Example |
|------|--------------|------------------|
| **Lowercase** | Treats "PASTA" and "pasta" as the same | You don't care if the recipe title is capitalized |
| **Punctuation** | Ignores commas, periods, etc. | "Pasta!" and "Pasta" are the same dish |
| **Tokenization** | Breaks text into words | Looking for "chicken" in "Chicken Alfredo Pasta" |
| **Stop Words** | Removes filler words like "the", "a", "is" | You search "pasta recipe", not "a pasta recipe" |
| **Stemming** | Treats "baking", "baked", "bakes" as "bake" | Finding all baking recipes, not just ones that say "baking" |

### Why Does This Matter?

Without these steps, search is frustratingly literal:
- Searching "Dogs" won't find "dogs" (wrong case)
- Searching "running" won't find "run" (different form)
- Searching "the cat" might return "The Matrix" (matched "the")

With preprocessing, search becomes **forgiving**—like a helpful friend who understands what you meant, even if you didn't say it perfectly.
