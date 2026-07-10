# prek

## Environments

Install prek.

```sh
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/download/v0.4.8/prek-installer.sh | sh
```

```text
downloading prek 0.4.8 x86_64-unknown-linux-gnu
no checksums to verify
installing to /home/vscode/.local/bin
  prek
everything's installed!
```

Confirm prek version.

```sh
prek --version
```

```text
prek 0.4.8
```

Enable prek's hook in repository.

```sh
prek install
```

```text
prek installed at `.git/hooks/pre-commit`
```

## Run

Run hook that apply to staged files.
If there is unstaged changes, that is stashed automatically.

The hook run in recursively.

The file is applied all hook in ancestor *pref.toml* in default.

```sh
prek run
```

```text
Unstaged changes detected, stashing unstaged changes to `/home/vscode/.cache/prek/patches/1783613152327-65956.patch`
✓ app01
  hook01.................................................................Passed
  hook02.............................................(no files to check)Skipped
✓ app02
  hook01.............................................(no files to check)Skipped
  hook02.................................................................Passed
✓ <workspace>
  hook01.................................................................Passed
  hook02.............................................(no files to check)Skipped
  hook03.................................................................Passed
  fix utf-8 byte order marker............................................Passed
Restored working tree changes from `/home/vscode/.cache/prek/patches/1783613152327-65956.patch`
```

Run specific hook.

```sh
prek run app01:hook01
```

```text
✓ app01
  hook01.................................................................Passed
```

Run specific directory.

```sh
prek run app02/
```

```text
✓ app02
  hook01.............................................(no files to check)Skipped
  hook02.................................................................Passed
```

List hooks.

```sh
prek list
```

```text
app01:hook01
app01:hook02
app02:hook01
app02:hook02
.:hook01
.:hook02
.:hook03
.:fix-byte-order-marker
```

Occur error if there is unstaged changes in *prek.toml*.

```sh
prek run
```

```text
error: prek configuration file is not staged, run `git add prek.toml` to stage it
```

## TODO

- Remote Hook
- Language support
- Custom Hook ?

## References

- [prek](https://github.com/j178/prek)
- [prek](https://prek.j178.dev/)
