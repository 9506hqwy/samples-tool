# Jujutsu

- [コマンド](./command/README.md)

## Environments

Install jj.

```sh
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/jj-vcs/jj/releases/download/v0.43.0/jj-v0.43.0-x86_64-unknown-linux-musl.tar.gz | \
  tar -zxf - -O "./jj" > ~/.local/bin/jj
chmod +x ~/.local/bin/jj
```

Confirm jj version.

```sh
jj --version
```

```text
jj 0.43.0-89f62ede8c1c611eaf134c0c49252efd65c7945d
```

Configure author.

```sh
jj config set --user user.name "root"
jj config set --user user.email "root@home.local"
```

Confirm author configuration.

```sh
cat ~/.config/jj/config.toml
```

```toml
#:schema https://docs.jj-vcs.dev/latest/config-schema.json

[user]
name = "root"
email = "root@home.local"
```

## References

- [jj-vcs](https://github.com/jj-vcs)
- [Jujutsu—a version control system](https://www.jj-vcs.dev/latest/)
