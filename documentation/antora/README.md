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

## Notes

- Enable antora support in workspace using vscode ([#855](https://github.com/asciidoctor/asciidoctor-vscode/issues/855)).
- Require to set link test when using fragment ([Page Link Text](https://docs.antora.org/antora/latest/page/link-content/)).

## References

- [Antora](https://antora.org/)
- [Antora Assembler](https://gitlab.com/antora/antora-assembler)
