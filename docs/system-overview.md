# System Overview - LinkedIn Content Automation

**Last Updated**: 2025-07-26  
**Purpose**: Comprehensive system architecture and functionality overview for Claude-powered LinkedIn content automation

---

## Project Summary

An intelligent LinkedIn content automation system that transforms GitHub issues into story-connected LinkedIn posts. Built for solo founders who want to maintain consistent personal branding without the manual overhead, this system leverages Claude's narrative understanding to create contextually aware content that builds on previous posts.

### Key Capabilities

- **Issue-Triggered Generation**: Create posts by opening GitHub issues with ideas
- **Story Continuity**: Claude maintains narrative threads across posts
- **PR-Based Review**: All content reviewed before publishing via pull requests
- **Smart Scheduling**: Automated posting at optimal engagement times
- **Voice Consistency**: Maintains authentic personal brand voice

---

## Architecture Overview

### Technology Stack

- **Workflow Orchestration**: GitHub Actions
- **AI Content Generation**: Claude API (Opus 4) via MCP
- **Version Control**: Git/GitHub
- **Content Storage**: Markdown files in repository
- **Publishing Platform**: LinkedIn API via MCP
- **Language**: YAML (workflows), Markdown (content)

### System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│               LinkedIn Content Automation                    │
├─────────────────────────────────────────────────────────────┤
│                    Trigger Layer                            │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐ │
│  │  GitHub Issues  │  │   PR Reviews    │  │   Scheduler    │ │
│  │  (Content Ideas)│  │  (Approvals)    │  │  (Daily Cron)  │ │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘ │
├─────────────────────────────────────────────────────────────┤
│                  Processing Layer                           │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐ │
│  │ Claude Content  │  │  PR Creation    │  │    Queue       │ │
│  │   Generation    │  │   Workflow      │  │  Management    │ │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘ │
├─────────────────────────────────────────────────────────────┤
│                    Storage Layer                            │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐ │
│  │  Content Config │  │   Draft Posts   │  │   Publishing   │ │
│  │  (tone, history)│  │ (content/drafts)│  │   Schedule     │ │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

---

## Core Components

### 1. Content Generation Workflow

**Location**: `.github/workflows/generate-post.yml`

- **Issue Trigger**: Activates on issues with 'linkedin-post' or 'idea' labels
- **Context Loading**: Reads tone guidelines, best practices, and post history
- **Claude Integration**: Uses Claude Code Action for narrative-aware generation
- **PR Creation**: Automatically creates branch and pull request with draft

### 2. Content Review Workflow

**Location**: `.github/workflows/content-review.yml`

- **PR Validation**: Ensures drafts meet quality standards
- **Manual Review**: Allows editing and feedback via PR comments
- **Approval Flow**: Merge triggers scheduling for publication
- **Issue Linking**: Updates original issue with PR status

### 3. Manual Publishing Workflow

**Location**: `.claude/commands/post.md`

- **Daily Publishing**: Use `/post` command to get scheduled content
- **Manual Control**: Copy and paste to LinkedIn manually
- **Status Tracking**: Mark posts as published after posting
- **History Updates**: Automatically updates history.md for continuity

### 4. Schedule Management

**Location**: `.github/workflows/update-schedule.yml`

- **File Movement**: Moves approved drafts to scheduled folder
- **Simple Organization**: Files dated by name (YYYY-MM-DD-title.md)
- **No Complex Logic**: Just folder-based states
- **Clear Workflow**: draft → scheduled → published

---

## Data Flow

### Content Creation Pipeline

1. **Issue Creation**: User creates GitHub issue with post idea and optional labels
2. **Workflow Trigger**: GitHub Action detects 'linkedin-post' or 'idea' label
3. **Context Gathering**: Claude reads tone.md, best-practices.md, and history.md
4. **Draft Generation**: Claude creates narrative-connected post maintaining voice
5. **PR Creation**: Draft saved to content/drafts/ and PR opened for review
6. **Review & Approval**: Manual review with edits, then merge to main
7. **File Movement**: Approved draft moved to content/scheduled/ folder
8. **Manual Publishing**: Use `/post` command to get content and post manually
9. **History Update**: Published post moved to content/published/ and history.md updated

### Data Structures

#### Post Draft Format

```markdown
---
title: "Post Title Here"
date: 2025-01-20
tags: [startup, building-in-public, ai]
priority: normal # high, normal, low
original_issue: 42
scheduled_date: 2025-01-21
status: draft # draft, queued, published, failed
---

# LinkedIn Post Content

Your post content here...
```

#### Schedule Entry

```yaml
- date: 2025-01-21
  file: content/drafts/2025-01-20-ai-automation.md
  title: "How AI Changed My Daily Workflow"
  issue: 42
  status: queued # queued, published, failed
  priority: normal
  published_url: null # Updated after publishing
```

---

## Current Implementation Status

### ✅ Completed Features

- **Issue-Triggered Generation**: GitHub issues with labels trigger post creation
- **Claude Integration**: Uses Claude Code Action for content generation
- **PR-Based Review**: Drafts created as PRs for review and approval
- **Context Files**: Tone, best practices, and comprehensive history guide
- **File-Based Workflow**: Simple draft → scheduled → published folder structure
- **Manual Publishing**: `/post` command for daily publishing routine
- **History Tracking**: Automatic updates to maintain narrative continuity

### 🎯 Design Decisions

- **No LinkedIn API**: Manual posting for full control and compliance
- **Folder-Based States**: Simple file movement instead of complex scheduling
- **Human-in-the-Loop**: Every post reviewed and published manually
- **Git as Database**: Complete audit trail with version control

### 📋 Future Enhancements

- **Post Templates**: Pre-formatted templates for common post types
- **Engagement Tracking**: Manual entry of post performance
- **Series Management**: Tools for managing post series
- **Archive System**: Yearly archiving of published posts

---

## Algorithm Details

### Narrative Continuity Algorithm

The system maintains story coherence across posts using:

1. **History Analysis**: Parses recent posts from history.md to identify themes
2. **Topic Threading**: Connects new content to previous narratives
3. **Voice Matching**: Applies tone guidelines to maintain consistency
4. **Context Windows**: Uses last 5-10 posts for narrative context

### Smart Scheduling Algorithm

Optimizes post timing for maximum engagement:

1. **Priority Scoring**: High-priority posts get immediate next-day slots
2. **Engagement Windows**: Targets 8-10 AM and 4-6 PM timezone-adjusted
3. **Spacing Logic**: Ensures minimum 18-hour gaps between posts
4. **Conflict Resolution**: Bumps lower priority posts when conflicts arise

---

## Performance Considerations

### Current Limitations

- **API Rate Limits**: LinkedIn API has daily posting limits
- **Context Window**: Claude's context limited to recent post history
- **Manual Review**: Each post requires human approval (by design)
- **Single User**: System designed for individual use, not teams

### Optimization Strategies

- **Batch Processing**: Generate multiple drafts in one Claude session
- **Context Caching**: Store processed history analysis for reuse
- **Parallel Workflows**: Run multiple GitHub Actions concurrently
- **Smart Retries**: Exponential backoff for API failures

---

## Security & Privacy

### Authentication & Access

- **GitHub Secrets**: All API tokens stored as encrypted secrets
- **OAuth Tokens**: Claude Code OAuth for secure API access
- **Repository Permissions**: Granular permissions for Actions
- **PR Reviews**: Human-in-the-loop for all content approval

### Data Protection

- **Content Privacy**: All drafts remain in private repository
- **No PII Storage**: System doesn't store personal information
- **Audit Trail**: Git history provides complete audit log
- **Token Rotation**: Regular rotation of API credentials

---

## Development Guidelines

### Code Organization

```
linkedin/
├── .github/workflows/     # GitHub Actions workflows
│   ├── generate-post.yml  # Issue → Draft generation
│   ├── content-review.yml # PR review automation
│   ├── publish-linkedin.yml # Publishing scheduler
│   └── update-schedule.yml # Schedule management
├── content/               # All content files
│   ├── config/           # Configuration files
│   │   ├── tone.md       # Voice guidelines
│   │   ├── best-practices.md # Content strategies
│   │   └── history.md    # Published post history
│   ├── drafts/           # Draft posts pending review
│   └── schedule.md       # Publishing schedule
├── docs/                 # Documentation
│   ├── product/          # Product requirements
│   ├── system-overview.md # This file
│   └── INDEX.md          # Documentation hub
└── scratch/              # Temporary notes
```

### Key Principles

- **Content as Code**: All content versioned in Git
- **Review Everything**: No automated publishing without approval
- **Maintain Context**: Every post connects to the narrative
- **Fail Gracefully**: Clear error messages and recovery paths

---

## Deployment & Operations

### Initial Setup

```bash
# 1. Fork/clone the repository
git clone https://github.com/yourusername/linkedin-automation

# 2. Set up GitHub Secrets
# Add in repository settings:
# - CLAUDE_CODE_OAUTH_TOKEN (required for Claude AI)

# 3. Configure your voice and style
# Edit content/config/tone.md with your authentic voice
# Edit content/config/best-practices.md with your content strategies
# Review content/config/history.md to understand narrative continuity

# 4. Enable GitHub Actions
# Ensure Actions are enabled in repository settings

# 5. Create initial folders
mkdir -p content/drafts content/scheduled content/published
```

### Daily Operations

```bash
# Morning routine
/post                    # Get today's scheduled post
# Copy content to LinkedIn
# Reply 'posted' when done

# Check scheduled posts
ls content/scheduled/    # See upcoming posts

# Archive old posts (quarterly)
mkdir -p content/archive/2024
mv content/published/2024-*.md content/archive/2024/
```

### Production Considerations

- **No API Tokens**: No LinkedIn credentials needed
- **Simple Workflow**: File-based states are easy to debug
- **Version Control**: Every change tracked in Git
- **Manual Control**: You decide when and what to post

---

## Future Roadmap

### Phase 1: Content Enhancement (Q1 2025)

- ✅ Comprehensive post history tracking
- ✅ Manual publishing workflow
- 📋 Post template library
- 📋 Series management tools

### Phase 2: Workflow Optimization (Q2 2025)

- 📋 Engagement tracking system
- 📋 Post performance analytics (manual entry)
- 📋 Content calendar visualization
- 📋 Batch post generation

### Phase 3: Advanced Features (Q3 2025)

- 📋 Multi-author support
- 📋 Content collaboration tools
- 📋 Archive search and retrieval
- 📋 Export tools for content repurposing

---

This system overview provides a comprehensive understanding of the LinkedIn Content Automation system's architecture, capabilities, and development status. For specific implementation details, refer to the individual workflow files and documentation.
