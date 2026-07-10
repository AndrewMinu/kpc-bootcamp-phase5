#!/usr/bin/env bash
# (오프라인 폴백) npx 없이 설치. 기본 개인 스코프.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${1:-$HOME/.agents/skills}"; mkdir -p "$DEST"
for d in "$HERE/skills"/*/; do [ -f "$d/SKILL.md" ] || continue
  n="$(basename "$d")"; rm -rf "$DEST/$n"; cp -r "$d" "$DEST/$n"; echo "  ✓ $n"; done
echo "완료. Codex에서 /skills 확인 → \$bootcamp-start"
