---
id: backend-publish-linkedin-command
workstream: backend
dependencies: [infra-linkedin-api-setup, backend-pr-merge-handler]
estimated_hours: 6
assigned_to: null
created: 2025-07-23
started: null
completed: null
priority: high
tags: [slash-command, linkedin, publishing, phase3]
---

# Implement /publish-linkedin Slash Command

## Context
- PRD: [Initial PRD](../../../docs/product/initial-prd.md)
- Architecture: [LinkedIn Automation Architecture](../../../scratch/linkedin-automation-architecture.md)
- Related Tasks: Publishing approved posts to LinkedIn

## Subtasks
- [ ] Create slash command structure for /publish-linkedin
- [ ] Implement approved post selection logic
- [ ] Format content for LinkedIn API requirements
- [ ] Handle media attachments if present
- [ ] Execute LinkedIn API posting
- [ ] Move published content to /published
- [ ] Update history.md with publication details
- [ ] Implement success/failure notifications
- [ ] Add retry mechanism for failures
- [ ] Create publishing report

## Acceptance Criteria
- [ ] Command can publish next queued post or specific post
- [ ] LinkedIn posts are formatted correctly
- [ ] Media attachments are handled properly
- [ ] Published posts are archived appropriately
- [ ] History tracking is updated in real-time
- [ ] Failures are handled gracefully with clear errors
- [ ] Retry logic handles transient failures
- [ ] Publishing metrics are tracked

## Technical Notes
- Validate post content before sending to API
- Handle LinkedIn's specific formatting requirements
- Consider time zone for optimal posting
- Implement idempotency to prevent duplicates
- Track LinkedIn post ID for future reference
- Handle various content types (text, links, images)
- Consider preview mode before actual posting

## Testing Requirements
- Test with various post formats and lengths
- Verify LinkedIn formatting is preserved
- Test media attachment handling
- Test failure scenarios and retries
- Verify duplicate prevention
- Test with rate limiting scenarios
- Ensure proper archival of published content