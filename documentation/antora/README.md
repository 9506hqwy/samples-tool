# Antora

## Environments

Check Bun version.

```sh
bun --version
```

```text
1.4.5
```

## Create

Build static documents.

```sh
bunx antora antora-playbook.yml
```

Run development server.

```sh
bunx http-server build/site -c-1
```

## Notes

- Enable antora support in workspace using vscode ([#855](https://github.com/asciidoctor/asciidoctor-vscode/issues/855)).
- Require to set link test when using fragment ([Page Link Text](https://docs.antora.org/antora/latest/page/link-content/)).

## References

- [Antora](https://antora.org/)
- [Antora Assembler](https://gitlab.com/antora/antora-assembler)
