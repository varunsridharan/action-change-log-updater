#!/bin/sh

set -eu

DOCS_REPO_NAME="${INPUT_REPO_NAME}"
DOCS_REPO_LINK="https://github.com/${DOCS_REPO_NAME}"
DOCS_CHANGE_LOG_FILE="${INPUT_REMOTE_FILE}"
DOCS_LOCAL_CHANGE_LOG_FILE="${INPUT_LOCAL_FILE}"
echo "Vars"
echo "DOCS_CHANGE_LOG_FILE : ${DOCS_CHANGE_LOG_FILE}"
echo "DOCS_LOCAL_CHANGE_LOG_FILE : ${DOCS_LOCAL_CHANGE_LOG_FILE}"
echo "DOCS_REPO_NAME : ${DOCS_REPO_NAME}"

echo "Clone Remote Github Repository"
cd ../../
mkdir docs_repo
cd docs_repo
git clone $DOCS_REPO_LINK ./

echo "Copying File"
rm -rf $remote_change_log_file
cat ./$DOCS_CHANGE_LOG_FILE
cp $GITHUB_WORKSPACE/$DOCS_LOCAL_CHANGE_LOG_FILE ./$DOCS_CHANGE_LOG_FILE


# Update Github Config.
#git config --global user.email "githubactionbot+changelog@gmail.com" && git config --global user.name "Change Log Updater Github Bot"

# Add File To Commit
#git add -A

# Add Commit Message
#git commit -m "Change Log Updated"

# Push To Github
#git push "https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY" HEAD:$BRANCH
