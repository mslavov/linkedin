---
title: "AI Eating Its Own Dog Food: LinkedIn Post Automation"
tags: ["AI", "Automation", "BuildingInPublic", "GitHub", "ClaudeCode", "DeveloperTools"]
priority: "high"
original_issue: 2
posting_time: "morning"
---

So I just did something wonderfully meta – I used AI to build a system that uses AI to create LinkedIn posts about using AI. 🤖

Here's the confession: For the past two years, my LinkedIn posts have been heavily AI-assisted. My workflow? Brain dump my thoughts → ChatGPT rewrites them so humans can understand → Manual copy-paste to LinkedIn. It worked, but it felt... inefficient.

Last week I looked at all the OOTB automation services. They were either too rigid or too expensive for what's essentially a glorified copy-paste operation.

Today I decided to scratch my own itch using the tools I use daily:

• **GitHub Issues**: Where I dump my post ideas (just like code tasks)
• **Claude Code**: To generate posts that maintain my voice 
• **GitHub Actions**: For the workflow automation
• **Manual Publishing**: Because I still want final control

The twist? The ENTIRE system was built using Claude Code. No manual coding – just conversations with an AI assistant that understands both code and context.

**The workflow is simple:**
1. Create a GitHub issue with my raw thoughts
2. Label it with 'claude' 
3. Claude generates a draft maintaining narrative continuity
4. PR review for quality control
5. Manual publish with the `/post` command

What started as "I should automate this tedious task" became an exploration of AI tools building AI workflows. And yes, this very post you're reading was generated through this system. 🚀

The code is open source: https://github.com/mslavov/linkedin

For my fellow developers: Have you automated any of your content workflows? What tools are you using?

For founders: How do you balance automation with authenticity in your content?

#AI #Automation #BuildingInPublic #GitHub #ClaudeCode #DeveloperTools