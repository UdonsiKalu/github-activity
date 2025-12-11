# Setup Instructions for New GitHub Activity Repository

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `github-activity` (or any name you prefer)
3. Description: "Daily development activity log"
4. Make it **Public** (required for contribution graph/streak to show on your profile)
5. **DO NOT** initialize with README, .gitignore, or license (we already have files)
6. Click "Create repository"

## Step 2: Connect Local Repository to GitHub

After creating the repo, GitHub will show you commands. Use these:

```bash
cd /home/udonsi-kalu/github-activity
git remote add origin https://UdonsiKalu:YOUR_TOKEN@github.com/UdonsiKalu/github-activity.git
git branch -M main
git push -u origin main
```

**Important:** Replace `YOUR_TOKEN` with your GitHub personal access token (the same one you used for the logs repo).

## Step 3: Update Cron Job

Update your cron job to use the new script:

```bash
crontab -e
```

Change the line from:
```
0 6 * * * /home/udonsi-kalu/workspace/startup-scripts/github_streak_final.sh >> /home/udonsi-kalu/workspace/logs/github_streak_cron.log 2>&1
```

To:
```
0 6 * * * /home/udonsi-kalu/github-activity/run_daily_activity.sh >> /home/udonsi-kalu/github-activity/logs/activity_cron.log 2>&1
```

## Step 4: Delete Old Repository (Optional)

Once you've verified the new repo is working:

1. Go to https://github.com/UdonsiKalu/logs
2. Click **Settings** (at the top)
3. Scroll to the bottom
4. Click **Delete this repository**
5. Type the repository name to confirm
6. Click **I understand the consequences, delete this repository**

**Warning:** This is permanent! Make sure the new repo is working first.

## Step 5: Test the Script

Test the script manually:

```bash
/home/udonsi-kalu/github-activity/run_daily_activity.sh
```

Check that commits are created and pushed successfully.

## Benefits of New Repository

✅ **Clean start** - No sensitive system information  
✅ **No automation references** - All commit messages look natural  
✅ **Minimal content** - Only activity log files  
✅ **Safe for public** - No Cloudflare, DNS, or system configs exposed (important since it's public!)  
