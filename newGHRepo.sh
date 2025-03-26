#!/bin/sh

# Set your repository name here
repoName="linux-bash-repo"

# Create README.md with repository name
echo "# $repoName" > README.md

# Initialise Git repository
git init
git add .
git commit -m "First commit"

# GitHub credentials
GITHUB_USER="JThomas404"
GITHUB_TOKEN="your_personal_access_token"

# Create GitHub repository using GitHub API
create_repo_response=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos -d "{\"name\":\"$repoName\", \"private\":false}")

# Check if repository was created successfully
if [ "$create_repo_response" -ne 201 ]; then
    echo "Failed to create GitHub repository. Response code: $create_repo_response"
    exit 1
fi

# Wait to ensure the repository is available
sleep 2

# Fetch the repository's clone URL
GIT_URL=$(curl -s \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/$GITHUB_USER/"$repoName" | jq -r '.clone_url')

# Ensure GIT_URL is valid
if [ -z "$GIT_URL" ] || [ "$GIT_URL" = "null" ]; then
    echo "Failed to retrieve repository URL. Check if the repository was created successfully."
    exit 1
fi

# Set up remote repository and push
git branch -M main
git remote add origin "$GIT_URL"
git push -u origin main

echo "Repository successfully created and pushed to GitHub: $GIT_URL"
