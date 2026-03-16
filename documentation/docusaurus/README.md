# Docusaurus

## Environments

Check NodeJS version.

```sh
node --version
```

```text
v24.14.0
```

Check NPM version.

```sh
npm --version
```

```text
11.9.0
```

## Create

Create documentation project.

```sh
npx create-docusaurus@latest samples classic
```

Run development server at default locale (en).
The development server serves only a locale.

```sh
npm run start
```

Run development server at specified locale.

```sh
npm run start -- --locale ja
```

Build static documents.

```sh
npm run build
```

Serve static documents at multi locale.

```sh
npm run serve
```

Export PDF.

```sh
npm run start -- --locale ja
npm run docs-to-pdf -- \
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
