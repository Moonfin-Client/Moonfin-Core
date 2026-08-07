#!/usr/bin/env bash
# Builds libdovi.so for Android from the dovi_tool sources and drops the
# binaries into this plugin's jniLibs, replacing whatever is checked in. This
# is how those binaries were produced, so run it to move to a newer libdovi or
# to add an ABI. The JNI shim dlopens the library at runtime, so a tree
# without it still builds and profile 7 just falls back to stripping.
#
# Requirements: rustup (with cargo), cargo-c, and an Android NDK. Run from
# anywhere.
#
#   rustup target add aarch64-linux-android armv7-linux-androideabi \
#       x86_64-linux-android i686-linux-android
#   cargo install cargo-c
#   ANDROID_NDK_HOME=~/Android/Sdk/ndk/28.2.13676358 ./build_libdovi.sh
set -euo pipefail

DOVI_TOOL_TAG="libdovi-3.4.0"
API_LEVEL=24
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JNILIBS_DIR="$SCRIPT_DIR/../android/src/main/jniLibs"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

: "${ANDROID_NDK_HOME:?Set ANDROID_NDK_HOME to your NDK path}"
TOOLCHAIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"

git clone --depth 1 --branch "$DOVI_TOOL_TAG" \
    https://github.com/quietvoid/dovi_tool "$WORK_DIR/dovi_tool"
cd "$WORK_DIR/dovi_tool/dolby_vision"

build_abi() {
    local rust_target="$1"
    local abi="$2"
    local clang_target="$3"

    export "CC_${rust_target//-/_}=$TOOLCHAIN/${clang_target}${API_LEVEL}-clang"
    export "CARGO_TARGET_$(echo "$rust_target" | tr '[:lower:]-' '[:upper:]_')_LINKER=$TOOLCHAIN/${clang_target}${API_LEVEL}-clang"

    cargo cbuild --release --target "$rust_target" --library-type cdylib

    mkdir -p "$JNILIBS_DIR/$abi"
    cp "target/$rust_target/release/libdovi.so" "$JNILIBS_DIR/$abi/libdovi.so"
    echo "built $abi"
}

build_abi aarch64-linux-android arm64-v8a aarch64-linux-android
build_abi armv7-linux-androideabi armeabi-v7a armv7a-linux-androideabi
build_abi x86_64-linux-android x86_64 x86_64-linux-android
build_abi i686-linux-android x86 i686-linux-android

echo "done: binaries in $JNILIBS_DIR/<abi>/libdovi.so"
