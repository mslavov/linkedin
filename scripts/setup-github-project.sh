#!/bin/bash

# Setup GitHub Project for LinkedIn Content Management
# This script creates a GitHub Project with kanban board for content workflow

set -e

echo "🚀 Setting up GitHub Project for LinkedIn Content Management..."

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed. Please install it first."
    echo "Visit: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub CLI. Please run: gh auth login"
    exit 1
fi

# Get repository information
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)
echo "📦 Repository: $REPO"

# Create the project
echo "📋 Creating GitHub Project..."
PROJECT_URL=$(gh project create --title "LinkedIn Content Pipeline" \
  --body "Kanban board for managing LinkedIn post creation workflow from idea to publication" \
  --format json | jq -r .url)

if [ -z "$PROJECT_URL" ]; then
    echo "❌ Failed to create project"
    exit 1
fi

echo "✅ Project created: $PROJECT_URL"
PROJECT_NUMBER=$(echo $PROJECT_URL | grep -oE '[0-9]+$')

# Create custom fields
echo "🔧 Creating custom fields..."

# Priority field
gh project field-create $PROJECT_NUMBER \
  --name "Priority" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "High,Normal,Low" || echo "Priority field might already exist"

# Content Type field  
gh project field-create $PROJECT_NUMBER \
  --name "Content Type" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "Story,Tips,Announcement,Technical,Thought Leadership" || echo "Content Type field might already exist"

# Scheduled Date field
gh project field-create $PROJECT_NUMBER \
  --name "Scheduled Date" \
  --data-type "DATE" || echo "Scheduled Date field might already exist"

# Engagement Score field
gh project field-create $PROJECT_NUMBER \
  --name "Engagement Score" \
  --data-type "NUMBER" || echo "Engagement Score field might already exist"

echo "✅ Custom fields created"

# Create views
echo "📊 Creating project views..."

# The default view is already a board view, we'll update it
# Note: GitHub CLI doesn't support creating/modifying views directly yet
echo "ℹ️  Please manually configure the board columns in the GitHub UI:"
echo "   1. 📝 Ideas (new issues)"
echo "   2. 🚧 In Progress (PR created)"
echo "   3. 👀 Review (PR open)"
echo "   4. 📅 Scheduled (PR merged)"
echo "   5. ✅ Published (manually posted)"
echo "   6. 📊 Archive (closed with metrics)"

# Link project to repository
echo "🔗 Linking project to repository..."
gh api graphql -f query='
  mutation($projectId: ID!, $repositoryId: ID!) {
    linkProjectV2ToRepository(input: {
      projectId: $projectId
      repositoryId: $repositoryId
    }) {
      repository {
        name
      }
    }
  }
' -f projectId="$PROJECT_ID" -f repositoryId="$(gh repo view --json id -q .id)" 2>/dev/null || echo "Project linking requires additional permissions"

# Create workflow for auto-adding issues
echo "📝 Creating auto-add workflow..."
cat > .github/workflows/add-to-project.yml << 'EOF'
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
          project-url: PROJECT_URL_PLACEHOLDER
          github-token: ${{ secrets.GITHUB_TOKEN }}
          labeled: linkedin-post, idea
EOF

# Replace placeholder with actual project URL
sed -i.bak "s|PROJECT_URL_PLACEHOLDER|$PROJECT_URL|g" .github/workflows/add-to-project.yml
rm .github/workflows/add-to-project.yml.bak

echo "✅ Auto-add workflow created"

echo "
🎉 GitHub Project setup complete!

📋 Project URL: $PROJECT_URL

Next steps:
1. Visit the project URL to configure board columns
2. Add existing linkedin-post issues to the project manually
3. New issues with 'linkedin-post' or 'idea' labels will be added automatically
4. Customize automation rules in the project settings

To add all existing issues to the project:
gh issue list --label linkedin-post --json number --jq '.[].number' | while read issue; do
  gh project item-add $PROJECT_NUMBER --owner $(echo $REPO | cut -d'/' -f1) --url https://github.com/$REPO/issues/\$issue
done
"