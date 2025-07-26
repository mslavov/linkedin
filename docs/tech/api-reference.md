# API Reference - LinkedIn Content Automation

**Last Updated**: 2025-07-26  
**Purpose**: Technical reference for GitHub Actions workflows and integrations

---

## GitHub Actions Workflows

### 1. Generate LinkedIn Post

**File**: `.github/workflows/generate-post.yml`  
**Trigger**: GitHub issue creation or labeling

#### Trigger Events

```yaml
on:
  issues:
    types: [opened, labeled]
```

#### Required Labels
- `linkedin-post` - Triggers post generation
- `idea` - Alternative trigger label

#### Workflow Inputs

| Input | Source | Description |
|-------|--------|-------------|
| Issue Number | `github.event.issue.number` | Unique identifier for tracking |
| Issue Title | `github.event.issue.title` | Post topic/subject |
| Issue Body | `github.event.issue.body` | Detailed content/context |
| Labels | `github.event.issue.labels` | Priority and categorization |

#### Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `CLAUDE_CODE_OAUTH_TOKEN` | Yes | Claude API authentication |
| `GITHUB_TOKEN` | Yes | GitHub API access (auto-provided) |

#### Outputs

- New branch: `post/issue-{number}`
- Draft file: `content/drafts/YYYY-MM-DD-{title}.md`
- Pull request with draft content
- Comment on original issue

---

### 2. Content Review

**File**: `.github/workflows/content-review.yml`  
**Trigger**: Pull request events

#### Trigger Events

```yaml
on:
  pull_request:
    types: [opened, edited, synchronize]
    paths:
      - "content/drafts/**/*.md"
```

#### Workflow Actions

1. **Validation Checks**
   - Frontmatter format validation
   - Content length requirements
   - Required metadata fields

2. **Quality Checks**
   - Voice consistency analysis
   - Narrative connection verification
   - Best practices compliance

#### Review Outputs

- Check status on PR (pass/fail)
- Inline comments for improvements
- Merge readiness indicator

---

### 3. Schedule Approved Post

**File**: `.github/workflows/update-schedule.yml`  
**Trigger**: Pull request merge

#### Trigger Events

```yaml
on:
  pull_request:
    types: [closed]
    paths:
      - "content/drafts/**/*.md"
```

#### Workflow Actions

```yaml
if: github.event.pull_request.merged == true
```

#### File Movement

1. **Extract merged draft**: Get filename from Git diff
2. **Move to scheduled**: `mv content/drafts/file.md content/scheduled/`
3. **Commit change**: Auto-commit with descriptive message
4. **Update issue**: Notify original issue of scheduling

#### Simple Organization

- Files named with date: `YYYY-MM-DD-title.md`
- No complex scheduling logic
- Manual publishing control
- Clear folder-based states

---

### 4. Manual Publishing Workflow

**File**: `.claude/commands/post.md`  
**Trigger**: Claude slash command

#### Command Usage

```bash
/post  # Get today's scheduled post
```

#### Publishing Process

1. **Check scheduled folder**: Find posts dated today or earlier
2. **Display content**: Show formatted post for copying
3. **Wait for confirmation**: User posts manually to LinkedIn
4. **Move to published**: File moved to `content/published/`
5. **Update history**: Add summary to `history.md`

#### Folder Structure

```
content/
├── scheduled/    # Posts ready to publish
├── published/    # Posts after publishing
└── config/
    └── history.md  # Updated with summaries
```

#### Benefits

- No API authentication needed
- Full control over timing
- No ToS violations
- Simple file-based workflow

---

## Claude API Integration

### Content Generation Endpoint

**Action**: `anthropics/claude-code-action@beta`  
**Model**: `claude-opus-4-20250514`

#### Request Format

```yaml
with:
  claude_code_oauth_token: ${{ secrets.CLAUDE_CODE_OAUTH_TOKEN }}
  model: "claude-opus-4-20250514"
  direct_prompt: |
    [Structured prompt with context]
  allowed_tools: "Read,Write,Bash,Grep"
```

#### Context Loading

Files automatically loaded by Claude:
- `content/config/tone.md` - Voice guidelines
- `content/config/best-practices.md` - Content strategies  
- `content/config/history.md` - Recent posts

#### Response Handling

Claude generates:
1. Draft content with frontmatter
2. Git branch creation
3. File commit
4. Pull request with explanation

---

## Data Formats

### Post Draft Frontmatter

```yaml
---
title: "Post Title"
date: YYYY-MM-DD
tags: [tag1, tag2, tag3]
priority: normal  # high, normal, low
original_issue: 123
scheduled_date: YYYY-MM-DD
status: draft  # draft, queued, published, failed
---
```

### Schedule Entry Schema

```yaml
posts:
  - date: string (YYYY-MM-DD)
    file: string (path to draft)
    title: string
    issue: number
    status: enum [queued, published, failed]
    priority: enum [high, normal, low]
    published_url: string (nullable)
```

---

## Error Codes & Handling

### Workflow Errors

| Code | Description | Resolution |
|------|-------------|------------|
| W001 | No draft file found | Check PR contents |
| W002 | Invalid frontmatter | Fix metadata format |
| W003 | Schedule conflict | Adjust timing |
| W004 | API rate limit | Wait and retry |

### API Errors

| Code | Description | Resolution |
|------|-------------|------------|
| A001 | Claude API timeout | Retry with backoff |
| A002 | LinkedIn auth failed | Check token validity |
| A003 | Invalid post format | Review content structure |
| A004 | Network error | Check connectivity |

---

## Webhook Events

### Issue Events

```json
{
  "action": "opened|labeled",
  "issue": {
    "number": 123,
    "title": "Post idea title",
    "body": "Detailed description",
    "labels": [
      {"name": "linkedin-post"},
      {"name": "priority:high"}
    ]
  }
}
```

### Pull Request Events

```json
{
  "action": "opened|closed|merged",
  "pull_request": {
    "number": 456,
    "title": "New post: Topic",
    "head": {
      "ref": "post/issue-123"
    },
    "merged": true
  }
}
```

---

## Integration Points

### MCP Servers

1. **Claude Code MCP**
   - Content generation
   - Context analysis
   - Draft creation
   - Narrative continuity

### External Services

| Service | Purpose | Authentication |
|---------|---------|----------------|
| GitHub API | Repository operations | GITHUB_TOKEN |
| Claude API | Content generation | OAuth token |

---

## Rate Limits

### GitHub Actions

- Workflow runs: 1000/hour per repository
- API calls: 5000/hour with token
- Artifact storage: 500 MB per artifact

### Claude API

- Requests: Based on OAuth plan
- Context window: ~200k tokens
- Generation: ~4k tokens per request

### Manual Posting

- No rate limits
- Post at your convenience
- Full control over timing

---

## Best Practices

### Workflow Design

1. **Idempotency**: Ensure reruns produce same result
2. **Error Recovery**: Handle partial failures gracefully  
3. **Logging**: Comprehensive action logging
4. **Secrets**: Never log sensitive data

### API Usage

1. **Batch Operations**: Minimize API calls
2. **Caching**: Store frequently used data
3. **Retries**: Implement exponential backoff
4. **Monitoring**: Track API usage metrics

### Security

1. **Token Rotation**: Regular credential updates
2. **Least Privilege**: Minimal permission scopes
3. **Audit Logging**: Track all operations
4. **Input Validation**: Sanitize all inputs

---

This API reference provides the technical details needed to understand and extend the LinkedIn Content Automation system. For implementation examples, see the workflow files directly.