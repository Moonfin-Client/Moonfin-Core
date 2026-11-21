import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

int osMajorVersion() {
  final match = RegExp(r'\d+').firstMatch(Platform.operatingSystemVersion);
  if (match == null) return 0;
  return int.tryParse(match.group(0)!) ?? 0;
}

String osVersionRaw() => Platform.operatingSystemVersion;

/// FLATPAK_ID, unless this binary isn't the Flatpak's own: a native build
/// started from some other Flatpak's terminal inherits that app's ID. Same rule
/// as my_application_resolve_id in linux/runner/my_application.cc.
String? linuxFlatpakAppId() {
  final id = Platform.environment['FLATPAK_ID'];
  if (id == null || id.isEmpty) return null;
  if (!Platform.resolvedExecutable.startsWith('/app/')) return null;
  return id;
}

/// Whether this binary is the snap's own. A native build started from a snap's
/// terminal inherits SNAP but runs from somewhere else.
bool linuxIsSnap() {
  final snap = Platform.environment['SNAP'];
  if (snap == null || snap.isEmpty) return false;
  return Platform.resolvedExecutable.startsWith('$snap/');
}

/// The host's os-release for a Flatpak, whose /etc holds the runtime's own.
/// A snap can't read the host's copy without the system-observe plug, so a
/// snap still reports its base's.
Future<Map<String, String>?> linuxHostOsRelease() async {
  if (linuxFlatpakAppId() == null) return null;
  try {
    return parseOsRelease(await File('/run/host/os-release').readAsLines());
  } on FileSystemException {
    return null;
  }
}

Map<String, String> parseOsRelease(List<String> lines) => {
  for (final line in lines)
    if (_osReleaseLine.firstMatch(line.trim()) case final match?)
      match[1]!: match[3]!,
};

final _osReleaseLine = RegExp(r'''^([A-Z0-9_]+)=(["']?)(.*)\2$''');

/// The CPU architecture this build targets, like x64 or arm64. On Windows it
/// also names the PC's own when they differ, since an x64 build on an ARM PC
/// runs emulated and nothing else in a report shows that.
String? cpuArchitecture() {
  final build = RegExp(r'on "\w+_(\w+)"')
      .firstMatch(Platform.version)
      ?.group(1);
  if (build == null || !Platform.isWindows) return build;
  final machine = _windowsNativeMachine();
  if (machine == null || machine == build) return build;
  return '$build, emulated on $machine';
}

typedef _IsWow64Process2Native = Int32 Function(
  IntPtr,
  Pointer<Uint16>,
  Pointer<Uint16>,
);
typedef _IsWow64Process2Dart = int Function(
  int,
  Pointer<Uint16>,
  Pointer<Uint16>,
);

/// GetNativeSystemInfo says x64 inside an emulated process, so only
/// IsWow64Process2 gives the real machine.
String? _windowsNativeMachine() {
  final machines = calloc<Uint16>(2);
  try {
    final isWow64Process2 = DynamicLibrary.open('kernel32.dll')
        .lookupFunction<_IsWow64Process2Native, _IsWow64Process2Dart>(
          'IsWow64Process2',
        );
    // -1 is the pseudo handle GetCurrentProcess returns.
    if (isWow64Process2(-1, machines, machines + 1) == 0) return null;
    return switch (machines[1]) {
      0x8664 => 'x64',
      0xAA64 => 'arm64',
      _ => null,
    };
  } catch (_) {
    return null;
  } finally {
    calloc.free(machines);
  }
}
