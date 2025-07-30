# LinkedIn Content Automation - Project Guidelines

## Project Overview

This is a LinkedIn content automation system that uses Claude to generate story-connected posts from GitHub issues. The system maintains narrative continuity across posts while preserving an authentic personal brand voice through a manual publishing workflow.

## CRITICAL: Documentation Reading Order

### 📚 MANDATORY READING ORDER:

1. **FIRST**: Read [`docs/INDEX.md`](docs/INDEX.md) - Project navigation and overview
2. **SECOND**: Read [`docs/system-overview.md`](docs/system-overview.md) - Architecture details
3. **THEN**: Consult specific technical docs as needed

## Project-Specific Rules

### Workflow Development
- **GitHub Actions Only**: All automation via `.github/workflows/`
- **YAML Syntax**: Use proper YAML formatting with 2-space indentation
- **Secret Management**: Never log or expose secrets in workflows
- **Error Handling**: Always include error states and recovery logic

### Content Management
- **File Storage**: All content stored as markdown in `content/`
- **Folder States**: draft → scheduled → published workflow
- **Frontmatter Required**: Every post must have valid YAML frontmatter
- **Git as Database**: Use Git history for audit trails, no external DB
- **Human Review**: All content requires PR approval before scheduling
- **Manual Publishing**: Use `/post` command for daily publishing

### Claude Integration
- **Context Loading**: Always load tone.md, best-practices.md, memory.md, and history.md
- **Narrative Continuity**: Reference previous posts for story threading
- **Voice Consistency**: Maintain voice guidelines from config files
- **Token Efficiency**: Minimize context usage, batch operations

### File Naming Conventions
- **All Posts**: `YYYY-MM-DD-{descriptive-slug}.md`
- **Folder Organization**: 
  - `content/drafts/` - New posts from PRs
  - `content/scheduled/` - Approved posts ready to publish
  - `content/published/` - Posts after manual publishing
- **Workflows**: `.github/workflows/{action}-{target}.yml`
- **Documentation**: Clear, descriptive names in docs/

### Security Practices
- **API Tokens**: Store in GitHub Secrets only
- **Branch Protection**: Main branch requires PR reviews
- **Input Validation**: Sanitize all workflow inputs
- **Minimal Permissions**: Use least-privilege principle

## Development Commands

### Testing Workflows Locally
```bash
# Test workflow syntax
yamllint .github/workflows/*.yml

# Check GitHub Actions
act -l  # List workflows
act -j generate-post  # Test specific job
```

### Content Operations
```bash
# Daily publishing
/post  # Get today's scheduled post

# Check scheduled posts
ls content/scheduled/

# Find posts by date
ls content/scheduled/$(date +%Y-%m-%d)-*.md

# Archive old posts quarterly
mkdir -p content/archive/2024
mv content/published/2024-*.md content/archive/2024/
```

### Claude Commands
- `/post` - Get scheduled post for manual publishing
- Reply `posted` after publishing to update system

## Important Reminders
- Do what has been asked; nothing more, nothing less
- NEVER create files unless absolutely necessary
- ALWAYS prefer editing existing files over creating new ones
- NEVER proactively create documentation unless requested
- ALWAYS maintain the PR review workflow for content
- Remember: Manual publishing gives full control - no automated posting

## Key History Context
- Professional journey: VMware expert → Startup founder → CTO
- Authentic voice: Conversational, honest about failures, skeptical of hype
- Focus areas: AI practicality, team building, education
- Avoid: Web3 hype (only posted when company-required)
