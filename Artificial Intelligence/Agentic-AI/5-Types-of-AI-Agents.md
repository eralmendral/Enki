# Simple Reflex AI Agent
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

# Model-Based Reflex Agent
- More advanced version of the **Simple Reflex Agent**.
- It uses **condition-action rules** to make decisions as well
- But it also incorporates an internal model of the world and that's stored in the state component and that state component is updated by observing how the world actually evolves.
- How the environment changes from one state to another.


![image](https://github.com/user-attachments/assets/6d277333-2643-4c0a-8e5f-ad472c5356e7)

