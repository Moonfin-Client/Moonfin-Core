#!/usr/bin/env bash
# Puts the fallback fonts the web engine can ask for into <web build>/fonts, so
# browsers load them from wherever the app is hosted instead of Google Fonts.
# Run it after flutter build web. The list comes from the built main.dart.js, so
# it always matches the Flutter version that made the build.
set -euo pipefail

WEB_DIR="${1:-build/web}"

paths="$(grep -oE '"[a-z0-9]+/v[0-9]+/[A-Za-z0-9_-]+(\.[0-9]+)?\.woff2"' "$WEB_DIR/main.dart.js" | tr -d '"' | sort -u)" || true
if [ -z "$paths" ]; then
  echo "No fallback font list in $WEB_DIR/main.dart.js" >&2
  exit 1
fi

# Flutter leaves this folder alone between builds, so clear out fonts an older
# Flutter asked for.
rm -rf "$WEB_DIR/fonts"
printf '%s\n' "$paths" | xargs -P 8 -I{} \
  curl -fsS --retry 3 --create-dirs -o "$WEB_DIR/fonts/{}" "https://fonts.gstatic.com/s/{}"

echo "Fetched $(printf '%s\n' "$paths" | wc -l | tr -d ' ') fallback fonts into $WEB_DIR/fonts"
