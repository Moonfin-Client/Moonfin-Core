#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_NAME="Moonfin"
APK_SOURCE="$REPO_ROOT/build/app/outputs/flutter-apk/app-mobile-release.apk"
BUNDLE_SOURCE="$REPO_ROOT/build/app/outputs/bundle/mobileRelease/app-mobile-release.aab"
PAGE_SIZE_CHECKER="$REPO_ROOT/scripts/check-android-16kb-pages.sh"

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

FLUTTER="$(resolve_flutter)"

# On CI, the Gradle and Kotlin daemons left over from the APK build still hold
# their memory when the App Bundle build starts its own Dart AOT compiles, and
# together they run the 16 GB runner out of memory. Locally the warm daemons
# just make the second build faster, so they're only stopped on CI.
stop_gradle_daemons_on_ci() {
  [ -n "${CI:-}" ] || return 0
  echo "Stopping Gradle and Kotlin daemons before the App Bundle build..."
  (cd "$REPO_ROOT/android" && ./gradlew --stop) || true
  pkill -f KotlinCompileDaemon || true
}

VERSION_LINE=$(grep '^version:' "$REPO_ROOT/pubspec.yaml" | sed 's/version:[[:space:]]*//' | tr -d '[:space:]')
APP_VERSION=$(printf '%s' "$VERSION_LINE" | cut -d'+' -f1)
APP_BUILD_NUMBER=$(printf '%s' "$VERSION_LINE" | cut -d'+' -f2)
if [ -z "$APP_VERSION" ] || [ -z "$APP_BUILD_NUMBER" ]; then
  echo "Error: could not read semantic version and build number from pubspec.yaml (expected x.y.z+build)" >&2
  exit 1
fi

APK_OUTPUT="$REPO_ROOT/${APP_NAME}_Android_v${APP_VERSION}.apk"
BUNDLE_OUTPUT="$REPO_ROOT/${APP_NAME}_Android_v${APP_VERSION}.aab"

echo "${APP_NAME} version: ${APP_VERSION} (${APP_BUILD_NUMBER})"

cd "$REPO_ROOT"

echo "Cleaning previous Flutter outputs..."
"$FLUTTER" clean

echo "Resolving packages..."
"$FLUTTER" pub get

echo "Building Android release APK for phones, tablets and TVs (arm64-v8a, armeabi-v7a, x86_64)..."
"$FLUTTER" build apk --release \
  --flavor mobile \
  --build-name "$APP_VERSION" \
  --build-number "$APP_BUILD_NUMBER" \
  --dart-define=DISTRIBUTION_CHANNEL=apk

if [ ! -f "$APK_SOURCE" ]; then
  echo "Error: APK not found at $APK_SOURCE" >&2
  exit 1
fi

cp "$APK_SOURCE" "$APK_OUTPUT"

if [ -x "$PAGE_SIZE_CHECKER" ]; then
  echo "Running 16 KB page-size compatibility check on APK (informational only)..."
  "$PAGE_SIZE_CHECKER" "$APK_SOURCE" || echo "Warning: APK 16 KB page-size check failed (not blocking)" >&2
fi

echo "APK created: $APK_SOURCE"
echo "APK copied to root: $APK_OUTPUT"

stop_gradle_daemons_on_ci
echo "Building Android App Bundle..."
if ! "$FLUTTER" build appbundle --release \
  --flavor mobile \
  --build-name "$APP_VERSION" \
  --build-number "$APP_BUILD_NUMBER" \
  --dart-define=DISTRIBUTION_CHANNEL=aab; then
  echo "Flutter appbundle build failed. Retrying with Gradle bundleRelease fallback..."
  (
    cd "$REPO_ROOT/android"
    ./gradlew bundleMobileRelease
  )
fi

if [ ! -f "$BUNDLE_SOURCE" ]; then
  echo "Error: App Bundle not found at $BUNDLE_SOURCE" >&2
  exit 1
fi

cp "$BUNDLE_SOURCE" "$BUNDLE_OUTPUT"

if [ -x "$PAGE_SIZE_CHECKER" ]; then
  echo "Running 16 KB page-size compatibility check on App Bundle..."
  "$PAGE_SIZE_CHECKER" "$BUNDLE_SOURCE"
fi

echo "App Bundle created: $BUNDLE_SOURCE"
echo "App Bundle copied to root: $BUNDLE_OUTPUT"
