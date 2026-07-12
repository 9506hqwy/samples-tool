# Lefthook

## Environments

Install lefthook.

```sh
curl -fsSL -o - https://github.com/evilmartians/lefthook/releases/download/v2.1.10/lefthook_2.1.10_Linux_x86_64.gz | \
    gzip -c -d > ~/.local/bin/lefthook
chmod +x ~/.local/bin/lefthook
```

Confirm lefthook version.

```sh
lefthook --version
```

```text
lefthook version 2.1.10
```

Enable lefthook's hook in repository.

```sh
lefthook install
```

```text
sync hooks: ✔️(pre-commit)
```

## Run

Run hook that apply to staged files.
If there is unstaged changes, that is stashed automatically.

The hook use *lefthook.yml* on repository root.

```sh
lefthook run pre-commit
```

```text
╭──────────────────────────────────────────╮
│ 🥊 lefthook  v2.1.10   hook:  pre-commit │
╰──────────────────────────────────────────╯
┃  hook01 ❯
README.md app01/a.py app01/lefthook.yml app02/a.go app02/lefthook.yml lefthook.yml

│  hook02 (skip) no matching staged files
┃  hook03 ❯
Hello, World!

┃  app01-hook01 ❯

│  app01-hook02 (skip) no files for inspection
│  app02-hook01 (skip) no files for inspection
┃  app02-hook02 ❯
./a.go

  ────────────────────────────────────
summary: (done in 0.01 seconds)
✔️ hook01 (0.00 seconds)
✔️ hook03 (0.00 seconds)
✔️ app01-hook01 (0.00 seconds)
✔️ app02-hook02 (0.00 seconds)
```

Run specific hook.

```sh
lefthook run pre-commit --job hook01
```

```text
╭──────────────────────────────────────────╮
│ 🥊 lefthook  v2.1.10   hook:  pre-commit │
╰──────────────────────────────────────────╯
┃  hook01 ❯
README.md app01/a.py app01/lefthook.yml app02/a.go app02/lefthook.yml lefthook.yml

  ────────────────────────────────────
summary: (done in 0.01 seconds)
✔️ hook01 (0.00 seconds)
```

List hooks.

```sh
lefthook dump
```

```yaml
extends:
  - app01/lefthook.yml
  - app02/lefthook.yml
pre-commit:
  jobs:
    - name: hook01
      run: echo {staged_files}
    - name: hook02
      run: sleep 1
      glob:
        - '*.ts'
    - name: hook03
      run: |
        VALUE=World
        echo Hello, ${VALUE}!
    - name: app01-hook01
      run: cat {staged_files}
      root: app01
      glob:
        - '*.py'
    - name: app01-hook02
      run: echo {staged_files}
      root: app01
      glob:
        - '*.go'
    - name: app02-hook01
      run: cat {staged_files}
      root: app02
      glob:
        - '*.py'
    - name: app02-hook02
      run: echo {staged_files}
      root: app02
      glob:
        - '*.go'
```

Run unstaged hook even if there is unstaged changes in *lefthook.yml*.

```sh
lefthook run pre-commit
```

```text
──────────────────────────────────────────╮
│ 🥊 lefthook  v2.1.10   hook:  pre-commit │
╰──────────────────────────────────────────╯
┃  hook01 ❯
README.md app01/a.py app01/lefthook.yml app02/a.go app02/lefthook.yml lefthook.yml

│  hook02 (skip) no matching staged files
┃  hook03 ❯
Hello, World!

┃  app01-hook01 ❯

│  app01-hook02 (skip) no files for inspection
│  app02-hook01 (skip) no files for inspection
┃  app02-hook02 ❯
./a.go

  ────────────────────────────────────
summary: (done in 0.01 seconds)
✔️ hook01 (0.00 seconds)
✔️ hook03 (0.00 seconds)
✔️ app01-hook01 (0.00 seconds)
✔️ app02-hook02 (0.00 seconds)
```

## TODO

- Remote Hook

## References

- [lefthook](https://github.com/evilmartians/lefthook)
- [Lefthook](https://lefthook.dev/)
