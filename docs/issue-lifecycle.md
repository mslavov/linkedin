# Issue Lifecycle & Project Management

**Last Updated**: 2025-01-27  
**Purpose**: Comprehensive guide to managing LinkedIn content creation through GitHub Issues and Projects

---

## Issue Lifecycle Overview

The LinkedIn content automation system follows a structured lifecycle for each piece of content, from initial idea to published post:

### 1. **Idea Creation** (Issue Opened)
- Create a GitHub issue with your post idea
- Add the `linkedin-post` or `idea` label
- Include any context, key points, or narrative connections
- Issue is automatically added to the GitHub Project board (if configured)

### 2. **Content Generation** (Workflow Running)
- GitHub Action triggers on label addition
- Project card moves to "Generating"
- Claude reads context files and generates draft
- PR is created automatically with the draft content
- Issue is linked to the PR with "Closes #X" syntax
- Project card moves to "Review" when PR is created

### 3. **Review & Refinement** (PR Open)
- Manual review of the generated content
- Edit directly in the PR for improvements
- Claude provides automated feedback on tone and best practices
- Project card stays in "Review" until PR is merged

### 4. **Scheduling** (PR Merged)
- Approved content is merged to main branch
- Post is automatically moved to `content/scheduled/`
- Added to schedule.json with optimal posting date
- Project card moves to "Scheduled"
- **Note**: Issue remains open until publication

### 5. **Publishing** (Manual Post)
- Use `/post` command to get today's scheduled content
- Manually copy and post to LinkedIn
- Confirm publication with "posted" response

### 6. **Completion** (Issue Closed)
- Post file moved to `content/published/` with date prefix
- History.md updated with post summary
- Original issue is automatically closed
- Project card moves to "Published/Archive"
- Optional: Add engagement metrics to the closed issue

---

## GitHub Project Setup

### Why Use a Project?

A GitHub Project provides visual workflow management through a kanban board, offering:
- **Visual Pipeline**: See all content at various stages at a glance
- **Bottleneck Detection**: Identify where content gets stuck
- **Metrics Tracking**: Record engagement scores and analyze performance
- **Team Collaboration**: Multiple contributors can see the content calendar

### Setting Up the Project

1. **Automatic Setup**:
   ```bash
   ./scripts/setup-github-project.sh
   ```

2. **Manual Setup**:
   - Go to your repository → Projects → New Project
   - Choose "Board" layout
   - Create these columns:
     - 📝 Ideas (issues without label)
     - 🤖 Generating (workflow running)
     - 👀 Review (PR open for edits)
     - 📅 Scheduled (PR merged)
     - ✅ Published (posted to LinkedIn)
     - 📊 Archive (closed with metrics)

3. **Configure Automation**:
   - Auto-add issues to "Ideas" when created
   - Move to "Generating" when `linkedin-post` label added
   - Move to "Review" when PR is created (linked to issue)
   - Move to "Scheduled" when PR is merged
   - Move to "Published" when issue is closed
   - Archive completed items after 30 days

### Custom Fields

Add these fields to track additional metadata:
- **Priority**: High/Normal/Low
- **Content Type**: Story/Tips/Technical/Announcement
- **Scheduled Date**: Target publication date
- **Engagement Score**: Post-publication metrics

---

## Workflow Automations

### Status Update Automations

The system includes several workflows that automatically update project status:

#### 1. **Generate Post Workflow** (`.github/workflows/generate-post.yml`)
- Sets status to "🤖 Generating" when issue is labeled
- Sets status to "👀 Review" after PR is created
- Uses GraphQL API for real-time updates

#### 2. **PR Merge Workflow** (`.github/workflows/pr-merged-to-scheduled.yml`)
- Triggers when PR is merged to main
- Sets status to "📅 Scheduled"
- Adds comment to issue confirming scheduling

#### 3. **Close Published Issue** (`.github/workflows/close-published-issue.yml`)
- Triggered by `/post` command after publishing
- Sets status to "✅ Published" 
- Closes issue with publication confirmation
- Supports optional engagement metrics

#### 4. **Add to Project** (`.github/workflows/add-to-project.yml`)
- Automatically adds issues with 'linkedin-post' label to project
- Initial status set to "📝 Ideas" by project automation

### Project Automation Settings

Configure these in your GitHub Project settings:
- **Item added to project** → Set Status to "📝 Ideas"
- **Item closed** → Set Status to "📊 Archive"
- **Auto-archive** → After 30 days in Archive

---

## Best Practices

### Issue Creation
- **Clear Titles**: Use descriptive titles that summarize the post topic
- **Detailed Context**: Include key points, target audience, and goals
- **Narrative Links**: Reference previous posts for continuity
- **Labels**: Always add `linkedin-post` or `idea` label

### Review Process
- **Voice Check**: Ensure content matches your authentic voice
- **Fact Verification**: Verify any claims or statistics
- **Engagement Optimization**: Check hook strength and CTA clarity
- **Timing Consideration**: Review scheduled date for relevance

### Project Management
- **Regular Reviews**: Weekly review of the content pipeline
- **Metric Tracking**: Record engagement after each post
- **Retrospectives**: Monthly analysis of what content performs best
- **Pipeline Health**: Ensure steady flow, avoid bottlenecks

---

## Troubleshooting

### Issue Not Auto-Closing
- Verify the PR body contains "Closes #X"
- Ensure you have proper permissions
- Check if close-published-issue workflow ran successfully
- Manually close with explanation if needed

### Project Card Not Moving
- Check automation rules in project settings
- Verify issue has correct labels
- Ensure workflows have proper permissions
- Manually move card if automation fails

### Content Scheduling Conflicts
- Review schedule.json for conflicts
- Adjust priorities in issue descriptions
- Use manual scheduling for time-sensitive content
- Consider content spacing requirements

---

## Metrics & Analytics

### Tracking Engagement
After publishing, record metrics by:
1. Adding comment to closed issue with stats
2. Updating Engagement Score in project
3. Including metrics in history.md entries

### Analyzing Performance
- Export project data for analysis
- Track trends in engagement by content type
- Identify optimal posting times
- Measure narrative continuity impact

---

## Future Enhancements

### Planned Improvements
- Automated engagement metric collection
- AI-powered content performance prediction
- Multi-platform publishing support
- Advanced scheduling algorithms
- Team collaboration features

### Community Contributions
- Fork and enhance the workflow
- Share custom automations
- Contribute documentation improvements
- Add integration possibilities

---

This documentation provides a complete guide to managing your LinkedIn content pipeline using GitHub's built-in project management tools, ensuring a smooth workflow from idea to published post.