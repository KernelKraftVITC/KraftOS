# Writing docs

Your project's `docs/` folder gets symlinked straight into this site at
build time, so whatever renders in your own repo renders here — same
markdown, same theme, same extensions. There's nothing to configure on your
side beyond writing markdown.

New here? See [Contributing](https://github.com/KernelKraftVITC/KraftOS/blob/pages/CONTRIBUTING.md)
first for how to get your project added in the first place — this page is
about what goes *inside* your `docs/` folder once it's wired up.

## Folder structure

```
your-repo/
  docs/
    index.md       # your project's landing page
    usage.md        # any page you want
    guides/
      advanced.md   # subfolders become nav sections automatically
    images/
      diagram.svg    # anything non-markdown just gets copied as-is
```

- `docs/index.md` is required — it's what your project's section links to.
- Everything else is up to you. File names become URLs
  (`usage.md` → `.../usage/`), folder names become nav section labels.
- No nav file to maintain — the site builds navigation straight from your
  folder structure.

## Basic markdown

Standard stuff works as expected:

```md
# Heading

Some text with **bold**, *italic*, and `inline code`.

- a list
- of things

[a link](https://example.com)
```

Link between your own pages with relative paths:

```md
See [advanced usage](guides/advanced.md).
```

## Images

Put image files anywhere under your `docs/` folder — `docs/images/` is a
sane default — and reference them with a normal relative markdown link:

```md
![architecture diagram](images/diagram.svg)
```

That's it. No special handling needed — SVG, PNG, JPG, GIF all just get
copied into the built site next to your pages, and the link path resolves
correctly regardless of where in the nav your page ends up. This is
confirmed working, not a guess — the same setup was exercised by a sample
module repo during setup.

Keep images reasonably sized — this is a docs site, not a CDN.

## Extensions available

The site runs [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
with the same extension set FastAPI's docs use. All of these work inside
your `docs/` folder:

**Admonitions** — callout boxes:

```md
!!! tip
    Use these for callouts. Also available: `note`, `warning`, `danger`.
```

**Fenced code blocks** with syntax highlighting — just name the language:

````md
```python
def hello():
    print("hi")
```
````

**Tabbed content** — useful for showing alternatives (package managers,
platforms, languages):

```md
=== "pip"
    ```sh
    pip install thing
    ```

=== "uv"
    ```sh
    uv add thing
    ```
```

**Collapsible details**:

```md
??? note "Click to expand"
    Hidden content here, collapsed by default.
```

## Preview locally before opening a PR

From the KraftOS root, on the `pages` branch, with your submodule already
added (see [Contributing](https://github.com/KernelKraftVITC/KraftOS/blob/pages/CONTRIBUTING.md)):

```sh
pip install -r requirements.txt
./scripts/sync-docs.sh
mkdocs serve
```

Open `http://127.0.0.1:8000` — your pages show up under
`sources/<your-project-name>/`. Re-run `sync-docs.sh` after pulling new
commits into your submodule to pick up changes; `mkdocs serve` live-reloads
on its own after that.
