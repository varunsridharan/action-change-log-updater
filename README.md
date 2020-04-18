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


---

## Contribute
If you would like to help, please take a look at the list of
[issues][issues] or the [To Do](#-todo) checklist.

## License
Our GitHub Actions are available for use and remix under the MIT license.

## Copyright
2017 - 2018 Varun Sridharan, [varunsridharan.in][website]

If you find it useful, let me know :wink:

You can contact me on [Twitter][twitter] or through my [email][email].

## Backed By
| [![DigitalOcean][do-image]][do-ref] | [![JetBrains][jb-image]][jb-ref] |  [![Tidio Chat][tidio-image]][tidio-ref] |
| --- | --- | --- |

[twitter]: https://twitter.com/varunsridharan2
[email]: mailto:varunsridharan23@gmail.com
[website]: https://varunsridharan.in
[issues]: issues/

[do-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/DO_Logo_Horizontal_Blue-small.png
[jb-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/phpstorm-small.png?v3
[tidio-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/tidiochat-small.png
[do-ref]: https://s.svarun.in/Ef
[jb-ref]: https://www.jetbrains.com
[tidio-ref]: https://tidiochat.com

