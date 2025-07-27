# GitHub Project Setup Guide

This guide provides both automated and manual instructions for setting up a GitHub Project to manage your LinkedIn content pipeline.

## Automated Setup

### Prerequisites

1. Install GitHub CLI: https://cli.github.com/
2. Authenticate with proper scopes:
   ```bash
   gh auth login
   gh auth refresh -s project,read:project
   ```

### Run Setup Script

```bash
./scripts/setup-github-project.sh
```

The script will:
- Create a new GitHub Project named "LinkedIn Content Pipeline"
- Add custom fields (Priority, Content Type, Scheduled Date, Engagement Score)
- Create an auto-add workflow for new issues
- Provide instructions for final configuration

## Manual Setup

If you prefer to set up the project manually or the script fails:

### 1. Create the Project

1. Go to your repository on GitHub
2. Click the "Projects" tab
3. Click "New project" → "New project"
4. Choose "Board" layout
5. Name it "LinkedIn Content Pipeline"

### 2. Configure Columns

Create these columns in order:
- 📝 Ideas
- 🚧 In Progress
- 👀 Review
- 📅 Scheduled
- ✅ Published
- 📊 Archive

### 3. Add Custom Fields

In project settings, add these fields:

1. **Priority** (Single select)
   - Options: High, Normal, Low
   
2. **Content Type** (Single select)
   - Options: Story, Tips, Announcement, Technical, Thought Leadership
   
3. **Scheduled Date** (Date)

4. **Engagement Score** (Number)

### 4. Create Auto-Add Workflow

Create `.github/workflows/add-to-project.yml`:

```yaml
name: Add LinkedIn Issues to Project

on:
  issues:
    types:
      - opened
      - labeled

jobs:
  add-to-project:
    name: Add issue to project
    runs-on: ubuntu-latest
    if: contains(github.event.issue.labels.*.name, 'linkedin-post') || contains(github.event.issue.labels.*.name, 'idea')
    steps:
      - uses: actions/add-to-project@v0.5.0
        with:
          project-url: YOUR_PROJECT_URL_HERE
          github-token: ${{ secrets.GITHUB_TOKEN }}
          labeled: linkedin-post, idea
```

Replace `YOUR_PROJECT_URL_HERE` with your actual project URL.

### 5. Configure Automations

In the project settings, set up these automations:

1. **When issues are opened** → Move to "Ideas"
2. **When PRs are opened** → Move to "In Progress"
3. **When PRs have activity** → Move to "Review"
4. **When PRs are merged** → Move to "Scheduled"
5. **When issues are closed** → Move to "Published"

### 6. Add Existing Issues

To add all existing LinkedIn post issues:

```bash
# Get your project number from the URL
PROJECT_NUMBER=YOUR_PROJECT_NUMBER

# Add all issues with linkedin-post label
gh issue list --label linkedin-post --json number --jq '.[].number' | while read issue; do
  gh project item-add $PROJECT_NUMBER --owner YOUR_USERNAME --url https://github.com/YOUR_USERNAME/linkedin/issues/$issue
done
```

## Using the Project

### Daily Workflow

1. **Create Ideas**: Open issues with `linkedin-post` label
2. **Track Progress**: Cards move automatically through columns
3. **Review Status**: Check board for content pipeline health
4. **Update Metrics**: Add engagement scores after publishing

### Best Practices

- Review the board weekly
- Archive completed items monthly
- Use filters to focus on specific content types
- Track metrics to improve content strategy

## Troubleshooting

### Permission Issues

If you see "missing required scopes" errors:
```bash
gh auth refresh -s project,read:project,write:project
```

### Cards Not Moving

- Check workflow permissions in repository settings
- Verify automation rules in project settings
- Ensure labels are correctly applied

### Manual Card Management

You can always drag cards manually between columns if automation fails.

## Next Steps

1. Complete the setup (automated or manual)
2. Add your open issues to the project
3. Start using the board for daily content management
4. Customize further based on your workflow needs