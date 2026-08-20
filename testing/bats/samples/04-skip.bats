# > ./bats/bin/bats 04-skip.bats
# 04-skip.bats
#  - 04-skip 01 (skipped: This test is skipped)
#
# 1 test, 0 failures, 1 skipped

@test "04-skip 01" {
    skip "This test is skipped"
    exit 1
}
