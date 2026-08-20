# Bash Automated Testing System

## Environments

Check bash version.

```sh
bash --version
```

```text
GNU bash, version 5.2.37(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

Install bats.

```sh
git clone --depth 1 https://github.com/bats-core/bats-core.git bats
git clone --depth 1 https://github.com/bats-core/bats-support.git test_helper/bats-support
git clone --depth 1 https://github.com/bats-core/bats-assert.git test_helper/bats-assert
```

Confirm bats version.

```sh
./bats/bin/bats --version
```

```text
Bats 1.14.0
```

## References

- [Bats](https://github.com/bats-core)
- [Welcome to bats-core’s documentation!](https://bats-core.readthedocs.io/en/stable/)
