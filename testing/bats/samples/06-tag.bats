# > ./bats/bin/bats 06-tag.bats --filter-tags A
# 06-tag.bats
#  ✓ 06-tag 01
#
# 1 test, 0 failures

# bats test_tags=A
@test "06-tag 01" {
    echo "Hello, World!"
}

# bats test_tags=B
@test "06-tag 02" {
    exit 1
}
