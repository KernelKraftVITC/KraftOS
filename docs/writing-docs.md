# Writing docs

Your project's `docs/` folder gets symlinked straight into this site, so
whatever renders in your submodule renders here — same rules, same theme.

## Basics

- Plain markdown files under `docs/`. `docs/index.md` is your project's
  landing page.
- Folders become nav sections automatically — no nav config to maintain.
- Link between your own pages with relative paths: `[usage](usage.md)`.

## Extensions available

This site runs [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
with the same extensions FastAPI's docs use. You can use all of these inside
your submodule's `docs/`:

**Admonitions**

```md
!!! tip
    Use these for callouts.
```

**Fenced code blocks with syntax highlighting**

````md
```python
def hello():
    print("hi")
```
````

**Tabbed content**

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

**Collapsible details**

```md
??? note "Click to expand"
    Hidden content here.
```

## Preview locally

From the KraftOS root, with your submodule checked out:

```sh
pip install -r requirements.txt
./scripts/sync-docs.sh
mkdocs serve
```

Your pages show up under `sources/<your-module-name>/`.
