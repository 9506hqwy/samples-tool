# > ./bats/bin/bats 01-basic.bats
# 01-basic.bats
#  ✓ 01-basic 01
#  ✓ 01-basic 02
#  ✗ 01-basic 03
#    (from function `fail' in file test_helper/bats-support/src/error.bash, line 31,
#     in test file 01-basic.bats, line 31)
#      `fail "always fails"' failed
#    stdout
#    stderr
#    always fails
#
# 3 tests, 1 failure

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "01-basic 01" {
    run echo "Hello, World!"
    assert_output "Hello, World!"
}

@test "01-basic 02" {
    run echo "Hello, World!" >&2
    assert_output "Hello, World!"
}

@test "01-basic 03" {
    echo "stdout"
    echo "stderr" >&2
    fail "always fails"
}
