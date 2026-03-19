# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

rgl is a regex search toolkit with two components:
- **rgl.sh** — shell one-liner wrapping `rg --no-ignore --pretty` piped through `less -R`
- **rgl.html** — standalone single-file browser app (no build step, no dependencies) that provides the same functionality with a split-pane GUI

## Architecture

`rgl.html` is a self-contained HTML/CSS/JS file. Everything lives in one file — styles in `<style>`, markup in `<body>`, logic in `<script>`. There is no build system, bundler, or framework.

### Key browser API dependency

The app relies on the **File System Access API** (`window.showDirectoryPicker`) for local directory access. This API is only available in Chromium browsers (Chrome, Edge). Do not introduce changes that assume Firefox or Safari support.

### App flow

1. **Indexing** — `indexDir()` recursively walks the selected directory via `FileSystemDirectoryHandle`, building `fileIndex[]` (skips dotfiles, `node_modules`, and binary extensions)
2. **Searching** — `doSearch()` iterates `fileIndex`, reads each file as text, tests each line against the user's regex, collects matches into `searchResults[]`
3. **Rendering results** — `buildResultGroup()` creates DOM for each file's matches (capped at 200 per file with expand-on-click)
4. **Document viewing** — `showDocument()` reads the full file, renders all lines, highlights matched lines, and scrolls the clicked match into view

### Performance considerations

- Search yields to the UI every 50 files via `setTimeout(0)` to keep the page responsive
- Results are built in a `DocumentFragment` before appending to DOM
- An `AbortController` cancels in-flight searches when a new one starts
- Per-file match display is capped at 200 with lazy expansion

### Theming

All colors use CSS custom properties in `:root` (Catppuccin Mocha palette). To change the theme, update the `--bg`, `--surface`, `--accent`, etc. variables.
