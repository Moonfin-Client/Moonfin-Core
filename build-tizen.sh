#!/usr/bin/env bash
set -euo pipefail

# Builds the Moonfin Tizen (Samsung TV) app as a signed .tpk using the
# flutter-tizen wrapper (https://github.com/flutter-tizen/flutter-tizen).
#
# Prerequisites (see README "Tizen (Samsung TV)" section for details):
#   * flutter-tizen on PATH, or FLUTTER_TIZEN_BIN pointing at the executable.
#   * Tizen Studio + the TV extension installed (provides the SDK that compiles
#     and signs the .tpk). Set TIZEN_SDK if installed to a non-default location.
#   * A Tizen certificate/security profile to sign the package. Pass its name
#     via MOONFIN_TIZEN_SECURITY_PROFILE (or the --security-profile flag); the
#     active profile is used if unset.
#
# Usage:
#   ./build-tizen.sh                      # release .tpk for a real TV (Tizen 6.0 target)
#   MOONFIN_TIZEN_SECURITY_PROFILE=moonfin ./build-tizen.sh
#   ./build-tizen.sh --debug              # debug build
#   ./build-tizen.sh --target emulator    # x64 emulator build (Tizen 8.0 target)

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_NAME="Moonfin"
APP_ID="org.moonfin.tizen"
DEVICE_PROFILE="tv"
BUILD_MODE="release"
SECURITY_PROFILE="${MOONFIN_TIZEN_SECURITY_PROFILE:-}"
OUTPUT_DIR="$REPO_ROOT/build/tizen/tpk"
TIZEN_TARGET="${MOONFIN_TIZEN_TARGET:-tv}"
TIZEN_API_VERSION="${MOONFIN_TIZEN_API_VERSION:-}"
TIZEN_TARGET_FRAMEWORK="${MOONFIN_TIZEN_TARGET_FRAMEWORK:-}"
MANIFEST_PATH="$REPO_ROOT/tizen/tizen-manifest.xml"
CSPROJ_PATH="$REPO_ROOT/tizen/Runner.csproj"

get_app_version() {
  local version_line version
  version_line="$(grep -E '^version:' "$REPO_ROOT/pubspec.yaml" | head -n 1 || true)"
  version="${version_line#version:}"
  version="${version%%+*}"
  version="$(echo "$version" | xargs)"

  if [ -z "$version" ]; then
    echo "unknown"
  else
    echo "$version"
  fi
}

framework_from_api_version() {
  local api_version="$1"
  printf 'tizen%s\n' "${api_version//./}"
}

api_version_from_framework() {
  local framework="$1"
  local digits prefix last
  digits="${framework#tizen}"
  prefix="${digits%?}"
  last="${digits: -1}"
  printf '%s.%s\n' "$prefix" "$last"
}

apply_tizen_target() {
  sed -i -E \
    "s#<TargetFramework>[^<]+</TargetFramework>#<TargetFramework>$TIZEN_TARGET_FRAMEWORK</TargetFramework>#" \
    "$CSPROJ_PATH"
  sed -i -E \
    "s#api-version=\"[^\"]+\"#api-version=\"$TIZEN_API_VERSION\"#" \
    "$MANIFEST_PATH"
}

restore_tizen_target() {
  if [ -n "${MANIFEST_BACKUP:-}" ] && [ -f "$MANIFEST_BACKUP" ]; then
    cp "$MANIFEST_BACKUP" "$MANIFEST_PATH"
    rm -f "$MANIFEST_BACKUP"
  fi
  if [ -n "${CSPROJ_BACKUP:-}" ] && [ -f "$CSPROJ_BACKUP" ]; then
    cp "$CSPROJ_BACKUP" "$CSPROJ_PATH"
    rm -f "$CSPROJ_BACKUP"
  fi
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --debug)
      BUILD_MODE="debug"
      ;;
    --release)
      BUILD_MODE="release"
      ;;
    --security-profile)
      shift
      SECURITY_PROFILE="${1:-}"
      ;;
    --device-profile)
      shift
      DEVICE_PROFILE="${1:-tv}"
      ;;
    --target)
      shift
      TIZEN_TARGET="${1:-tv}"
      ;;
    --tizen-api-version)
      shift
      TIZEN_API_VERSION="${1:-}"
      ;;
    --tizen-target-framework)
      shift
      TIZEN_TARGET_FRAMEWORK="${1:-}"
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
  shift
done

case "$TIZEN_TARGET" in
  tv)
    # tizen80 is required for proper Dart AOT compilation; lower targets fall
    # back to JIT (kernel_blob.bin) which triples the package size. Real TV
    # hardware can run Tizen-8-targeted packages even on older Tizen 6/7 firmware
    # because the flutter-tizen engine handles the platform ABI, not the OS APIs.
    : "${TIZEN_API_VERSION:=8.0}"
    : "${TIZEN_TARGET_FRAMEWORK:=$(framework_from_api_version "$TIZEN_API_VERSION")}"
    ;;
  emulator)
    : "${TIZEN_API_VERSION:=8.0}"
    : "${TIZEN_TARGET_FRAMEWORK:=$(framework_from_api_version "$TIZEN_API_VERSION")}"
    ;;
  *)
    echo "Error: unsupported Tizen target '$TIZEN_TARGET'. Use 'tv' or 'emulator'." >&2
    exit 1
    ;;
esac

if [ -z "$TIZEN_API_VERSION" ] && [ -n "$TIZEN_TARGET_FRAMEWORK" ]; then
  TIZEN_API_VERSION="$(api_version_from_framework "$TIZEN_TARGET_FRAMEWORK")"
fi
if [ -z "$TIZEN_TARGET_FRAMEWORK" ] && [ -n "$TIZEN_API_VERSION" ]; then
  TIZEN_TARGET_FRAMEWORK="$(framework_from_api_version "$TIZEN_API_VERSION")"
fi

MANIFEST_BACKUP="$(mktemp)"
CSPROJ_BACKUP="$(mktemp)"
cp "$MANIFEST_PATH" "$MANIFEST_BACKUP"
cp "$CSPROJ_PATH" "$CSPROJ_BACKUP"
trap restore_tizen_target EXIT

apply_tizen_target

resolve_flutter_tizen() {
  if [ -n "${FLUTTER_TIZEN_BIN:-}" ] && [ -x "$FLUTTER_TIZEN_BIN" ]; then
    printf '%s\n' "$FLUTTER_TIZEN_BIN"
    return 0
  fi

  if command -v flutter-tizen >/dev/null 2>&1; then
    command -v flutter-tizen
    return 0
  fi

  local candidates=(
    "$HOME/flutter-tizen/bin/flutter-tizen"
    "$HOME/Documents/flutter-tizen/bin/flutter-tizen"
  )

  local candidate
  for candidate in "${candidates[@]}"; do
    if [ -x "$candidate" ]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  echo "Error: flutter-tizen not found. Clone https://github.com/flutter-tizen/flutter-tizen," >&2
  echo "       add its bin/ to PATH, or set FLUTTER_TIZEN_BIN to the executable path." >&2
  exit 1
}

FLUTTER_TIZEN="$(resolve_flutter_tizen)"
echo "==> Using flutter-tizen: $FLUTTER_TIZEN"
echo "==> Tizen target: $TIZEN_TARGET (api=$TIZEN_API_VERSION, framework=$TIZEN_TARGET_FRAMEWORK)"

cd "$REPO_ROOT"

echo "==> Resolving dependencies (flutter-tizen pub get)"
"$FLUTTER_TIZEN" pub get

build_args=(
  build tpk
  "--$BUILD_MODE"
  --device-profile "$DEVICE_PROFILE"
  --dart-define=MOONFIN_TIZEN=true
  -t lib/main.dart
)

if [ -n "$SECURITY_PROFILE" ]; then
  build_args+=(--security-profile "$SECURITY_PROFILE")
  echo "==> Signing with security profile: $SECURITY_PROFILE"
else
  echo "==> Signing with the active Tizen security profile (none specified)"
fi

echo "==> Building $APP_NAME ($APP_ID) .tpk [$BUILD_MODE, profile=$DEVICE_PROFILE]"
"$FLUTTER_TIZEN" "${build_args[@]}"

mkdir -p "$OUTPUT_DIR"
TPK_SOURCE_DIR="$REPO_ROOT/build/tizen/tpk"
shopt -s nullglob
tpks=("$TPK_SOURCE_DIR"/*.tpk)
if [ "${#tpks[@]}" -eq 0 ]; then
  echo "Warning: no .tpk found under $TPK_SOURCE_DIR; check the build output above." >&2
else
  echo "==> Built .tpk artifact(s):"
  for tpk in "${tpks[@]}"; do
    echo "    $tpk"
  done

  # Copy the newest built package to the repository root with a stable,
  # versioned filename for easy release handling.
  latest_tpk="$(ls -1t "$TPK_SOURCE_DIR"/*.tpk | head -n 1)"
  app_version="$(get_app_version)"
  root_artifact="$REPO_ROOT/${APP_NAME}_Tizen_v${app_version}.tpk"
  cp -f "$latest_tpk" "$root_artifact"
  echo "==> Copied root artifact: $root_artifact"
fi

echo "==> Done. Install on a TV/emulator with:"
echo "    $FLUTTER_TIZEN install   # to a connected device/emulator"
echo "    or: tizen install -n <file>.tpk -t <target>"
