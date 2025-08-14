---
title: "Remember the Code Review Meeting? I Just Reinvented It with AI"
tags: ["AI", "ClaudeCode", "Cursor", "CodeReview", "DeveloperTools", "BuildingInPublic", "SoftwareEngineering"]
priority: "normal"
original_issue: 18
posting_time: "morning"
---

Yesterday I spent 3 hours in an interactive code review session. With Claude Code. And it was… liberating?

Here's the thing about AI coding assistants: they're brilliant at producing code. Mountains of it. Often over-engineered, frequently over-featured, sometimes solving problems you didn't know you had. 🏔️

After finding Claude waiting for my input AGAIN (yes, I built that baby monitor), I realized I had a bigger problem: I was becoming a stranger to my own codebase.

**The pattern was toxic:**
• Ask Claude to build feature → Get 2000 lines of pristine code
• "Looks good" (narrator: it wasn't) → Deploy
• Bug appears → Spend hours understanding "my" code
• Repeat with less confidence each time

Sound familiar? We're speed-running technical debt at unprecedented velocity.

**So I built an interactive code review slash command.**

Not a static analyzer. Not a linter. An actual conversation where Claude walks me through what it built, line by line, answering my "wait, why did you do THAT?" questions in real-time.

It's like sitting with a junior developer at a projector screen (remember those pre-PR days?). Except this junior wrote 10x more code than any human could.

**After 3 hours of deep review:**
• Found 4 over-engineered abstractions I'd never need
• Discovered 2 edge cases Claude handled that I didn't ask for
• Understood design decisions I'd been blindly accepting
• Actually learned patterns I can apply elsewhere

The command: https://github.com/mslavov/agent-docs-template/blob/every-inc-claude-setup/.claude/commands/review.md

The irony? Using AI to review AI-generated code. But here's what matters: I now KNOW my codebase again. Every decision, every trade-off, every clever optimization.

Maybe the answer to AI velocity isn't more velocity. Maybe it's intentional deceleration at the right moments.

What's your approach to reviewing AI-generated code? Still doing quick scans and hoping for the best?

#AI #ClaudeCode #Cursor #CodeReview #DeveloperTools #BuildingInPublic #SoftwareEngineering