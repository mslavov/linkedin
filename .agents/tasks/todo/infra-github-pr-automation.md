---
id: infra-github-pr-automation
workstream: infra
dependencies: [backend-generate-post-command]
estimated_hours: 5
assigned_to: null
created: 2025-07-23
started: null
completed: null
priority: high
tags: [github, automation, pr, phase2]
---

# Implement Automated PR Creation for Drafts

## Context
- PRD: [Initial PRD](../../../docs/product/initial-prd.md)
- Architecture: [LinkedIn Automation Architecture](../../../scratch/linkedin-automation-architecture.md)
- Related Tasks: Review workflow for generated content

## Subtasks
- [ ] Create GitHub Action triggered by new files in /drafts
- [ ] Implement PR creation with draft content
- [ ] Generate meaningful PR titles from post content
- [ ] Include AI justification in PR description
- [ ] Add relevant labels and metadata to PR
- [ ] Set up PR template for review guidance
- [ ] Configure auto-assignment to Milko
- [ ] Add preview rendering of LinkedIn post
- [ ] Implement PR validation checks

## Acceptance Criteria
- [ ] New drafts automatically create PRs within minutes
- [ ] PR title clearly indicates post topic
- [ ] PR description includes full context and justification
- [ ] LinkedIn post preview shows formatting
- [ ] PRs are assigned to correct reviewer(s)
- [ ] Labels indicate post type and status
- [ ] PR template guides review process
- [ ] Validation prevents malformed drafts

## Technical Notes
- Use GitHub API or CLI for PR creation
- Implement branch naming convention for drafts
- Consider PR queue management for multiple drafts
- Add markdown preview that mimics LinkedIn formatting
- Include character count and engagement predictions
- Link back to original idea file
- Use PR comments for revision history

## Testing Requirements
- Test PR creation with various draft types
- Verify PR metadata and labels
- Test auto-assignment functionality
- Validate PR template rendering
- Test with multiple simultaneous drafts
- Ensure PR descriptions are informative
- Test branch conflict resolution