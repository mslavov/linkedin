---
title: "AgentForge: The Platform I Built While Not Building Bugzy"
tags: ["agentforge", "platform-announcement", "building-in-public", "ai-orchestration", "developer-tools"]
priority: 1
original_idea: "agentforge-announcement"
pillar: 2
---

Yesterday I mentioned AgentForge. Here's the story.

Two weeks ago, I started building infrastructure to support Bugzy. What I ended up with is a complete agent orchestration platform—and it happened almost by accident.

The progression looked like this:

Started with a simple need: run Claude Code agents in the cloud securely.

Built the runner. Stateless, isolated, secure. One agent, one execution, clean slate every time.

Needed integrations. Created nextjs-nango-plugin to connect to 500+ tools (GitHub, Linear, Slack, etc). Realized this was useful beyond Bugzy.

Needed multi-tenancy. Built team management, project isolation, per-repo SSH keys for private repository access.

Needed billing. Implemented usage-based pricing with Stripe meters. Because pricing AI agent executions is... an unsolved problem.

Added VFS backed by Git. Every file operation version-controlled. Every change tracked. Rollback is just a Git command.

Built real-time execution logs with streaming. Watch your agents work, see what they're thinking, debug when things go wrong.

Created automatic MCP configuration. Connect an integration, it auto-generates the MCP config. Deploy a task, it becomes a Claude Code slash command. Zero manual setup.

Then it hit me: I wasn't just building Bugzy infrastructure anymore. I'd extracted a generic agent orchestration platform.

The same components that run QA agents can run any agent workflow:
• Customer support automation
• Code review processes
• Data analysis tasks
• Documentation generation
• Whatever workflow you can describe

AgentForge is what happens when you build the foundation first and realize the foundation IS the product.

It's built on three repositories working together:
• Agent Forge (web platform) - manage agents, projects, teams
• nextjs-nango-plugin (integration layer) - connect to external tools
• cloudrun-claude-code (execution environment) - secure, isolated agent runtime

The plan: Keep Bugzy as the flagship use case (autonomous QA) while offering AgentForge as the platform for anyone building agent workflows.

Open question: Is this brilliant or am I just really good at finding ways to NOT ship the actual product?

We'll find out soon enough.

What's the most useful "accidental" product you've built while working on something else?

#AgentForge #AI #BuildingInPublic #PlatformEngineering #AgentOrchestration #DeveloperTools
