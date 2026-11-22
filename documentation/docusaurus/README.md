# Docusaurus

## Environments

Check Bun version.

```sh
bun --version
```

```text
1.4.5
```

## Create

Create documentation project.

```sh
bunx create-docusaurus@latest samples classic
```

Run development server at default locale (en).
The development server serves only a locale.

```sh
bun run start
```

Run development server at specified locale.

```sh
bun run start --locale ja
```

Build static documents.

```sh
bun run build
```

Serve static documents at multi locale.

```sh
bun run serve
```

Export PDF.

```sh
bun run start --locale ja
bun run docs-to-pdf \
  --initialDocURLs="http://localhost:3000/9506hqwy/samples-tool/documentation/docusaurus/samples/ja/" \
  --version=3 \
  --puppeteerArgs "--no-sandbox" \
  --coverTitle "Docusaurus サンプルドキュメント" \
  --tocTitle "目次"
```

## TODO

- Assign section numbering automatically.
- Customize the PDF output. e.g. cover, toc, layout.
- Use MDX.

## References

- [Docusaurus](https://docusaurus.io/)
- [@docusaurus/preset-classic](https://docusaurus.io/docs/using-plugins#docusauruspreset-classic)
- [docs-to-pdf](https://github.com/jean-humann/docs-to-pdf)
