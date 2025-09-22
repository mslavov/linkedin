# Generate LinkedIn Post

You create LinkedIn posts from GitHub issues or local idea files while maintaining narrative continuity and brand voice consistency.

<source> #$ARGUMENTS </source>

## Workflow

Generate a LinkedIn post based on a GitHub issue or local idea file, following the established voice guidelines and maintaining story continuity with previous posts.

## Tasks

When invoked with an issue number (e.g., `/generate-post 31`) or an idea file name (e.g., `/generate-post ai-automation.md`):

### 1. Read Context Files
First, read ALL context files to understand the brand voice and narrative history:
- Read `content/config/tone.md` - Voice and style guidelines
- Read `content/config/best-practices.md` - LinkedIn optimization rules
- Read `content/config/memory.md` - Key themes and narratives
- Read `content/config/history.md` - Recent post summaries

### 2. Fetch Source Content
Get the content from the specified source:

**If numeric (GitHub issue):**
- Use `gh issue view <issue_number>` to get title and body
- Extract the core message and theme from the issue

**If filename (local idea):**
- Read `content/ideas/<filename>` to get the idea content
- Extract the core message and theme from the idea file
- Use the metadata from the idea's frontmatter

### 3. Generate Post Content
Create a LinkedIn post that:
- Maintains narrative continuity with recent posts in history.md
- Follows the voice guidelines from tone.md
- Implements best practices from best-practices.md
- Avoids topic fatigue (check last 3 posts for variety)
- Connects to previous stories when relevant
- Uses authentic, conversational tone

### 4. Create Draft File
Create the draft file in `content/drafts/`:
- Filename: `descriptive-slug.md` (e.g., "ai-agent-building.md")
- NO date prefix in the filename
- Include valid YAML frontmatter:
  ```yaml
  ---
  title: "Engaging Title Here"
  tags: ["tag1", "tag2", "tag3"]
  priority: 1
  original_issue: <issue_number>  # if from GitHub
  original_idea: <idea_filename>   # if from local idea
  ---
  ```
- Write post content in markdown format (will be converted to plain text for LinkedIn)

### 5. Next Steps (Context-Dependent)

**If from GitHub issue:**
- Create Pull Request:
```bash
git checkout -b post/issue-<issue_number>
git add content/drafts/*.md
git commit -m "Add LinkedIn post draft from issue #<issue_number>"
git push -u origin post/issue-<issue_number>
```
- Create the PR:
```bash
gh pr create \
  --title "Add LinkedIn post: <issue_title>" \
  --body "Generated LinkedIn post from issue #<issue_number>

This PR adds a draft post that:
- Maintains narrative continuity
- Follows brand voice guidelines
- Ready for review and scheduling

Closes #<issue_number>"
```
- Update Issue:
```bash
gh issue comment <issue_number> --body "🤖 Draft post has been generated! Review the PR: <pr_url>"
```

**If from local idea:**
- Update the idea file status:
  - Change `status: new` to `status: drafted`
  - Add `draft_file: <draft_filename>`
  - Add `drafted_date: YYYY-MM-DD`
- Inform the user:
  - Draft has been created at `content/drafts/<filename>`
  - Ready for review and scheduling using `/schedule-post`

## Important Guidelines

### Voice Consistency
- Conversational and authentic tone
- Honest about failures and learnings
- Skeptical of hype, practical focus
- Personal stories over generic advice

### Narrative Threading
- Reference previous posts when relevant
- Continue story arcs (startup journey, AI experiments, team building)
- Build on established themes from memory.md
- Avoid repetitive topics (check last 3 posts)

### LinkedIn Optimization
- Start with a hook (question, bold statement, story opening)
- Use line breaks for readability
- Include a clear call-to-action
- Keep under 3000 characters
- Use relevant hashtags (3-5 max)

### Quality Checks
Before creating the PR, verify:
- ✓ Context files were read
- ✓ Post maintains narrative continuity
- ✓ Voice is consistent with guidelines
- ✓ File has valid frontmatter
- ✓ Topic provides variety from recent posts
- ✓ Post follows LinkedIn best practices

## Error Handling

If any step fails:
- Stop immediately and report the specific error
- Do not proceed with partial completion
- Provide clear error context for debugging

## Example Usage

### From GitHub Issue:
```
/generate-post 31
```
This will:
1. Load all context files
2. Fetch issue #31 from GitHub
3. Generate a narrative-connected post
4. Create draft file in content/drafts/
5. Create a PR for review
6. Link PR to the original issue

### From Local Idea:
```
/generate-post ai-automation.md
```
This will:
1. Load all context files
2. Read idea from content/ideas/ai-automation.md
3. Generate a narrative-connected post
4. Create draft file in content/drafts/
5. Update the idea file status
6. Ready for local review and scheduling