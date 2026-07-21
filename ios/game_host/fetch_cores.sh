#!/usr/bin/env bash
# Downloads prebuilt iOS libretro core dylibs from the libretro buildbot into
# ios/game_host/cores/staging/. For development only: a shipping build must
# compile the cores from pinned sources with dynarec disabled (build_cores.sh).
# wrap_frameworks.sh runs the no-JIT gate on whatever lands here either way.
#
# Usage: fetch_cores.sh [core ...]   (default: the bundled core set)

set -euo pipefail

CORES=("$@")
if [ ${#CORES[@]} -eq 0 ]; then
  CORES=(fceumm snes9x gambatte mgba genesis_plus_gx pcsx_rearmed)
fi

BUILDBOT="https://buildbot.libretro.com/nightly/apple/ios-arm64/latest"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAGING="$SCRIPT_DIR/cores/staging"
mkdir -p "$STAGING"

for core in "${CORES[@]}"; do
  zip="${core}_libretro_ios.dylib.zip"
  echo "==> $core"
  curl -fL --retry 3 -o "$STAGING/$zip" "$BUILDBOT/$zip"
  unzip -o -q "$STAGING/$zip" -d "$STAGING"
  rm -f "$STAGING/$zip"
  dylib="$STAGING/${core}_libretro_ios.dylib"
  [ -f "$dylib" ] || { echo "error: $dylib missing after unzip" >&2; exit 1; }
  lipo -info "$dylib" | grep -q arm64 || { echo "error: $core is not arm64" >&2; exit 1; }
done

echo "done: $(ls "$STAGING" | wc -l | tr -d ' ') dylibs in $STAGING"
echo "next: wrap_frameworks.sh"
