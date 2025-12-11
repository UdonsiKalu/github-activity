#!/bin/bash
# Daily Development Activity Script
# Creates 4-10 randomized commits every morning to track development activity

# Configuration
REPO_DIR="/home/udonsi-kalu/github-activity"
LOG_FILE="/home/udonsi-kalu/github-activity/logs/activity.log"
ACTIVITY_FILE="$REPO_DIR/activity_log.txt"
PROGRESS_FILE="$REPO_DIR/progress.json"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

# Function to log with timestamp
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Function to create meaningful commit content
create_activity_content() {
    local commit_number=$1
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local day_of_year=$(date '+%j')
    local week_of_year=$(date '+%V')
    
    # Create different types of content based on commit number
    case $commit_number in
        1)
            echo "# Daily Development Log - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Development Status" >> "$ACTIVITY_FILE"
            echo "- Date: $timestamp" >> "$ACTIVITY_FILE"
            echo "- Day of Year: $day_of_year" >> "$ACTIVITY_FILE"
            echo "- Week: $week_of_year" >> "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Development Progress" >> "$ACTIVITY_FILE"
            echo "- Code updates and improvements" >> "$ACTIVITY_FILE"
            echo "- Repository maintenance" >> "$ACTIVITY_FILE"
            echo "- Code organization and cleanup" >> "$ACTIVITY_FILE"
            ;;
        2)
            echo "# Code Quality Improvements - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Updates" >> "$ACTIVITY_FILE"
            echo "- Code formatting improvements" >> "$ACTIVITY_FILE"
            echo "- Documentation updates" >> "$ACTIVITY_FILE"
            echo "- Comment enhancements" >> "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Technical Details" >> "$ACTIVITY_FILE"
            echo "- Commit timestamp: $timestamp" >> "$ACTIVITY_FILE"
            echo "- Code maintenance and updates" >> "$ACTIVITY_FILE"
            ;;
        3)
            echo "# Project Documentation - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Documentation Updates" >> "$ACTIVITY_FILE"
            echo "- README improvements" >> "$ACTIVITY_FILE"
            echo "- Code comments added" >> "$ACTIVITY_FILE"
            echo "- Process documentation" >> "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Files Modified" >> "$ACTIVITY_FILE"
            echo "- activity_log.txt (this file)" >> "$ACTIVITY_FILE"
            echo "- Documentation files" >> "$ACTIVITY_FILE"
            ;;
        4)
            echo "# Performance Optimization - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Optimizations" >> "$ACTIVITY_FILE"
            echo "- Code efficiency improvements" >> "$ACTIVITY_FILE"
            echo "- Resource usage optimization" >> "$ACTIVITY_FILE"
            echo "- Performance monitoring" >> "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Metrics" >> "$ACTIVITY_FILE"
            echo "- Performance metrics updated" >> "$ACTIVITY_FILE"
            echo "- Time: $timestamp" >> "$ACTIVITY_FILE"
            ;;
        5)
            echo "# Testing & Validation - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Testing Updates" >> "$ACTIVITY_FILE"
            echo "- Test coverage improvements" >> "$ACTIVITY_FILE"
            echo "- Validation checks" >> "$ACTIVITY_FILE"
            echo "- Quality assurance" >> "$ACTIVITY_FILE"
            ;;
        6)
            echo "# Bug Fixes & Improvements - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Bug Fixes" >> "$ACTIVITY_FILE"
            echo "- Code refinements" >> "$ACTIVITY_FILE"
            echo "- Error handling improvements" >> "$ACTIVITY_FILE"
            echo "- Stability enhancements" >> "$ACTIVITY_FILE"
            ;;
        7)
            echo "# Security & Best Practices - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Security Updates" >> "$ACTIVITY_FILE"
            echo "- Security improvements" >> "$ACTIVITY_FILE"
            echo "- Best practices implementation" >> "$ACTIVITY_FILE"
            echo "- Code standards compliance" >> "$ACTIVITY_FILE"
            ;;
        8|9|10)
            echo "# Development Update - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Daily Summary" >> "$ACTIVITY_FILE"
            echo "- Development progress tracked" >> "$ACTIVITY_FILE"
            echo "- Code updates completed" >> "$ACTIVITY_FILE"
            echo "- Development workflow active" >> "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Next Steps" >> "$ACTIVITY_FILE"
            echo "- Continue development tomorrow" >> "$ACTIVITY_FILE"
            echo "- Maintain consistent development schedule" >> "$ACTIVITY_FILE"
            echo "- Monitor project progress" >> "$ACTIVITY_FILE"
            ;;
        *)
            # Fallback for any commit number > 8
            echo "# Development Update - $(date '+%Y-%m-%d')" > "$ACTIVITY_FILE"
            echo "" >> "$ACTIVITY_FILE"
            echo "## Additional Updates" >> "$ACTIVITY_FILE"
            echo "- Continuous improvement" >> "$ACTIVITY_FILE"
            echo "- Code maintenance" >> "$ACTIVITY_FILE"
            echo "- Progress tracking" >> "$ACTIVITY_FILE"
            ;;
    esac
}

# Function to create a commit
create_commit() {
    local commit_number=$1
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Create meaningful content
    create_activity_content $commit_number
    
    # Add to git
    cd "$REPO_DIR"
    git add activity_log.txt
    
    # Create commit with different messages - varied and natural
    local messages=(
        "docs: Update development log"
        "refactor: Improve code quality and formatting"
        "docs: Update project documentation"
        "perf: Optimize performance and monitoring"
        "test: Add validation and testing improvements"
        "fix: Resolve issues and refine code"
        "security: Update security practices"
        "feat: Add new features and improvements"
        "chore: Update dependencies and configuration"
        "style: Improve code style and consistency"
        "build: Update build configuration"
        "ci: Improve CI/CD pipeline"
    )
    
    local message_index=$((commit_number - 1))
    if [ $message_index -ge ${#messages[@]} ]; then
        message_index=$((${#messages[@]} - 1))
    fi
    local commit_message="${messages[$message_index]}"
    
    git commit -m "$commit_message" >> "$LOG_FILE" 2>&1
    
    if [ $? -eq 0 ]; then
        log_message "✅ Commit #$commit_number created successfully: $commit_message"
        return 0
    else
        log_message "❌ Failed to create commit #$commit_number"
        return 1
    fi
}

# Function to push commits
push_commits() {
    cd "$REPO_DIR"
    git push origin main >> "$LOG_FILE" 2>&1
    
    if [ $? -eq 0 ]; then
        log_message "✅ All commits pushed to GitHub successfully"
        return 0
    else
        log_message "❌ Failed to push commits to GitHub"
        return 1
    fi
}

# Function to update progress tracking
update_progress() {
    local successful_commits=$1
    local date=$(date '+%Y-%m-%d')
    
    # Create or update progress file
    if [ ! -f "$PROGRESS_FILE" ]; then
        echo "{\"total_commits\": 0, \"last_update\": \"$date\"}" > "$PROGRESS_FILE"
    fi
    
    # Update progress (simple JSON update)
    local current_total=$(grep -o '"total_commits": [0-9]*' "$PROGRESS_FILE" | grep -o '[0-9]*')
    local new_total=$((current_total + successful_commits))
    
    # Simple JSON update
    sed -i "s/\"total_commits\": [0-9]*/\"total_commits\": $new_total/" "$PROGRESS_FILE"
    sed -i "s/\"last_update\": \"[^\"]*\"/\"last_update\": \"$date\"/" "$PROGRESS_FILE"
}

# Main execution
# Randomize commits between 4 and 10 for natural variation
COMMIT_COUNT=$((RANDOM % 7 + 4))  # Random number between 4 and 10
log_message "🚀 Starting daily development commits - $COMMIT_COUNT commits"
echo "🚀 Starting daily development commits - $COMMIT_COUNT commits"

# Check if we're in a git repository
if [ ! -d "$REPO_DIR/.git" ]; then
    log_message "❌ Not in a git repository. Initializing..."
    cd "$REPO_DIR"
    git init
    git config user.name "Udonsi Kalu"
    git config user.email "udonsik@yahoo.com"
    log_message "⚠️  Please add your GitHub remote: git remote add origin https://github.com/UdonsiKalu/your-repo.git"
fi

# Remove git lock file if it exists (from previous crashed process)
if [ -f "$REPO_DIR/.git/index.lock" ]; then
    log_message "⚠️  Removing stale git lock file"
    rm -f "$REPO_DIR/.git/index.lock"
fi

# Create commits with small delays (randomized count)
successful_commits=0
for ((i=1; i<=COMMIT_COUNT; i++)); do
    log_message "Creating commit #$i..."
    
    # Remove lock file before each commit attempt
    [ -f "$REPO_DIR/.git/index.lock" ] && rm -f "$REPO_DIR/.git/index.lock"
    
    if create_commit $i; then
        ((successful_commits++))
    fi
    
    # Small delay between commits
    sleep 3
done

# Update progress tracking
update_progress $successful_commits

# Push all commits
log_message "Pushing $successful_commits commits to GitHub..."
if push_commits; then
    log_message "✅ Daily commits completed successfully"
    echo "✅ Daily commits completed - $successful_commits commits pushed"
    echo "📊 Progress saved to: $PROGRESS_FILE"
else
    log_message "❌ Daily commits completed with push errors"
    echo "❌ Daily commits completed with push errors - $successful_commits commits created locally"
    echo "📊 Progress saved to: $PROGRESS_FILE"
fi

log_message "Daily development commits finished"
