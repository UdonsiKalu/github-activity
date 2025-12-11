#!/bin/bash
# Script to connect the new repository to GitHub
# Run this AFTER creating the repository on GitHub
# 
# IMPORTANT: Replace YOUR_TOKEN with your GitHub personal access token

cd /home/udonsi-kalu/github-activity

# Add remote (replace YOUR_TOKEN with your actual token)
git remote add origin https://UdonsiKalu:YOUR_TOKEN@github.com/UdonsiKalu/github-activity.git

# Push to GitHub
git push -u origin main

echo "✅ Repository connected to GitHub!"
echo "Check it at: https://github.com/UdonsiKalu/github-activity"
