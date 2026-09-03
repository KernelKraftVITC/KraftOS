# Adding your project's docs

`main` is protected — nobody pushes to it directly, everything lands through
a pull request. To get your project listed:

1. **Fork this repo** (or branch it directly if you have write access).

2. **Add your repo as a submodule**, tracking the branch you want synced:

   ```sh
   git submodule add -b main <your-repo-url> projects/<your-project-name>
   ```

   Use whatever your default branch is instead of `main` if it differs —
   the weekly sync follows this branch, not a pinned commit.

3. **Make sure your repo has a `docs/` folder** with markdown in it. See
   [Writing docs](writing-docs.md) for the syntax available. `docs/index.md`
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

6. **Open a PR against `main`.** Once merged:
   - the next push rebuilds and deploys the site immediately
   - after that, the weekly cron keeps pulling your submodule's `main` HEAD
     automatically — you don't need to open a PR again just to publish new
     doc changes, only to add/remove a project or bump the pin manually
