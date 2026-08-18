# > Invoke-Pester ./samples/01-basic.Tests.ps1
#
# Running tests from 1 files.
# [+] /workspaces/samples-tool/testing/pester/samples/01-basic.Tests.ps1 12ms (1 test)
# Tests completed in 13ms
# Tests Passed: 1, Failed: 0, Skipped: 0, Inconclusive: 0, NotRun: 0

Describe "01-basic" {
    It "Run test" {
        # 外部コマンドを実行
        $output = /usr/bin/echo "Hello, World!" 2> variable:err
        # 標準出力を検証
        $output | Should-Be "Hello, World!"
        # 標準出力を検証
        $err | Should-BeNull
    }
}
