# KraftOS Docs

Documentation hub for all KernelKraftVITC projects. Built with
[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) (the same
engine FastAPI's docs run on).

## How it works

Each project lives here as a git submodule and owns a `docs/` folder of
markdown. `scripts/sync-docs.sh` symlinks every submodule's `docs/` into
`docs/sources/<name>`, then `mkdocs build` turns the combined tree into a
static site.

A weekly GitHub Actions workflow (`.github/workflows/docs.yml`) pulls the
latest commit from every submodule, rebuilds the site, and deploys it to
GitHub Pages as a build artifact — no `gh-pages` branch, nothing committed
by hand.

## Add a project

```sh
git submodule add <repo-url> projects/<name>
```

The project needs a `docs/` folder with markdown in it. Nothing else to wire
up — the next build (or `./scripts/sync-docs.sh` locally) picks it up.

## Local preview

```sh
pip install -r requirements.txt
./scripts/sync-docs.sh
mkdocs serve
```
