# M2: Memory Management

**C/C++ (freestanding)** — Give the kernel the ability to manage physical and virtual memory. This is a prerequisite for processes, the module loader, and effectively everything that follows.

## Dependencies

| Direction | Modules |
|---|---|
| Depends on | M1 |
| Blocks | M3, M4 |

## Module

Repo: [kraft-memory-management](https://github.com/KernelKraftVITC/kraft-memory-management)
Owner: [@yashvini-chirri](https://github.com/yashvini-chirri)
Tracked branch: `main`

## Scope

Give the kernel the ability to manage physical and virtual memory. This is a prerequisite for processes, the module loader, and effectively everything that follows.

## Submodules

- [ ] Physical frame allocator
- [ ] Paging / virtual memory (4-level, higher-half)
- [ ] Kernel heap allocator (kmalloc / kfree)

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
