# Schedule LinkedIn Post

You need to update the content/schedule.json file to add a new scheduled post.

## Usage
When calling this command, provide:
1. The file path (required) - e.g., `content/scheduled/my-post.md`
2. PR number (optional) - e.g., `3`
3. PR title (optional) - e.g., `"Add LinkedIn post about AI"`

## Task

Given the post file: {{ARG1:content/scheduled/filename.md}}
PR Number: {{ARG2:N/A}}
PR Title: {{ARG3:Manual scheduling}}

Please:
1. Read the current content/schedule.json file
2. Read the new post file to understand its content and priority
3. Analyze the current schedule to find the optimal slot
4. Consider these scheduling rules:
   - High priority posts get the next available slot
   - Normal priority posts should be spaced at least 24 hours apart
   - Low priority posts can be scheduled further out
   - Avoid scheduling on weekends unless it's high priority
   - Morning posts (specified in frontmatter) should be scheduled for 9 AM
   - Afternoon posts should be scheduled for 2 PM
5. Add the new post to the schedule.json with a unique ID
6. Update the last_updated timestamp
7. Commit the updated schedule.json

The new entry should include:
- id: Generate from the filename (e.g., "ai-eating-its-own-dogfood" from "ai-eating-its-own-dogfood.md")
- file: The full path to the file
- scheduled_date: The optimal date in YYYY-MM-DD format
- priority: Extract from the post's frontmatter
- original_issue: Extract from the post's frontmatter (if present)
- status: "scheduled"

## Important Notes
- Ensure the schedule.json remains valid JSON
- Sort posts by scheduled_date
- Use ISO 8601 format for timestamps
- If the file doesn't exist in the specified location, check both drafts and scheduled folders
- Commit message should be: "Schedule post: [filename] for [date]"