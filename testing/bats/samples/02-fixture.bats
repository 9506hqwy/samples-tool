# > ./bats/bin/bats 02-fixture.bats
# 02-fixture.bats
#  ✗ 02-fixture 01
#    (in test file 02-fixture.bats, line 22)
#      `exit 1' failed
#    setup
#    Hello, World!
#    teardown
#
# 1 test, 1 failure

setup() {
    echo "setup"
}

teardown() {
    echo "teardown"
}

@test "02-fixture 01" {
    echo "Hello, World!"
    exit 1
}
