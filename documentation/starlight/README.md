# Starlight

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
npm create astro@latest -- --template starlight
```

Run development server.

```sh
npm run dev
```

Build static documents.

```sh
npm run build
```

Serve static documents.

```sh
npm run preview
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
