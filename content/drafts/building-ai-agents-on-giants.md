---
title: "Is Building on Claude Code 'Cheating'? My Secret Startup Confession"
tags: ["AI", "StartupLife", "ClaudeCode", "BuildingInPublic", "AIAgents", "DeveloperTools"]
priority: 1
original_issue: 29
---

So here's my "top secret" startup idea: an AI agent. Revolutionary, right? 😅

After multiple iterations with variable success, one thing kept killing me: context management. I tried everything - different prompting strategies, various context windows, custom retrieval systems. Nothing worked like I wanted.

Then I switched from Cursor to Claude Code (this was 2 months ago when the difference was huge). The key differentiator? How they handle context.

Cursor indexes your codebase and you point it at files. Claude Code? It searches, reads, searches again - actively gathering context like a developer would. Self-directed context engineering.

That's when Dan from Every opened my eyes. He uses Claude Code not just for coding but for writing, data analytics, everything. And I started wondering...

Can I just build my agent ON TOP of Claude Code? Is that... cheating?

Well, turns out I'm not alone in this "cheat":
- LangChain just released Deep Agents doing exactly this
- The Claude Code PM released an SDK for this exact use case

The real kicker? Here's how to run Claude Code in a Cloud Run container on GCP: github.com/mslavov/cloudrun-claude-code

Sometimes the best innovation isn't building from scratch. It's recognizing when someone else already solved the hard part and building the next layer.

What's your take - is building on existing AI platforms "cheating" or just smart engineering?

#AI #StartupLife #ClaudeCode #BuildingInPublic #AIAgents #DeveloperTools