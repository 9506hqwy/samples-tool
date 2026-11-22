# Starlight

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
bun create astro@latest --template starlight
```

Run development server.

```sh
bun run dev
```

Build static documents.

```sh
bun run build
```

Serve static documents.

```sh
bun run preview
```

## TODO

- Improve the link to another document.
- Assign section numbering automatically.
- Insert images to PDF output.
- Customize the PDF output. e.g. cover, toc, layout.
- Use MDX.

## Notes

- `starlight-to-pdf` does not supports Puppeteer with `--no-sandbox`.

## References

- [Starlight](https://starlight.astro.build/)
- [astro-pdf](https://github.com/lameuler/astro-pdf)
- [starlight-to-pdf](https://github.com/Linkerin/starlight-to-pdf)
