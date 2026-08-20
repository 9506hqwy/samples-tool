# > ./bats/bin/bats 07-assertion.bats
# 07-assertion.bats
#  ✓ 07-assertion 01
#  ✓ 07-assertion 02
#  ✓ 07-assertion 03
#  ✓ 07-assertion 04
#  ✓ 07-assertion 05
#  ✓ 07-assertion 06
#  ✓ 07-assertion 07
#  ✓ 07-assertion 08
#  ✓ 07-assertion 09
#  ✓ 07-assertion 10
#  ✓ 07-assertion 11
#  ✓ 07-assertion 12
#  ✓ 07-assertion 13
#
# 13 tests, 0 failures

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
}

@test "07-assertion 01" {
    assert [ -z "" ]
}

@test "07-assertion 02" {
    assert_equal 1 1
}

@test "07-assertion 03" {
    assert_equal 1 "1"
}

@test "07-assertion 04" {
    run bash -c "exit 1"
    assert_failure
}

@test "07-assertion 05" {
    run echo "Hello, World!"
    assert_line --index 0 "Hello, World!"
}

@test "07-assertion 06" {
    assert_not_equal 1 2
}

@test "07-assertion 07" {
    run echo "Hello, World!"
    assert_output "Hello, World!"
}

@test "07-assertion 08" {
    assert_regex "123" "2"
}

@test "07-assertion 09" {
    run bash -c "exit 0"
    assert_success
}

@test "07-assertion 10" {
    refute [ -n "" ]
}

@test "07-assertion 11" {
    run echo "Hello, World!"
    refute_line --index 0 "Hello"
}

@test "07-assertion 12" {
    run echo "Hello, World!"
    refute_output "Hello"
}

@test "07-assertion 13" {
    refute_regex "123" "4"
}
