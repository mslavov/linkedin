# Documentation Index

**Purpose**: Central navigation hub  
**Project**: LinkedIn Content Automation

## 📋 Documentation Overview

A Claude-powered system that transforms GitHub issues into story-connected LinkedIn posts, with a manual publishing workflow that gives you full control over your content.

## 🏗️ Architecture
- [`system-overview.md`](system-overview.md) - Complete system architecture and components
- Workflow orchestration via GitHub Actions
- Claude AI integration for narrative continuity
- Simple folder-based workflow (draft → scheduled → published)
- Manual publishing via `/post` command

## 📁 Product
- [`product/initial-prd.md`](product/initial-prd.md) - Product requirements and vision
- [`product/README.md`](product/README.md) - Product documentation guide
- [`product/template.md`](product/template.md) - PRD template for new features

## 🔧 Technical
- [`tech/api-reference.md`](tech/api-reference.md) - GitHub Actions workflows and Claude integration
- [`tech/storage-reference.md`](tech/storage-reference.md) - Folder-based workflow and file organization
- [`issue-lifecycle.md`](issue-lifecycle.md) - Issue lifecycle management and GitHub Projects setup

## 🎆 Getting Started

1. **Setup Repository**: Fork/clone and configure CLAUDE_CODE_OAUTH_TOKEN
2. **Configure Voice**: Edit `content/config/tone.md`, `memory.md`, and review `history.md`
3. **Create Content**: Open GitHub issue with `linkedin-post` or `idea` label
4. **Publish Manually**: Use `/post` command to get content and post to LinkedIn

## 📂 Project Structure

```
linkedin/
├── .github/workflows/     # Automation workflows
├── content/              # All content files
│   ├── config/          # Voice, memory, and guidelines
│   ├── drafts/          # Pending posts
│   └── schedule.md      # Publishing queue
├── docs/                # This documentation
└── scratch/             # Temporary notes
```

## Quick Task Lookup

| Task Type | Primary Doc | Workflow/Command |
|-----------|------------|------------------|
| Create Post | Open GitHub issue | `generate-post.yml` |
| Review Draft | Check pull request | `content-review.yml` |
| Schedule Post | Merge PR | `update-schedule.yml` |
| Publish Post | Use `/post` command | Manual copy/paste |
| Check Queue | `ls content/scheduled/` | - |
| Update Voice | `content/config/tone.md` | - |
| Update Memory | `content/config/memory.md` | - |
| View History | `content/config/history.md` | - |
| Debug Workflow | `tech/api-reference.md` | Check Actions tab |

## 🔄 Workflow States

1. **Idea** → GitHub Issue
2. **Draft** → Pull Request (content/drafts/)
3. **Scheduled** → Merged PR (content/scheduled/)
4. **Published** → Manual post (content/published/)
5. **Archived** → History updated (history.md)

## 📊 Key Metrics

- Time from idea to published post
- PR approval rate
- Posting consistency
- Narrative coherence score

## 🛠️ Maintenance

- Check scheduled posts daily with `/post`
- Update voice guidelines as your style evolves
- Archive old posts quarterly to content/archive/
- Review history.md for narrative consistency