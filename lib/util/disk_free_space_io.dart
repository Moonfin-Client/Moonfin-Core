import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

/// Bytes available to this process on the filesystem holding [path], or null
/// when it can't be determined. Callers treat null as "don't block the
/// operation". A missing answer must never refuse a download a full disk
/// would have allowed.
Future<int?> availableDiskSpaceBytes(String path) async {
  try {
    if (Platform.isWindows) return _windowsAvailableBytes(path);
    if (Platform.isLinux || Platform.isMacOS || Platform.isAndroid) {
      return _statvfsAvailableBytes(path);
    }
  } catch (_) {}
  return null;
}

// statvfs writes into a raw buffer sized well past any libc's struct. These
// structs are read views over that buffer, so they only model the leading
// fields up to f_bavail, and each libc gets its own because the layouts
// differ.

/// glibc x86_64/aarch64 and Android bionic LP64, where every field is 64-bit.
final class _StatVfs64 extends Struct {
  @Uint64()
  external int fBsize;
  @Uint64()
  external int fFrsize;
  @Uint64()
  external int fBlocks;
  @Uint64()
  external int fBfree;
  @Uint64()
  external int fBavail;
}

/// macOS, where f_bsize and f_frsize are 64-bit but the block counts are
/// fsblkcnt_t, which Darwin defines as 32-bit.
final class _StatVfsMacos extends Struct {
  @Uint64()
  external int fBsize;
  @Uint64()
  external int fFrsize;
  @Uint32()
  external int fBlocks;
  @Uint32()
  external int fBfree;
  @Uint32()
  external int fBavail;
}

typedef _StatVfsNative = Int32 Function(Pointer<Utf8>, Pointer<Void>);
typedef _StatVfsDart = int Function(Pointer<Utf8>, Pointer<Void>);

int? _statvfsAvailableBytes(String path) {
  // 32-bit ABIs lay the struct out differently again. Report unknown rather
  // than read a guessed layout.
  if (sizeOf<IntPtr>() != 8) return null;
  final libc = Platform.isAndroid
      ? DynamicLibrary.open('libc.so')
      : DynamicLibrary.process();
  final statvfs = libc.lookupFunction<_StatVfsNative, _StatVfsDart>('statvfs');
  final pathPtr = path.toNativeUtf8();
  final buf = calloc<Uint8>(512);
  try {
    if (statvfs(pathPtr, buf.cast()) != 0) return null;
    if (Platform.isMacOS) {
      final s = buf.cast<_StatVfsMacos>().ref;
      return s.fBavail * s.fFrsize;
    }
    final s = buf.cast<_StatVfs64>().ref;
    return s.fBavail * s.fFrsize;
  } finally {
    calloc.free(buf);
    calloc.free(pathPtr);
  }
}

typedef _GetDiskFreeSpaceExNative =
    Int32 Function(
      Pointer<Utf16>,
      Pointer<Uint64>,
      Pointer<Uint64>,
      Pointer<Uint64>,
    );
typedef _GetDiskFreeSpaceExDart =
    int Function(
      Pointer<Utf16>,
      Pointer<Uint64>,
      Pointer<Uint64>,
      Pointer<Uint64>,
    );

int? _windowsAvailableBytes(String path) {
  final kernel32 = DynamicLibrary.open('kernel32.dll');
  final getDiskFreeSpaceEx = kernel32
      .lookupFunction<_GetDiskFreeSpaceExNative, _GetDiskFreeSpaceExDart>(
        'GetDiskFreeSpaceExW',
      );
  final pathPtr = path.toNativeUtf16();
  final freeToCaller = calloc<Uint64>();
  try {
    if (getDiskFreeSpaceEx(pathPtr, freeToCaller, nullptr, nullptr) == 0) {
      return null;
    }
    return freeToCaller.value;
  } finally {
    calloc.free(pathPtr);
    calloc.free(freeToCaller);
  }
}
