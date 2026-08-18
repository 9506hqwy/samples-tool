# > Invoke-Pester ./samples/02-fixture.Tests.ps1
#
# unning tests from 1 files.
# BeforeAll in global
# BeforeAll in 02-fixture
# BeforeEach in 02-fixture
# Exec test 01
# AfterEach in 02-fixture
# BeforeEach in 02-fixture
# Exec test 02
# AfterEach in 02-fixture
# BeforeAll in group-01
# BeforeEach in 02-fixture
# BeforeEach in group-01
# Exec test 03
# AfterEach in group-01
# AfterEach in 02-fixture
# BeforeEach in 02-fixture
# BeforeEach in group-01
# Exec test 04
# AfterEach in group-01
# AfterEach in 02-fixture
# AfterAll in group-01
# AfterAll in 02-fixture
# AfterAll in global
# [+] /workspaces/samples-tool/testing/pester/samples/02-fixture.Tests.ps1 23ms (4 tests)
# Tests completed in 23ms
# Tests Passed: 4, Failed: 0, Skipped: 0, Inconclusive: 0, NotRun: 0

BeforeAll {
    Write-Host "BeforeAll in global"
}

AfterAll {
    Write-Host "AfterAll in global"
}

Describe "02-fixture" {
    BeforeAll {
        Write-Host "BeforeAll in 02-fixture"
    }

    AfterAll {
        Write-Host "AfterAll in 02-fixture"
    }

    BeforeEach {
        Write-Host "BeforeEach in 02-fixture"
    }

    AfterEach {
        Write-Host "AfterEach in 02-fixture"
    }

    It "Run test 01" {
        Write-Host "Exec test 01"
    }

    It "Run test 02" {
        Write-Host "Exec test 02"
    }

    Context "group-01" {
        BeforeAll {
            Write-Host "BeforeAll in group-01"
        }

        AfterAll {
            Write-Host "AfterAll in group-01"
        }

        BeforeEach {
            Write-Host "BeforeEach in group-01"
        }

        AfterEach {
            Write-Host "AfterEach in group-01"
        }

        It "Run test 03" {
            Write-Host "Exec test 03"
        }

        It "Run test 04" {
            Write-Host "Exec test 04"
        }
    }
}
