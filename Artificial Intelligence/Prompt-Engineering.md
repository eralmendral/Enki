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







<br>
<hr/>

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
