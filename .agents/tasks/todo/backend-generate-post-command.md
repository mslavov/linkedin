---
id: backend-generate-post-command
workstream: backend
dependencies: [infra-config-files-setup, backend-sync-notion-command]
estimated_hours: 8
assigned_to: null
created: 2025-07-23
started: null
completed: null
priority: high
tags: [slash-command, ai, content-generation, phase2]
---

# Implement /generate-post Slash Command

## Context
- PRD: [Initial PRD](../../../docs/product/initial-prd.md)
- Architecture: [LinkedIn Automation Architecture](../../../scratch/linkedin-automation-architecture.md)
- Related Tasks: AI-powered LinkedIn post generation

## Subtasks
- [ ] Create slash command structure for /generate-post
- [ ] Implement idea file selection logic (manual or automatic)
- [ ] Load and parse context files (tone.md, best-practices.md, history.md)
- [ ] Build comprehensive prompt for Claude including all context
- [ ] Implement Claude API integration for content generation
- [ ] Parse AI response to extract post and metadata
- [ ] Create draft file with generated content and justification
- [ ] Add frontmatter with metadata (idea source, generation date, etc.)
- [ ] Implement error handling and retry logic
- [ ] Add generation summary and statistics

## Acceptance Criteria
- [ ] Command can process specific idea file or select automatically
- [ ] Generated posts match Milko's tone and style
- [ ] Posts follow LinkedIn best practices
- [ ] Each draft includes positioning justification
- [ ] Draft files are created in /drafts directory
- [ ] Metadata tracks source idea and generation details
- [ ] Failed generations provide helpful error messages
- [ ] Generation quality is consistently high

## Technical Notes
- Use Claude's system prompts for consistent behavior
- Include examples from history.md in prompts
- Structure prompts for optimal output formatting
- Consider token limits when building context
- Implement prompt versioning for iteration
- Cache frequently used context to improve performance
- Use temperature settings appropriate for creative content
- Preserve idea-to-draft traceability

## Testing Requirements
- Test with various idea types and formats
- Verify tone consistency across multiple generations
- Test context file parsing and inclusion
- Validate output format and structure
- Test error scenarios (API failures, invalid ideas)
- Benchmark generation quality metrics
- Ensure reproducible results with same inputs