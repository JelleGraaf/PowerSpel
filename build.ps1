[cmdletbinding()]
param(
    [string[]]$Task = 'default'
)

# The $BeforeErrorCount and $AfterErrorCount are added so a developer can run this build.ps1 without first having to clear the $error variable to make the build pass.
$BeforeErrorCount = $error.Count

if (!(Get-Module -Name Pester -ListAvailable)) {
    Install-Module -Name Pester -Scope CurrentUser
}
if (!(Get-Module -Name psake -ListAvailable)) {
    Install-Module -Name psake -Scope CurrentUser
}
if (!(Get-Module -Name PSDeploy -ListAvailable)) {
    Install-Module -Name PSDeploy -Scope CurrentUser
}
Import-Module "C:\Program Files\WindowsPowerShell\Modules\PSScriptAnalyzer\1.7.0\PSScriptAnalyzer.psm1" -Verbose

Invoke-psake -buildFile "$PSScriptRoot\psakeBuild.ps1" -taskList $Task -Verbose:$VerbosePreference

$AfterErrorCount = $error.Count
if($AfterErrorCount -gt $BeforeErrorCount){
    $ErrorActionPreference = 'stop'
    write-error "some build tests failed."
    $Host.SetShouldExit(13)
    Exit 13
}
