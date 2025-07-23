---
id: backend-sync-notion-command
workstream: backend
dependencies: [infra-notion-api-setup, infra-github-repo-setup]
estimated_hours: 6
assigned_to: null
created: 2025-07-23
started: null
completed: null
priority: high
tags: [slash-command, notion, sync, phase1]
---

# Implement /sync-notion Slash Command

## Context
- PRD: [Initial PRD](../../../docs/product/initial-prd.md)
- Architecture: [LinkedIn Automation Architecture](../../../scratch/linkedin-automation-architecture.md)
- Related Tasks: Core sync functionality between Notion and GitHub

## Subtasks
- [ ] Create slash command structure in .claude/commands/
- [ ] Implement Notion database query for unsynced ideas
- [ ] Convert Notion blocks to clean markdown format
- [ ] Generate unique filenames based on idea title and timestamp
- [ ] Write markdown files to /ideas directory
- [ ] Update Notion items with sync status and timestamp
- [ ] Implement duplicate detection logic
- [ ] Add progress reporting during sync
- [ ] Create sync summary report

## Acceptance Criteria
- [ ] Command successfully fetches all unsynced ideas from Notion
- [ ] Each idea is converted to well-formatted markdown
- [ ] Files are created with meaningful, unique names
- [ ] Notion database is updated with sync status
- [ ] Duplicates are detected and handled gracefully
- [ ] Command provides clear feedback on sync progress
- [ ] Errors are reported clearly to the user
- [ ] Dry-run mode available for testing

## Technical Notes
- Use YAML frontmatter for metadata (notion_id, created_date, etc.)
- Sanitize filenames to be URL-safe and filesystem-friendly
- Preserve rich text formatting where possible
- Include original Notion URL in markdown file
- Use atomic operations to prevent partial syncs
- Consider batching for large numbers of ideas
- Implement idempotent sync (safe to run multiple times)

## Testing Requirements
- Test with various Notion content types (text, lists, headings)
- Verify duplicate detection with identical titles
- Test partial sync recovery after failures
- Verify markdown output quality and formatting
- Test with empty database and large datasets
- Ensure Notion updates are atomic with file creation