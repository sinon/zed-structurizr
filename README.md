# Structurizr DSL for Zed

Zed exention for the [Structurizr DSL](https://docs.structurizr.com/dsl/language), a text-based DSL commonly used to describe [C4 architecture models](https://c4model.com/).

## What this extension provides

- syntax highlighting for the currently supported Structurizr DSL surface
- block-aware indentation for core workspace, model, deployment, view, and style constructs
- bracket matching for Structurizr block delimiters
- outline support for workspaces, model elements, views, styles, and configuration blocks
- folding queries for the major block forms supported by the grammar
- text objects for block and comment navigation in Zed's Vim mode



## Language naming and discoverability

The extension is published as **Structurizr DSL** and is intended for users working with Structurizr and C4-style architecture modelling in `.dsl` files.

If Zed does not automatically detect a file, select **Structurizr DSL** from the language picker.

## Repository structure

- `extension.toml` contains the extension manifest and the pinned upstream grammar reference.
- `languages/structurizr/` contains the Zed-specific language config and Tree-sitter query files that shape the editor experience.

## Smoke testing

This repo includes `big-bank.dsl`, which is a good sample for checking that:

- Zed recognizes `.dsl` files as **Structurizr DSL**
- highlighting, outline, indentation, folds, and block matching behave sensibly
- edits continue to parse cleanly while working inside nested model, deployment, and view sections

## Development

To test the extension locally in Zed:

1. Open the command palette and run `zed: install dev extension`.
2. Select this repository (`/Users/rob/dev/zed-structurizr`).
3. Open a `.dsl` file such as `big-bank.dsl`.

If you need verbose extension logs, launch Zed from the terminal with:

```sh
zed --foreground
```

Also useful for debugging is `zed: open log` from the Command Pallete

When updating editor support, keep the extension-side query files in `languages/structurizr/` aligned with the grammar's supported syntax and bump the pinned grammar revision in `extension.toml` when the extension should consume newer grammar behavior.
