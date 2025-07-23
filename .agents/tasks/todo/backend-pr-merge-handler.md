---
id: backend-pr-merge-handler
workstream: backend
dependencies: [infra-github-pr-automation]
estimated_hours: 4
assigned_to: null
created: 2025-07-23
started: null
completed: null
priority: high
tags: [github, automation, workflow, phase2]
---

# Create PR Merge Handler Workflow

## Context
- PRD: [Initial PRD](../../../docs/product/initial-prd.md)
- Architecture: [LinkedIn Automation Architecture](../../../scratch/linkedin-automation-architecture.md)
- Related Tasks: Moving approved content to publishing queue

## Subtasks
- [ ] Create GitHub Action triggered by PR merge events
- [ ] Detect merged PRs in drafts namespace
- [ ] Move approved content from /drafts to /approved
- [ ] Update metadata with approval timestamp and reviewer
- [ ] Clean up draft file and branch
- [ ] Update history.md with approved content
- [ ] Trigger queue reordering if needed
- [ ] Send notifications of approval

## Acceptance Criteria
- [ ] Merged PRs automatically move content to /approved
- [ ] Original draft files are removed
- [ ] Metadata includes complete approval trail
- [ ] History tracking is updated automatically
- [ ] Feature branches are cleaned up
- [ ] Process completes within seconds of merge
- [ ] Failed moves are reported clearly

## Technical Notes
- Use GitHub Action 'pull_request' event with 'closed' action
- Check merge status before processing
- Preserve all metadata during file move
- Atomic operations to prevent data loss
- Consider race conditions with multiple merges
- Implement rollback for failed moves
- Log all operations for audit trail

## Testing Requirements
- Test with single and multiple PR merges
- Verify file moves preserve content
- Test metadata updates
- Ensure branch cleanup works
- Test error handling for conflicts
- Verify history.md updates
- Test notification delivery