#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_NAME="Moonfin"
APP_ID="org.moonfin.linux"
APP_ICON="$REPO_ROOT/assets/icons/moonfin.png"
BUILD_DIR="$REPO_ROOT/build/linux/release/bundle"
TEMP_DIR="$REPO_ROOT/build/linux/temp"

get_deb_architecture() {
  local machine
  machine="$(uname -m)"

  case "$machine" in
    x86_64)
      printf '%s\n' "amd64"
      ;;
    aarch64|arm64)
      printf '%s\n' "arm64"
      ;;
    armv7l|armv7*)
      printf '%s\n' "armhf"
      ;;
    i386|i486|i586|i686)
      printf '%s\n' "i386"
      ;;
    *)
      printf '%s\n' "$machine"
      ;;
  esac
}

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

get_app_version() {
  grep '^version:' "$REPO_ROOT/pubspec.yaml" | sed 's/version:[[:space:]]*//' | cut -d'+' -f1 | tr -d '[:space:]'
}

resolve_mpv_package_name() {
  # Package naming differs across Ubuntu bases. Prefer newer naming when available.
  if command -v apt-cache >/dev/null 2>&1; then
    if apt-cache show libmpv2 >/dev/null 2>&1; then
      printf '%s\n' "libmpv2"
      return 0
    fi
    if apt-cache show libmpv1 >/dev/null 2>&1; then
      printf '%s\n' "libmpv1"
      return 0
    fi
  fi

  # Conservative fallback for older Ubuntu/core22 environments.
  printf '%s\n' "libmpv1"
}

resolve_build_dir() {
  local candidates=(
    "$REPO_ROOT/build/linux/x64/release/bundle"
    "$REPO_ROOT/build/linux/arm64/release/bundle"
    "$REPO_ROOT/build/linux/release/bundle"
  )

  local candidate
  for candidate in "${candidates[@]}"; do
    if [ -d "$candidate" ] && [ -f "$candidate/moonfin" ]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  echo "Error: Linux bundle directory not found after Flutter build." >&2
  echo "Checked:" >&2
  for candidate in "${candidates[@]}"; do
    echo "  - $candidate" >&2
  done
  exit 1
}

resolve_shared_lib() {
  local soname="$1"

  # Prefer distro packages to avoid /usr/local builds that dpkg-query cannot map.
  if command -v dpkg-query >/dev/null 2>&1; then
    local pkg_candidates=()
    case "$soname" in
      # Prefer libmpv2 where available; keep libmpv1 as distro compatibility fallback.
      libmpv.so.2) pkg_candidates=("libmpv2" "libmpv1") ;;
      libmpv.so.1) pkg_candidates=("libmpv1" "libmpv2") ;;
      libmpv.so) pkg_candidates=("libmpv-dev" "libmpv2" "libmpv1") ;;
      libsecret-1.so.0) pkg_candidates=("libsecret-1-0") ;;
      libsqlite3.so.0) pkg_candidates=("libsqlite3-0") ;;
      libwebkit2gtk-4.1.so.0) pkg_candidates=("libwebkit2gtk-4.1-0") ;;
      libwebkit2gtk-4.0.so.37) pkg_candidates=("libwebkit2gtk-4.0-37") ;;
    esac

    local dpkg_pkg
    for dpkg_pkg in "${pkg_candidates[@]:-}"; do
      local pkg_path
      pkg_path="$(dpkg-query -L "$dpkg_pkg" 2>/dev/null | awk -v s="$soname" 'index($0, "/" s) {print; exit}')"
      if [ -n "$pkg_path" ] && [ -f "$pkg_path" ]; then
        printf '%s\n' "$pkg_path"
        return 0
      fi
    done
  fi

  if command -v ldconfig >/dev/null 2>&1; then
    local resolved
    while IFS= read -r resolved; do
      [ -z "$resolved" ] && continue
      [ ! -f "$resolved" ] && continue
      case "$resolved" in
        /usr/local/*)
          continue
          ;;
      esac
      printf '%s\n' "$resolved"
      return 0
    done < <(ldconfig -p 2>/dev/null | awk -v name="$soname" '$1 == name {print $NF}')
  fi

  local candidate
  for candidate in \
    "/usr/lib/$soname" \
    "/usr/lib64/$soname" \
    "/lib/$soname" \
    "/lib64/$soname" \
    "/usr/lib/x86_64-linux-gnu/$soname" \
    "/usr/lib/aarch64-linux-gnu/$soname"; do
    if [ -f "$candidate" ]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  return 1
}

runtime_seed_libs() {
  local seed_libs=""

  local libmpv_path=""
  local mpv_soname
  for mpv_soname in libmpv.so.2 libmpv.so.1 libmpv.so; do
    if libmpv_path="$(resolve_shared_lib "$mpv_soname")"; then
      break
    fi
  done
  if [ -z "$libmpv_path" ]; then
    echo "Error: could not resolve libmpv (.so.2 or .so.1). Install libmpv2 (preferred) or libmpv1 on the build host." >&2
    return 1
  fi
  seed_libs="$libmpv_path"

  local libsecret_path
  if ! libsecret_path="$(resolve_shared_lib libsecret-1.so.0)"; then
    echo "Error: could not resolve libsecret-1.so.0. Install libsecret-1-0 on the build host." >&2
    return 1
  fi
  seed_libs="$seed_libs"$'\n'"$libsecret_path"

  local libsqlite3_path
  if ! libsqlite3_path="$(resolve_shared_lib libsqlite3.so.0)"; then
    echo "Error: could not resolve libsqlite3.so.0. Install libsqlite3-0 on the build host." >&2
    return 1
  fi
  seed_libs="$seed_libs"$'\n'"$libsqlite3_path"

  local webkit_path=""
  local webkit_soname
  for webkit_soname in libwebkit2gtk-4.1.so.0 libwebkit2gtk-4.0.so.37; do
    if webkit_path="$(resolve_shared_lib "$webkit_soname")"; then
      break
    fi
  done
  if [ -z "$webkit_path" ]; then
    echo "Error: could not resolve WebKitGTK runtime library (4.1 or 4.0). Install libwebkit2gtk-4.1-0 or libwebkit2gtk-4.0-37 on the build host." >&2
    return 1
  fi
  seed_libs="$seed_libs"$'\n'"$webkit_path"

  # WebKitGTK links libharfbuzz-icu, a split-out shim that minimal/immutable distros
  # (SteamOS, Fedora-atomic) do not ship. The main harfbuzz stack is skipped as a
  # system lib, so bundle the ICU shim explicitly. Best-effort: not every build host
  # has it, and it is only needed where WebKit is bundled.
  local harfbuzz_icu_path
  if harfbuzz_icu_path="$(resolve_shared_lib libharfbuzz-icu.so.0)"; then
    seed_libs="$seed_libs"$'\n'"$harfbuzz_icu_path"
  else
    echo "Warning: libharfbuzz-icu.so.0 not found on build host; AppImage may fail on distros lacking it." >&2
  fi

  printf '%s\n' "$seed_libs" | grep -v '^$' || true
}

ensure_sqlite_unversioned_link() {
  local dest_lib="$1"
  mkdir -p "$dest_lib"

  if [ -e "$dest_lib/libsqlite3.so" ]; then
    return 0
  fi

  local sqlite_real
  sqlite_real="$(find "$dest_lib" -maxdepth 1 -type f -name 'libsqlite3.so.*' | sort -V | tail -n1 || true)"
  if [ -z "$sqlite_real" ]; then
    return 0
  fi

  ln -sf "$(basename "$sqlite_real")" "$dest_lib/libsqlite3.so"
}

# Arch ships libmpv.so.2; Ubuntu 22.04 ships libmpv.so.1. Ensure both soname
# symlinks exist in the bundle so binaries compiled against either version work.
ensure_mpv_compat_symlinks() {
  local dest_lib="$1"

  local mpv_real
  mpv_real="$(find "$dest_lib" -maxdepth 1 -name 'libmpv.so.*' ! -type l 2>/dev/null | sort -V | tail -n1 || true)"
  [ -z "$mpv_real" ] && return 0

  local base
  base="$(basename "$mpv_real")"

  for alt in libmpv.so.1 libmpv.so.2 libmpv.so; do
    [ ! -e "$dest_lib/$alt" ] && ln -sf "$base" "$dest_lib/$alt"
  done
}

collect_transitive_libs() {
  local seed_libs="$1"
  local all_deps=""

  while IFS= read -r seed; do
    [ -z "$seed" ] && continue
    [ ! -f "$seed" ] && continue

    local deps
    deps="$(ldd "$seed" 2>/dev/null | grep -oP '=> \K/[^ ]+' || true)"
    all_deps="$(printf '%s\n%s\n%s' "$all_deps" "$deps" "$seed")"
  done <<< "$seed_libs"

  printf '%s\n' "$all_deps" | sort -u | grep -v '^$' || true
}

runtime_skip_pattern() {
  local skip='linux-vdso|ld-linux|libc[.]so|libm[.]so|libpthread|libdl[.]so|librt[.]so'
  skip="$skip"'|libstdc[+][+]|libgcc_s'
  skip="$skip"'|libX[a-z]|libxcb|libxkb|libxshmfence|libICE|libSM'
  skip="$skip"'|libwayland|libffi|libpcre'
  skip="$skip"'|libGL|libEGL|libGLX|libGLdispatch|libOpenGL|libdrm|libgbm'
  skip="$skip"'|libglib|libgobject|libgio|libgmodule|libgthread'
  skip="$skip"'|libpulse|libdbus|libasound|libsndfile|libpipewire|libspa|libjack'
  skip="$skip"'|libfontconfig|libfreetype|libharfbuzz|libcairo|libpango|libpixman'
  skip="$skip"'|libatk|libgdk|libgtk|libepoxy|libgdk_pixbuf|librsvg'
  skip="$skip"'|libmount|libblkid|libselinux|libuuid|libresolv|libnss|libnsl|libcrypt'
  skip="$skip"'|libsystemd'
  printf '%s\n' "$skip"
}

copy_runtime_libs() {
  local dest_lib="$1"
  local lib_paths="$2"
  local skip_pattern="$3"

  mkdir -p "$dest_lib"

  local count=0
  while IFS= read -r lib_path; do
    [ -z "$lib_path" ] && continue
    [ ! -f "$lib_path" ] && continue

    local lib_name
    lib_name="$(basename "$lib_path")"
    # libharfbuzz-icu is matched by the libharfbuzz skip entry but must be bundled
    # (WebKit needs it; it is absent on minimal/immutable distros). Keep plain
    # libharfbuzz and the other skips.
    if [[ ! "$lib_name" =~ ^libXpresent[.]so ]] && [[ ! "$lib_name" =~ ^libharfbuzz-icu[.]so ]]; then
      [[ "$lib_name" =~ $skip_pattern ]] && continue
    fi

    local real_path
    real_path="$(readlink -f "$lib_path")"
    [ -f "$real_path" ] || continue

    local real_name
    real_name="$(basename "$real_path")"

    if [ ! -f "$dest_lib/$real_name" ]; then
      cp -L "$real_path" "$dest_lib/$real_name"
      count=$((count + 1))
    fi

    if [ "$real_name" != "$lib_name" ] && [ ! -e "$dest_lib/$lib_name" ]; then
      ln -sf "$real_name" "$dest_lib/$lib_name"
    fi

    local soname
    soname="$(readelf -d "$real_path" 2>/dev/null | sed -n 's/.*SONAME.*\[\(.*\)\].*/\1/p' | head -n1)"
    if [ -n "$soname" ] && [ "$soname" != "$real_name" ] && [ ! -e "$dest_lib/$soname" ]; then
      ln -sf "$real_name" "$dest_lib/$soname"
    fi
  done <<< "$lib_paths"

  printf '%s\n' "$count"
}

inject_linux_runtime_libs() {
  local bundle_dir="$1"

  local seed_libs
  seed_libs="$(runtime_seed_libs)"
  if [ -z "$seed_libs" ]; then
    echo "Warning: Could not resolve runtime seed libraries on this build host." >&2
    return 1
  fi

  local all_deps
  all_deps="$(collect_transitive_libs "$seed_libs")"

  local skip
  skip="$(runtime_skip_pattern)"

  local bundled_count
  bundled_count="$(copy_runtime_libs "$bundle_dir/lib" "$all_deps" "$skip")"
  ensure_sqlite_unversioned_link "$bundle_dir/lib"
  ensure_mpv_compat_symlinks "$bundle_dir/lib"
  echo "Bundled $bundled_count runtime libraries for AppImage/Tarball"
}

# Bundle libmpv + transitive deps for Flatpak (sandboxed, no system libs available).
inject_flatpak_libs() {
  local dest_lib="$1"
  mkdir -p "$dest_lib"
  echo "Bundling runtime libraries for Flatpak..."

  local seed_libs
  seed_libs="$(runtime_seed_libs)"
  if [ -z "$seed_libs" ]; then
    echo "Error: could not resolve required runtime seed libraries." >&2
    return 1
  fi

  local all_deps
  all_deps="$(collect_transitive_libs "$seed_libs")"

  local skip
  skip="$(runtime_skip_pattern)"

  local count
  count="$(copy_runtime_libs "$dest_lib" "$all_deps" "$skip")"
  ensure_sqlite_unversioned_link "$dest_lib"
  ensure_mpv_compat_symlinks "$dest_lib"

  echo "Bundled $count runtime libraries for Flatpak"
}

create_desktop_file() {
  local dest="$1"
  cat > "$dest/${APP_ID}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Moonfin
Exec=moonfin
Icon=${APP_ID}
Categories=AudioVideo;Video;
Comment=Jellyfin & Emby media client
Terminal=false
EOF
}

create_metainfo_file() {
  local dest="$1"
  local version="$2"

  cat > "$dest/${APP_ID}.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>${APP_ID}</id>
  <metadata_license>CC0-1.0</metadata_license>
  <project_license>GPL-3.0</project_license>
  <name>Moonfin</name>
  <developer_name>Moonfin Team</developer_name>
  <summary>Jellyfin &amp; Emby media client</summary>
  <description>
    <p>Moonfin is a media client for Jellyfin and Emby servers, available on mobile, TV, and desktop platforms.</p>
  </description>
  <url type="homepage">https://moonfin.app/</url>
  <launchable type="desktop-id">${APP_ID}.desktop</launchable>
  <releases>
    <release version="${version}" date="$(date '+%Y-%m-%d')"/>
  </releases>
  <content_rating type="oars-1.1"/>
</component>
EOF
}

ensure_flatpak_runtime() {
  # GNOME runtime includes WebKitGTK required by linux webview plugin.
  local runtime="org.gnome.Platform//50"
  local sdk="org.gnome.Sdk//50"

  if flatpak info --user "$runtime" >/dev/null 2>&1 && flatpak info --user "$sdk" >/dev/null 2>&1; then
    return 0
  fi

  flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
  flatpak install --user --noninteractive flathub "$runtime" "$sdk" || true
}

copy_icon() {
  local dest="$1"
  if [ -f "$APP_ICON" ]; then
    cp "$APP_ICON" "$dest/${APP_ID}.png"
  fi
}

build_flutter_binary() {
  echo "Building Flutter release binary for Linux..."
  local flutter_bin
  flutter_bin="$(resolve_flutter)"
  cd "$REPO_ROOT"

  local attempt=1 max_attempts=3
  while true; do
    if "$flutter_bin" build linux --release --dart-define=DISTRIBUTION_CHANNEL=linux; then
      return 0
    fi
    if [ "$attempt" -ge "$max_attempts" ]; then
      echo "Error: 'flutter build linux' failed after ${max_attempts} attempts." >&2
      return 1
    fi
    echo "flutter build failed (attempt ${attempt}/${max_attempts}); purging pdfium cache and retrying..." >&2
    # The plugin downloads into <cmake-binary-dir>/pdfium and copies into .lib/.
    # Remove both across whatever arch/release dir Flutter used so the next configure
    # re-fetches from scratch instead of reusing the truncated archive.
    rm -rf "$REPO_ROOT"/build/linux/*/release/pdfium \
           "$REPO_ROOT"/build/linux/*/release/.lib/* 2>/dev/null || true
    sleep $((attempt * 10))
    attempt=$((attempt + 1))
  done
}

build_appimage() {
  echo "=== Building AppImage ==="
  if ! command -v appimagetool >/dev/null 2>&1; then
    echo "Skipping AppImage: appimagetool not found"
    echo "  Install: https://github.com/AppImage/AppImageKit/releases"
    return 1
  fi

  local appimage_dir="$TEMP_DIR/appimage"
  local version="$(get_app_version)"
  local appimage_name="${APP_NAME}_Linux_v${version}.AppImage"

  rm -rf "$appimage_dir"
  mkdir -p "$appimage_dir"

  cp -r "$BUILD_DIR"/* "$appimage_dir/"
  inject_linux_runtime_libs "$appimage_dir"

  cat > "$appimage_dir/AppRun" << 'EOF'
#!/bin/bash
APPDIR="$(cd "$(dirname "$0")" && pwd)"
export LD_LIBRARY_PATH="$APPDIR/lib:$LD_LIBRARY_PATH"

resolve_exact_lib() {
  local lib_name="$1"
  local old_ifs="$IFS"
  IFS=':'
  for lib_dir in $LD_LIBRARY_PATH; do
    [ -n "$lib_dir" ] && [ -e "$lib_dir/$lib_name" ] && IFS="$old_ifs" && return 0
  done
  IFS="$old_ifs"

  for lib_dir in /lib /lib64 /usr/lib /usr/lib64 /usr/lib/x86_64-linux-gnu /usr/lib/aarch64-linux-gnu; do
    [ -e "$lib_dir/$lib_name" ] && return 0
  done

  return 1
}

missing_libs="$(ldd "$APPDIR/moonfin" 2>/dev/null | awk '/not found/ {print $1}' | sort -u || true)"
if ! resolve_exact_lib libsqlite3.so; then
  missing_libs="$(printf '%s\n%s\n' "$missing_libs" "libsqlite3.so" | awk 'NF' | sort -u)"
fi

if [ -n "$missing_libs" ]; then
  echo "Moonfin cannot start. Missing shared libraries:" >&2
  printf '  - %s\n' $missing_libs >&2
  echo "Install the missing libraries for your distro and retry." >&2
  exit 127
fi

exec "$APPDIR/moonfin" "$@"
EOF
  chmod +x "$appimage_dir/AppRun"

  create_desktop_file "$appimage_dir"
  copy_icon "$appimage_dir"
  mkdir -p "$appimage_dir/usr/share/pixmaps"
  copy_icon "$appimage_dir/usr/share/pixmaps"

  cd "$TEMP_DIR"
  appimagetool "$appimage_dir" "$appimage_name" || true
  
  if [ -f "$appimage_name" ]; then
    mv "$appimage_name" "$REPO_ROOT/"
    echo "✓ Created: $REPO_ROOT/$appimage_name"
  fi
}

build_tarball() {
  echo "=== Building Tarball ==="

  local version="$(get_app_version)"
  local tarball_name="${APP_NAME}_Linux_v${version}.tar.gz"
  local tar_dir="$TEMP_DIR/tarball/moonfin-${version}"

  rm -rf "$TEMP_DIR/tarball"
  mkdir -p "$tar_dir"
  cp -r "$BUILD_DIR"/* "$tar_dir/"
  inject_linux_runtime_libs "$tar_dir"

  if [ -f "$tar_dir/moonfin" ]; then
    mv "$tar_dir/moonfin" "$tar_dir/moonfin-bin"
    cat > "$tar_dir/moonfin" << 'EOF'
#!/bin/sh
APPDIR="$(cd "$(dirname "$0")" && pwd)"
export LD_LIBRARY_PATH="$APPDIR/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

resolve_exact_lib() {
  lib_name="$1"
  old_ifs="$IFS"
  IFS=':'
  for lib_dir in $LD_LIBRARY_PATH; do
    [ -n "$lib_dir" ] && [ -e "$lib_dir/$lib_name" ] && IFS="$old_ifs" && return 0
  done
  IFS="$old_ifs"

  for lib_dir in /lib /lib64 /usr/lib /usr/lib64 /usr/lib/x86_64-linux-gnu /usr/lib/aarch64-linux-gnu; do
    [ -e "$lib_dir/$lib_name" ] && return 0
  done

  return 1
}

missing_libs="$(ldd "$APPDIR/moonfin-bin" 2>/dev/null | awk '/not found/ {print $1}' | sort -u || true)"
if ! resolve_exact_lib libsqlite3.so; then
  missing_libs="$(printf '%s\n%s\n' "$missing_libs" "libsqlite3.so" | awk 'NF' | sort -u)"
fi

if [ -n "$missing_libs" ]; then
  echo "Moonfin cannot start. Missing shared libraries:" >&2
  printf '  - %s\n' $missing_libs >&2
  echo "Install the missing libraries for your distro and retry." >&2
  exit 127
fi

exec "$APPDIR/moonfin-bin" "$@"
EOF
    chmod +x "$tar_dir/moonfin"
  fi

  cat > "$tar_dir/README.txt" << EOF
Moonfin ${version}
Jellyfin & Emby media client for Linux

Installation:
  1. Extract this archive
  2. Run ./moonfin

Dependencies:
  - GTK 3.0+
  - GLib 2.0+
  - WebKitGTK 4.1 runtime (libwebkit2gtk-4.1-0)
  - libflutter_linux_gtk (bundled)
  - Additional runtime libs are bundled when available (libmpv, libsecret)

Requirements:
  - X11 or Wayland display server
  - Network access to Jellyfin/Emby server
EOF

  cd "$TEMP_DIR/tarball"
  tar -czf "$tarball_name" "moonfin-${version}"
  mv "$tarball_name" "$REPO_ROOT/"
  echo "✓ Created: $REPO_ROOT/$tarball_name"
}

build_deb() {
  echo "=== Building Debian Package (.deb) ==="
  if ! command -v dpkg-deb >/dev/null 2>&1; then
    echo "Skipping .deb: dpkg-deb not found"
    return 1
  fi

  local version="$(get_app_version)"
  local deb_name="${APP_NAME}_Linux_v${version}.deb"
  local pkg_root="$TEMP_DIR/deb/moonfin-${version}"
  local deb_arch
  deb_arch="$(get_deb_architecture)"

  rm -rf "$TEMP_DIR/deb"
  mkdir -p "$pkg_root"/{usr/bin,usr/lib/moonfin,usr/share/applications,usr/share/pixmaps,usr/share/doc/moonfin,DEBIAN}

  cp -r "$BUILD_DIR"/* "$pkg_root/usr/lib/moonfin/"

  inject_linux_runtime_libs "$pkg_root/usr/lib/moonfin"

  cat > "$pkg_root/usr/bin/moonfin" << 'EOF'
#!/bin/sh
APPDIR="/usr/lib/moonfin"
export LD_LIBRARY_PATH="$APPDIR/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "$APPDIR/moonfin" "$@"
EOF
  chmod +x "$pkg_root/usr/bin/moonfin"

  create_desktop_file "$pkg_root/usr/share/applications"
  copy_icon "$pkg_root/usr/share/pixmaps"

  mkdir -p "$pkg_root/usr/share/metainfo"
  create_metainfo_file "$pkg_root/usr/share/metainfo" "$version"

  cat > "$pkg_root/DEBIAN/control" << EOF
Package: moonfin
Version: ${version}
Architecture: ${deb_arch}
Maintainer: Moonfin Team <support@moonfin.dev>
Installed-Size: $(du -sk "$pkg_root/usr" | cut -f1)
Depends: libgtk-3-0, libglib2.0-0, libsecret-1-0, libwebkit2gtk-4.1-0
Description: Jellyfin & Emby media client
 Moonfin is a media client for Jellyfin and Emby servers,
 available on mobile, TV, and desktop platforms.
 .
 Features:
  - Browse and stream media
  - Offline downloads
  - Casting support
  - DLNA playback
Homepage: https://moonfin.app/
License: GPL-3.0
EOF

  cat > "$pkg_root/usr/share/doc/moonfin/copyright" << EOF
Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
Upstream-Name: Moonfin
Upstream-Contact: https://github.com/jmshrv/Moonfin
Source: https://github.com/jmshrv/Moonfin

Files: *
Copyright: 2024-2025 Moonfin Team
License: GPL-3.0
EOF

  cd "$TEMP_DIR/deb"
  dpkg-deb --build "moonfin-${version}" "$deb_name" 2>/dev/null || true

  if [ -f "$deb_name" ]; then
    mv "$deb_name" "$REPO_ROOT/"
    echo "✓ Created: $REPO_ROOT/$deb_name"
  fi
}

build_rpm() {
  echo "=== Building RPM Package (.rpm) ==="
  if ! command -v rpmbuild >/dev/null 2>&1; then
    echo "Skipping .rpm: rpmbuild not found"
    return 1
  fi

  local version="$(get_app_version)"
  local rpm_name="${APP_NAME}_Linux_v${version}.rpm"
  local rpm_dir="$TEMP_DIR/rpm"
  local spec_file="$rpm_dir/moonfin.spec"

  rm -rf "$rpm_dir"
  mkdir -p "$rpm_dir"/{SPECS,SOURCES,BUILD,RPMS,SRPMS}
  create_desktop_file "$rpm_dir"
  create_metainfo_file "$rpm_dir" "$version"

  cat > "$spec_file" << EOF
Name:           moonfin
Version:        ${version}
Release:        1
Summary:        Jellyfin & Emby media client
License:        GPL-3.0

%description
Moonfin is a media client for Jellyfin and Emby servers,
available on mobile, TV, and desktop platforms.

%install
mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/usr/lib/moonfin
mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/share/pixmaps
mkdir -p %{buildroot}/usr/share/metainfo

cp -r ${BUILD_DIR}/* %{buildroot}/usr/lib/moonfin/

cat > %{buildroot}/usr/bin/moonfin << 'EOFRUNNER'
#!/bin/sh
APPDIR="/usr/lib/moonfin"
export LD_LIBRARY_PATH="\$APPDIR/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
exec "\$APPDIR/moonfin" "\$@"
EOFRUNNER
chmod +x %{buildroot}/usr/bin/moonfin

cp "$rpm_dir/${APP_ID}.desktop" %{buildroot}/usr/share/applications/${APP_ID}.desktop
cp "$rpm_dir/${APP_ID}.metainfo.xml" %{buildroot}/usr/share/metainfo/${APP_ID}.metainfo.xml

if [ -f "$APP_ICON" ]; then
  cp "$APP_ICON" %{buildroot}/usr/share/pixmaps/${APP_ID}.png
fi

%files
/usr/bin/moonfin
%dir /usr/lib/moonfin
/usr/lib/moonfin/*
/usr/share/applications/${APP_ID}.desktop
/usr/share/pixmaps/${APP_ID}.png
/usr/share/metainfo/${APP_ID}.metainfo.xml

%changelog
* $(date '+%a %b %d %Y') Moonfin Team <support@moonfin.dev>
- Release ${version}
EOF

  cd "$rpm_dir"
  rpmbuild --define "_topdir $rpm_dir" -bb "$spec_file" || true
  local rpm_file=$(find "$rpm_dir/RPMS" -name "*.rpm" 2>/dev/null | head -1)
  if [ -n "$rpm_file" ]; then
    cp "$rpm_file" "$REPO_ROOT/$rpm_name"
    echo "✓ Created: $REPO_ROOT/$rpm_name"
  fi
}

retry_with_backoff() {
  local max_attempts="$1"
  shift

  local attempt=1
  while true; do
    if "$@"; then
      return 0
    fi

    if [ "$attempt" -ge "$max_attempts" ]; then
      return 1
    fi

    local delay=$((attempt * 10))
    echo "Command failed (attempt $attempt/$max_attempts). Retrying in ${delay}s..."
    sleep "$delay"
    attempt=$((attempt + 1))
  done
}

build_snap() {
  echo "=== Building Snap Package ==="
  if ! command -v snapcraft >/dev/null 2>&1; then
    echo "Skipping Snap: snapcraft not found"
    echo "  Install: sudo snap install snapcraft --classic"
    return 1
  fi

  if command -v snap >/dev/null 2>&1; then
    echo "Waiting for snapd seed to complete..."
    if ! snap wait system seed.loaded >/dev/null 2>&1; then
      echo "Warning: snapd seed wait failed; continuing and letting snapcraft attempt build."
    fi

    if ! snap list core22 >/dev/null 2>&1; then
      echo "core22 not found. Installing core22 base snap..."
      if ! retry_with_backoff 3 sudo snap install core22 --channel=latest/stable; then
        echo "Failed to install core22 after retries."
        return 1
      fi
    fi
  fi

  local snap_dir="$TEMP_DIR/snap"
  local version="$(get_app_version)"
  local snap_mpv_package
  snap_mpv_package="$(resolve_mpv_package_name)"

  rm -rf "$snap_dir"
  mkdir -p "$snap_dir"

  cat > "$snap_dir/snapcraft.yaml" << EOF
name: moonfin
title: Moonfin
version: '${version}'
summary: Jellyfin & Emby media client
description: |
  Moonfin is a media client for Jellyfin and Emby servers.
  Stream movies, TV shows, music, and photos from your server.

grade: stable
confinement: strict
base: core22

apps:
  moonfin:
    command: moonfin
    plugs:
      - home
      - network
      - network-bind
      - opengl
      - pulseaudio
    environment:
      LD_LIBRARY_PATH: \$SNAP/lib:\$SNAP/lib/x86_64-linux-gnu:\$SNAP/usr/lib/x86_64-linux-gnu

parts:
  moonfin:
    plugin: dump
    source: .
    override-build: |
      mkdir -p \$SNAPCRAFT_PART_INSTALL/bin
      mkdir -p \$SNAPCRAFT_PART_INSTALL/lib
      cp -r ${BUILD_DIR}/* \$SNAPCRAFT_PART_INSTALL/
    stage-packages:
      - libgtk-3-0
      - libglib2.0-0
      - libx11-6
      - ${snap_mpv_package}
      - libsecret-1-0
      - libwebkit2gtk-4.1-0
EOF

  cp -r "$BUILD_DIR"/* "$snap_dir/"
  [ -f "$APP_ICON" ] && cp "$APP_ICON" "$snap_dir/${APP_ID}.png"

  cd "$snap_dir"
  if ! retry_with_backoff 3 snapcraft pack --destructive-mode; then
    echo "Snap build failed after retries"
    return 1
  fi

  local snap_file
  snap_file=$(find "$snap_dir" -maxdepth 1 -name "*.snap" 2>/dev/null | head -1)
  if [ -n "$snap_file" ]; then
    mv "$snap_file" "$REPO_ROOT/${APP_NAME}_Linux_v${version}.snap"
    echo "✓ Created: $REPO_ROOT/${APP_NAME}_Linux_v${version}.snap"
  else
    echo "Snap build did not produce a .snap file"
    return 1
  fi
}

build_flatpak() {
  echo "=== Building Flatpak Package ==="
  if ! command -v flatpak-builder >/dev/null 2>&1; then
    echo "Skipping Flatpak: flatpak-builder not found"
    echo "  Install: sudo apt install flatpak-builder"
    return 1
  fi

  local flatpak_dir="$TEMP_DIR/flatpak"
  local version="$(get_app_version)"

  rm -rf "$flatpak_dir"
  mkdir -p "$flatpak_dir"

  local flatpak_build_dir="$TEMP_DIR/flatpak-build"
  local flatpak_repo_dir="$TEMP_DIR/flatpak-repo"
  local flatpak_name="${APP_NAME}_Linux_v${version}.flatpak"
  local flatpak_src="$flatpak_dir/src"

  rm -rf "$flatpak_build_dir" "$flatpak_repo_dir"
  mkdir -p "$flatpak_src"
  cp -r "$BUILD_DIR"/* "$flatpak_src/"
  inject_flatpak_libs "$flatpak_src/lib/moonfin"
  [ -f "$APP_ICON" ] && cp "$APP_ICON" "$flatpak_src/${APP_ID}.png"
  create_desktop_file "$flatpak_src"
  create_metainfo_file "$flatpak_src" "$version"

  cat > "$flatpak_dir/${APP_ID}.yml" << EOF
app-id: ${APP_ID}
runtime: org.gnome.Platform
runtime-version: '50'
sdk: org.gnome.Sdk

command: moonfin

finish-args:
  - --share=network
  - --socket=fallback-x11
  - --socket=wayland
  - --device=dri
  - --socket=pulseaudio
  - --socket=session-bus
  - --system-talk-name=org.freedesktop.NetworkManager
  - --filesystem=home

modules:
  - name: appstream-compose-shim
    # Shim for SDKs that dropped appstream-compose (24.08+); appstreamcli compose replaces it.
    buildsystem: simple
    build-commands:
      - mkdir -p /app/bin
      - cp appstream-compose /app/bin/appstream-compose
      - chmod +x /app/bin/appstream-compose
    sources:
      - type: script
        dest-filename: appstream-compose
        commands:
          - |
            #!/usr/bin/env bash
            args=()
            basename_val=""
            skip_next=0
            for arg in "\$@"; do
              if [[ "\$skip_next" -eq 1 ]]; then
                basename_val="\$arg"
                skip_next=0
                continue
              fi
              if [[ "\$arg" == --basename ]]; then
                skip_next=1
                continue
              fi
              if [[ "\$arg" == --basename=* ]]; then
                basename_val="\${arg#--basename=}"
                continue
              fi
              if [[ -n "\$basename_val" && "\$arg" == "\$basename_val" ]]; then
                args+=("/")
                continue
              fi
              args+=("\$arg")
            done
            exec appstreamcli compose "\${args[@]}"
  - name: moonfin
    buildsystem: simple
    build-commands:
      - mkdir -p /app/bin /app/moonfin /app/share/applications /app/share/metainfo /app/share/icons/hicolor/512x512/apps
      - cp -r . /app/moonfin/
      - chmod +x /app/moonfin/moonfin
      - |
        cat > /app/bin/moonfin << 'EOFRUN'
        #!/bin/sh
        export LD_LIBRARY_PATH="/app/moonfin/lib/moonfin:/app/moonfin/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"

        resolve_exact_lib() {
          lib_name="\$1"
          old_ifs="\$IFS"
          IFS=':'
          for lib_dir in \$LD_LIBRARY_PATH; do
            [ -n "\$lib_dir" ] && [ -e "\$lib_dir/\$lib_name" ] && IFS="\$old_ifs" && return 0
          done
          IFS="\$old_ifs"

          for lib_dir in /lib /lib64 /usr/lib /usr/lib64 /usr/lib/x86_64-linux-gnu /usr/lib/aarch64-linux-gnu; do
            [ -e "\$lib_dir/\$lib_name" ] && return 0
          done

          return 1
        }

        missing_libs="\$(ldd /app/moonfin/moonfin 2>/dev/null | awk '/not found/ {print \$1}' | sort -u || true)"
        if ! resolve_exact_lib libsqlite3.so; then
          missing_libs="\$(printf '%s\\n%s\\n' "\$missing_libs" "libsqlite3.so" | awk 'NF' | sort -u)"
        fi

        if [ -n "\$missing_libs" ]; then
          echo "Moonfin cannot start. Missing shared libraries:" >&2
          printf '  - %s\\n' \$missing_libs >&2
          echo "Install the missing libraries in the runtime and retry." >&2
          exit 127
        fi

        exec /app/moonfin/moonfin "\$@"
        EOFRUN
      - chmod +x /app/bin/moonfin
      - '[ -f ${APP_ID}.png ] && cp ${APP_ID}.png /app/share/icons/hicolor/512x512/apps/ || true'
      - cp ${APP_ID}.desktop /app/share/applications/
      - cp ${APP_ID}.metainfo.xml /app/share/metainfo/
    sources:
      - type: dir
        path: src
EOF

  mkdir -p "$flatpak_repo_dir"
  ostree init --repo="$flatpak_repo_dir" --mode=archive-z2 2>/dev/null || true
  ostree --repo="$flatpak_repo_dir" config set 'core.min-free-space-percent' 0 2>/dev/null || true

  ensure_flatpak_runtime

  flatpak-builder --force-clean \
    --repo="$flatpak_repo_dir" \
    "$flatpak_build_dir" \
    "$flatpak_dir/${APP_ID}.yml"

  if flatpak build-bundle "$flatpak_repo_dir" "$REPO_ROOT/$flatpak_name" "${APP_ID}"; then
    echo "✓ Created: $REPO_ROOT/$flatpak_name"
  else
    echo "Flatpak build did not produce a bundle"
  fi
}

main() {
  local formats="${1:-all}"
  formats="$(printf '%s\n' "$formats" | tr '[:upper:]' '[:lower:]')"
  local version="$(get_app_version)"

  echo "======================================"
  echo "Moonfin Linux Package Builder"
  echo "Version: ${version}"
  echo "======================================"
  echo ""

  build_flutter_binary
  BUILD_DIR="$(resolve_build_dir)"
  if [ "${BUNDLE_RUNTIME_LIBS:-0}" = "1" ]; then
    inject_linux_runtime_libs "$BUILD_DIR"
  else
    echo "Skipping bundled runtime libs (set BUNDLE_RUNTIME_LIBS=1 to enable)."
  fi
  rm -rf "$TEMP_DIR"

  case "$formats" in
    all)
      build_tarball || true
      build_appimage || true
      build_deb || true
      build_rpm || true
      build_snap || true
      build_flatpak || true
      ;;
    tarball)
      build_tarball
      ;;
    appimage)
      build_appimage
      ;;
    deb)
      build_deb
      ;;
    rpm)
      build_rpm
      ;;
    snap)
      build_snap
      ;;
    flatpak)
      build_flatpak
      ;;
    *)
      cat << USAGE
Usage: $0 [FORMAT]

Available formats:
  all          Build all package formats (default)
  tarball      Create tarball (.tar.gz)
  appimage     Create AppImage (requires appimagetool)
  deb          Create Debian package (requires dpkg-deb)
  rpm          Create RPM package (requires rpmbuild)
  snap         Create Snap package (requires snapcraft)
  flatpak      Create Flatpak package (requires flatpak-builder)

Examples:
  $0                 # Build all formats
  $0 tarball         # Build only tarball
  $0 appimage        # Build only AppImage
USAGE
      exit 1
      ;;
  esac

  rm -rf "$TEMP_DIR"

  echo ""
  echo "======================================"
  echo "Build complete!"
  echo "Artifacts: $REPO_ROOT"
  ls -lh "$REPO_ROOT"/Moonfin_* 2>/dev/null || echo "(no artifacts built)"
  echo "======================================"
}

main "$@"
