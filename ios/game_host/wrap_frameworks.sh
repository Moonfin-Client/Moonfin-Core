#!/usr/bin/env bash
# Wraps each staged core dylib (from fetch_cores.sh or build_cores.sh) into a
# flat iOS framework bundle under ios/game_host/cores/, which
# moonfin_game_host.podspec embeds (code-sign-on-copy) and the app dlopen's.
#
# Also runs the no-JIT backstop: skips any core that links the iOS JIT toggle
# or maps executable pages, and exits non-zero so the failure is not silent.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CORES_DIR="$SCRIPT_DIR/cores"
STAGING="$CORES_DIR/staging"
MIN_OS="15.0"

[ -d "$STAGING" ] || { echo "error: $STAGING not found; run fetch_cores.sh or build_cores.sh first" >&2; exit 1; }

shopt -s nullglob
dylibs=("$STAGING"/*_libretro*.dylib)
[ ${#dylibs[@]} -gt 0 ] || { echo "error: no dylibs in $STAGING" >&2; exit 1; }

failed=()
for dylib in "${dylibs[@]}"; do
  base="$(basename "$dylib" .dylib)"
  name="${base%_ios}"                        # fceumm_libretro_ios -> fceumm_libretro
  fw="$CORES_DIR/$name.framework"
  echo "==> $name"

  # No-JIT backstop. A real recompiler on Apple silicon has to toggle W^X through
  # pthread_jit_write_protect_np or map executable pages with MAP_JIT, so those are
  # the reliable tells. (Dynarec symbol names are not: an interpreter build compiled
  # with -DDRC_DISABLE still keeps them as no-op stubs.) The build recipe in
  # build_cores.sh is the real guarantee, and this only catches an obviously wrong dylib.
  if nm -u "$dylib" 2>/dev/null | grep -q 'pthread_jit_write_protect_np'; then
    echo "SKIP: $name links the iOS JIT toggle - rebuild interpreter only" >&2
    failed+=("$name")
    continue
  fi
  if strings "$dylib" | grep -q 'MAP_JIT'; then
    echo "SKIP: $name references MAP_JIT" >&2
    failed+=("$name")
    continue
  fi

  rm -rf "$fw"
  mkdir -p "$fw"
  cp "$dylib" "$fw/$name"
  install_name_tool -id "@rpath/$name.framework/$name" "$fw/$name"

  # CFBundleIdentifier forbids underscores.
  bundle_id="org.moonfin.core.$(echo "${name%_libretro}" | tr '_' '-')"

  cat > "$fw/Info.plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key><string>en</string>
	<key>CFBundleExecutable</key><string>$name</string>
	<key>CFBundleIdentifier</key><string>$bundle_id</string>
	<key>CFBundleInfoDictionaryVersion</key><string>6.0</string>
	<key>CFBundleName</key><string>$name</string>
	<key>CFBundlePackageType</key><string>FMWK</string>
	<key>CFBundleShortVersionString</key><string>1.0</string>
	<key>CFBundleVersion</key><string>1</string>
	<key>CFBundleSupportedPlatforms</key><array><string>iPhoneOS</string></array>
	<key>MinimumOSVersion</key><string>$MIN_OS</string>
</dict>
</plist>
PLIST
done

echo "done: frameworks in $CORES_DIR"
echo "next: cd ios && pod install"
if [ ${#failed[@]} -gt 0 ]; then
  echo "NOT wrapped (failed the no-JIT gate): ${failed[*]}" >&2
  exit 1
fi
