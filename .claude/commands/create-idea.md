# Create LinkedIn Post Idea

You help create and manage LinkedIn post ideas in a structured format, storing them locally as markdown files while maintaining compatibility with the GitHub issues workflow.

<idea_description> #$ARGUMENTS </idea_description>

## Workflow

Create a new idea file for a LinkedIn post that can later be developed into a full post using the /generate-post command.

**IMPORTANT**: Before creating an idea file, ALWAYS read the following config files for context:
- `content/config/memory.md` - Personal facts, work philosophy, and 40:40:20 rule
- `content/config/tone.md` - Voice and writing style guidelines
- `content/config/best-practices.md` - LinkedIn posting best practices

These files ensure ideas align with personal brand, current frameworks, and authentic voice.

## Tasks

When invoked with an idea description (e.g., `/create-idea AI automation lessons learned`):

### 1. Parse the Idea
Extract the core concept from the user's input to create:
- A descriptive filename
- A clear title
- Relevant tags
- Priority level (if specified, otherwise default to "normal")

### 2. Create Idea File
Create a new markdown file in `content/ideas/` with:
- Filename: `{descriptive-slug}.md` (e.g., "ai-automation-lessons.md")
- YAML frontmatter with metadata
- The idea content in the body

### 3. File Structure
```yaml
---
title: "Clear, Engaging Title"
created_date: YYYY-MM-DD
tags: ["tag1", "tag2", "tag3"]
priority: normal  # high, normal, low
status: new  # new, drafted, abandoned
---

## Original Prompt
[The original user input/arguments provided to create this idea]

## Core Idea
[The main concept or story to explore]

## Key Points
- Point 1
- Point 2
- Point 3

## Potential Hook
[Opening line or question to grab attention]

## Connection to Previous Content
[How this relates to ongoing narratives, if applicable]

## Notes
[Any additional context, references, or thoughts]
```

### 4. Validation
Before creating the file:
- Check if a similar idea already exists in the ideas folder
- Ensure the filename is unique
- Verify the idea has substance for a full post

### 5. Confirmation
After creating the file:
- Confirm the file was created successfully
- Show the path to the new idea file
- Remind user they can use `/generate-post {filename}` to create a draft

## Priority Guidelines

- **High**: Time-sensitive topics, product launches, major announcements
- **Normal**: Regular content, ongoing narratives, general insights
- **Low**: Evergreen content, optional topics, backlog ideas

## Example Usage

```
/create-idea Lessons learned from building an AI agent that writes its own documentation
```

This will create:
- File: `content/ideas/ai-agent-self-documentation.md`
- Title: "Lessons learned from building an AI agent that writes its own documentation"
- Tags: Based on content analysis
- Ready for `/generate-post ai-agent-self-documentation.md`

## Notes

- Ideas can be revisited and updated before generating posts
- Abandoned ideas should have their status updated rather than deleted
- Ideas folder serves as a content backlog and brainstorming repository
- This local workflow complements the GitHub issues workflow for flexibility