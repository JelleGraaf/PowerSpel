# Powershell module deployment template

This module provides the basic scaffolding required for a Powershell module that can be hosted in the OGD Powershell gallery.
It functions both as an example and as a template to quickly create new modules.

The module follows the following structure:

* `<modulename>\Public`

    Scripts in this directory become the public interface of the module, i.e. these functions are accessible to the users of your module.

* `<modulename>\Private`

    Scripts in this directory are not published as exported functions.
    These scripts can therefore only be used by your own module functions, but not by users.

* `tests\`

    Scripts in this directory will be evaluated by the deployment runner.
    They can provide quality control by verifying that your module functions do what they are supposed to do.
    If these tests fail, your module will not be published.


# New project instructions
When creating a new project, use the following procedure:

In gitlab:
1. Create a new project named `<modulename>`
1. Under Settings/Runners, add the shared deployment runner to this project

On your machine:
1.  `git clone` the PowershellModule repository to your local machine
1.  Run `.\Rename-Module.ps1 -NewName <modulename> -Description "<short description of your module>"`.

    Use `Get-Help .\Rename-Module.ps1` or read the script to explore all script options.

1.  Review the changes made by the script.
    If additional changes need to be made, remember to use `git add` on the changed files.
1.  Run `git push --set-upstream --all origin`
