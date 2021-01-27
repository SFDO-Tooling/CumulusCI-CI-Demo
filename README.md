# CumulusCI CI Demo


This repository contains an example of how to implement a continuous integration pipeline for a managed package project using GitHub Actions and CumulusCI.

## Using this Template

This repository can easily be forked and used as a template for your own Salesforce project.

You will need to add the following secrets to your projects repository:

1) CUMULUSCI_SERVICE_github - A GitHub personal access token so that CumulusCI can access the GitHub API.

2) SFDX_AUTH_URL - The `Sfdx Auth Url` listed when running `sfdx force:org:display --verbose -u username`

3) SFDX_CLIENT_ID - The client id for your connnected app.

4) SFDX_HUB_KEY - Set to the private key associated with your connected app (the contents of your `server.key` file).

You also need to set the value for the `CUMULUSCI_ORG_packaging` environment variable in workflows `main.yml`.
It should have the following structure:
```
{
    "username": first.last@something.com,
    "instance_url": "https://something.my.salesforce.com"
}
```
