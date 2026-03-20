# Sphinx

## Environments

Check uv version.

```sh
uv --version
```

```text
uv 0.10.10
```

## Create

Create documentation project.

```sh
uv run sphinx-quickstart .
```

Run development server.

```sh
uv run sphinx-autobuild . _build/html
```

Build static documents.

```sh
uv run sphinx-build -M html . _build
```

## TODO

- Show the ToC of documents other than the default document in sidebar.
- Improve duplicate cross reference name.
- Export PDF format.

## References

- [Sphinx](https://www.sphinx-doc.org/ja/master/index.html)
- [MyST - Markedly Structured Text - Parser](https://myst-parser.readthedocs.io/en/latest/index.html)
- [Read the Docs Sphinx Theme](https://sphinx-rtd-theme.readthedocs.io/en/stable/index.html)
