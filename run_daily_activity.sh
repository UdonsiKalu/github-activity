#!/bin/bash
# Wrapper script for daily activity commits

# Run the daily activity script
/home/udonsi-kalu/github-activity/daily_activity.sh

# Force push to ensure commits are uploaded
cd /home/udonsi-kalu/github-activity
git push origin main >> /home/udonsi-kalu/github-activity/logs/activity.log 2>&1

if [ $? -eq 0 ]; then
    echo "✅ All commits pushed to GitHub successfully!"
else
    echo "❌ Some commits may not have been pushed"
fi
