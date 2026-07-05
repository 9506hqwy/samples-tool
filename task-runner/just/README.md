# just

## Environments

Install just.

```sh
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin
```

```text
install: Repository:  https://github.com/casey/just
install: Crate:       just
install: Tag:         1.55.1
install: Target:      x86_64-unknown-linux-musl
install: Destination: /home/vscode/.local/bin
install: Archive:     https://github.com/casey/just/releases/download/1.55.1/just-1.55.1-x86_64-unknown-linux-musl.tar.gz
```

Confirm just version.

```sh
just --version
```

```text
just 1.55.1
```

## Run

Run 1st recipe at 1st *justfile*.
Recursively search for a *justfile* in parent directories.

```sh
just -f samples/01-basic.justfile
```

```text
Hello, World!
```

Run specific recipe.

```sh
just -f samples/01-basic.justfile hello-world-ja
```

```text
こんにちは、世界！
```

Run specific recipes in order.

```sh
just -f samples/01-basic.justfile hello-world-ja hello-world
```

```text
こんにちは、世界！
Hello, World!
```

Run recipe with parameter.

```sh
just -f samples/04-parameter.justfile hello 世界
```

```text
Hello, 世界!
```

Run with argument.

```sh
just -f samples/11-expr.justfile world=世界
```

```text
Hello, 世界!
```

Run code block in markdown file.

```sh
just -f samples/19-markdown.md
```

```text
Hello, World!
```

Format *justfile* source.

```sh
just --fmt
```

## TODO

- cache
- function
- incremental build ?
- file pattern rule ?
- call another recipe ?

## References

- [just](https://github.com/casey/just)
- [Just Programmer's Manual](https://just.systems/man/en/)
