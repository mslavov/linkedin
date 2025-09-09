---
title: "Benchmarking AI CLIs: Beyond the Marketing Claims"
tags: ["AI", "DeveloperTools", "ClaudeCode", "Benchmarking", "BuildingInPublic", "OpenSource"]
priority: 1
original_issue: 33
---

Yesterday I caught myself defending Claude Code like it was my favorite child. "It's still the best," I told a colleague asking about AI CLIs.

But then came the uncomfortable question: "Based on what?"

Truthfully? My gut feeling and some Twitter posts.

That's when I realized – we're all operating on vibes while companies throw around completion percentages and cherry-picked demos. Google and OpenAI aren't sleeping, and their CLIs are evolving fast. If you factor in pricing, they might actually deliver better ROI for certain use cases.

So I'm building my own benchmark.

Not another synthetic test suite that measures how well AI can reverse a linked list. Real-world slash commands, actual development workflows, the stuff we do every day:

• /test-fix: Can it understand failing tests and fix them?
• /code-review: Does it catch the gotchas a human would?
• /refactor: Can it improve code without breaking it?
• /document: Will it write useful docs or generic fluff?

The repo is already live: github.com/mslavov/claude-code-eval

Here's my approach:
1. Identical prompts across all CLIs
2. Real codebases with actual complexity
3. Measure both success rate AND solution quality
4. Track time-to-solution and token usage
5. Document the "feel" – because vibe matters

This connects to something Pierre Burgy will discuss at AI Engineer Paris – vibes over benchmarks. But what if we could measure the vibe systematically?

Early results are... interesting. Claude Code wins on complex reasoning. Cursor excels at quick edits. OpenAI's new CLI surprises with cost efficiency. Each has its sweet spot.

Anyone else tired of marketing benchmarks? What would you test in a real-world CLI evaluation?

Time to turn opinions into data. 📊

#AI #DeveloperTools #ClaudeCode #Benchmarking #BuildingInPublic #OpenSource