# 1. Simple Reflex AI Agent
- Follows pre-defined rules to make decisions.
- Like a thermostat, turns on the heat when temperature turns below a predefined threshhold. And turn off when temperature is reached.


<br>

- Agent

-> Environment (Precepts) -> Sensors [ what the world is like now? ] -> Condition-Action Rules [What action should I do now? ] -> Actuators ... -> Action -> [ Environment ] 

![image](https://github.com/user-attachments/assets/759747f5-d952-4620-bd33-75ebf25e7194)


- if (condition -> action structure
- executed by **actuators** and results to an **action** and that action affects the **environment**. 
- Effective in sturctured and preditable environments where the rules are well defined but dynamic scenarios? They can trip these agents up.
- Because they don't store past information, they can repeatedly make the same mistakes if the predefined rules are insufficient for handling new situations.

<br>
<br>
<hr>
<br>
<br>

# 2. Model-Based Reflex Agent
- More advanced version of the **Simple Reflex Agent**.
- It uses **condition-action rules** to make decisions as well
- But it also incorporates an internal model of the world and that's stored in the state component and that state component is updated by observing how the world actually evolves.
- How the environment changes from one state to another.
- Example Analogy: "Robotic Vaccum Cleaner"


![image](https://github.com/user-attachments/assets/6d277333-2643-4c0a-8e5f-ad472c5356e7)


<br>
<br>
<hr>
<br>
<br>

# 3. Goal-Based 
- Building on top of **Model Based Agent** by adding decision making but based on **Goals**
- No more condition-action rules but **goals**.
- The agent uses it's internal model, how the world evolves, what my actions do? Simulate future outcomes, essentially predicting: What it will be like if I do action A. What action will help me achieve my goal based on the current state and predicted future.
- Example Analogy: "Self Driving Car"
- Goal-based agents are widely used in robotics and simulations where a clear objective is set and adaptation to the environment is required.
- 

<br>
<br>
<hr>
<br>
<br>

# 4. Utility-Based Agent
- It considers not just when a goal is met but how desirable different outcomes are.
- Utility - represents a preference value for particular outcome.
- For each possible future state, the agent will ask, how happy will I be in such a state.
- This lets it **rank** options, not just pick anything that meets the goal.
- Example Analogy: "Autonomous Drone Delivery"
- The goal-based delivery version be to use a goal to deliver a package to address X, and it chooses an action that completes that goal. Doesn't matter if gives a bumpy energy-wasting routes.
- A utility-based version might instead be something like deliver the packages quickly and safely and with minimum energy usage whereby now the drone simulates multiple paths, it estimates things like duration and battery level and weather. And picks the route that maximizes its utility score.
- 
  
![image](https://github.com/user-attachments/assets/abd66d05-ca06-4dc9-a6ba-4eedfc89b64a)

<br>
<br>
<hr>
<br>
<br>

# 5. Learning Agent
- Rather than being hard coded or being goal driven, it learns from experience.
- It impoves it's performance overtime by updating its behavior, based on feedback from the environment.
- There's a **Critic component** and that observes the outcomes of the agent's actions via the sensors and it compares them to the **Performance Standard**.
- That gives us a numerical feedback signal that's often called a reward in **reinforcement learning**.
- And this **reward** is passed to a **Learning Element** that updates the agent's knowledge using the feedback from the critic.
- **Learning Element** - it's job here is to improve the agent's mapping from states all the way though to actions.
- **Problem Generator** - suggests new actions the agent hasn't tried yet, like 'try a different path', see if it's any faster.
- **Performance Element** - selects actions based on what the **learning element** has determined to be optimal.
<br>
- Example: "AI Chess bot" 
- **Performance Element** - plays the game using current learned strategies.
- **Critic** - will see if it lost the match.
- **Learning Elements** - adjusts it's strategy based on the outcomes of thousands of games.
- **Problem Generator** - suggests new moves that it hasn't explored yet.

  
![image](https://github.com/user-attachments/assets/e9df479b-a773-4daf-9c8f-658b3c39f5f0)



<br>
<br>
<hr>
<br>
<br>

## Summary
1. Simple Reflex -> Reacts
2. Model based Reflex -> Remembers (Tracking state) , still reactive
3. Goal based model -> Aims (anyway of meeting that goal)
4. Utility based -> It evaluates, choosing the best outcome (but requires a right utility function to do so)
5. Learning -> Learning from experience (can be slowest and data intensive process)

<br>
### We will want to use multiple agents together "Multi Agents System"
- Working in a shared environment, working in a cooperative way, working towards a common goal.

<br>

> AI Agents work best with human in the loop, at least in the time being.
