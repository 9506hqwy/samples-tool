# > Invoke-Pester ./samples/06-tag.ps1 -TagFilter A
#
# Running tests from 1 files.
# [+] /workspaces/samples-tool/testing/pester/samples/06-tag.ps1 10ms (2 tests)
# Tests completed in 13ms
# Tests Passed: 1, Failed: 0, Skipped: 0, Inconclusive: 0, NotRun: 1

Describe "06-tag" {
    It "Run test A" -Tag "A" {
        $true | Should-BeTrue
    }

    It "Run test B" -Tag "B" {
        $false | Should-BeTrue
    }
}
