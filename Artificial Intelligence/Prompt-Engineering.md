# Guidelines

## Principles

## Principe 1: Write Clear and Specific Instructions
- clear != short
- longer prompt provides more clarity
-

### **Tactic 1**: Use delimiters to clearly indicate distinct parts of the input
Delimiters can be anything like: ```, """, < >, <tag> </tag>, :

### **Tactic 2**: Ask for a structured output
### **Tactic 3**: Ask the model to check whether conditions are satisfied

### **Tactic 4**: "Few-shot" prompting
- a technique in natural language processing (NLP) that allows models to perform tasks with minimal examples. Instead of needing large amounts of data for training, it guides the model with a few examples within the prompt itself. 



## Principle 2: Give the model time to “think”

### Tactic 1: Specify the steps required to complete a task

Example
```
text = f"""
In a charming village, siblings Jack and Jill set out on \ 
a quest to fetch water from a hilltop \ 
well. As they climbed, singing joyfully, misfortune \ 
struck—Jack tripped on a stone and tumbled \ 
down the hill, with Jill following suit. \ 
Though slightly battered, the pair returned home to \ 
comforting embraces. Despite the mishap, \ 
their adventurous spirits remained undimmed, and they \ 
continued exploring with delight.
"""
# example 1
prompt_1 = f"""
Perform the following actions: 
1 - Summarize the following text delimited by triple \
backticks with 1 sentence.
2 - Translate the summary into French.
3 - List each name in the French summary.
4 - Output a json object that contains the following \
keys: french_summary, num_names.

Separate your answers with line breaks.

Text:
```{text}```
"""
```


### Tactic 2: Instruct the model to work out its own solution before rushing to a conclusion.

- Prompt
```
prompt = f"""
Determine if the student's solution is correct or not.

Question:
I'm building a solar power installation and I need \
 help working out the financials.
- Land costs $100 / square foot
- I can buy solar panels for $250 / square foot
- I negotiated a contract for maintenance that will cost \
me a flat $100k per year, and an additional $10 / square \
foot
What is the total cost for the first year of operations
as a function of the number of square feet.

Student's Solution:
Let x be the size of the installation in square feet.
Costs:
1. Land cost: 100x
2. Solar panel cost: 250x
3. Maintenance cost: 100,000 + 100x
Total cost: 100x + 250x + 100,000 + 100x = 450x + 100,000
"""
```

<br>
### Model Limitations: Hallucinations
- Hallucination makes that sound plausible but are not true
- Reducing Hallucination:
- First find relevant information, then answer the question based on the relevant information.

<br>
<hr/>
## Iterative Prompt Development Process
- Analyze and refine your prompts to generate marketing copy from a product fact sheet.


<br>
Machine Learning Model
- Idea -> Implementation (Code/Data) -> Experimental Results -> Error Analysis ... -> Idea
<br>
Iterative Prompt 
- Idea -> Implementation (Prompt) -> Experimental Results -> Error Analysis ... -> Idea
- Prompt Guidlines
  - Be clear and specific
  - Analyze why result does not give desired output.
  - Refine the idea and the prompt.
  - Repeat
<br>
<br>
Iterative Process:
- Try Something
- Analyze where the result does not give what you want
- Clarify instructions, give more time to think
- Refine prompts with a batch of examples

<hr>
<br>
## Summarizing
- Summarize text with a focus on specific topics.
- Specific purpose of mind in summary.
   - Example: 
<br>
<hr>
Text to summarize
<br>
```
prod_review = """
Got this panda plush toy for my daughter's birthday, \
who loves it and takes it everywhere. It's soft and \
super cute, and its face has a friendly look. It's \
a bit small for what I paid though. I think there \
might be other options that are bigger for the \
same price. It arrived a day earlier than expected, \
so I got to play with it myself before I gave it \
to her.
"""
```
<br>
<hr>
Summarize with a word/sentence/character limit
<br>

```
prompt = f"""
Your task is to generate a short summary of a product \
review from an ecommerce site.

Summarize the review below, delimited by triple
backticks, in at most 30 words.

Review: ```{prod_review}```
"""

```
<br>
<hr>
Summarize with a focus on shipping and delivery
<br>
```prompt = f"""
Your task is to generate a short summary of a product \
review from an ecommerce site to give feedback to the \
Shipping deparmtment.

Summarize the review below, delimited by triple
backticks, in at most 30 words, and focusing on any aspects \
that mention shipping and delivery of the product.

Review: ```{prod_review}```
"""
```

<br>
<hr>
Summarize with a focus on price and value

```prompt = f"""
Your task is to generate a short summary of a product \
review from an ecommerce site to give feedback to the \
pricing deparmtment, responsible for determining the \
price of the product.

Summarize the review below, delimited by triple
backticks, in at most 30 words, and focusing on any aspects \
that are relevant to the price and perceived value.

Review: ```{prod_review}```
"""```

<hr>
<br>
- Summaries include topics that are not related to the topic of focus.
- Try **Extract** instead of "summarize"

<br>
```
reviews = [review_1, review_2, review_3, review_4]

for i in range(len(reviews)):
    prompt = f"""
    Your task is to generate a short summary of a product \
    review from an ecommerce site.

    Summarize the review below, delimited by triple \
    backticks in at most 20 words.

    Review: ```{reviews[i]}```
    """

    response = get_completion(prompt)
    print(i, response, "\n")

```
<br>
<hr>
<br>
## Inferring
- Extracting richer information from a text.
- Information Extraction is part of NLP (Natural Language Processing) that relates to taking piece of text and extracting certaing things you want to know from the text.

<br>
<hr>
## Transforming
- Large language model are very good at transforming as input to a different format such as translating text.
- Transforming formats such as inputting HTML and outputting JSON.
- 




<hr>

# Prompt Engineering Guide
- [Prompt engineering guide link](https://promptingguide.ai/introduction/elements)

- Crafting ideal inputs in order to get the most out of Large Language Models.
- Prompt is what you use to communicate with AI.
- A prompt can be very simple; like a question.
- A prompt can be very complex; like having code, and different kind of templates.
- Prompt creation is only one component of generative AI engineering.
- Prompt engineering is a component of Generative AI.




## Prompt can have:
- Instructions
- Question
- Input Ddata
- Example

## Prompt Writing
- A different approach to AI Prompt Writing
- 
