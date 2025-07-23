---
id: infra-github-repo-setup
workstream: infra
dependencies: []
estimated_hours: 3
assigned_to: null
created: 2025-07-23
started: null
completed: null
priority: high
tags: [setup, github, phase1]
---

# Set Up GitHub Repository Structure

## Context
- PRD: [Initial PRD](../../../docs/product/initial-prd.md)
- Architecture: [LinkedIn Automation Architecture](../../../scratch/linkedin-automation-architecture.md)
- Related Tasks: Core infrastructure setup for LinkedIn automation

## Subtasks
- [ ] Create repository directory structure (/ideas, /drafts, /approved, /config, /published)
- [ ] Set up GitHub branch protection rules for main branch
- [ ] Configure PR templates for draft reviews
- [ ] Create initial README with project overview
- [ ] Set up .gitignore for sensitive files
- [ ] Initialize GitHub Actions directory structure
- [ ] Create labels for PR categorization (draft, ready-for-review, approved)

## Acceptance Criteria
- [ ] All required directories exist with README files explaining their purpose
- [ ] Main branch is protected, requiring PR reviews
- [ ] PR template includes fields for post positioning and target audience
- [ ] Repository is properly documented for team onboarding
- [ ] GitHub Actions can be triggered successfully

## Technical Notes
- Use conventional GitHub repository structure
- PR template should guide reviewers to check tone, positioning, and relevance
- Consider using GitHub Projects for visual workflow tracking
- Ensure .gitignore excludes any API keys or credentials

## Testing Requirements
- Create test PR to verify template and protection rules
- Verify GitHub Actions can access all directories
- Test that branch protection prevents direct pushes to main