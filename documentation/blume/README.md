# Blume

## Environments

Check NodeJS version.

```sh
node --version
```

```text
v24.19.0
```

Check NPM version.

```sh
npm --version
```

```text
11.17.0
```

## Create

Create documentation project.

```sh
npx blume init
```

```text
Need to install the following packages:
blume@1.5.3
Ok to proceed? (y) y
npm warn deprecated lodash.isequal@4.5.0: This package is deprecated. Use require('node:util').isDeepStrictEqual instead.
┌  blume init
│
◇  Where should we create your project?
│  .
│
◇  What's your docs site called?
│  Blume Samples
│
◇  Which template?
│  docs
│
◇  Where does your content live?
│  filesystem
│
◇  Content directory?
│  docs
│
◆  Created /workspaces/samples-tool/documentation/blume/samples/docs/index.mdx
│
◆  Created /workspaces/samples-tool/documentation/blume/samples/package.json
│
◆  Created /workspaces/samples-tool/documentation/blume/samples/blume.config.ts
│
◆  Added node_modules/, .blume/, dist/ to .gitignore
│
◇   ──────────────╮
│                 │
│  Next steps:    │
│                 │
│    npm install  │
│    npm run dev  │
│                 │
├─────────────────╯
│
└  You're all set.
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
- Export PDF format.
- Use MDX.

## References

- [Blume](https://useblume.dev/)
- [haydenbleasel/blume](https://github.com/haydenbleasel/blume)
