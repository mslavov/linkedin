---
title: "When You Can't Find What You Need, Build It: My Slack MCP Server Story"
tags: ["engineering", "open-source", "mcp", "slack", "automation", "developer-tools", "problem-solving"]
priority: normal
status: draft
original_idea: build-what-you-need-slack-mcp.md
---

Ever spent 3 hours searching for the perfect tool, only to build your own in 30 minutes?

That was me last week with Slack integrations.

I needed Claude Code to post messages to our team channel. Simple, right? Every existing MCP server I found was overengineered - requiring OAuth flows, user tokens, complex configurations. Like bringing a Formula 1 car to a grocery run.

All I wanted was: bot token → post message → done.

So on September 5th, I did what any reasonable developer would do: I forked ubie-oss/slack-mcp-server and started simplifying.

The refactoring was surgical. I kept the core Slack operations (list channels, post messages, reply to threads, add reactions) and removed everything else. The result? A focused tool that does exactly what I need, nothing more.

What remained: Clean TypeScript with stdio transport only - perfect for Claude Desktop integration.

Here's what I learned from this tiny adventure:

1. The best solution isn't always the most feature-rich one
2. Forking beats building from scratch when you need 20% of existing functionality
3. Reading someone else's code teaches you their problems (and why they overengineered)
4. Sometimes the simplest solution is the one you write yourself

The funny part? My fork ended up being slightly larger (58KB vs 47KB) because I added example scripts and better documentation. Because if you're going to solve a problem, might as well help the next person who has it.

GitHub: https://github.com/mslavov/slack-mcp-server

This connects to something I've been thinking about lately - we've gotten so used to searching for solutions that we've forgotten the joy of building them. Not everything needs to be a product. Sometimes it's just simplifying someone else's good work to fit your exact needs.

What's the smallest thing you've built that had the biggest impact on your workflow?

#OpenSource #DeveloperTools #MCP #SlackIntegration #BuildingInPublic #Engineering #ProblemSolving