---
title: "Are You Vibing or Actually Testing Your AI Coding Workflows?"
tags: ["AI", "ClaudeCode", "Testing", "DeveloperTools", "BuildingInPublic", "Evaluation"]
priority: 1
original_issue: 31
---

Two weeks ago, I spent 3 hours debugging why my custom Claude Code slash command wasn't working consistently. Turns out, it worked perfectly... 60% of the time.

Which got me thinking: How do you actually test these AI workflows we're all building?

Here's the challenge with AI evals:
- You need real-world scenarios (not "Hello World" examples)
- You can't blow your API budget testing every edge case
- You need to measure success beyond "it didn't crash"

And custom workflows? With slash commands and sub-agents? Good luck finding a testing framework for that.

I stumbled across @mslavov's claude-code-eval - a tiny wrapper on promptfoo specifically for testing slash commands and sub-agents. It's not solving everything (you still need real test data and success metrics), but at least it gives you a way to run evals without going broke.

My current approach? I've been collecting actual chat histories where things went wrong, turning them into test cases. Real bugs make the best test data.

But honestly? Most of us are still just vibing - pushing to production and hoping our workflows hold up.

What's your approach to testing AI workflows? Are you structuring this somehow, or are we all just crossing our fingers and monitoring Discord for angry users? 🤔

GitHub: github.com/mslavov/claude-code-eval

#AI #ClaudeCode #Testing #DeveloperTools #BuildingInPublic #Evaluation