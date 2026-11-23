# pfpdf

## Environments

```{note}
Does not work when specifying a directory as `--input` with Bun ?

Error: `no *.md files found`
```

Check Bun version.

```sh
bun --version
```

```text
1.4.5
```

## Create

```{note}
Run as a non-root user, as the browser cannot start with the sandbox enabled.
```

```sh
bunx @pfnet-research/pfpdf@latest --input <path/to/file>.md --output <path/to/file>.pdf
```

## References

- [pfpdf](https://github.com/pfnet-research/pfpdf)
