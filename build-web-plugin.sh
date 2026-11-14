#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$REPO_ROOT/../Plugin"
DEFAULT_JELLYFIN_TARGET="$PLUGIN_ROOT/Jellyfin/frontend"
DEFAULT_EMBY_TARGET="$PLUGIN_ROOT/Emby/web"

print_help() {
  cat <<'EOF'
Usage:
  ./build-web-plugin.sh [TARGET_DIR ...]

With no arguments this builds once and syncs into both plugin frontends:
  ../Plugin/Jellyfin/frontend
  ../Plugin/Emby/web

Pass one or more target directories to override that.

Environment:
  FLUTTER_BIN                    Optional absolute path to flutter executable
  MOONFIN_PLUGIN_FRONTEND_DIR    Overrides the Jellyfin target
  MOONFIN_EMBY_WEB_DIR           Overrides the Emby target

Notes:
  - Builds Flutter web once with base-href /Moonfin/Web/, then syncs to each target
  - Both plugins serve the app at /Moonfin/Web/, so one build works for both
  - config.json is excluded because the plugins serve /Moonfin/Web/config.json dynamically
  - theme/ is protected from the build/web delete-sync and synced from web/theme
EOF
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  print_help
  exit 0
fi

TARGETS=()
if [ "$#" -gt 0 ]; then
  TARGETS=("$@")
else
  for candidate in \
    "${MOONFIN_PLUGIN_FRONTEND_DIR:-$DEFAULT_JELLYFIN_TARGET}" \
    "${MOONFIN_EMBY_WEB_DIR:-$DEFAULT_EMBY_TARGET}"; do
    if [ -d "$candidate" ] || [ -d "$(dirname "$candidate")" ]; then
      TARGETS+=("$candidate")
    fi
  done

  if [ "${#TARGETS[@]}" -eq 0 ]; then
    echo "Error: no target found. The Plugin repo is not a sibling checkout." >&2
    echo "Provide targets as: ./build-web-plugin.sh /path/to/Plugin/Jellyfin/frontend /path/to/Plugin/Emby/web" >&2
    echo "Or set MOONFIN_PLUGIN_FRONTEND_DIR and MOONFIN_EMBY_WEB_DIR." >&2
    exit 1
  fi
fi

resolve_flutter() {
  if [ -n "${FLUTTER_BIN:-}" ] && [ -x "$FLUTTER_BIN" ]; then
    printf '%s\n' "$FLUTTER_BIN"
    return 0
  fi

  if command -v flutter >/dev/null 2>&1; then
    command -v flutter
    return 0
  fi

  local candidates=(
    "$HOME/flutter/bin/flutter"
    "$HOME/Documents/flutter/bin/flutter"
    "$HOME/snap/flutter/common/flutter/bin/flutter"
  )

  local candidate
  for candidate in "${candidates[@]}"; do
    if [ -x "$candidate" ]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  echo "Error: Flutter not found. Add flutter to PATH or set FLUTTER_BIN to the full flutter executable path." >&2
  exit 1
}

sync_target() {
  local target="$1"
  mkdir -p "$target"
  rsync -a --delete --exclude config.json --exclude theme/ "$REPO_ROOT/build/web/" "$target/"

  # Theme Editor assets live outside Flutter's build/web output so the delete-sync
  # above cant wipe them from the target.
  if [ -d "$REPO_ROOT/web/theme" ]; then
    rsync -a --delete "$REPO_ROOT/web/theme/" "$target/theme/"
  else
    echo "Warning: web/theme not found. Existing theme assets in $target were preserved."
  fi

  echo "Synced build/web -> $target"
}

FLUTTER="$(resolve_flutter)"

echo "Building Flutter web bundle for Moonfin plugin mode..."
"$FLUTTER" build web --wasm --release --no-web-resources-cdn --base-href "/Moonfin/Web/"
bash "$REPO_ROOT/scripts/fetch-web-fonts.sh" "$REPO_ROOT/build/web"

for target in "${TARGETS[@]}"; do
  sync_target "$target"
done
