#!/usr/bin/env bash
# Checks that the helpers moved into home_row_card_image.dart return exactly
# what the old private helpers in home_screen.dart returned.
#
# Usage, from the repo root after `flutter pub get`:
#   tool/parity_2197/run.sh [old-commit]
# old-commit defaults to 8dfd2e8d2, the upstream main this PR branched from.
set -euo pipefail

BASE=${1:-8dfd2e8d2}
DIR=tool/parity_2197
HOME_SCREEN=lib/ui/screens/home/home_screen.dart
OUT=$(mktemp -d)

if ! git diff --quiet -- "$HOME_SCREEN"; then
  echo "$HOME_SCREEN has local changes, commit or stash them first" >&2
  exit 1
fi
restore() {
  git checkout -- "$HOME_SCREEN"
  rm -f "$DIR/facade.dart"
}
trap restore EXIT

echo "== New helpers (this branch)"
cp "$DIR/facade_new.dart.txt" "$DIR/facade.dart"
PARITY_OUT="$OUT/new.json" flutter test "$DIR/harness_test.dart"

echo "== Old helpers ($BASE), with test hooks added to HomeScreen"
git show "$BASE:$HOME_SCREEN" |
  awk -v hooks="$DIR/old_hooks.dart.txt" '
    { print }
    /^  const HomeScreen\(\{super\.key\}\);$/ {
      print ""
      while ((getline line < hooks) > 0) print line
    }' > "$HOME_SCREEN"
grep -q 'parityRowUrl' "$HOME_SCREEN" || { echo "could not add the hooks" >&2; exit 1; }
cp "$DIR/facade_old.dart.txt" "$DIR/facade.dart"
PARITY_OUT="$OUT/old.json" flutter test "$DIR/harness_test.dart"

echo "== Comparing"
dart run "$DIR/compare.dart" "$OUT/old.json" "$OUT/new.json"
