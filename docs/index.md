---
author: KraftOS maintainers
updated: 2026-09-04
---

# KraftOS

A 64-bit x86 kernel built from scratch, module by module, in C/C++. Each
module is owned by one person, lives in its own repo, and gets pulled into
this site as a submodule — see [Writing docs](writing-docs.md) and the
[style guide](style-guide.md) for how that works.

## Tech stack

- **Language:** C, with C++ where it earns its keep (no exceptions, no RTTI)
- **Freestanding** — no libc, no hosted runtime; everything from boot up is
  ours
- **Bootloader:** [Limine](https://github.com/limine-bootloader/limine)
- **Toolchain:** a cross-compiler targeting `x86_64-elf` (never the system
  compiler)
- **Testing:** QEMU, cross-checked against real hardware where it matters

## Current team — M1 to M4

The first four modules are in active development. One person per module,
one repo per module.

| Module | Scope | Owner | Repo |
|---|---|---|---|
| M1 | Boot & Bring-up | [@sanipaani](https://github.com/sanipaani) | [kraft-boot-bringup](https://github.com/KernelKraftVITC/kraft-boot-bringup) |
| M2 | Memory Management | [@yashvini-chirri](https://github.com/yashvini-chirri) | [kraft-memory-management](https://github.com/KernelKraftVITC/kraft-memory-management) |
| M3 | Kernel Module Loader (LKM) | [@kumar-shaurya](https://github.com/kumar-shaurya) | [kraft-kernel-module-loader](https://github.com/KernelKraftVITC/kraft-kernel-module-loader) |
| M4 | Process & Scheduling | [@Krishdeep13](https://github.com/Krishdeep13) | [kraft-process-scheduling](https://github.com/KernelKraftVITC/kraft-process-scheduling) |

See the [roadmap](roadmap.md) for the full M1–M12 plan and how the modules
depend on each other, or jump straight into a module's docs below.
