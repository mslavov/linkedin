---
title: "Are You Vibing or Actually Testing Your AI Coding Workflows?"
tags: ["AI", "ClaudeCode", "Testing", "DeveloperTools", "BuildingInPublic", "Evaluation"]
priority: 1
original_issue: 31
---

Every tech influencer has their 'revolutionary' AI coding workflow. I've got mine too - complete with baby monitors and custom review commands. But here's the uncomfortable question nobody's asking: How do we know any of this actually works?

We're all inventing custom AI workflows - slash commands, sub-agents, chained prompts. But how do you actually test this stuff?

Traditional testing doesn't work when your "code" is prompts and your "output" is probabilistic. You need:
- Real data (not "write hello world in Python")
- A way to run evals without burning through your Claude budget
- Metrics beyond "didn't throw an error"

The hardest part? Testing custom development workflows with their own sub-agents and commands. How do you know your carefully crafted workflow actually improves things versus just vibing with vanilla Claude?

So I built something: https://github.com/mslavov/claude-code-eval

It's a tiny wrapper on promptfoo specifically for testing Claude Code slash commands and sub-agents. Doesn't solve everything - you still need real test data and figure out what "success" means. But at least you can run evals without going broke.

My approach: Every time Claude does something unexpected, it becomes a test case. Three months of chat histories = surprisingly comprehensive test suite. Turns out my failures are more valuable than my successes.

The irony? I built all these tools to make development more predictable, but I'm still mostly vibing when it comes to testing them.

What's your approach? Structured testing framework or just shipping and praying?

#AI #ClaudeCode #Testing #DeveloperTools #BuildingInPublic #Evaluation