# Asciidoctor

## Environments

Check asciidoctor version.

```sh
asciidoctor --version
```

```text
Asciidoctor 2.0.23 [https://asciidoctor.org]
Runtime Environment (ruby 3.3.8 (2025-04-09 revision b200bad6cd) [x86_64-linux-gnu]) (lc:UTF-8 fs:UTF-8 in:UTF-8 ex:UTF-8)
```

## Create

Build static documents.

```sh
asciidoctor -a data-uri -D _build -R src '**/index.adoc'
```

Export PDF.

```sh
asciidoctor-pdf \
    -a data-uri \
    -a scripts=cjk \
    -a pdf-theme=./theme.yml \
    -a pdf-fontsdir=/usr/share/fonts/truetype \
    -D _build \
    -R src \
    '**/index.adoc'
```

## TODO

- Split pages.
- Add locale selector.
- Add version selector.
- Align graph and table caption to center in HTML.
- Customize the PDF output. e.g. cover, toc, layout.

## References

- [Asciidoctor](https://asciidoctor.org/)
