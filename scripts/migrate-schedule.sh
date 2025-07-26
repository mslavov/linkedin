#!/bin/bash

# Migration script to convert date-based filenames to new schedule.json system
# This script should be run once to migrate existing scheduled posts

set -e

echo "🔄 Starting migration of scheduled posts to new schedule.json system..."

# Check if schedule.json exists
if [ ! -f "content/schedule.json" ]; then
    echo "❌ Error: content/schedule.json not found"
    exit 1
fi

# Create backup
cp content/schedule.json content/schedule.json.backup
echo "✅ Created backup: content/schedule.json.backup"

# Process each file in content/scheduled/
for file in content/scheduled/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        
        # Extract date from filename (YYYY-MM-DD-*.md format)
        if [[ $filename =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)\.md$ ]]; then
            date="${BASH_REMATCH[1]}"
            slug="${BASH_REMATCH[2]}"
            new_filename="${slug}.md"
            
            echo "Processing: $filename"
            echo "  Date: $date"
            echo "  New filename: $new_filename"
            
            # Move file to remove date prefix
            mv "$file" "content/scheduled/$new_filename"
            
            # Add entry to schedule.json using jq
            # Note: This requires jq to be installed
            if command -v jq &> /dev/null; then
                # Extract metadata from the file
                priority=$(grep -E "^priority:" "$file" | cut -d' ' -f2 || echo "normal")
                issue=$(grep -E "^original_issue:" "$file" | cut -d' ' -f2 || echo "null")
                
                # Create new entry
                jq --arg id "$slug" \
                   --arg file "content/scheduled/$new_filename" \
                   --arg date "$date" \
                   --arg priority "$priority" \
                   --arg issue "$issue" \
                   '.posts += [{
                      "id": $id,
                      "file": $file,
                      "scheduled_date": $date,
                      "priority": $priority,
                      "original_issue": ($issue | tonumber // null),
                      "status": "scheduled"
                    }] | .last_updated = now | .' \
                   content/schedule.json > content/schedule.json.tmp
                
                mv content/schedule.json.tmp content/schedule.json
                echo "  ✅ Added to schedule.json"
            else
                echo "  ⚠️  Warning: jq not installed, please manually add to schedule.json:"
                echo "     - id: $slug"
                echo "     - file: content/scheduled/$new_filename"
                echo "     - scheduled_date: $date"
            fi
        else
            echo "⚠️  Skipping $filename - doesn't match expected date format"
        fi
    fi
done

echo ""
echo "🎉 Migration complete!"
echo "Please review content/schedule.json and commit the changes."