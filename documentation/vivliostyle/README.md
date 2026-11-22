# Vivliostyle

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
bun create book
```

```text
║
◇─ Where should we create your project?
║  .
║
◇─ What's the title of your publication?
║  Vivliostyle Samples
║
◇─ What's the author name?
║  9506hqwy
║
◇─ What's the language?
║  Japanese
║
◇─ What's the project template?
║  Minimal
║
◇─ Fetching a list of Vivliostyle themes...
║
◇─ What's the project theme?
║  Not use Vivliostyle theme
║
◇─ Should we install dependencies? (You can install them later.)
║  Yes
║
╙─ All configurations are set! Creating your project...

INFO Downloading a template
INFO Installing dependencies with bun

bun install v1.4.5 (a7733435c)

+ @vivliostyle/cli@11.5.0

599 packages installed [6.69s]

SUCCESS Successfully created a project at .

Next steps:
1. Create and edit Markdown files
2. Modify the entry field in vivliostyle.config.js
3. npm run preview to open a preview browser window
4. npm run build to generate the output file

For more information, visit https://docs.vivliostyle.org.

🖋 Happy writing!
```

Run development server.

```sh
bun run preview --no-open-viewer
```

```text
$ vivliostyle preview --no-open-viewer
INFO Start preview

Vivliostyle CLI v11.5.0
║ 📙 Up and running (press Ctrl+C to quit)
╙─ Preview URL: http://localhost:13000/__vivliostyle-viewer/index.html#src=http://localhost:13000/vivliostyle/publication.json&bookMode=true&renderAllPages=true
```

Build static documents.

```sh
bun run build
```

```text
$ vivliostyle build
INFO Start building
INFO Launching PDF build environment
INFO Building pages
INFO
INFO docs/intro.md はじめに
INFO docs/graph_table.md 図と表
INFO docs/link.md リンク
INFO docs/reference.md 参照
INFO Building PDF
INFO Processing PDF
SUCCESS Finished building Vivliostyle Samples.pdf
📘 Built successfully!
```

## TODO

- Improve the link to another document.
- Assign section numbering automatically.
- Customize the PDF output. e.g. cover, toc, layout.

## References

- [Vivliostyle](https://vivliostyle.org/)
