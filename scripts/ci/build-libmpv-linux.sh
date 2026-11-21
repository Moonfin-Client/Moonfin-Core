#!/usr/bin/env bash
# Builds libmpv into PREFIX for build-linux.sh to bundle in place of the
# distro's, which is mpv 0.37 on Ubuntu 24.04.
#
# mpv 0.42 works with 24.04's FFmpeg 6.1 but needs libplacebo 7.387, and 24.04
# only has 6.338. So libplacebo is built too, statically, and linked into libmpv
# with its symbols hidden: 24.04's libavfilter loads libplacebo 6.338, and both
# export the same unversioned pl_* names.
#
# Needs the distro's build dependencies of mpv and libplacebo, plus
# libdisplay-info-dev, which mpv 0.42's DRM support added.
set -euo pipefail

MPV_VERSION=v0.42.0
LIBPLACEBO_VERSION=v7.387.0

PREFIX="${1:?usage: $0 PREFIX}"
SRC="$(mktemp -d)"
trap 'rm -rf "$SRC"' EXIT

git clone --quiet --depth 1 --recursive --shallow-submodules \
  --branch "$LIBPLACEBO_VERSION" https://github.com/haasn/libplacebo.git "$SRC/libplacebo"
meson setup "$SRC/libplacebo/build" "$SRC/libplacebo" \
  --prefix="$PREFIX" --libdir=lib --buildtype=release \
  -Ddefault_library=static -Db_staticpic=true \
  -Dvulkan=disabled -Dd3d11=disabled -Ddemos=false -Dtests=false
meson install -C "$SRC/libplacebo/build" --quiet

git clone --quiet --depth 1 --branch "$MPV_VERSION" \
  https://github.com/mpv-player/mpv.git "$SRC/mpv"
# Wayland and Vulkan stay off: 24.04's wayland-client and Vulkan headers are
# older than mpv asks for. DRM is required explicitly, because without
# libdisplay-info it would drop out silently and take vaapi-drm with it.
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig" meson setup "$SRC/mpv/build" "$SRC/mpv" \
  --prefix="$PREFIX" --libdir=lib --buildtype=release \
  -Dlibmpv=true -Dcplayer=false -Dbuild-date=false \
  -Ddrm=enabled -Dvaapi-drm=enabled \
  -Dc_link_args=-Wl,--exclude-libs,ALL
meson install -C "$SRC/mpv/build" --quiet

# grep -q would stop reading early, and pipefail would then fail the check quietly.
if nm -D --defined-only "$PREFIX/lib/libmpv.so.2" | grep ' pl_' >/dev/null; then
  echo "Error: libmpv exports libplacebo symbols." >&2
  exit 1
fi
