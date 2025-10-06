---
title: "Breaking My Own Code: A Security Review Request"
date: 2025-10-06
tags: ["open-source", "security", "cloudrun-claude-code", "community", "building-in-public"]
status: scheduled
pillar: 4
notes: "cloudrun-claude-code security hardening - requesting white-hat review"
---

I spent a few hours Friday afternoon hardening a container. Not exactly how I planned to wrap up the week, but when you're running AI agents in production, security doesn't wait for Monday.

Here's the problem: I've been building cloudrun-claude-code - basically Claude Code running in a container on Google Cloud Run. It's open source, it's useful, and it potentially gives an AI agent access to everything.

Including my Anthropic API key.

That kept me thinking.

So Friday, I went down the rabbit hole. The solution I landed on is elegantly simple:

Run the Claude CLI as a restricted user that can only write to one folder.
Add a simple proxy that intercepts requests to Anthropic and injects the real auth headers.

The agent never sees the actual credentials. It thinks it has them, but it's talking to localhost. The proxy handles the real authentication.

I think it works. The isolation feels solid. The attack surface is minimal.

But here's where I need help from my network:

Security researchers, white-hat hackers, paranoid engineers - I want you to try to break it.

Can you trick the agent into retrieving information it shouldn't have access to? Can you make it leak secrets? Can you escape the sandbox?

The repo is public. The setup is documented. I'll buy coffee (or donate to a charity of your choice) for anyone who finds a legitimate vulnerability.

Not because I think it's perfect. Because I know it's not.

And I'd rather find out now from someone who wants to help than later from someone who doesn't.

Who's in?

#Security #OpenSource #AI #CloudRun #BuildingInPublic #Infosec