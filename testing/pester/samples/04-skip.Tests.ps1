# > $container = New-PesterContainer -Path './samples/04-skip.Tests.ps1' -Data @{ Skip = $true }
# > Invoke-Pester -Container $container
#
# Running tests from 1 files.
# [+] /workspaces/samples-tool/testing/pester/samples/04-skip.Tests.ps1 11ms (1 test)
# [!] /workspaces/samples-tool/testing/pester/samples/04-skip.Tests.ps1 11ms
# Tests completed in 13ms
# Tests Passed: 0, Failed: 0, Skipped: 1, Inconclusive: 0, NotRun: 0

param (
    $Skip
)

Describe "04-skip" {
    It "Run test" -Skip:$Skip {
        $false | Should-BeTrue
    }
}
