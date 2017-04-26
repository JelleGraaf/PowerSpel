[CmdletBinding()]
param()

task default -depends Analyze, Test

task Analyze {
    $saResults = Invoke-ScriptAnalyzer -Path $PSScriptRoot\customfunctions\public -Severity @('Error', 'Warning') -Recurse -Verbose:$false -ExcludeRule PSAvoidUsingConvertToSecureStringWithPlainText, psshouldprocess, PSAvoidUsingPlainTextForPassword
    if ($saResults) {
        $saResults | Format-Table
        write-error 'One or more Script Analyzer errors/warnings where found. Build cannot continue!'
    }
}

task Test {
    $testResults = Invoke-Pester -Path (join-path -path $PSScriptRoot -childpath 'tests') -PassThru
    if ($testResults.FailedCount -gt 0) {
        $testResults | Format-List
        Write-Error -Message 'One or more Pester tests failed. Build cannot continue!'
    }
}
