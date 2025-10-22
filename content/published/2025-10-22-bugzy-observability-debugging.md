---
title: "You Can't Fix an AI Agent You Can't See"
tags: ["AI", "debugging", "observability", "Bugzy", "agent-development"]
priority: 1
original_idea: bugzy-slack-optimization-gdpr.md
series: "48-hour-sprint"
series_part: 1
---

Yesterday I told you I'm breaking my 40:40:20 rule this week. Betting 80% of my time on making Bugzy's QA agent actually good.

Here's what that actually looks like.

Monday morning, 5:30 AM. Coffee. The agent was failing and I didn't know why.

Not crashing. Not throwing errors. Just not working right. Making weird decisions. Missing obvious things.

First problem: I couldn't see what it was doing.

So I built the tool I should have built weeks ago - a slash command to download and analyze agent execution logs.

Not rocket science. Just /bugzy:download with an execution ID, pipe it to Claude, ask "what went wrong?"

Turns out, observability for AI agents is basically the same as observability for any system. You can't fix what you can't see.

Then I got curious. What if I tested with Haiku 4.5? Cheaper, faster model. See how it performs.

Haiku struggled. Hard.

Not smart enough to figure things out on its own? Sure. But here's the thing - its failures were incredibly revealing.

When a powerful model like Sonnet compensates for unclear instructions, you don't notice the problems. When Haiku can't compensate, suddenly every gap in your instructions becomes obvious.

The logs revealed two problems I'd been papering over:

First, my instructions were a mess. Vague. Contradictory in places. Sonnet was doing its best with garbage input. Haiku just... couldn't. That's on me.

Second, the environment variable handling was completely broken.

I was treating everything as a secret. API keys? Secret. Database URLs? Secret. Project name? Also secret, apparently. Branch name? You guessed it - secret.

The agent couldn't see any of it. I'd relied on Playwright's secrets management to handle the passing. Except that wasn't working. At all.

So the agent was flying blind. No project context. No configuration. Just pure instructions and whatever it could scrape from the codebase.

The fix was embarrassingly simple: be explicit about what's actually a secret (API keys, tokens) versus what's just config (project names, branch names, environment settings).

Shocking concept - the agent needs to see the configuration to do its job.

Two hours of debugging. One custom slash command. A handful of log analysis sessions.

The result? An agent that actually knows what project it's working on.

Sometimes the best product work is building the tools to understand what's broken.

What debugging tools have you built for your AI agents? Or are you still flying blind?

#BuildingInPublic #AI #Debugging #Observability #AgentDevelopment
