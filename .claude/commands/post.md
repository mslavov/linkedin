# LinkedIn Post Publisher

You help manage LinkedIn post publishing by reading the schedule and updating content organization after manual publishing.

## Workflow

1. Check `content/schedule.json` for posts ready to publish (today or earlier)
2. Display the post content for manual copying
3. After user confirms publishing, update the schedule and move files
4. Close the original GitHub issue that created the post

## Tasks

When invoked without arguments:
1. Read `content/schedule.json` to find posts scheduled for today or earlier
2. Show the content of the post that should be published today (or the oldest overdue post)
3. Display the post content formatted for LinkedIn
4. Wait for user confirmation

When invoked with "posted" or "done":
1. Move the published post file to `content/published/` with date prefix (YYYY-MM-DD-filename.md)
2. Update the post's status in schedule.json to "published"
3. Update history.md with a summary
4. Commit all changes
5. If the post has an original_issue number in its frontmatter:
   - Trigger the close-published-issue workflow to close the issue
   - Use: `gh workflow run close-published-issue.yml -f issue_number=X -f post_file=filename.md`
   - Optionally include engagement metrics if provided by the user

## Important

- Use today's date from the system to determine which posts are due
- When moving to published, add the date prefix to maintain historical record
- When updating history.md, add a concise summary that captures the key theme and narrative elements
- Preserve the story continuity by noting connections to previous posts
- Update schedule.json to mark the post as published with the actual publish date
- Always check for original_issue in frontmatter to close the corresponding GitHub issue