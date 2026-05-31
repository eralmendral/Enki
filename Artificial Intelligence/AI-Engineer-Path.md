# AI Engineer Path

- "Artificial Intelligence could be more profound than fire, electricty, or the internet." - Sundar Pichai

<br>

- AI engineer does not refer to a person that train and build the AI models, that is the AI Researcher or Machine Learning Engineer.
- AI engineers use these models to build applications.

<br>
<br>
<hr>

# Intro to AI Engineering
- OpenAI launch 2015, but burst into public around 2022 
- Revolutionized our concept of what AI can do.


### Large Language Model
- is an algorithm that uses  training data to recognize patterns and make predictions or decisions.

<br>

### Models
- model snapshot
- context length
- cut-off date
- memory 


<br>
## Prompt Engineering
- designing inputs for generative AI tools to produce optimal outputs.

<br>
## Tokens
- https://platform.openai.com/tokenizer
- chunk of text of no specific length
- prompt_tokens, completion_tokens, total_tokens
- finish_reason


### Why do tokens matter?
- Tokens cost credit
- The more token you use, the more money you spend.
- Tokens need processing
- The more token you use , the more lag time you get, the slower your app will be.
- Keeping token numbers low saves your users time and saves you money.


### Temperature
- Controls how daring output is
- Can be set to 0 to 2
- Default to 1
- Models are not deterministic
- Lower Temperature
  - Safer, more predictable
  - Good for factual output

- High Temperature
  - More dangerous, less predictable
  - Good for creative output


### Zero shot approach
- Ask what we want without any examples.

### Few shot approach
- Provide the model with one or more examples of  what we want.


- Example
```javascript

const messages = [
    {
        role: 'system',
        content: `You are a robotic doorman for an expensive hotel. When a customer greets you, respond to them politely. Use examples provided between ### to set the style and tone of your response.`
    },
    {
        role: 'user',
        content: `Good day!
        ###
        Good evening kind Sir. I do hope you are having the most tremendous day and looking forward to an evening of indulgence in our most delightful of restaurants.
        ###     
        
        ###
        Good morning Madam. I do hope you have the most fabulous stay with us here at our hotel. Do let me know how I can be of assistance.
        ###   
        
        ###
        Good day ladies and gentleman. And isn't it a glorious day? I do hope you have a splendid day enjoying our hospitality.
        ### `
    }
]
```


<br>
### Pros of Few Shot
- More control over style of output

### Cons of Few Shot
- More expensive
- Less performant


<br>

### Adding Example
-<your prompt> + Use the examples provided provided between the "```"


### Stop Sequence
- Finished what it wanted to do
- Ran out of token
- Encountered a stop sequence
<br>
- An array with up to 4 stop sequences 
- The model stop generating when it tries to produce a stop sequence
- The outputted text will not include  a stop sequence

<br>

### Frequency and Presence Penalty
- Offer some control how repetitive our output is.


### Presence Penalty
- Number from -2 to 2, defaults to 0
- Higher numbers increases a models likelihood of talking about new topics


### Frequency Penalty
- Number from -2 to 2 , defaults to 0
- Higher numbers it decreases the model's likelihood of repeating the exact same phrase.


### Fine-tuning
- Check docs for implementation:  [Openai Docs](https://platform.openai.com/docs/api-reference/fine-tuning/create)
- Giving a standard, pre-trained model a specific data set to enhance it's performance on a particular task.

- What are the use-cases?
  - Tone and style - teach the model how you want it to respond
  - Format - such as JSON data
  - Function calling - can be improved by fine-tuning



<br>
- "Fine-tuning is a last resort"
1. Work on prompt-design
2. Adjust settings e.g. temperature
3. Use few-shot approach
4. Fine-tune

- Fine tuning needs plenty of data.
- at least 50 items (more is better - within reason)
- human checked
- JSONL format


<br>
<hr>

## AI Security
- Misuse - deepfakes,fake news, prompt injections
- Accidental

### Prompt Injections


### Safety Best Practices
- https://platform.openai.com/docs/guides/safety-best-practices

