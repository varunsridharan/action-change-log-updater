#!/bin/sh

set -eu

DOCS_REPO_NAME="${INPUT_REPO_NAME}"
DOCS_REPO_LINK="https://github.com/${DOCS_REPO_NAME}"
DOCS_CHANGE_LOG_FILE="${INPUT_REMOTE_FILE}"
DOCS_LOCAL_CHANGE_LOG_FILE="${INPUT_LOCAL_FILE}"
GITHUB_TOKEN="${INPUT_GITHUB_TOKEN}"

echo "
Setting Up!
"
cd ../../
mkdir docs_repo
cd docs_repo

echo "
Clone Documentation Github Repository
"
git clone $DOCS_REPO_LINK ./

echo "
Remote File : ${DOCS_CHANGE_LOG_FILE}
Local  File : ${DOCS_LOCAL_CHANGE_LOG_FILE}
"

echo "
Copying Change Log File
"

rm -rf $DOCS_CHANGE_LOG_FILE
cp $GITHUB_WORKSPACE/$DOCS_LOCAL_CHANGE_LOG_FILE ./$DOCS_CHANGE_LOG_FILE


if [ -z "$(git status --porcelain)" ]; then
    # Working directory is clean
    echo "
    >>> No changes detected
    "
else
    # Update Github Config.
    git config --global user.email "githubactionbot+changelog@gmail.com" && git config --global user.name "Change Log Updater Github Bot"

    # Add File To Commit
    git add -A

    # Add Commit Message
    git commit -m "Change Log Updated"

    # Push To Github
    git push "https://x-access-token:$GITHUB_TOKEN@github.com/$DOCS_REPO_NAME"

    echo "
    Copying complete 👌
    "
fi