# Bundled libretro cores (iOS)

This directory holds the interpreter-only libretro cores embedded in the iOS
app. The binaries are not committed. Populate it before a build:

- `../fetch_cores.sh` downloads prebuilt `ios-arm64` cores from the libretro
  buildbot and wraps them into flat frameworks. Use for development.
- `../build_cores.sh` builds each core from a pinned commit for the App Store,
  interpreter-only, and fails if any core would ship a JIT.

Both leave `*.framework` bundles here, which `moonfin_game_host.podspec`
embeds. The set matches `appleBundledCores` in `lib/util/game_cores.dart`:
fceumm, snes9x, gambatte, mgba, genesis_plus_gx, pcsx_rearmed.
