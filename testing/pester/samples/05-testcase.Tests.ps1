# > Invoke-Pester ./samples/05-testcase.Tests.ps1
#
# Running tests from 1 files.
# [-] 05-testcase.Run test A == B 4ms
#  Expected [string] 'B', but got [string] 'A'.
#  at $Actual | Should-Be $Expected, /workspaces/samples-tool/testing/pester/samples/05-testcase.Tests.ps1:8
# [-] 05-testcase.Run test B 5ms
#  Expected [string] 'A', but got [string] 'B'.
#  at $_ | Should-Be "A", /workspaces/samples-tool/testing/pester/samples/05-testcase.Tests.ps1:13
# Tests completed in 22ms
# Tests Passed: 2, Failed: 2, Skipped: 0, Inconclusive: 0, NotRun: 0

Describe "05-testcase" {
    # ハッシュオブジェクトの場合
    It "Run test <Actual> == <Expected>" -ForEach @(
        @{ Actual = "A"; Expected = "A" },
        @{ Actual = "A"; Expected = "B" }
    ) {
        $Actual | Should-Be $Expected
    }

    # 配列の場合
    It "Run test <_>" -ForEach @("A", "B") {
        $_ | Should-Be "A"
    }
}
