# M1: Boot & Bring-up

**C/C++ (freestanding)** — Take the machine from power-on to a running 64-bit kernel that can print to the screen and serial port, and react to a keypress. This is the foundation every other module depends on.

## Dependencies

| Direction | Modules |
|---|---|
| Depends on | none — this is a foundation module |
| Blocks | M2 |

## Module

Repo: [kraft-boot-bringup](https://github.com/KernelKraftVITC/kraft-boot-bringup)
Owner: [@sanipaani](https://github.com/sanipaani)
Tracked branch: `main`

## Scope

Take the machine from power-on to a running 64-bit kernel that can print to the screen and serial port, and react to a keypress. This is the foundation every other module depends on.

## Submodules

- [ ] Toolchain and repository / build setup
- [ ] Boot via Limine into 64-bit long mode
- [ ] Framebuffer and serial output
- [ ] GDT and TSS
- [ ] IDT and exception handling
- [ ] PIC / APIC and timer interrupt
- [ ] Keyboard driver

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
