# Structurizr DSL for Zed

Zed exention for the [Structurizr DSL](https://docs.structurizr.com/dsl/language), a text-based DSL commonly used to describe [C4 architecture models](https://c4model.com/).

## What this extension provides

- syntax highlighting for the currently supported Structurizr DSL surface
- block-aware indentation for core workspace, model, deployment, view, and style constructs
- bracket matching for Structurizr block delimiters
- outline support for workspaces, model elements, views, styles, and configuration blocks
- folding queries for the major block forms supported by the grammar
- text objects for block and comment navigation in Zed's Vim mode
- local language-server launching for `structurizr-lsp` via Zed `lsp.structurizr-lsp.binary.path`, `STRUCTURIZR_LSP_BIN`, or `PATH`.

## Language naming and discoverability

The extension is published as **Structurizr DSL** and is intended for users working with Structurizr and C4-style architecture modelling in `.dsl` files.

If Zed does not automatically detect a file, select **Structurizr DSL** from the language picker.

## Repository structure

- `extension.toml` contains the extension manifest and the pinned upstream grammar reference.
- `languages/structurizr/` contains the Zed-specific language config and Tree-sitter query files that shape the editor experience.

## Smoke testing

This repo includes `big-bank.dsl` and `big-bank-plc` workspace, which are good samples for checking that:

- Zed recognizes `.dsl` files as **Structurizr DSL**
- highlighting, outline, indentation, folds, and block matching behave sensibly
- edits continue to parse cleanly while working inside nested model, deployment, and view sections

## Development

To test the extension locally in Zed:

1. Open the command palette and run `zed: install dev extension`.
2. Select this repository (`/Users/rob/dev/zed-structurizr`).
3. Open a `.dsl` file such as `big-bank.dsl` or `big-bank-plc` workspace.

To test the local LSP integration as well:

1. Build `strz` from <https://github.com/sinon/tree-sitter-structurizr>
2. In Zed user settings or the target worktree's `.zed/settings.json`, configure:

```json
{
  "lsp": {
    "structurizr-lsp": {
      "binary": {
        "path": "~/path-to/strz",
        "args": ["server"]
      }
    }
  }
}
```

3. Launch Zed, optionally with `--foreground` while debugging.

For one-shot terminal launches, the extension also honors
`STRUCTURIZR_LSP_BIN` from Zed's shell environment when you start a fresh Zed
instance:

```sh
STRUCTURIZR_LSP_BIN=~/path-to/strz zed --foreground
```

If no explicit override is configured, the extension will look for
`structurizr-lsp` on `PATH`.

If Zed is already running, prefer `lsp.structurizr-lsp.binary.path`; launching
`zed` again from a shell does not reliably replace the environment of the
already-running app.

Also useful for debugging is `zed: open log` from the Command Palette.

When updating editor support, keep the extension-side query files in `languages/structurizr/` aligned with the grammar's supported syntax and bump the pinned grammar revision in `extension.toml` when the extension should consume newer grammar behavior.
