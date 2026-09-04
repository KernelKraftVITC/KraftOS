# M3: Kernel Module Loader (LKM)

**C/C++ (freestanding)** — A Linux-style dynamic module loading subsystem that parses relocatable kernel modules, resolves kernel symbols, and registers or unregisters them at runtime. This is what lets later subsystems such as the VFS and filesystems be developed and loaded independently of the process/scheduler track.

## Dependencies

| Direction | Modules |
|---|---|
| Depends on | M2 |
| Blocks | M8 (future) |

## Module

Repo: [kraft-kernel-module-loader](https://github.com/KernelKraftVITC/kraft-kernel-module-loader)
Owner: [@kumar-shaurya](https://github.com/kumar-shaurya)
Tracked branch: `main`

## Scope

A Linux-style dynamic module loading subsystem that parses relocatable kernel modules, resolves kernel symbols, and registers or unregisters them at runtime. This is what lets later subsystems such as the VFS and filesystems be developed and loaded independently of the process/scheduler track.

## Submodules

- [ ] Relocatable ELF (.ko-style) parsing
- [ ] Kernel symbol table and resolution
- [ ] Module register/init and cleanup API
- [ ] insmod / rmmod-style loading mechanism

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
