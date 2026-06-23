# Claude
- AI assistant designed to be your thinking partner.

### Constitutional AI
- Trained to align with human values and operate transparently 

### Capabilities:
- Summarization
- Search
- Creative & Collaborative Writing
- Q&A
- Coding
- more...


### Ways to Access:
- Claude.ai
- ClaudeCode
- Claude & Slack
- Claude for Excel

### Conversation:
- Effective prompts using clear, specific language
- Upload files and images to provide with additional context

### Prompting:
- 1. Set stage - Your role and what are your objectives.
- 2. Define Tasks - What action do you want Claude to take? Write, Analyze, Build or something else?

- 3. Specify Rules - Style or tone, etc.

### Iterating responses
1. Ask follow up questions
2. Provide feedback
3. Redirect or restart

### Personalizing Claude
1. Memory - Claude remembers context of previous chats
2. Styles - The same with style, applies across all conversations


----

## Claude Code
- Agentic coding tool


### Capabilities:

- understands codebase
- edits files
- run commands (terminal commands)
- search the web
- integrates with existing developer tools
- help get things faster
- Works as an AI Agent


### AI Agent
- software that can interact with its environment & perform actions to complete a defined goal.
- having LLM operating in a loop in real time.
- can have access to tools, external services, and other AI agents to help reach their goals.

### Using Claude Code Effectively
1. Context Window
  - Claude's working memory
  - It can a lot but not everything at once.
  - Agentic aspect comes in to finding strategic ways to find the answers within your codebase without storing your entire codebase into context.


2. Ask for Permission/s
 - You're always in control, whether you prefer  a hands-on or hands-off approach.

3. It can make mistakes
 - It might **misunderstand intent**
 - introduce a bug
 - over-engineer a solution
 - Staying in loop helps you catch these early.


### How Claude Code Works?
- it works through "<Agentic Loop>" 

#### Agentic Loop
1. Enter a prompt
2. **Claude** gathers context for the model -> Returns a **TEXT** or **TOOL CALL** -> **Claude Code** the can execute this return value.
3. It takes action - edit a file or run a command.
4. It verifies the results and determines whether they achieve what your prompt set to do.
5. If they do, Claude finishes and wait for next prompt, if not, it loops back and tries again until result is complete.



### Context Management
- conversation, file contents, command outputs, and more it can store and reference.
- if limit is reached, claude code compacts your conversation automatically 

#### Command to manage context
 - /compact
 - /clear
 - /context

### Tips for Saving Context Space
 - Be Specific
 - MCP servers load all their tools into context by default, even when unused.
 - Turn off servers unrelated to your current project to save context.
 - Skills are an alternative that work like MCP servers but don't load everything upfront.

### Tools
- Backbone of how agents work.
- Most AI assistant take text and return text (text in / text out)
- Tools let claude code determine when to execute code to get closer to completing task.
- Could be <File Reading Tool>, <Web Search Tool>, or any other capabilities.
- Uses semantic understanding to determine when to call a tool and how to use the output.

### Permissions
- Default
- Auto-Accept
- Plan mode


------

### Prompting
- Auto Accept vs Approval
- Try to be as descriptive as possible


### Plan Mode
- Takes the prompt and uses **read-only** tools.
- Analyze codebase and research your suggested implementation.
- Great for planning complex changes.


### Daily Workflows
- Explore -> Plan -> Code -> Commit

#### Explore and Plan
- use Plan mode
- Claude will read relevant files, run some web searches
- best place to course correct

#### Code
Tips:
1. Define a success criteria
2. Add tools. Example: Web UIs
3. Include a Test Suite - make sure the tests are a reliable source of truth to avoid false positives.

#### Commit
- Once changes are tested, it's ready to commit push.
- Run a "sub agent code reviewer" to look at your work.
- subagent gets a fresh pair of eyes on the codebase — it doesn't carry the bias the main agent might have from the session.
- get Claude code to generate commit message in your style.


----

### Code Review
- use a subagent to review your changes.
- /commit-push-pr
- --from-pr

----
### Claude.MD file
- ```/init```
- Persistent memory about the project.
- Acts as an onboarding script that Claude Code reads automatically each session, giving it persistent context about your codebase so it doesn't start fresh every time.
- Here's a one-liner-per-bullet summary:
- Commit your CLAUDE.md to version control so the whole team benefits from shared context.
- Project-level CLAUDE.md lives in the root directory and is shared with the team.
- User-level CLAUDE.md lives in your config folder, is private to you, and applies across all your projects.
- Save corrections to memory by asking Claude to store rules you find yourself repeating.
- Reference project docs using the `@` symbol with a file path (e.g., `@README.md`).
- Start without a CLAUDE.md to spot where you keep course-correcting, keeping the file compact and focused.
- Run `/init` to have Claude auto-generate a CLAUDE.md when you're ready.
- Bottom line: good context separates a frustrating session from a productive one—start with your stack, preferences, and commands, then build from there.


---

### Subagents
- Here's a one-liner-per-bullet summary:
- Subagents let Claude delegate tasks to run in parallel, each in its own isolated context window.
- They keep your main context clean by doing exploration work (codebase, web searches) and returning only a summary, not the whole journey.
- Subagents are defined in Markdown files with YAML frontmatter.
- Run `/agents` and select "Create new agent" to have Claude generate one for you.
- Setup walks you through the agent's scope, purpose, accessible tools, and even a color.
- Claude auto-generates the name, description, and prompt, which also tells it when to call the subagent.
- Persistent memory lets a subagent retain context across conversations for consistent use on the same projects.
- Preload skills via the `skill` key, but note the entire skill loads into context (unlike in your main conversation).
- Bottom line: subagents handle the heavy lifting in the background and return just the answer, keeping your context window clean.

### Built-in Subagents
- Claude code includes subagents you can use immediately

1. General-purpose subagent  - multi step task that require 'exploration and action'
2. Explore subagent - fast searching of code bases
3. Plan subagent - use during plan mode for research and analysis before presenting a plan.

### Custom Subagents
- can create using custom **system prompts + tool access*


----
### Skills
- Agent skills are folders of instructions, scripts, resources that agent can discover and use to do things more accurately and efficiently.
- SKILL.md file
  - name
  - description

- Task specific.
- Work best for specialized knowledge for specific task


---

### MCP
- Model Context Protocol
- Lets Claude Code to connect to external tools and data sources
- A lot of your context lives outside your codebase — in databases, productivity apps, or public repositories. MCP bridges that gap.

- Here's a simplified summary with an analogy:

**The Analogy: MCP servers are like apps on a new phone**

Think of Claude Code as a brand-new smartphone. Out of the box, it can do the basics. But to do specific jobs—check your work tasks, pull up a manual—you install apps. MCP servers are those apps: they give Claude extra abilities to *do things*, not just talk about them.

The catch is the same as a phone: every app you install runs a little in the background and uses up resources. Install too many and the phone slows down. So you keep only the apps you actually use.

**The Summary**

- "Tools" let Claude actually perform actions (like fetching your project tasks), instead of just replying with text.
- MCP servers are how you add these tools—for example, connecting your project-management app or a documentation source.
- Add a server with the command `claude mcp add`.
- There are two types: HTTP servers (remote, run by the provider over the internet) and Stdio servers (run locally on your own machine).
- Check what's connected, see status, or turn off servers you don't need by typing `/mcp` inside a session.
- You can set how widely a server is available: **Local** (just this project, just you), **User** (all your projects), or **Project** (shared with your whole team via a `.mcp.json` file checked into version control).
- Every installed server quietly uses up context space even when idle—like background apps draining a battery—so disable unused ones with `/mcp`.
- If a tool has a command-line equivalent (like `gh` for GitHub or `aws` for AWS), use that instead—it's lighter on context.
- A "Skill" can also be a lighter alternative, since it only loads fully when Claude decides it's needed.
- If your MCP tools use more than 10% of the context window, Claude Code auto-switches to "tool search mode" (finds tools on demand), though it's less reliable.
- Bottom line: MCP connects Claude Code to your outside tools and data—add servers with `claude mcp add`, share them with your team via `.mcp.json`, and keep things fast by disabling what you're not using.


----


### Hooks
- ./claude/hooks/settings.json
- Hooks run commands at specific points in Claude Code's lifecycle, and unlike everything else, they're deterministic—they always run.
- Use them when something must happen every time: prompting Claude in CLAUDE.md mostly works, but a hook guarantees it.
- Common uses: auto-formatting after edits, logging commands for compliance, blocking dangerous operations, and sending task-completion notifications.
- Configure hooks in `settings.json` by picking an event, optionally setting a matcher for specific tools, and providing a command to run.
- Available events: PreToolUse (before a tool call), PostToolUse (after a tool call), UserPromptSubmit (when you submit a prompt), Stop (when Claude finishes), and Notification (when Claude sends a notification).
- Set them up via the `/hooks` command or by editing `settings.json` directly.
- Most common hook is auto-formatting: a PostToolUse hook with matcher `"Edit|MultiEdit|Write"` that runs the right formatter based on file extension.
- **PreToolUse** hooks can block tool calls: they receive tool name and input as JSON on stdin, and the exit code decides what happens.
- Exit code 0 proceeds, exit code 2 blocks the action and feeds the stderr message back to Claude, any other code shows a non-blocking error.
- Use blocking to enforce hard rules—no writes to production, no `rm -rf`, no commits to main—guaranteed rather than suggested.
- Hooks in `.claude/settings.json` are project-level and can be checked into your repo so the whole team gets them automatically.
- Use the `CLAUDE_PROJECT_DIR` environment variable to reference project scripts so they work regardless of Claude's working directory. 

> Bottom line: if something must happen every time without fail, put it in a hook, not a prompt.


----


### Coding Assistant



----

### Claude Cowork
- Cowork turns Claude from a conversation into a hands-on working session where it plans and executes real tasks on your files, folders, and apps while you steer—and this course takes you from first launch to confident daily use.


