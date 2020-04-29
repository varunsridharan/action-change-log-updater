#!/bin/sh

set -eu

DOCS_REPO_NAME="${INPUT_REPO_NAME}"
DOCS_CHANGE_LOG_FILE="${INPUT_REMOTE_FILE}"
DOCS_LOCAL_CHANGE_LOG_FILE="${INPUT_LOCAL_FILE}"
GITHUB_TOKEN="${INPUT_GITHUB_TOKEN}"
DOCS_REPO_LINK="https://x-access-token:$GITHUB_TOKEN@github.com/${DOCS_REPO_NAME}"

echo "
------------------------------------------------
Repo Name : ${DOCS_REPO_NAME}                  |
Repo Link : ${DOCS_REPO_LINK}                  |
Remote File : ${DOCS_CHANGE_LOG_FILE}          |
Local  File : ${DOCS_LOCAL_CHANGE_LOG_FILE}    |
------------------------------------------------
"

echo "🔧 Setting Up"
cd ../../
mkdir docs_repo
cd docs_repo

echo "##[group]🌐 Clone Documentation Github Repository"
git clone $DOCS_REPO_LINK ./
echo "##[endgroup]"

echo "🔀 Copying Change Log File"
rm -rf $DOCS_CHANGE_LOG_FILE
cp $GITHUB_WORKSPACE/$DOCS_LOCAL_CHANGE_LOG_FILE ./$DOCS_CHANGE_LOG_FILE

if [ -z "$(git status --porcelain)" ]; then
  echo "✅ Nothing To Push"
else
  git config --global user.email "githubactionbot+changelog@gmail.com" && git config --global user.name "Change Log Updater Github Bot"
  git add -A
  git commit -m "👌 Change Log Updated / ⚡ Triggered By $GITHUB_SHA"
  #git push "https://x-access-token:$GITHUB_TOKEN@${DOCS_REPO_LINK}"
  git push ${DOCS_REPO_LINK}
  echo "👌 Update Complete"
fi
