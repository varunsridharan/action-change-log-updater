#!/bin/sh

set -eu

DOCS_REPO_LINK="${INPUT_DOCS_REPO_LINK}"
docs_change_log_file=$INPUT_docs_change_log_file
local_change_log_file=$INPUT_local_change_log_file

echo "Listing all files"
ls -lah

echo "Var Details"
echo "$DOCS_REPO_LINK"

# Update Github Config.
#git config --global user.email "githubactionbot+changelog@gmail.com" && git config --global user.name "Change Log Updater Github Bot"

# Add File To Commit
#git add -A

# Add Commit Message
#git commit -m "Change Log Updated"

# Push To Github
#git push "https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY" HEAD:$BRANCH
