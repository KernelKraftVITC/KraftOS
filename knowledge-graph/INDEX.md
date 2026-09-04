# Knowledge Graph — Index Hub

> **Why this exists:** so anyone (or any LLM session) can orient on the whole project in seconds, without re-reading four repos.
> **Resolution rule:** if you see a file path here, read it directly. Every entry is grounded in a real repo.
> **Status note:** every module below is **spec-only** right now — each repo has a `docs/index.md` describing scope and submodules, but no kernel source yet. Function-level indexes will fill in as code lands; until then they describe *planned* structure, not existing code.
> **Integration branch:** [`main`](https://github.com/KernelKraftVITC/KraftOS/tree/main) — only M4 (`kraft-process-scheduling`) is wired in there so far, via PR. The rest join the same way.
> **Docs site:** [`pages`](https://github.com/KernelKraftVITC/KraftOS/tree/pages) — published at https://kernelkraftvitc.github.io/KraftOS/
> **Last updated:** 2026-09-04

---

## Per-Module Indexes

| Module | Owner | What It Does | MD (human) | JSON (AI) |
|---|---|---|---|---|
| **M1 — kraft-boot-bringup** | [@sanipaani](https://github.com/sanipaani) | Power-on → running 64-bit kernel: Limine boot, framebuffer/serial, GDT/TSS, IDT, PIC/APIC+timer, keyboard | [`INDEX.md`](kraft-boot-bringup/INDEX.md) | [`index.json`](kraft-boot-bringup/index.json) |
| **M2 — kraft-memory-management** | [@yashvini-chirri](https://github.com/yashvini-chirri) | Physical frame allocator, 4-level higher-half paging, kernel heap | [`INDEX.md`](kraft-memory-management/INDEX.md) | [`index.json`](kraft-memory-management/index.json) |
| **M3 — kraft-kernel-module-loader** | [@kumar-shaurya](https://github.com/kumar-shaurya) | Linux-style LKM: relocatable ELF parsing, symbol resolution, insmod/rmmod | [`INDEX.md`](kraft-kernel-module-loader/INDEX.md) | [`index.json`](kraft-kernel-module-loader/index.json) |
| **M4 — kraft-process-scheduling** | [@Krishdeep13](https://github.com/Krishdeep13) | Thread abstraction, context switch, round-robin scheduler, ring-3 transition | [`INDEX.md`](kraft-process-scheduling/INDEX.md) | [`index.json`](kraft-process-scheduling/index.json) |

Modules M5–M12 are roadmapped but not yet staffed — see the full breakdown in each module's README's "Roadmap beyond this module" section, or the [`pages` branch docs](https://kernelkraftvitc.github.io/KraftOS/) for the complete M1–M12 list.

---

## Data Flow

Boot hands off into memory management, which gates both the module loader
and the scheduler — those two proceed in parallel from there.

```
┌───────────────────────────────────────────────────────────────┐
│  M1 · Boot & Bring-up (@sanipaani)                             │
│  Limine → long mode → GDT/IDT/APIC → framebuffer/serial/kbd    │
└───────────────────────────┬─────────────────────────────────────┘
                             │
                             ▼
              ┌───────────────────────────────┐
              │  M2 · Memory Management        │
              │  (@yashvini-chirri)            │
              │  frame alloc → paging → heap   │
              └───────────┬─────────┬──────────┘
                           │         │
              ┌────────────┘         └────────────┐
              ▼                                    ▼
 ┌─────────────────────────────┐    ┌──────────────────────────────┐
 │  M3 · Kernel Module Loader   │    │  M4 · Process & Scheduling    │
 │  (@kumar-shaurya)            │    │  (@Krishdeep13)               │
 │  ELF parse → symbols →       │    │  threads → context switch →   │
 │  insmod/rmmod                │    │  scheduler → ring-3           │
 └───────────────┬───────────────┘    └───────────────┬────────────┘
                 │                                     │
                 ▼                                     ▼
     M8 · VFS Core (future)              M5 · Syscalls & Lifecycle (future)
                                          M6 · Sync & IPC (future)
```

M3 and M4 don't depend on each other — both can be developed in parallel
once M2 is done.
