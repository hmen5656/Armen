# GrowOff Module Software

## Description

The GrowOff module software is divided into four parts:

1. The **module core**, which communicates with the hardware peripherals. The core is a Python Flask app that responds to incoming events from hardware sensors and via MQTT. Additionally, it provides an HTTP REST API for testing, and it is configured to send metrics and events using Telegraf. The core lives inside a Docker container.
2. The **data collection agent**, [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/), which lives inside a second Docker container.
3. The **module base software**, which is responsible for securely downloading and installing images of the module core and keeping it up-to-date, using Docker, AWS ECR, and systemd, as well as providing a reverse SSH tunnel service for debugging. The base software is installed using a handful of shell scripts and configuration files.
4. The **operating system**, which is currently Raspbian Lite (Debian 10 "buster"), plus a number of configuration changes (hostname, Wi-Fi, locale, SSH, I2C, 1-Wire, etc.).


## Module Core

See README.md in the `containers/growoffmodule_core/app/` directory.


## Deployment Instructions

### Developing in local mode

1. Push to a device via [local mode](https://www.balena.io/docs/learn/develop/local-mode/):

       balena push XXX.local

### Preparing a release candidate

1. For a major/minor release, create a release branch from `main`. For a patch (hotfix), create a release branch from the previous  released version. Examples:

       # for a major/minor release, branched from main
       git checkout -b v1.2-branch main

       # for a patch (hotfix), branched from previous version
       git checkout -b v1.2.1-branch v1.2

1. Add fixes to the release branch, possibly using `git cherry-pick`.

1. Tag the code and push the tag to GitHub:

       git tag v#.#.#-rc#
       git push origin <tag>

1. Merge any fixes on the release branch back to `main`.

1. In the top-level of the project, push the code to Balena. Note that Balena packages up your local code, so make sure you have no staged and unstaged changes (`git stash` if needed).

       balena push growoffmodule --release-tag Version v#.#.#-rc#

1. Pin a test device to the release candidate. Fill out the [pre/post-release checklist](https://docs.google.com/forms/d/e/1FAIpQLSfTCIxoNi4LQ9TIPsVAzhY2i_wTvV66BkXjA1FCX5zZd3Fd3A/viewform).

### Releasing to production modules

1. Retag the candidate tag as the final tag, and push the tag to GitHub.

       git tag v#.#.# v#.#.#-rc#
       git push origin <tag>

1. In Balena, update the release tag similarly to remove the "-rc#".
1. In Jira, go to the [GOSW releases](https://gronska.atlassian.net/projects/GOSW?selectedItem=com.atlassian.jira.jira-projects-plugin:release-page) page, click "..." > Release to release the version.
1. In GitHub, go to the [GrowOffModule releases](https://github.com/Gronska/GrowOffModule/releases) page and draft a new version.
1. Change the release pinning to deploy to more modules. Fill out the [pre/post-release checklist](https://docs.google.com/forms/d/e/1FAIpQLSfTCIxoNi4LQ9TIPsVAzhY2i_wTvV66BkXjA1FCX5zZd3Fd3A/viewform).


### Deleting releases on Balena

Use the REST API:

    curl -X DELETE "https://api.balena-cloud.com/v5/release(<releasenumber>)" -H "Authorization:Bearer <token>"

where `<releasenumber>` is the number at the end of the release page URL, e.g. https://dashboard.balena-cloud.com/apps/1819681/releases/`1234567`, and `<token>` is a session token you get from https://dashboard.balena-cloud.com/preferences/access-tokens (valid for several days).  You will want to replace also the angle brackets.
