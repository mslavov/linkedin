---
title: "When 'Hey Siri, Turn On The Lights' Just Isn't Nerdy Enough"
tags: ["AI", "SmartHome", "OpenSource", "DeveloperTools", "BuildingInPublic", "HomeAutomation", "MCP"]
priority: "normal"
original_issue: 8
posting_time: "morning"
---

You know that moment when you're deep into a morning coding session at 5 AM (you probably don't, as normal people don't code at 5 AM 😅) and you need to turn on the lights, but you're too focused to move AND too annoyed with Siri's "I'm sorry, I didn't quite get that"? 

Yeah, me too. So naturally, I did what any reasonable developer would do – I built a way to ask Claude to do it instead. 💡

After all these Claude Code adventures this week, I realized: if I'm already chatting with AI all day, why not let it control my smart home too? Enter **Shelly MCP** – because apparently, I can't help but make everything more complicated than it needs to be.

**The journey went something like this:**
1. Me: "Siri, turn on the office lights"
2. Siri: "I found some web results for office lights"
3. Me: *writes an entire integration to use Claude instead*
4. Also me: "This is definitely more efficient" 🤔

Here's what I built: A Model Context Protocol (MCP) server that bridges Claude/ChatGPT with Shelly Cloud. Now I can control my lights, switches, and plugs directly from my AI assistant. Because typing "turn on the lights" to Claude is somehow more satisfying than yelling at Siri.

**The technical bits for fellow nerds:**
- Uses Shelly Cloud API (though they have several APIs and documentation is... an adventure)
- MCP protocol for clean AI integration  
- Works with any MCP-compatible AI (Claude, ChatGPT, etc.)
- Open source, because sharing is caring

*[Video demo of asking Claude to control lights goes here]*

The real win? When I'm deep in a coding session, I can now control my environment without breaking context. "Claude, dim the lights to 30% and turn on the desk lamp" feels more natural when Claude is already helping me debug that nasty race condition.

**GitHub repo**: https://github.com/mslavov/shelly-mcp

Is this over-engineering? Absolutely. Is it practical? Surprisingly, yes. Will I add more features? Already planning voice responses and automation rules. 🚀

Fellow developers: What's the most unnecessarily complex solution you've built for a simple problem? And more importantly, did it spark joy?

#AI #SmartHome #OpenSource #DeveloperTools #BuildingInPublic #HomeAutomation #MCP