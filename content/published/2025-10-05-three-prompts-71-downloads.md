---
title: "Three Prompts, 71 Downloads, Zero Idea If Anyone's Actually Using It"
tags: ["developer-tools", "ai-assisted-coding", "building-in-public", "open-source"]
priority: 1
original_idea: vercel-local-cron-package.md
---

Three prompts to Claude. One NPM package. 71 downloads in 24 hours.

I have no idea if anyone's actually using it.

Here's what happened: I was adding cron jobs to a Next.js app and got annoyed at manually hitting endpoints to test them. So I asked Claude to build a tool that runs alongside the dev server and triggers cron jobs locally.

Three prompts later, vercel-local-cron existed.

I almost spent a fourth prompt asking for a better name, but decided to search NPM first. Turns out there are a bunch of similar tools. Classic developer move – building something that already exists because searching felt like more work than building.

But here's where it gets weird.

I published it anyway (because why not?), and woke up to 71 downloads. Seventy-one people found this thing, decided it was worth installing, and... then what? Are they using it? Did it solve their problem? Did it break their dev environment?

No idea.

This is what gets me about modern development. The barrier to creating tools is so low now that I accidentally became a package maintainer. And the distance between "I need this" and "strangers are using it" has collapsed to basically nothing.

I used to spend weeks building side projects. Now I spend three prompts and apparently that's enough for 71 people to trust it in their workflow.

I'm not sure if this is amazing or terrifying. Probably both.

If you're one of the 71 – come say hi so I know you're real.

GitHub: https://github.com/mslavov/vercel-local-cron
NPM: https://www.npmjs.com/package/vercel-local-cron

What's your record for fastest side project from idea to strangers using it?

#BuildingInPublic #DeveloperTools #OpenSource #AI #NPM
