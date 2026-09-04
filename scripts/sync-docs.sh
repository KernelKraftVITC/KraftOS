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

# Module order follows the roadmap (M1-M4), not alphabetical — shared by
# the nav config and the landing page below.
# ponytail: hardcoded list, add new module names here as they get staffed.
order=(kraft-boot-bringup kraft-memory-management kraft-kernel-module-loader kraft-process-scheduling)

{
  echo "nav:"
  for name in "${order[@]}"; do
    echo "  - $name"
  done
  echo "  - ..."
} > docs/sources/.pages

# Landing page for the "Modules" tab itself — without this, navigation.indexes
# has nothing to link the section header to, and the tab 404s.
{
  echo "---"
  echo "author: parrothacker1"
  echo "updated: $(date -u +%F)"
  echo "---"
  echo
  echo "# Modules"
  echo
  echo "One repo per module, pulled in as a submodule."
  echo
  for name in "${order[@]}"; do
    [ -d "docs/sources/$name" ] || continue
    title="$(grep -m1 '^# ' "docs/sources/$name/index.md" 2>/dev/null | sed 's/^# //')"
    echo "- [${title:-$name}]($name/index.md)"
  done
  for dir in docs/sources/*/; do
    name="$(basename "$dir")"
    if ! printf '%s\n' "${order[@]}" | grep -qx "$name"; then
      title="$(grep -m1 '^# ' "$dir/index.md" 2>/dev/null | sed 's/^# //')"
      echo "- [${title:-$name}]($name/index.md)"
    fi
  done
} > docs/sources/index.md
