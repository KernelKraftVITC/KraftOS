# Knowledge Graph

Consolidated project context — team assignments, module scope, dependency structure, and per-module indexes.

**Quick-start:** [`INDEX.md`](INDEX.md) — index hub with per-module status (owner, repo, spec vs. actual source) and the dependency graph.

**Source of truth for module scope/submodules:** each module's own `docs/index.md` in its repo (linked from that module's `README.md` below) — this knowledge graph summarizes and cross-references it, it doesn't replace it.

Last reviewed: 2026-09-04

## Structure

```
knowledge-graph/
├── README.md                          # this file
├── INDEX.md                           # Index hub — per-module status, dependency graph
├── kraft-boot-bringup/                # M1 — @sanipaani
│   ├── README.md                      #   Module context — scope, submodules, owner
│   ├── INDEX.md                       #   Function-level index (spec-only until source lands)
│   └── index.json                     #   Structured index for AI consumption
├── kraft-memory-management/           # M2 — @yashvini-chirri
│   ├── README.md
│   ├── INDEX.md
│   └── index.json
├── kraft-kernel-module-loader/        # M3 — @kumar-shaurya
│   ├── README.md
│   ├── INDEX.md
│   └── index.json
└── kraft-process-scheduling/          # M4 — @Krishdeep13
    ├── README.md
    ├── INDEX.md
    └── index.json
```

## Index

| Module | What |
|---|---|
| [`kraft-boot-bringup/README.md`](kraft-boot-bringup/README.md) | M1 context — boot/bring-up scope, submodules, owner |
| [`kraft-memory-management/README.md`](kraft-memory-management/README.md) | M2 context — physical/virtual memory scope, submodules, owner |
| [`kraft-kernel-module-loader/README.md`](kraft-kernel-module-loader/README.md) | M3 context — LKM scope, submodules, owner |
| [`kraft-process-scheduling/README.md`](kraft-process-scheduling/README.md) | M4 context — scheduling scope, submodules, owner |

No `.stale/` yet — nothing here has been superseded.
