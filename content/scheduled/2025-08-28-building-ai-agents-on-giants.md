---
title: "Is Building on Claude Code 'Cheating'? My Secret Startup Confession"
tags: ["AI", "StartupLife", "ClaudeCode", "BuildingInPublic", "AIAgents", "DeveloperTools"]
priority: 1
original_issue: 29
---

Some of you know my "stealth" startup idea is all about an AI agent. Revolutionary, right? 😅

After multiple iterations with variable success, one thing kept killing me: context management. I tried everything - different prompting strategies, various context windows, custom retrieval systems. Nothing worked like I wanted.

Two months ago, the difference between Cursor and Claude Code was huge. So a month ago, I made the switch. The key differentiator? How they handle context.

Cursor indexes your codebase and you point it at files. Claude Code? It searches, reads, searches again - actively gathering context like a developer would. Self-directed context engineering.

Then I watched [Dan from Every's podcast](https://youtu.be/crMrVozp_h8?si=0c2fruN3VTkdDDIE) about using Claude Code not just for coding but for writing, data analytics, everything.

Inspired, I started experimenting - using Claude Code for non-coding tasks myself. And that's when it hit me...

Wait, can I just build my agent ON TOP of Claude Code? Is that... cheating?

Well, turns out I'm not alone in this approach:
- LangChain just released [Deep Agents](https://blog.langchain.com/deep-agents/) doing exactly this
- The Claude Code PM [released an SDK](https://youtu.be/DAQJvGjlgVM) for this exact use case

So I did it - here's how to run Claude Code in a Cloud Run container on GCP: github.com/mslavov/cloudrun-claude-code

Sometimes the best innovation isn't building from scratch. It's recognizing when someone else already solved the hard part and building the next layer.

What's your take - is building on existing AI platforms "cheating" or just smart engineering?

#AI #StartupLife #ClaudeCode #BuildingInPublic #AIAgents #DeveloperTools