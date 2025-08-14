---
title: "AI Eating Its Own Dog Food: LinkedIn Post Automation"
tags: ["AI", "Automation", "BuildingInPublic", "GitHub", "ClaudeCode", "DeveloperTools"]
priority: "high"
original_issue: 2
posting_time: "morning"
---

I just did something wonderfully meta – used AI to build a system that uses AI to create LinkedIn posts about using AI. 🤖

For two years, my LinkedIn workflow was: brain dump → ChatGPT rewrite → manual copy-paste. It took 30 minutes per post. The math? 78 hours annually of copy-paste gymnastics. No wonder I wasn't posting consistently.

Last week's OOTB automation services? Too rigid or too expensive for glorified copy-paste.

So I built my own system using daily tools:
• **GitHub Issues**: Where I dump post ideas
• **Claude Code**: Generates posts maintaining my voice  
• **GitHub Actions**: Workflow automation
• **Manual Publishing**: I keep final control

The twist? Built the ENTIRE system using Claude Code in 4 hours. Just conversations with an AI assistant – faster than setting up most SAAS tools.

**Simple workflow:**
1. Create GitHub issue with raw thoughts
2. Label with 'claude' 
3. AI generates draft with narrative continuity
4. PR review for quality
5. Publish with `/post` command

**Week one results:**
• Time per post: 30min → 3min (90% reduction)
• Pipeline: 2-3 → 12 ready drafts
• My voice stays consistent

What started as "automate this tedious task" became AI tools building AI workflows. Yes, this post was generated through this system. 🚀

Open source: https://github.com/mslavov/linkedin

What's your take – have you automated any of your content workflows? How do you balance efficiency with authenticity?

Next: What happens when your AI assistant needs a babysitter...

#AI #Automation #BuildingInPublic #GitHub #ClaudeCode #DeveloperTools