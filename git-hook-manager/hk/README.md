# hk

## Environments

Install hk.

```sh
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/jdx/hk/releases/download/v1.50.0/hk-x86_64-unknown-linux-gnu.tar.gz | \
  tar -zxf - -O "hk" > ~/.local/bin/hk
chmod +x ~/.local/bin/hk
```

Confirm hk version.

```sh
hk --version
```

```text
hk 1.50.0
```

Enable hk's hook in repository.

```sh
hk install
```

```text
Installed hk hook via git config: hook.hk-pre-commit.command
```

## Run

Run hook that apply to staged files.
Recursively search for a *hk.pkl* in parent directories.

```sh
hk run pre-commit
```

```text
hk 1.50.0 by @jdx – pre-commit – fix  [=================================================================] 3/3
✔ files - Fetching staged files (4 files)
✔ hook01
✔ hook01
✔ hook02
```

Run unstaged hook even if there is unstaged changes in *hk.pkl*.

```sh
hk run pre-commit
```

```text
hk 1.50.0 by @jdx – pre-commit – fix  [=================================================================] 3/3
✔ files - Fetching staged files (4 files)
✔ hook01
✔ hook01
✔ hook02
```

## TODO

- Builtin Linters
- Add file to staging area if use `fix` when `stage!=empty` ?
- Stash Automatically ?
- Custom Hook ?
- Offline ?

## References

- [hk](https://github.com/jdx/hk)
- [hk](https://hk.jdx.dev/)
