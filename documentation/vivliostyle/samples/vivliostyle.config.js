// @ts-check
import { defineConfig } from '@vivliostyle/cli';

export default defineConfig({
  title: "Vivliostyle Samples",
  author: "9506hqwy",
  language: "ja",
  theme: [
    "style.css",
  ],
  browser: "chrome@157.0.8103.78",
  image: "ghcr.io/vivliostyle/cli:11.5.0",
  entry: [
    "docs/intro.md",
    "docs/graph_table.md",
    "docs/link.md",
    "docs/reference.md",
  ],
  toc: {
    sectionDepth: 2,
  },
});
