# > Invoke-Pester ./samples/07-assertion.Tests.ps1
#
# Running tests from 1 files.
# [-] 07-assertion.General.Run test Should-BeGreaterThan 01 2ms
#  Expected the actual value to be greater than [int] 1, but it was not. Actual: [int] 1
#  at 1 | Should-BeGreaterThan 1, /workspaces/samples-tool/testing/pester/samples/07-assertion.Tests.ps1:18
# [-] 07-assertion.General.Run test Should-BeLessThan 01 2ms
#  Expected the actual value to be less than [int] 2, but it was not. Actual: [int] 2
#  at 2 | Should-BeLessThan 2, /workspaces/samples-tool/testing/pester/samples/07-assertion.Tests.ps1:35
# [-] 07-assertion.Boolean.Run test Should-BeTrue 02 2ms
#  Expected [bool] $true, but got: [int] 1.
#  at 1 | Should-BeTrue, /workspaces/samples-tool/testing/pester/samples/07-assertion.Tests.ps1:77
# [-] 07-assertion.Boolean.Run test Should-BeFalse 02 2ms
#  Expected [bool] $false, but got: [int] 0.
#  at 0 | Should-BeFalse, /workspaces/samples-tool/testing/pester/samples/07-assertion.Tests.ps1:86
# [-] 07-assertion.String.Run test Should-BeString 02 2ms
#  Expected [string] '1', but got [int] 1.
#  at 1 | Should-BeString "1", /workspaces/samples-tool/testing/pester/samples/07-assertion.Tests.ps1:105
# [-] 07-assertion.String.Run test Should-NotBeWhiteSpaceString 01 2ms
#  Expected a [string] that is not $null, empty or whitespace, but got [string]: ' '
#  at " " | Should-NotBeWhiteSpaceString, /workspaces/samples-tool/testing/pester/samples/07-assertion.Tests.ps1:122
# [-] 07-assertion.Collection.Run test Should-BeCollection 02 3ms
#  Expected [Object[]] @(1, 2) to be present in [Object[]] @(1, 2, 3), but they don't have the same number of items.
#  at @(1, 2, 3) | Should-BeCollection @(1, 2), /workspaces/samples-tool/testing/pester/samples/07-assertion.Tests.ps1:149
# Tests completed in 317ms
# Tests Passed: 37, Failed: 7, Skipped: 0, Inconclusive: 0, NotRun: 0

Describe "07-assertion" {
    Context "General" {
        It "Run test Should-Be 01" {
            1 | Should-Be 1
        }

        It "Run test Should-Be 02" {
            "1" | Should-Be 1
        }

        It "Run test Should-NotBe 01" {
            1 | Should-NotBe 2
        }

        It "Run test Should-BeGreaterThan 01" {
            # Fail
            1 | Should-BeGreaterThan 1
        }

        It "Run test Should-BeGreaterThan 02" {
            2 | Should-BeGreaterThan 1
        }

        It "Run test Should-BeGreaterThanOrEqual 01" {
            1 | Should-BeGreaterThanOrEqual 1
        }

        It "Run test Should-BeGreaterThanOrEqual 02" {
            2 | Should-BeGreaterThanOrEqual 1
        }

        It "Run test Should-BeLessThan 01" {
            # Fail
            2 | Should-BeLessThan 2
        }

        It "Run test Should-BeLessThan 02" {
            1 | Should-BeLessThan 2
        }

        It "Run test Should-BeLessThanOrEqual 01" {
            2 | Should-BeLessThanOrEqual 2
        }

        It "Run test Should-BeLessThanOrEqual 02" {
            1 | Should-BeLessThanOrEqual 2
        }

        It "Run test Should-BeNull 01" {
            $null | Should-BeNull
        }

        It "Run test Should-NotBeNull 01" {
            1 | Should-NotBeNull
        }

        It "Run test Should-BeSame 01" {
            $v1 = New-Object Object
            $v1 | Should-BeSame $v1
        }

        It "Run test Should-NotBeSame 01" {
            $v1 = New-Object Object
            $v2 = New-Object Object
            $v1 | Should-NotBeSame $v2
        }
    }

    Context "Boolean" {
        It "Run test Should-BeTrue 01" {
            $true | Should-BeTrue
        }

        It "Run test Should-BeTrue 02" {
            # Fail
            1 | Should-BeTrue
        }

        It "Run test Should-BeFalse 01" {
            $false | Should-BeFalse
        }

        It "Run test Should-BeFalse 02" {
            # Fail
            0 | Should-BeFalse
        }

        It "Run test Should-BeTruthy 01" {
            1 | Should-BeTruthy
        }

        It "Run test Should-BeFalsy 01" {
            0 | Should-BeFalsy
        }
    }

    Context "String" {
        It "Run test Should-BeString 01" {
            "A" | Should-BeString "A"
        }

        It "Run test Should-BeString 02" {
            # Fail
            1 | Should-BeString "1"
        }

        It "Run test Should-NotBeString 01" {
            "A" | Should-NotBeString "B"
        }

        It "Run test Should-BeEmptyString 01" {
            "" | Should-BeEmptyString
        }

        It "Run test Should-NotBeEmptyString 01" {
            " " | Should-NotBeEmptyString
        }

        It "Run test Should-NotBeWhiteSpaceString 01" {
            # Fail
            " " | Should-NotBeWhiteSpaceString
        }

        It "Run test Should-BeLikeString 01" {
            "ABC" | Should-BeLikeString "*B*"
        }

        It "Run test Should-NotBeLikeString 01" {
            "ABC" | Should-NotBeLikeString "*B"
        }

        It "Run test Should-MatchString  01" {
            "ABC" | Should-MatchString  "B"
        }

        It "Run test Should-NotMatchString 01" {
            "ABC" | Should-NotMatchString "B$"
        }
    }

    Context "Collection" {
        It "Run test Should-BeCollection 01" {
            @(1, 2) | Should-BeCollection @(1, 2)
        }

        It "Run test Should-BeCollection 02" {
            # Fail
            @(1, 2, 3) | Should-BeCollection @(1, 2)
        }

        It "Run test Should-ContainCollection 01" {
            @(1, 2, 3) | Should-ContainCollection @(1, 2)
        }

        It "Run test Should-NotContainCollection 01" {
            @(1, 2, 3) | Should-NotContainCollection @(1, 4)
        }

        It "Run test Should-All  01" {
            @(1, 2) | Should-All { $_ -gt 0 }
        }

        It "Run test Should-Any  01" {
            @(1, 2) | Should-Any { $_ -gt 1 }
        }
    }

    Context "Hashtable" {
        It "Run test Should-BeHashtable 01" {
            @{ A = 1 } | Should-BeHashtable
        }

        It "Run test Should-BeHashtable 02" {
            @{ A = 1 } | Should-BeHashtable -Count 1
        }

        It "Run test Should-BeHashtable 03" {
            @{ A = 1 } | Should-BeHashtable -Key "A"
        }
    }

    Context "DateTime and TimeSpan" {
        It "Run test Should-BeBefore  01" {
            (Get-Date) | Should-BeBefore (Get-Date).AddDays(1)
        }

        It "Run test Should-BeAfter   01" {
            (Get-Date).AddDays(1) | Should-BeAfter (Get-Date)
        }

        It "Run test Should-BeFasterThan 01" {
            { Start-Sleep -Milliseconds 100 } | Should-BeFasterThan 1s
        }

        It "Run test Should-BeSlowerThan 01" {
            { Start-Sleep -Milliseconds 100 } | Should-BeSlowerThan 10ms
        }
    }
}
