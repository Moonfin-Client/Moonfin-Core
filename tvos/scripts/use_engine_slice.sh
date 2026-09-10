#!/usr/bin/env bash
set -euo pipefail

# Swaps tvos/Flutter/Flutter.framework for one of the slices the flutter-tvos
# toolchain ships. The framework is gitignored and precache leaves the simulator
# slice in place, so a device build has to be pointed at the right one first.
#
#   ./tvos/scripts/use_engine_slice.sh release   # device, AOT
#   ./tvos/scripts/use_engine_slice.sh debug     # device, JIT, hot reload
#   ./tvos/scripts/use_engine_slice.sh profile   # device, AOT with profiling
#   ./tvos/scripts/use_engine_slice.sh sim       # simulator, arm64 hosts only

SLICE="${1:-}"
case "$SLICE" in
  debug)   ARTIFACT=tvos_debug_arm64 ;;
  profile) ARTIFACT=tvos_profile_arm64 ;;
  release) ARTIFACT=tvos_release_arm64 ;;
  sim)     ARTIFACT=tvos_debug_sim_arm64 ;;
  *) echo "usage: $(basename "$0") {debug|profile|release|sim}" >&2; exit 1 ;;
esac

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
FLUTTER_TVOS="${FLUTTER_TVOS_ROOT:-$HOME/flutter-tvos}"
SOURCE="$FLUTTER_TVOS/engine_artifacts/$ARTIFACT/Flutter.framework"
DEST="$REPO_ROOT/tvos/Flutter/Flutter.framework"

if [ ! -d "$SOURCE" ]; then
  echo "error: $SOURCE not found. Run flutter-tvos precache --force first." >&2
  exit 1
fi

rm -rf "$DEST.staging"
cp -R "$SOURCE" "$DEST.staging"
rm -rf "$DEST"
mv "$DEST.staging" "$DEST"

PLATFORM="$(vtool -show-build "$DEST/Flutter" 2>/dev/null | awk '/platform/{print $2; exit}')"
MINOS="$(vtool -show-build "$DEST/Flutter" 2>/dev/null | awk '/minos/{print $2; exit}')"
echo "engine slice: $ARTIFACT ($PLATFORM, minos $MINOS)"
