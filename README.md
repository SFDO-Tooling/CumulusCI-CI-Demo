# CumulusCI CI Demo

This repository contains an example of how to implement a continuous integration pipeline for a managed package project using GitHub Actions and CumulusCI.

## Workflows

### Overview

There are three workflows that help implement CumulusCI flow:

1. Feature Test
2. Main
3. Packaging Test

`Feature Test` deploys the repositories metadata to an org and runs tests against it.
`Main` uploads metadata to a packaging org and creates a new beta release.
`Packaging Test` installs the newly created beta version into an org and runs tests against it.

All GitHub action workflows have the same initial steps:

1. Install the Salesforce CLI (`sfdx`)
2. Setup Python
3. Install CumulusCI

The workflows differ in the events that trigger them, as well as, the specific CumulusCI flows that are run.

### Feature Test

#### Where

`.github/workflows/feature.yml`

#### When

This workflow runs on _all_ commits to _any_ branch in the repository.

#### What

This workflow does two things:

1. Runs the `ci_feature` flow against a `dev` org. This flow deploys (unmanaged) metadata in the repository to an org and runs Apex tests.
2. Runs the `robot` task against a `dev` org. This task executes all robot tests located under `robot/cci-ci-demo/tests/` against a `qa_org`.

### Main

#### Where

`.github/workflows/main.yml`

#### When

This workflow runs after the "Feature Test" workflow completes successfully against the `main` branch.

#### What

This workflow does two things:

1. Deploys the metadata in the repository to the packaging org via the `ci_master` flow.
2. Uploads a managed beta release via the `release_beta` flow.

Both of these flows are run against the packaging org.

### Packaging Test

#### Where

`.github/workflows/package_test.yml`

#### When

This workflow runs after a new release tag is created in GitHub. (Tags are created by the prior workflow via the `release_beta` flow.)

#### What

This workflow does one thing:

1. Runs the `ci_beta` flow to install the latest Beta Release (created by the prior workflow) in a `beta` org and run Apex tests.

## Using this Template

This repository can easily be forked and used as a template for your own Salesforce managed package project.

You will need to add the following secrets to your projects repository:

1. `CUMULUSCI_SERVICE_github` - This is so that CumulusCI can access the GitHub API to do things like aggregate release notes, and automerge commits made to `main` into `feature/` branches. Set this secret with the following value: `{"username": "github_username", "token":"github_personal_access_token","email":"email_address"}`

2. `SFDX_AUTH_URL` - The `Sfdx Auth Url` listed when running `sfdx force:org:display --verbose -u <username>` against your dev hub org.

3. `SFDX_CLIENT_ID` - The client id for your connnected app in the packaging org.

4. `SFDX_HUB_KEY` - Set to the private key associated with your connected app (the contents of your `server.key` file) in your packaging org.

You also need to set the value for the `CUMULUSCI_ORG_packaging` environment variable in workflows `main.yml`.
It should have the following structure:

```
{
    "username": "first.last@something.com",
    "instance_url": "https://something.my.salesforce.com"
}
```
