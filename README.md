# rgl

Ripgrep-like regex search tools: a shell wrapper and a standalone browser app.

## rgl.sh

A minimal shell wrapper around [ripgrep](https://github.com/BurntSushi/ripgrep) that searches all files (including ignored ones) with colored output piped through `less`.

### Usage

```sh
./rgl.sh "PATTERN"
```

### Requirements

- [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`)

## rgl.html

A standalone, single-file HTML app that replicates `rgl.sh` in the browser — no server or build step required.

### Features

- **Folder picker** — select any local directory to search
- **Regex search** — full JavaScript regex support with case sensitivity and whole-word options
- **File filtering** — filter by extension (e.g. `*.js, *.txt`) and max file size
- **Split-pane UI** — results on the left, full document viewer on the right with a draggable divider
- **Click-to-navigate** — click any match to open the file and scroll to the matched line
- **Match highlighting** — matches are highlighted in both the results list and the document viewer
- **Large result handling** — results beyond 200 per file are collapsed with an expand option

### Usage

Open `rgl.html` in **Chrome** or **Edge**. The [File System Access API](https://developer.mozilla.org/en-US/docs/Web/API/File_System_Access_API) is required and is not supported in Firefox or Safari.

### Screenshot

1. Click **Open Folder** to select a directory
2. Type a regex pattern and press Enter or click **Search**
3. Click any result line to view the full document with the match in focus

## License

MIT
