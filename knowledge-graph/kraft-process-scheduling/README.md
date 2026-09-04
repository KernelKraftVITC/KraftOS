# M4: Process & Scheduling

**C/C++ (freestanding)** — Introduce true multitasking: kernel threads, context switching, a scheduler, and the transition into unprivileged user mode.

## Dependencies

| Direction | Modules |
|---|---|
| Depends on | M2 |
| Blocks | M5 (future), M6 (future) |

## Module

Repo: [kraft-process-scheduling](https://github.com/KernelKraftVITC/kraft-process-scheduling)
Owner: [@Krishdeep13](https://github.com/Krishdeep13)
Tracked branch: `main`

## Scope

Introduce true multitasking: kernel threads, context switching, a scheduler, and the transition into unprivileged user mode.

## Submodules

- [ ] Thread abstraction and context switch
- [ ] Round-robin scheduler
- [ ] Ring-3 user mode transition

## Status

**Spec-only.** No kernel source exists in this repo yet — only
`docs/index.md` (the module spec) and this assignment's `README.md`. This
knowledge-graph entry will grow a real function-level index once source
lands.

## Key Files

| File | Purpose |
|---|---|
| `docs/index.md` (in the module repo) | Module spec — objectives, architecture notes |
| `README.md` (in the module repo) | Assignment note, links back here |
