# tui-test

## Environments

Install tui-test.

```sh
curl --proto '=https' --tlsv1.2 -LsSf https://raw.githubusercontent.com/microsoft/tui-test/main/install/install.sh | TUI_TEST_VERSION=beta TUI_TEST_INSTALL_DIR=~/.local/bin sh
```

```text
Downloading tui-test for x86_64-unknown-linux-musl...
Installed tui-test to /root/.local/bin/tui-test
```

Confirm tui-test version.

```sh
tui-test --version
```

```text
tui-test 0.1.0-beta.5
```

## Run

Run script using CLI.

```sh
./samples/01-basic.sh
```

```text
## 01-basic 01
expect output           [OK]
## 01-basic 02
session exited before 'unknown' became visible
expect output           [NG]
```

Run scrpt using Python.

```sh
uv run ./samples/01-basic.py
```

```text
.E
======================================================================
ERROR: test_basic_02 (__main__.TestClass.test_basic_02)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/root/.cache/uv/environments-v2/01-basic-a2760b8d13749fa3/lib/python3.14/site-packages/tui_test/client.py", line 149, in _await_native
    return await awaitable
           ^^^^^^^^^^^^^^^
tui_test._native.NativeAssertionError: session exited before 'unknown' became visible
 :
 :
----------------------------------------------------------------------
Ran 2 tests in 0.066s
```

## References

- [microsoft/tui-test](https://github.com/microsoft/tui-test)
