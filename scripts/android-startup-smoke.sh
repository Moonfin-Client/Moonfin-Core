#!/usr/bin/env bash
# Run only against a disposable emulator, without server credentials.
set -euo pipefail
package=art.tiedemann.moonfin
mkdir -p qa-evidence
apk="$(find apk -maxdepth 1 -name '*.apk' -print -quit)"
test -s "$apk"
adb wait-for-device
adb install -r "$apk"
adb shell pm grant "$package" android.permission.POST_NOTIFICATIONS || true
component="$(adb shell cmd package resolve-activity --brief "$package" | tr -d '\r' | tail -n1)"
case "$component" in */*) ;; *) echo 'Launcher activity missing' >&2; exit 1 ;; esac
adb logcat -c
adb shell am start -W -n "$component"
sleep 15
pid="$(adb shell pidof -s "$package" | tr -d '\r')"
test -n "$pid"
adb shell dumpsys activity activities > qa-evidence/activity.txt
adb logcat -b crash -d > qa-evidence/crash.txt
adb logcat -b main -b system -d > qa-evidence/runtime.txt
adb exec-out screencap -p > qa-evidence/android-startup.png
adb shell uiautomator dump /sdcard/moonfin-books-ui.xml >/dev/null || true
adb pull /sdcard/moonfin-books-ui.xml qa-evidence/ui.xml || true
if grep -Eq 'FATAL EXCEPTION|Fatal signal' qa-evidence/crash.txt ||
   grep -Fq "ANR in $package" qa-evidence/runtime.txt; then
  echo 'Android startup crashed or stopped responding' >&2
  exit 1
fi
printf 'Package: %s\nScope: first launch only, no server login or Books request tested\n' "$package" > qa-evidence/README.txt
