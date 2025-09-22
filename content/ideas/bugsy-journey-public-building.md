---
title: "Building Bugsy in Public: From Vacation Idea to AI-Powered QA Agent"
created_date: 2025-01-17
tags: ["building-in-public", "ai-agents", "qa-automation", "product-development", "lessons-learned", "bugsy", "startup-journey"]
priority: high
status: drafted
draft_file: bugsy-three-builds-one-lesson.md
drafted_date: 2025-09-18
---
## Original Prompt
I want to talk about the background and story of how I came up with Bugsy and what I’ve done so far. This is a follow‑up to my public post, so here’s a short version.

I got the idea when I saw a company automating the browser with an agent. I thought it would be a perfect use case for manual QA—automating manual QA. While on vacation I started building a SaaS with a fancy onboarding that integrates GitHub, Linear, and other tools. I worked on it in Cursor, then dropped it.

Later, I participated in the Conf AI workshop and decided to give it another shot, this time in public so I could use it for marketing. I created two or three versions. I began with the SaaS, built a proof of concept using browser‑use, and it worked. I used it to test itself, but when I asked it to add more tests, it started hallucinating. I wasn’t doing any context engineering, so it performed poorly unless the tests were very well defined.

I then experimented with improving the context so the agent could understand the project better, and that led me to the conclusions I’m working on now. I needed it to mimic the way people were gaining context. Then I realized that coding agents are actually doing that by having tools they export the codebase and understand things. Right now I decided to rebuild Bugsy on top of CodeCode, and I did it but without any of the SAS stuff like the landing page and everything; it's the whole thing. I actually run it right now on my computer. I can also run it in the cloud, but I first want to fine‑tune it on my computer to make sure the prompts, the commands, and everything else work correctly. And that's it.

## Core Idea
Share the complete journey of building Bugsy—from the initial spark during vacation to rebuilding it on Claude Code. This is a follow-up post that dives deep into the technical evolution, pivots, and key learnings from attempting to automate manual QA with AI agents.

## Key Points
- Initial inspiration: Seeing browser automation agents and recognizing the QA opportunity
- The vacation SaaS attempt with GitHub/Linear integrations (and why I dropped it)
- The Conf AI workshop catalyst—deciding to build in public for marketing
- Three iterations: SaaS → browser-use POC → context-aware agent
- The hallucination problem and context engineering breakthrough
- Realizing coding agents already solve context understanding
- Current status: Rebuilding on Claude Code, local testing before cloud deployment

## Potential Hook
"I built the same product three times before realizing I was solving the wrong problem. Here's how building an AI QA agent taught me about context—both for machines and humans."

## Connection to Previous Content
- Follows up on the initial public announcement about Bugsy
- Connects to themes about building in public and transparent development
- Relates to discussions about AI agent limitations and practical applications
- Ties into the journey of iterative product development and technical pivots

## Notes
- Emphasize the learning process and pivot decisions
- Highlight the importance of context engineering for AI agents
- Show vulnerability about dropping the first version
- Connect the technical insights to broader lessons about AI development
- Mention current status: running locally, fine-tuning before cloud deployment
- Could reference specific technical challenges (hallucinations, test definition quality)
- Opportunity to discuss the evolution from fancy UI to core functionality focus