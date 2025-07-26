# LinkedIn Content Automation

## Overview
This system automates LinkedIn post creation using GitHub issues as triggers and Claude for content generation.

## Workflow
1. **Create Issue**: Open a GitHub issue with label `linkedin-post` or `idea`
2. **Auto-Generate**: Claude creates a draft maintaining story continuity
3. **Review PR**: Draft appears as PR for review/editing
4. **Merge to Schedule**: Approved posts are queued
5. **Auto-Publish**: Daily workflow publishes scheduled posts

## Directory Structure
```
content/
├── config/           # Configuration files
│   ├── tone.md      # Voice guidelines  
│   ├── best-practices.md
│   └── history.md   # Recent posts for continuity
├── drafts/          # Pending drafts
├── published/       # Archive of published posts
└── schedule.md      # Publishing queue
```

## Setup Required

### GitHub Secrets
- `CLAUDE_CODE_OAUTH_TOKEN` - For Claude integration
- `LINKEDIN_CLIENT_ID` - LinkedIn app credentials
- `LINKEDIN_CLIENT_SECRET` - LinkedIn app credentials  
- `JWT_SECRET` - Random string for MCP auth

### LinkedIn App Setup
1. Create app at https://www.linkedin.com/developers/
2. Add "Community Management API" product
3. Set redirect URL: `http://localhost:3001/callback`

## Labels
- `linkedin-post` or `idea` - Triggers post generation
- `high-priority` - Schedules post sooner
- `evergreen` - Flexible scheduling

## Manual Controls
- Run "Publish to LinkedIn" workflow manually via Actions tab
- Edit schedule.md directly to reorder posts
- Close PR without merging to skip a post