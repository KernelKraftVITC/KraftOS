# Contributing

KraftOS is the docs hub for every KernelKraftVITC project. Each project
lives here as a **git submodule** and owns a `docs/` folder — this repo just
stitches everyone's `docs/` together into one site and deploys it.

**`main` is protected.** Nobody — including maintainers — can push to it
directly. Every change, including adding a new project, goes through a pull
request from a branch.

If this is your first time touching this repo, follow the steps below in
order. None of it assumes you've done this before.

## 0. Prerequisites

You need on your machine:

- `git`
- Python 3.10+ and `pip`
- Write access to the `KernelKraftVITC/KraftOS` repo (ask a maintainer to
  add you as a collaborator if you don't have it — if you're an outside
  contributor without access, fork the repo instead and open the PR from
  your fork; everything else below is the same)

## 1. Clone the repo

```sh
git clone https://github.com/KernelKraftVITC/KraftOS.git
cd KraftOS
```

You don't need `--recurse-submodules` just to add a new project, but if you
want to see the existing ones' docs while you work, use:

```sh
git submodule update --init --recursive
```

## 2. Pick a name for your project

Your project's folder name under `projects/` becomes:

- the URL path its docs live at (`/sources/<name>/...`)
- the section label shown in the site's navigation

So pick something short and recognizable — **lowercase, hyphen-separated**,
matching your actual repo name where possible. E.g. a repo called
`Kraft-Bootloader` should be added as `projects/kraft-bootloader`, not
`projects/KraftBootloader` or `projects/Kraft_Bootloader`.

## 3. Create a branch

Never work on `main` — you can't push it anyway. Branch off first:

```sh
git checkout -b add-<your-project-name>
```

Example: `git checkout -b add-kraft-bootloader`.

## 4. Add your repo as a submodule

```sh
git submodule add -b main <your-repo-url> projects/<your-project-name>
```

Replace `main` with your repo's actual default branch if it isn't `main`
(check on GitHub if unsure). This `-b` matters — it's what tells the weekly
sync which branch to follow. Without it, the sync may not track the branch
you expect.

This stages two things: `.gitmodules` (updated with your project's URL and
branch) and a new entry `projects/<your-project-name>` pointing at your
repo's current commit. That's all this repo actually stores about your
project — not your files, just a pointer to them.

## 5. Make sure your repo has a `docs/` folder

That's the only requirement on your project's side. Inside it:

- `docs/index.md` — becomes your project's landing page
- any other `.md` files, in subfolders if you like — see
  [Writing docs](docs/writing-docs.md) for syntax, images, and structure

If you don't have this yet, add it in your own repo, commit, and push there
first — then come back here.

## 6. Preview the whole site locally

From the KraftOS root:

```sh
pip install -r requirements.txt
./scripts/sync-docs.sh
mkdocs serve
```

Open `http://127.0.0.1:8000` and check your project shows up correctly
under its section in the nav. `Ctrl+C` to stop the server when you're done.

Re-run `./scripts/sync-docs.sh` any time you pull new commits into your
submodule and want to preview them.

## 7. Commit and push your branch

```sh
git add .gitmodules projects/<your-project-name>
git commit -m "Add <your-project-name> docs"
git push origin add-<your-project-name>
```

Do **not** run `git push origin main` — it will be rejected, and you don't
want it to succeed anyway (nobody's changes should land on `main` without
review).

## 8. Open a pull request

```sh
gh pr create --base main --title "Add <your-project-name> docs"
```

or open one from the GitHub UI — GitHub will offer a "Compare & pull
request" button on your branch automatically. Target `main`.

A maintainer reviews and merges it. As soon as it's merged:

- the merge itself triggers an immediate rebuild + redeploy
- from then on, the weekly cron job pulls whatever's newest on your
  submodule's tracked branch automatically — you generally don't need to
  open another PR here just because you edited a doc page in your own repo

If you've pushed a doc fix and don't want to wait for the weekly sync, ask a
maintainer to trigger the `Docs` workflow manually from the **Actions** tab
(`Run workflow`) — that pulls latest and redeploys on demand.

## Removing or renaming a project

Same flow: branch, `git submodule deinit -f projects/<name>` +
`git rm projects/<name>` (or edit `.gitmodules`/re-run `submodule add` for a
rename), commit, push the branch, open a PR.
