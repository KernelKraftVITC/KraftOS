# Contributing docs

This branch (`pages`) is the docs site only — mkdocs source, and nothing
else. If you're looking to wire your module's *code* into the kernel build,
that's a separate PR against the [`main`](https://github.com/KernelKraftVITC/KraftOS/tree/main)
branch instead; see that branch's README.

`pages` is protected — nobody pushes to it directly, everything lands
through a pull request. To get your module's docs listed on the site:

1. **Fork this repo** (or branch it directly if you have write access),
   checked out on the `pages` branch.

2. **Add your repo as a submodule**, tracking the branch you want synced:

   ```sh
   git submodule add -b main <your-repo-url> projects/<your-project-name>
   ```

   Use whatever your default branch is instead of `main` if it differs —
   the weekly sync follows this branch, not a pinned commit.

3. **Make sure your repo has a `docs/` folder** with markdown in it. See
   [Writing docs](docs/writing-docs.md) for the syntax available. `docs/index.md`
   becomes your project's landing page.

4. **Preview it locally**:

   ```sh
   pip install -r requirements.txt
   ./scripts/sync-docs.sh
   mkdocs serve
   ```

   Check your pages under `sources/<your-project-name>/` at
   `http://127.0.0.1:8000`.

5. **Commit and push.** You're committing `.gitmodules` and the submodule's
   pinned commit — not the docs content itself, and not `docs/sources/`
   (that's generated, and gitignored).

6. **Open a PR against `pages`.** Once merged:
   - the next push rebuilds and deploys the site immediately
   - after that, the weekly cron keeps pulling your submodule's `main` HEAD
     automatically — you don't need to open a PR again just to publish new
     doc changes, only to add/remove a project or bump the pin manually

If you've pushed a doc fix and don't want to wait for the weekly sync, ask a
maintainer to trigger the `Docs` workflow manually from the **Actions** tab
(`Run workflow`) — that pulls latest and redeploys on demand.

## Removing or renaming a project

Same flow: branch off `pages`, `git submodule deinit -f projects/<name>` +
`git rm projects/<name>` (or edit `.gitmodules`/re-run `submodule add` for a
rename), commit, push the branch, open a PR against `pages`.
