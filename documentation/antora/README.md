# Antora

## Environments

Check NodeJS version.

```sh
node --version
```

```text
v24.14.1
```

Check NPM version.

```sh
npm --version
```

```text
11.11.0
```

## Create

Build static documents.

```sh
npx antora antora-playbook.yml
```

Run development server.

```sh
npx http-server build/site -c-1
```

## TODO

- Customize theme.
- Assign section numbering automatically.
- Customize the PDF output. e.g. cover, toc, layout.

## References

- [Antora](https://antora.org/)
