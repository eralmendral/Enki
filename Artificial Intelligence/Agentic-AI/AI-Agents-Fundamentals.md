# AI Agents
- What is NOT an AI agent is if you just ask an AI to do something for you. Which is known as One shot prompting.
- For example, go to chat GPT and write "Please write out an essay on topic X from start to finish in one go."

## Non-Agentic Workflow
- Zero-Shot Prompting: No examples are provided, and the model must rely entirely on its pre-trained knowledge. One-Shot Prompting: A single example is given to clarify the task for the model.
- "Please type out an essay on topic X from start to finish in one go, without using backspace.


## Agentic Workflow
- Write an essay outline on topic X
- Do you need any web research?
- Write a first draft.
- Consider what parts need revision or more research.
- Revise your draft.

<br>
- Break down into different steps/stages (e.g. planning, research, drafting, revising).
- Feedback Loop - AI iterates based on human guidance.
- Circular iterative process.
- Step by step execution
- 

<br>
## Truly Autonomous AI Agent
- Fully Independent AI
- AI determines steps, tools, and iterates without human involvement.
- **Adaptive Decision-Making**
- AI Adjusts workflow dynamically to achieve the best outcome.


<hr>
<br>
# Agentic Design Patterns

1. Reflection
- Simply asking an AI to more carefully look through its own results.
- Ex: "Please write the code in order to complete a specific task" -> But you are not going to stop here
- We will ask the AI to : "Please now check the code carefully for correctness, style and efficiency, and give constructive criticism for how to improve it."


- Another example is: create another AI and have the other AI prompt the original AI to go through its own code and go through the reflection process.
- This is called multi-agent framework.

<br>

2. Tool Use
- Ex. Code Execution, Calculate things, Object detection, Web Generation, Accessing Calendars, Accessing Emails
- What are the necessary tools it needs to accomplish these steps.

3. Planning

4. Agent


<br>

<hr>

# Single AI Agent
- 4 components
- Task
- Answers
- Models 
- Tools

<br>
- Example:
- Task: Plan a 3 day  trip to Tokyo on a budget.
- Answer you want: Detailed itinerary with locations, costs, hotels, and tickets.
- Model: Anthropic Claude or any preffered model
- Tools: 
   - Google Maps
   - Skyscanner
   - Booking.com
   - Saved Credit card


<br>
<hr>
- Agents can be working with different tasks.
- Agents can have tools, and tasks can have tools too.
- Agents can be working with another Agents on different tasks.
- Having more than one Agent is called a **Crew**.
- 
