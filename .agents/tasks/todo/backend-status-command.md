---
id: backend-status-command
workstream: backend
dependencies: [backend-sync-notion-command, backend-generate-post-command, backend-publish-linkedin-command]
estimated_hours: 5
assigned_to: null
created: 2025-07-23
started: null
completed: null
priority: medium
tags: [slash-command, monitoring, analytics, phase4]
---

# Implement /status Slash Command

## Context
- PRD: [Initial PRD](../../../docs/product/initial-prd.md)
- Architecture: [LinkedIn Automation Architecture](../../../scratch/linkedin-automation-architecture.md)
- Related Tasks: System health monitoring and analytics

## Subtasks
- [ ] Create slash command structure for /status
- [ ] Implement system health checks for all components
- [ ] Add Notion sync status and last run time
- [ ] Show queue statistics (pending, approved, published)
- [ ] Display recent publishing history
- [ ] Calculate content generation metrics
- [ ] Show upcoming scheduled posts
- [ ] Add error log summary
- [ ] Create visual dashboard output
- [ ] Implement detailed drill-down options

## Acceptance Criteria
- [ ] Command provides comprehensive system overview
- [ ] All component statuses are checked
- [ ] Queue state is clearly displayed
- [ ] Recent activity is summarized
- [ ] Errors and warnings are highlighted
- [ ] Output is well-formatted and readable
- [ ] Performance metrics are included
- [ ] Can drill down into specific areas

## Technical Notes
- Cache status data for performance
- Use color coding for status indicators
- Include trend analysis where applicable
- Show both current state and history
- Make output concise but comprehensive
- Consider ASCII charts for metrics
- Include actionable recommendations

## Testing Requirements
- Test with various system states
- Verify all metrics are accurate
- Test performance with large datasets
- Ensure error detection works
- Test drill-down functionality
- Verify caching behavior
- Test output formatting