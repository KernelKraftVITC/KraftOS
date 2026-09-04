# KraftOS — Project Context

This branch is the standing reference for the whole project: the roadmap,
who owns what, and how the pieces depend on each other. It isn't built or
deployed anywhere — it's read directly on GitHub. For the published docs
site, see the [`pages`](https://github.com/KernelKraftVITC/KraftOS/tree/pages)
branch. For the actual kernel build, see
[`main`](https://github.com/KernelKraftVITC/KraftOS/tree/main).

## What this is

A 64-bit x86 kernel built from scratch, in C/C++, split into modules that
different people own. Twelve modules are planned end to end; only the first
four are staffed right now.

## Tech stack

- **Language:** C, with C++ where it earns its keep (no exceptions, no RTTI)
- **Freestanding** — no libc, no hosted runtime
- **Bootloader:** [Limine](https://github.com/limine-bootloader/limine)
- **Toolchain:** cross-compiler targeting `x86_64-elf`
- **Testing:** QEMU, cross-checked against real hardware where it matters

## Team — M1 to M4

| Module | Scope | Owner | Repo |
|---|---|---|---|
| M1 | Boot & Bring-up | [@sanipaani](https://github.com/sanipaani) | [kraft-boot-bringup](https://github.com/KernelKraftVITC/kraft-boot-bringup) |
| M2 | Memory Management | [@yashvini-chirri](https://github.com/yashvini-chirri) | [kraft-memory-management](https://github.com/KernelKraftVITC/kraft-memory-management) |
| M3 | Kernel Module Loader (LKM) | [@kumar-shaurya](https://github.com/kumar-shaurya) | [kraft-kernel-module-loader](https://github.com/KernelKraftVITC/kraft-kernel-module-loader) |
| M4 | Process & Scheduling | [@Krishdeep13](https://github.com/Krishdeep13) | [kraft-process-scheduling](https://github.com/KernelKraftVITC/kraft-process-scheduling) |

## Integration status

This reflects `main` as of the last time this file was updated — expect it
to lag reality; check `main` directly for the current truth.

| Module | Wired into `main` | Notes |
|---|---|---|
| M4 | ✅ submodule added | Merged via PR — first one in, sets the pattern |
| M1 | ⬜ not yet | Pending PR from @sanipaani |
| M2 | ⬜ not yet | Pending PR from @yashvini-chirri |
| M3 | ⬜ not yet | Pending PR from @kumar-shaurya |

Every module currently has only a docs spec (`docs/index.md`) in its repo —
no kernel source yet. This graph describes the *planned* dependency
structure, not code that exists today; it's meant to stay accurate as work
lands, not to claim work that hasn't happened.

## Dependency graph

M1 is the foundation everything boots from. M2 (memory) is the hard
prerequisite for both M3 and M4 — those two can proceed **in parallel**
once M2 lands, since the module loader and the scheduler don't depend on
each other. Later modules (M5 onward, not yet assigned) build on top of
M3/M4.

```mermaid
graph TD
    M1["M1 · Boot & Bring-up<br/>@sanipaani"]
    M2["M2 · Memory Management<br/>@yashvini-chirri"]
    M3["M3 · Kernel Module Loader<br/>@kumar-shaurya"]
    M4["M4 · Process & Scheduling<br/>@Krishdeep13"]
    M5["M5 · Syscalls & Process Lifecycle"]
    M6["M6 · Synchronization & IPC"]
    M7["M7 · Block Device Driver"]
    M8["M8 · VFS Core"]
    M9["M9 · Filesystem: ext2"]
    M10["M10 · Userland & Shell"]
    M11["M11 · Graphics & Basic UI"]
    M12["M12 · Extra Modules"]

    M1 --> M2
    M2 --> M3
    M2 --> M4
    M4 --> M5
    M4 --> M6
    M1 --> M7
    M3 --> M8
    M2 --> M8
    M7 --> M9
    M8 --> M9
    M5 --> M10
    M9 --> M10
    M1 --> M11
    M10 --> M11
    M4 --> M12
    M9 --> M12

    classDef active fill:#5c6ac4,color:#fff,stroke:#3f4a9e;
    classDef future fill:#e0e0e6,color:#333,stroke:#aaa,stroke-dasharray: 4 3;
    class M1,M2,M3,M4 active
    class M5,M6,M7,M8,M9,M10,M11,M12 future
```

## Full roadmap

1. **M1 — Boot & Bring-up** — toolchain, Limine boot into long mode,
   framebuffer/serial, GDT/TSS, IDT, PIC/APIC + timer, keyboard driver
2. **M2 — Memory Management** — physical frame allocator, paging
   (4-level, higher-half), kernel heap (`kmalloc`/`kfree`)
3. **M3 — Kernel Module Loader (LKM)** — relocatable ELF (`.ko`-style)
   parsing, kernel symbol table, register/init/cleanup API,
   `insmod`/`rmmod`-style loading
4. **M4 — Process & Scheduling** — thread abstraction + context switch,
   round-robin scheduler, ring-3 user mode transition
5. **M5 — System Calls & Process Lifecycle** — syscall ABI/dispatch, core
   syscalls (`write`, `exit`, `getpid`), ELF loader, `fork`/`exec`/`wait`
6. **M6 — Synchronization & IPC** — spinlock, mutex, pipes
7. **M7 — Block Device Driver** — virtio-blk or ATA, read/write requests,
   interrupt-driven I/O completion
8. **M8 — VFS Core** — inode/file abstraction, mount + path resolution,
   file syscalls (`open`, `read`, `write`, `close`, `lseek`)
9. **M9 — Filesystem: ext2** — read support, write support, FAT (stretch)
10. **M10 — Userland & Shell** — minimal C library, shell (init process),
    coreutils (`ls`, `cat`, `echo`)
11. **M11 — Graphics & Basic UI** — framebuffer compositor, window
    manager, input routing, minimal widget toolkit
12. **M12 — Extra Modules** *(optional, for early finishers)* — SMP,
    xfs/btrfs read-only study, basic networking, demand paging / CoW fork
