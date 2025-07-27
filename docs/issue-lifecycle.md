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

### 2. **Content Generation** (PR Created)
- GitHub Action triggers on label addition
- Claude generates a draft maintaining voice and narrative continuity
- PR is created with the draft content
- Issue is linked to the PR with "Closes #X" syntax
- Project card moves to "In Progress"

### 3. **Review & Refinement** (PR Review)
- Manual review of the generated content
- Edit directly in the PR for improvements
- Claude provides automated feedback on tone and best practices
- Project card in "Review" column

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
     - 📝 Ideas
     - 🚧 In Progress  
     - 👀 Review
     - 📅 Scheduled
     - ✅ Published
     - 📊 Archive

3. **Configure Automation**:
   - Auto-add issues with `linkedin-post` label
   - Move cards based on PR status
   - Archive completed items after 30 days

### Custom Fields

Add these fields to track additional metadata:
- **Priority**: High/Normal/Low
- **Content Type**: Story/Tips/Technical/Announcement
- **Scheduled Date**: Target publication date
- **Engagement Score**: Post-publication metrics

---

## Workflow Automations

### Issue Auto-Close Workflow

Located in `.github/workflows/close-published-issue.yml`, this workflow:
- Triggers when content is published via `/post` command
- Adds publication confirmation to the issue
- Closes the issue with completion status
- Updates project card status

### Project Automation

The `.github/workflows/add-to-project.yml` workflow:
- Automatically adds new issues to the project
- Assigns to appropriate column based on labels
- Updates card status as issue progresses

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