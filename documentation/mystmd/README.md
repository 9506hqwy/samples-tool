# MyST

## Environments

Check uv version.

```sh
uv --version
```

```text
uv 0.11.28 (x86_64-unknown-linux-gnu)
```

## Create

Create documentation project.

```sh
uv run myst init
```

```text
building myst-cli session with API URL: https://api.mystmd.org
🍡 Execution parallelism set to: 11

Welcome to the MyST CLI! 🎉 🚀

myst init walks you through creating a myst.yml file.

You can use MyST to:

 - create interactive websites from markdown and Jupyter Notebooks 📈
 - build & export professional PDFs and Word documents 📄

Learn more about this CLI and MyST Markdown at: https://mystmd.org


💾 Writing default .gitignore
💾 Writing new project and site config file: myst.yml

? Would you like to run myst start now? No

You can start the MyST web server later with: myst start
You can build all content with: myst build --all
```

Run development server.
The server use 3000 port (http) and 3100 port (websocket) in default.

```sh
uv run myst start
```

Build static documents.

```sh
uv run myst build --all
```

```text
building myst-cli session with API URL: https://api.mystmd.org
🍡 Execution parallelism set to: 11
🌎 Building MyST site
📖 Built index.md in 13 ms.
📖 Built intro.md in 12 ms.
📖 Built graph_table.md in 13 ms.
📖 Built link.md in 12 ms.
📖 Built reference.md in 12 ms.
📖 Built myst.yml#site.parts.primary_sidebar_footer in 12 ms.
📚 Built 5 pages for project in 38 ms.
```

## TODO

- Customize prefix of figure and table.
- Customize web site width.
- Export PDF with japanese fonts using LaTeX.
- Customize the PDF output. e.g. cover, toc, layout.

## References

- [MyST](https://mystmd.org/)
- [Bundle the default book-theme with the myst-cli enabling offline use #210](https://github.com/jupyter-book/mystmd/issues/210)
