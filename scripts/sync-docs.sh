#!/usr/bin/env bash
# Symlinks each submodule's docs/ into docs/sources/<name> so mkdocs sees one tree.
# ponytail: relinks everything on every run instead of diffing, cheap enough at submodule-count scale.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

rm -rf docs/sources
mkdir -p docs/sources

[ -f .gitmodules ] || exit 0

(git config --file .gitmodules --get-regexp path 2>/dev/null || true) | while read -r _ path; do
  if [ -d "$path/docs" ]; then
    name="$(basename "$path")"
    ln -sfn "../../$path/docs" "docs/sources/$name"
    echo "linked $path/docs -> docs/sources/$name"
  fi
done

# Module nav order follows the roadmap (M1-M4), not alphabetical.
# ponytail: hardcoded list, add new module names here as they get staffed.
cat > docs/sources/.pages <<'EOF'
nav:
  - kraft-boot-bringup
  - kraft-memory-management
  - kraft-kernel-module-loader
  - kraft-process-scheduling
  - ...
EOF
