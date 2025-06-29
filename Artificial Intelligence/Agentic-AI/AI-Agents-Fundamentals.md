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

2. Tool Use (API Calls)
- Ex. Code Execution, Calculate things, Object detection, Web Generation, Accessing Calendars, Accessing Emails
- What are the necessary tools it needs to accomplish these steps.

3. Planning (Decide on steps for task)

4. Agent (Multi-Agent Collaboration)


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

![image](https://github.com/user-attachments/assets/77cc95ef-faa7-422c-97a8-5bf0d0496bb8)

<br>

## Multi-agent design patterns
1. Sequential Patterns
 - When you have one agent that does something and it pass to another agent, and the another agent pass to another agent.
 - Ex: AI  powered document processing.
 - 1. Agent #1 : Text Extraction from scan documents
 - 2. Agent #2 : Pass to another agent which Summarizes the text.
 - 3. Agent #3 : Then pass to another agent which Action Item Extraction.
 - 4. Agent #4 : Finally to last agent that saves the data to database.

<br>
<hr/>

2. Hierarchical Agent System
 - Has a leader or manager agent that supervise multiple agents that has their own specific tasks.
 - The **Sub Agents** will complete their tasks and report their results back to the **Manager Agent**.
 - Example: "Writing a report for business decision making"
 - You have your **Manager AI Agent** that receives Task and delegates it to sub agents.
 - Sub-Agent 1: "Monitors market trends."
 - Sub-Agent 2: "Monitoring/Analyzes customer sentiment."
 - Sub-Agent 3: "Tracks internal performance metrics across the company. So it's understanding this specific product is how interplaying with other products within the company."
 - Sub-Agent 4: "Compile reports of sub agent 1,2,3 together to report to the manager Agent."


 <br>
 <hr>

 3. Hybrid System
  - Combines Sequential and Hierarchical together.
  - Agents can collaborate top down as well as sequentially.
  - Example: "Autonomous vechiles"
  - At the top level, you might have AI agent that plans the overall route and traffic strategy for an autonomous vehicle.
  - Then you have the **Sub Agents** that handle things like 'real-time Sensor Fusion', 'collission avoidance', 'road condition analysis'.
  - You need to have a continous feedback loop: "The vehicle dynamically adjusts its behavior based on road conditions and unexpected obstacles."
  - You need to have a lots of different little feedback loops between these different agents and then communicating continuously with the top level agent as well.
  - This design pattern is really common in robotics, navigation systems, and adaptive AI systems, basically like in places where there's lots of moving parts.

<br>
<hr>

4. Parallel Agent Design Systems
- Agents working on different work strams independently.
- Agents would be handling different parts of a task simultanesouly often to speed up processing
- Example: "AI for large scale data analysis"
- Utlimately at the end, merging everything together.

<br>
<hr>

5. Asynchronous Multi-Agent Systems
- This is when agents execute tasks independently and at different times.
- System that's proven to handle uncertain conditions better than sequential or parallel approaches.
- Example: "AI Powered Cyber Security Threat Detection"
  - You got **Agent 1** that's monitoring Network traffic in real time.
  - **Agent 2** that monitoring suspircous usage patterns and 
  - **Agent 3** that's just randomly sampling and testing out different use cases.
- When any of these agents picked up something anomalous they would flag it and then other things would happen after that. This type of Asynchronous design pattern is especially helpful for anything that requires real-time monitoring or self-healing systems.


<br>
<hr>
- You can have these systems and link up these systems themselves and this called a **Float**.
- This can result in really complex processing and results.
- As you increase the complexity of the systems, you're also basically increasing the amount of chaos that's within it.

