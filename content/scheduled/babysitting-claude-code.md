---
title: "Building a Baby Monitor for Claude Code"
tags: ["AI", "ClaudeCode", "DeveloperTools", "Automation", "BuildingInPublic", "Productivity"]
priority: "normal"
original_issue: 6
posting_time: "morning"
---

Remember my post about automating LinkedIn posts with AI? Well, plot twist – turns out AI assistants need babysitting too. 👶

Here's what nobody tells you about Claude Code: it's brilliant, but it's also like leaving a toddler alone with your codebase. You walk away for a coffee, come back, and it's sitting there asking "Can I delete this folder? Can I run this command? Pretty please?"

After missing several permission prompts (and finding Claude patiently waiting for hours), I realized I needed a notification system. So I built what any reasonable developer would build – a baby monitor for my AI assistant. 🍼

The damage from missed prompts? In one week:
• 7 stalled workflows (average wait time: 2.5 hours)
• 3 timeout failures requiring complete reruns
• 14 times I had to drop everything to check on Claude
• 1 very patient AI wondering if I'd abandoned it

**The solution was hilariously simple:**
1. Claude Code has hooks for events (like notifications)
2. I wrote a bash script that parses these events
3. Connected it to Pushcut for iOS push notifications
4. Now my phone buzzes whenever Claude needs attention

Here's the actual script for my fellow Claude parents:

```bash
#!/bin/bash
json_input=$(cat)
message=$(echo "$json_input" | jq -r '.message // "No message"')
cwd=$(echo "$json_input" | jq -r '.cwd // ""')
dir_name=$(basename "$cwd")
escaped_message=$(echo "$message" | jq -Rs .)

curl -X POST -d "{\"text\": $escaped_message, \"title\": \"Claude needs you\"}" \
     -H "Content-Type: application/json" \
     https://api.pushcut.io/<YOUR_SECRET>/notifications/Claude%20needs%20you
```

**Impact after implementation:**
• Response time to Claude: 2.5 hours → 3 minutes
• Successful automation runs: 73% → 96%
• Weekly interruptions: 14 → 2
• Peace of mind: priceless
• Setup time: 15 minutes (ROI in 2 days)

The irony? I'm now more responsive to my AI assistant than my actual notifications. And yes, just like a real baby, Claude always seems to need something the moment you step away. ⏱️

Fun fact: This baby monitor has now sent me 47 notifications this month. That's 47 times Claude would have been sitting there, politely waiting while I was blissfully unaware. At an average of 5 minutes per intervention, that's nearly 4 hours saved.

Have you built any "quality of life" tools around AI assistants? What's your most creative workaround for managing these automated helpers?
#AI #ClaudeCode #DeveloperTools #Automation #BuildingInPublic #Productivity