#!/usr/bin/env bash
# 이 단계 스킬을 Codex에 설치(개인 스코프=어디서든). 인자로 경로 주면 그 위치.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${1:-$HOME/.agents/skills}"; mkdir -p "$DEST"
for d in "$HERE/skills"/*/; do [ -f "$d/SKILL.md" ] || continue
  n="$(basename "$d")"; rm -rf "$DEST/$n"; cp -r "$d" "$DEST/$n"; echo "  ✓ $n"; done
[ -d "$HERE/data" ] && { mkdir -p "$DEST/bootcamp-shared"; cp -r "$HERE/data/." "$DEST/bootcamp-shared/"; echo "  ✓ bootcamp-shared"; }
echo "완료. Codex에서 /skills 확인 → \$bootcamp-guide"
