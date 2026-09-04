# KraftOS

Integration branch for the KraftOS kernel. Each module lives in its own
repo, wired in here as a git submodule once its owner opens a PR adding it —
this branch is where the modules come together into the actual OS build.

Docs are handled entirely on the [`pages`](../../tree/pages) branch — see
that branch's README, or the published site, for module specs, the team
roadmap, and how to write/add docs. `main` doesn't build or serve docs at
all; it's purely for source integration.

## Adding your module here

Open a PR against `main` adding your repo as a submodule under `projects/`:

```sh
git checkout -b add-<your-project-name>
git submodule add -b main <your-repo-url> projects/<your-project-name>
git push origin add-<your-project-name>
```

Then open the PR. `main` is protected — nobody pushes to it directly.
