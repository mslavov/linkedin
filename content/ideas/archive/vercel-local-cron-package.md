---
title: "Building vercel-local-cron: When You Ship in 3 Prompts and 71 Strangers Use It"
created_date: 2025-10-05
tags: ["developer-tools", "rapid-development", "open-source", "ai-assisted-coding", "npm"]
priority: normal
status: drafted
draft_file: three-prompts-71-downloads.md
drafted_date: 2025-10-05
---

## Original Prompt
I added some Chrome jobs to my Next.js application. While doing so I wondered how to test this vocally, because there's no one to actually run Chrome vocally. If I want to, I have to manually hit the endpoints, which works in most cases. I thought, what if there is a tool - spoiler alert, there are many of those tools - but what if there is a tool that runs with the Next.js dev server and also runs the cron jobs? So here it is: https://github.com/mslavov/vercel-local-cron I built that. To be honest, it costs almost nothing; it's just three prompts to get it into this shape. Another useless prompt to rename it for a better name, but I decided not to, this is how I discovered the other tools. So yeah, here it is - yet another NPM package: https://www.npmjs.com/package/vercel-local-cron 71 downloads since yesterday, is anyone actually using it?!?!?

## Core Idea
The irony of modern development: build a tool in 3 prompts because you were too lazy to manually test cron endpoints, publish it as "yet another NPM package," and discover 71 strangers downloaded it overnight.

This story captures:
- The absurdly low barrier to creating developer tools today (3 prompts!)
- The surprising reality of immediate adoption (71 downloads - real people?)
- The humor in almost renaming it, then discovering competition through that search
- The builder's mentality: solve your own problem, ship it, move on
- The weird validation/confusion of random strangers using your side project

## Key Points
- **The Problem**: Testing Vercel cron jobs locally requires manually hitting endpoints
- **The Solution**: Built vercel-local-cron to run alongside Next.js dev server
- **The Build Process**: Literally 3 prompts to Claude (plus one rejected rename prompt)
- **The Discovery**: While considering a rename, found other similar tools existed
- **The Surprise**: 71 downloads in ~24 hours - are people actually using this?
- **The Broader Point**: AI-assisted development making tool creation trivially easy
- **The Question**: When everyone can build and publish tools this fast, what happens to the NPM ecosystem?

## Potential Hook
"Three prompts. 71 downloads. Zero idea if anyone's actually using it."

Alternative hooks:
- "I built an NPM package in 3 prompts because I was too lazy to hit an endpoint manually"
- "Yesterday: annoyed at testing cron jobs. Today: 71 strangers downloaded my solution. What just happened?"
- "The barrier to publishing developer tools is so low now that I accidentally became a package maintainer"

## Connection to Previous Content
- Aligns with 40:40:20 framework's "20% AI Ops" - using AI to build automations
- Connects to hands-on builder spirit (still shipping code despite dual CTO roles)
- Ties to practical AI usage theme (real problem → quick solution)
- Contrasts with over-engineering pet peeve (minimal solution that works)
- Echoes transparency about what tools actually cost to build

## Story Arc
1. **Setup**: Adding cron jobs to Next.js app, frustrated with manual endpoint testing
2. **The Build**: "What if there's a tool?" → Narrator: there were many → Built it anyway in 3 prompts
3. **The Almost-Rename**: One extra prompt to rename it, search reveals competitors, abandon mission
4. **The Publish**: Ship it as "yet another NPM package"
5. **The Surprise**: Wake up to 71 downloads - existential question: is anyone using this?
6. **The Reflection**: When building tools is this trivial, what does it mean for the ecosystem?

## Potential Angles
1. **Humor-focused**: The absurdity of modern development speed
2. **Practical**: Here's how I solved local cron testing (with surprise ending)
3. **Philosophical**: What happens when the barrier to tool creation approaches zero?
4. **Data-driven**: 71 downloads × 0 known users = ??? (the mystery of package metrics)
5. **Builder's journey**: From "I need this" to "strangers are using it" in 24 hours

## Tone Considerations
- Self-deprecating ("yet another NPM package", "useless prompt")
- Genuine curiosity mixed with confusion (71 downloads?!)
- Dry humor about the simplicity (3 prompts = published package)
- Relatable developer frustration (manual testing sucks)
- Honest about process (including the rejected rename)

## Call to Action Options
- "Ever built something tiny that somehow got traction? What was it?"
- "Package maintainers: do you actually know who uses your tools?"
- "What's your record for fastest side project from idea to strangers using it?"
- "Are you one of the 71? Come say hi so I know you're real!"

## Technical Details to Include
- Tool: vercel-local-cron
- Runs alongside Next.js dev server
- Solves local testing for Vercel cron jobs
- GitHub: https://github.com/mslavov/vercel-local-cron
- NPM: https://www.npmjs.com/package/vercel-local-cron
- Build time: 3 prompts + 1 rejected rename prompt
- Downloads: 71 in ~24 hours (as of writing)

## Notes
- This fits the "building in public" narrative perfectly
- Shows practical AI usage (not hype)
- Demonstrates bias toward action (ship it vs. overthink it)
- Relatable to both founders (shipping fast) and developers (testing pain)
- The genuine confusion about downloads is endearing and authentic
- Consider including screenshot of NPM download stats for credibility
- Optional: Link to specific competitors found during rename search
- Stay humble - this is a tiny tool, not a major achievement
- The real story is the meta-commentary on modern development speed
