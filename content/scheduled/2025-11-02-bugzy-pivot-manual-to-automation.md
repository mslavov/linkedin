---
title: "Two Conversations Changed Bugzy's Direction"
tags: ["bugzy", "product-pivot", "customer-development", "qa-automation", "building-in-public"]
priority: 1
original_idea: bugzy-pivot-from-manual-to-automation-qa.md
---

Bugzy is pivoting. Here's how it happened.

Last week I had a few customer conversations. Nothing crazy - 2 on Monday, 3 the Friday before.

Then I sat down to calculate my costs for the first potential customer. Wanted to give them a fair price.

That's when it hit me.

Running tests by having an AI agent manually click through every step? Expensive. Really expensive. An LLM call between every single action adds up fast.

But running tests through automation code? Fraction of the cost.

Then two people in those conversations said something that stuck with me:

"We have automation. We have QA teams. But our people are stretched thin. We need something to help bridge the gap, not replace the team."

Bridge the gap. Not replace.

That's when I decided: Bugzy needs to pivot from manual QA to automation QA.

The manual exploration stays - analyzing failures, exploring the app, doing what automation can't. But the actual test execution? That runs through code.

From: AI agent that manually clicks through each test step
To: AI agent that creates and runs automated test code

Same goal (close testing gaps), completely different execution (automation as leverage, not manual labor replication).

The bonus: I get to dust off my test framework design skills. They're rusty, but I think I can make it work.

Not a dramatic pivot. More like finding the right implementation for the same goal.

Sometimes the best insights come from doing the math and listening to what people actually need.

How do you decide between manual and automated approaches in your work?

#BuildingInPublic #QAAutomation #Bugzy #CustomerDevelopment #StartupLessons
