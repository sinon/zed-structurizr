# structurizr

Zed language extension scaffold for the Structurizr DSL, backed by the Tree-sitter grammar in `/Users/rob/dev/tree-sitter-structurizr`.

This repository is intentionally local-dev-first. It wires Zed to the grammar repository and provides the minimum extension layout needed to iterate on language support before worrying about publication.

## Files

- `extension.toml` registers the extension and points Zed at the Structurizr Tree-sitter grammar.
- `languages/structurizr/config.toml` defines the language metadata and file association.
- `languages/structurizr/*.scm` contains the initial Tree-sitter query placeholders for Zed-specific editor behavior.

## Local development

1. Keep the grammar repository available at `/Users/rob/dev/tree-sitter-structurizr`.
2. In Zed, open the command palette and run `zed: install dev extension`.
3. Select this repository (`/Users/rob/dev/zed-structurizr`).
4. Open a `.dsl` file and choose `Structurizr` from the language selector if Zed does not pick it automatically.

If you need verbose extension logs, launch Zed from the terminal with:

```sh
zed --foreground
```

## Grammar source

For local development, `extension.toml` uses a `file://` grammar repository URL:

```toml
[grammars.structurizr]
repository = "file:///Users/rob/dev/tree-sitter-structurizr"
```

Before publishing, replace that with the hosted Git URL for the grammar repository and pin `rev` to a specific commit SHA.

## Current query status

The grammar and extension now both have an initial query pass for highlighting, folding/indent hints, brackets, and outline support.

At the moment, `languages/structurizr/highlights.scm` and `languages/structurizr/indents.scm` mirror the query logic in `/Users/rob/dev/tree-sitter-structurizr/queries/` so Zed can consume local copies directly. If you update the grammar-side queries, keep the extension-side copies in sync. Bump the pinned grammar commit SHA in `extension.toml` when the extension should start using a newer grammar commit.

## Smoke test idea

Create or open a file such as `example.dsl` with content like:

```dsl
workspace {
  model {
    user = person "User"
    system = softwareSystem "System"
    user -> system "Uses"
  }
}
```

Then verify that:

- Zed recognizes the file as `Structurizr`
- the extension loads without manifest errors
- edits do not break parsing
- future query work can be added under `languages/structurizr/`
