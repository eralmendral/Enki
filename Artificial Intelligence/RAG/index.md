# RAG
- Retrieval Augmented Generation


<br>
- Pairs with LLM retriever

## Modules
 - Retriever
 - Vector Database
 - LLM
 - Monitoring & Evaluation


## Introduction of RAG
- LLMs are already powerful - they summarize text, generate code, rewerite content
- RAG fruther improves them - LLM  + New Information (giving them access to information , that they don't know from their training)


<br>
## Two Steps
- Collection Information (Retrieval)
- Reason & Respond (Generation)


## Traditional LLM
- "kind of a person with a huge chunk of knowledge from reading huge data of the internet"
- PROMPT -> LLM -> INTERNET DATA

- Issue: Very recent information, Specialized knowledge might be an issue.

- LLM - mathematical models that are trained
- Trainig Data - massive dataset from the open internet (web pages, books, forums, code)
- When you send a prompt to an llm, an information related to your issue is in trained data.

## What LLMs don't know
- Private databases
- Hard to access information
- Real time data

## How do you make sure the LLM knows this useful information?
- "Just put it in the prompt"
- Key idea of RAG system is, "You can modify a prompt before sending it to the LLM"

- Prompt -> Rag System -> Augmented Prompt -> LLM -> Response
- This information needs to be retrieved from somewhere, the component that handles this process is called 'Retriever'.
- Retreiver -> Knowledge Base 
- Retreiver gets from knowledge base
- Retrieval Augmented Generation - improving or augmenting the way an LLM generate text by first retrieving relevant information from a knowledge base.


## Normal Use
- Prompt -> LLM -> Response

## RAG System
- Prompt -> Retreiver [Knowledge Base] -> Relevan Documents -> Augmented Prompt -> LLM -> Response


## Advantages
1. Injects missing knowledge (adds info not in the training data
2. Reduces Hallucinations
3. Keeps models up to date.
4. Enables source citation
5. Focuses model on generation.

<br>

<br>

<hr>

<br>

# Components

<hr>

## LLMs
- llms are just fancy autocomplete
- Neural Network - under the hood 
- a complex mathematical model of language
- LLM generate 'token' - pirce of a word
- some words get single tokens
- compound words use multiple tokens
- punctuation marks

<br>
## LLM Process
- Process current state -> Calculate probabilities -> Select next token


## Why LLM Hallucinate
- Generate probable words sequences
- Just reproduce statistical patterns from their training data
- Knowledge gaps cause inaccucate responses
- LLMs are design to generate 'probably' text, not truthful text.

- RAG solves the problem
- LLM <----- ( relevant context ) <---- Retriever + Knowledge Base

## Why not add everything?
- Higher Computation Cost
- Longer prompts take more computation to run .
- Model performs computationally complex scan of every token
- Scan happens before  generating each new token
- Context Window Limit

<br>
<br>
<hr>
<br>

## Retrieval
- Documents in a database
- "index" for search
- Retriever searches the index

<br>
## Retriever Trade offs
1. Relevance vs Irrelevance
2. REturn every document
3. Return the single highest rated document?
4. No perfect solution
5. Monitor and experiment

<br>

<hr>


# Information Retrieval and Search Foundations


1. Metadata Filtering


<br>

2. Keyword Search
- the idea is , document that contain a lot of words from the prompt are more likely to be relevant.
- Both the 'prompt' and each document are treated as <b>Bag of Words</b>
- The order of the words is totally ignored and all that matters is which words is in the text and how often.
- The word count is stored inside of a 'vector' 
- The vector has one spot for each word in the system's vocabulary.
- Sparse vector - generated for each document
- All this vector can be arranged in a grid which refer to 'Term Document Matrix' 
- Each column is a different document
- Each row is a different word
- This is also called 'inverted index' 
- Because it's easy to start from a word and find document that contains it.
- It's inverted , because usually you start with a document and check what words it contains.
- When a prompt is sent to the retriever, a sparse vector is quickly generated for the prompt. Each document and prompt has sparse vector, you're ready to start scoring and ranking documents.
- The simplest approach is award documents points when they contain words in the prompt.
- Each word in the prompt is called a keyword.
- Word in row -> award in document in each column a point.

<br>
- Frequency Based Scoring
- Shortcoming is it doesn't capture if a document contains keywords multple times. 
- A fix is simply increase the document score every time it contains a keyword.
- Award each document the number of points, in it's column.

- This introduces new problems however
- Longer documents may contain keywords many times simply because they are longer.
- Solution: Normalize by document length
- Score = (number of keywords occurences) / (total words in document)
- TF-IDF
- Basic TF scoring treats all words equally, whether they're common filler words or rare, meaningful terms.
- Solution: Weight term using "inverse document frequency" (IDF)
- Score = TF(word,doc) * log(total docs/ docs containing word)
- 1. Count documents - calculate each idf value for each word in system's vocabulary
- For each word it appears in and divide in total docs
 Example:
<br>
Pizza  - appears in 5 out of 100 documents
DF = 5/100 = 0.05

<br>
The - appears in all 100 documents
DF = 100/100 = 1.0

<br>
2. Flip  to reward rare words
Pizza <br>
IDF = 1/0.05 = 20

<br>
The - not rare word
DF = 1/1.0 = 1.0

<br>
<hr>
- At this point, rare word has higher idf than common one.

<br>
3. Apply Log
Still higher <br>
Pizza log(1/20 = 1.30

<br>
The - log(1)  = 0
- too common, no weight

<br>




## TF-IDF
- 
