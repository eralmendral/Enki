
# 
- "Here's code intented for {task} 
```
def do_task(x):

  ..

  Check the code carefuly for correctness, style and efficiency, and give constructive criticism for how to improve it."



<br>
<hr>
## Inferring

Product Review Text
```
lamp_review = """
Needed a nice lamp for my bedroom, and this one had \
additional storage and not too high of a price point. \
Got it fast.  The string to our lamp broke during the \
transit and the company happily sent over a new one. \
Came within a few days as well. It was easy to put \
together.  I had a missing part, so I contacted their \
support and they very quickly got me the missing piece! \
Lumina seems to me to be a great company that cares \
about their customers and products!!
"""
```

<br>
Sentiment (positive/negative)
```
prompt = f"""
What is the sentiment of the following product review,
which is delimited with triple backticks?

Review text: '''{lamp_review}'''
"""
```
<br>
```
prompt = f"""
What is the sentiment of the following product review, 
which is delimited with triple backticks?

Give your answer as a single word, either "positive" \
or "negative".

Review text: '''{lamp_review}''' 
```

<hr>
<br>
Identify types of emotions

```prompt = f"""
Identify a list of emotions that the writer of the \
following review is expressing. Include no more than \
five items in the list. Format your answer as a list of \
lower-case words separated by commas.

Review text: '''{lamp_review}'''
"""
```

<br>
```
prompt = f"""
Is the writer of the following review expressing anger?\
The review is delimited with triple backticks. \
Give your answer as either yes or no.

Review text: '''{lamp_review}'''
"""
```

<br>
Extract product and company name from customer reviews
```
prompt = f"""
Identify the following items from the review text: 
- Item purchased by reviewer
- Company that made the item

The review is delimited with triple backticks. \
Format your response as a JSON object with \
"Item" and "Brand" as the keys. 
If the information isn't present, use "unknown" \
as the value.
Make your response as short as possible.
  
Review text: '''{lamp_review}'''
"""
```

<br>
Doing multiple tasks at once
```
prompt = f"""
Identify the following items from the review text: 
- Sentiment (positive or negative)
- Is the reviewer expressing anger? (true or false)
- Item purchased by reviewer
- Company that made the item

The review is delimited with triple backticks. \
Format your response as a JSON object with \
"Sentiment", "Anger", "Item" and "Brand" as the keys.
If the information isn't present, use "unknown" \
as the value.
Make your response as short as possible.
Format the Anger value as a boolean.

Review text: '''{lamp_review}''
```

<br>

Inferring topics

```story = """
In a recent survey conducted by the government,
public sector employees were asked to rate their level
of satisfaction with the department they work at.
The results revealed that NASA was the most popular
department with a satisfaction rating of 95%.

One NASA employee, John Smith, commented on the findings,
stating, "I'm not surprised that NASA came out on top.
It's a great place to work with amazing people and
incredible opportunities. I'm proud to be a part of
such an innovative organization."

The results were also welcomed by NASA's management team,
with Director Tom Johnson stating, "We are thrilled to
hear that our employees are satisfied with their work at NASA.
We have a talented and dedicated team who work tirelessly
to achieve our goals, and it's fantastic to see that their
hard work is paying off."

The survey also revealed that the
Social Security Administration had the lowest satisfaction
rating, with only 45% of employees indicating they were
satisfied with their job. The government has pledged to
address the concerns raised by employees in the survey and
work towards improving job satisfaction across all departments.
"""
```

<br>
Infer 5 topics

```prompt = f"""
Determine five topics that are being discussed in the \
following text, which is delimited by triple backticks.

Make each item one or two words long. 

Format your response as a list of items separated by commas.

Text sample: '''{story}'''
"""
```

```topic_list = [
    "nasa", "local government", "engineering", 
    "employee satisfaction", "federal government"
]
```

<br>
Make a news alert for certain topics

```
prompt = f"""
Determine whether each item in the following list of \
topics is a topic in the text below, which
is delimited with triple backticks.

Give your answer as follows:
item from the list: 0 or 1

List of topics: {", ".join(topic_list)}

Text sample: '''{story}'''
"""
```

```python

topic_dict = {i.split(': ')[0]: int(i.split(': ')[1]) for i in response.split(sep='\n')}
if topic_dict['nasa'] == 1:
    print("ALERT: New NASA story!")

```



<br>
<hr>
<br>

# 1. Set the Role
- Tell the AI who it should act as (e.g. copywriter, marketer, empathetic employee, etc.)
```
You are a marketing strategist with five years of of experience in building landing pages.
```


# 2. Define the Goal
- Specify the tone you want the response to have (e.g., straightforward, friendly, apologetic, professonal)

```
You want to increase the conversion rate of this landing page through copywriting
```

# 3. Specific instructions
 - Give the AI relevant details or context to include in the response (e.g., what the message is about, who the audience is, specific facts)


```
Please break it down into a structure with a different sections. I want bullet points for the main benefits.
```

<br>
<hr>

# Make the AI a Prompt Engineer for us.

```
You are a prompt engineer with 10 years of experience. Please write a prompt to be able to create a great landing page structure.

Use the best practice for AI coding tools. 
```

<br>
<hr>

``` Please act like a direct response marketer. use a straightforward but friendly tone.```


