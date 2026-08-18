# > $container = New-PesterContainer -Path './samples/03-param.Tests.ps1' -Data @{ Data = "Hello, World!" }
# > Invoke-Pester -Container $container
#
# Running tests from 1 files.
# [+] /workspaces/samples-tool/testing/pester/samples/03-param.Tests.ps1 17ms (1 test)
# Tests completed in 18ms
# Tests Passed: 1, Failed: 0, Skipped: 0, Inconclusive: 0, NotRun: 0

param (
    $Data
)

Describe "03-param" {
    It "Run test" {
        $Data | Should-Be "Hello, World!"
    }
}
