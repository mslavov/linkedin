---
title: "When Your AI Assistant Has a Case of 'Senior Engineer Syndrome'"
tags: ["AI", "ClaudeCode", "DeveloperTools", "CodeQuality", "BuildingInPublic", "Productivity"]
priority: 8
original_issue: 20
---

Today I discovered my AI assistant has developed what I call "Senior Engineer Syndrome" – that irresistible urge to turn a simple refactoring into a complete architectural overhaul.

The symptoms appeared after a routine refactoring request:
• 4,400 lines added 📈
• Only ~40% actually used 🤦‍♂️
• The rest? Beautiful, pristine, utterly unnecessary abstractions

It's like asking your senior engineer to fix a typo and getting back a microservices architecture with event sourcing.

This got me thinking: do we train Claude to be more disciplined upfront, or build self-review mechanisms?

**Option 1: Strict Instructions**
- Add explicit constraints in CLAUDE.md
- "Do ONLY what was asked"
- Saves tokens, but fights its helpful nature

**Option 2: Self-Review Process**
- Let it overengineer, then auto-cleanup
- Carl's Stop hook approach
- More tokens, but potentially better quality

After 20+ years in engineering, I've seen this pattern in humans too. Sometimes that overengineering instinct leads to brilliant insights. Other times it's just complexity theater.

What's your take? Do you constrain your AI assistants upfront or let them explore and clean up after?

#AI #ClaudeCode #DeveloperTools #CodeQuality #BuildingInPublic #Productivity