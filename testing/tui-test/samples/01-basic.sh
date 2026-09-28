#!/bin/bash

trap 'tui-test close --all > /dev/null' EXIT

assert() {
    NAME="$1"
    shift

    FUNC="$1"
    shift

    if "${FUNC}" "$@";
    then
        echo -e "${NAME}\t\t[OK]"
    else
        echo -e "${NAME}\t\t[NG]"
    fi
}

echo "## 01-basic 01"
tui-test run echo "Hello, World!" > /dev/null
assert "expect output" tui-test expect text "Hello, World!"
tui-test screenshot -o 01-basic-01.svg > /dev/null

echo "## 01-basic 02"
tui-test run echo "Hello, World!" > /dev/null
assert "expect output" tui-test expect text "unknown"
tui-test screenshot -o 01-basic-02.svg > /dev/null
