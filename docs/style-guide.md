---
author: KraftOS maintainers
updated: 2026-09-04
---

# Style guide

Every module's docs get pulled into one site — this keeps them reading like
one document instead of four different people's notes stitched together.

## Frontmatter (required)

Every page needs a YAML frontmatter block at the top, before any content:

```md
---
author: Your Name
updated: 2026-09-04
---

# Page Title
```

- **`author`** — your name, not your GitHub handle. Shown as a byline.
- **`updated`** — the date you last substantively edited the page
  (`YYYY-MM-DD`), not every typo fix. Bump it when the content changes.

This is metadata, not content — it renders as a byline above the page, not
as text in your prose. Never write "Written by X" or a date inside the
body; the site does that for you.

## Voice

- **Second person, imperative for instructions.** "Add your submodule",
  not "The user should add their submodule" or "We will add a submodule".
- **Present tense.** Describe what the code does, not what it "will do" or
  "is designed to do".
- **No filler.** Skip "In this section, we will discuss..." — just start.
  Skip "It's important to note that..." — if it's worth saying, say it
  directly.
- **Contractions are fine.** "Don't", "it's", "you'll" — this isn't a
  legal document.

## Structure

- **One `#` heading per page**, matching the page title. Everything else
  is `##` and down — don't skip levels.
- **Sentence case for headings** — "Physical frame allocator", not
  "Physical Frame Allocator".
- **Short paragraphs.** Three or four sentences, not walls of text. If a
  paragraph needs a "firstly/secondly", make it a list instead.
- **Code over description.** Show the command or the signature; don't
  narrate it in prose first.

## Formatting conventions

- Use admonitions (`!!! note`, `!!! warning`) for genuine callouts, not
  every paragraph. If more than one in three blocks is an admonition,
  you're overusing them.
- Fenced code blocks always get a language tag — ` ```c`, not ` ``` `.
- Reference actual identifiers in backticks: `kmalloc`, not "the kmalloc
  function".
- Diagrams as Mermaid (` ```mermaid `) where they clarify structure —
  don't describe a data flow in prose that a five-line graph shows
  instantly.

## Terminology

Keep these consistent across all module docs:

| Use | Not |
|---|---|
| kernel module | plugin, extension |
| freestanding | bare-metal *(fine in passing, but "freestanding" is the term we standardize on for build-target language)* |
| submodule *(git)* | subrepo, subproject |
| module *(a KraftOS M-number)* | component, part *(when referring to M1–M12 specifically)* |

## Before you open a PR

- [ ] Frontmatter present (`author`, `updated`)
- [ ] One `#` heading, sentence case
- [ ] Code blocks tagged with a language
- [ ] Read it out loud once — if you stumble, so will the reader

See [Writing docs](writing-docs.md) for the mechanics (folder structure,
images, extensions available); this page is about tone and consistency.
