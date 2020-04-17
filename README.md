# Action - Change Log Updater

This action update change log file from my pro plugin's repo to docs repo.

## Usage
```yaml
uses: varunsridharan/action-change-log-updater@master
with:
  REPO_NAME: "vs-docs/wc-bulk-price-updater"
  REMOTE_FILE: "change-log.md"
  LOCAL_FILE: "CHANGELOG.md"
  GITHUB_TOKEN: ${{ secrets.GIT_TOKEN }}
```

## Example File

```yaml
name: On CHANGELOG.md Update

on:
  push:
    branches:
      - master

jobs:
  Update_Change_Log:
    runs-on: ubuntu-latest
    steps:
      - name: Fetching Local Repository
        uses: actions/checkout@v1
      - name: Setting Up Github Config
        uses: varunsridharan/action-change-log-updater@master
        with:
          REPO_NAME: "vs-docs/wc-bulk-price-updater"
          REMOTE_FILE: "change-log.md"
          LOCAL_FILE: "CHANGELOG.md"
          GITHUB_TOKEN: ${{ secrets.GIT_TOKEN }}
```