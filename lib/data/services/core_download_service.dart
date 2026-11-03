import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../util/game_cores.dart';

/// Downloads and installs libretro cores from the Libretro buildbot on Android
/// and non-Apple desktop platforms, where cores are not bundled with the app.
/// Users choose which systems to add from the emulator cores settings screen
/// or consent to downloading a missing core when launching a game.
class CoreDownloadService {
  CoreDownloadService(this._store, {Dio? dio}) : _dio = dio ?? Dio();

  final PreferenceStore _store;
  final Dio _dio;

  CoreDownloadPromptChoice? downloadPromptChoice(String coreId) {
    final value = _store.getString(coreDownloadPromptPreferenceKey(coreId));
    if (value == null) return null;
    for (final choice in CoreDownloadPromptChoice.values) {
      if (choice.name == value) return choice;
    }
    return null;
  }

  /// Save a response only when the user selects "Don't show this again".
  /// Persist before acting so a download error still respects that choice.
  Future<void> recordDownloadPromptChoice(
    String coreId,
    CoreDownloadPromptChoice choice,
  ) async {
    if (!await _store.setString(
      coreDownloadPromptPreferenceKey(coreId),
      choice.name,
    )) {
      throw StateError('Could not save the core download choice');
    }
  }

  /// The core ids recorded as installed.
  List<String> get installed =>
      _store.getStringList(installedCoresPreferenceKey) ?? const <String>[];

  bool isInstalled(String coreId) => installed.contains(coreId);

  /// Whether libretro publishes a build of [coreId] for this platform and
  /// architecture. Rows for cores without a build are shown as unavailable.
  bool isAvailable(String coreId) => coreDownloadUrl(coreId) != null;

  /// Downloads [coreId], extracts the core file into [coresDirectory], installs
  /// any support files the core needs, and records it as installed.
  /// [onProgress] reports 0..1 across the whole install.
  Future<void> download(
    String coreId, {
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final url = coreDownloadUrl(coreId);
    if (url == null) {
      throw StateError('No core build for this platform');
    }

    final support = coreSupportFilesFor(coreId);
    final coreShare = support == null ? 1.0 : _coreShare(coreId, support);

    final response = await _dio.get<List<int>>(
      url,
      cancelToken: cancelToken,
      options: Options(responseType: ResponseType.bytes),
      onReceiveProgress: (received, total) {
        if (onProgress != null && total > 0) {
          onProgress(received / total * coreShare);
        }
      },
    );
    final zipBytes = response.data;
    if (zipBytes == null || zipBytes.isEmpty) {
      throw StateError('Empty core download');
    }

    final coreBytes = _extractCore(zipBytes);
    if (coreBytes == null) {
      throw StateError('Core file missing from download');
    }

    if (cancelToken?.cancelError case final error?) throw error;

    if (support != null) {
      await installSupportFiles(
        coreId,
        cancelToken: cancelToken,
        onProgress: (p) => onProgress?.call(coreShare + p * (1 - coreShare)),
      );
    }
    if (cancelToken?.cancelError case final error?) throw error;

    final dir = await coresDirectory();
    if (!await dir.exists()) await dir.create(recursive: true);
    final file = File('${dir.path}/${coreFileName(coreId)}');
    // Publish only a complete file: a failed or interrupted install must not
    // leave a partial library that the next launch mistakes for a usable core.
    final staging = await dir.createTemp('.$coreId-');
    var published = false;
    try {
      final stagedFile = File('${staging.path}/core');
      await stagedFile.writeAsBytes(coreBytes, flush: true);
      if (cancelToken?.cancelError case final error?) throw error;
      await stagedFile.rename(file.path);
      published = true;
    } finally {
      try {
        await staging.delete(recursive: true);
      } catch (error) {
        if (!published) rethrow;
        // A leftover empty staging directory does not invalidate the installed
        // binary or justify skipping its installed record.
        debugPrint('Could not remove core staging directory: $error');
      }
    }

    // Publication completed the install. Even if the caller closes now, record
    // it so routing cannot mistake the complete binary for a missing core.
    await _markInstalled(coreId, true);
    onProgress?.call(1);
  }

  /// Fetches the support files [coreId] needs and unpacks them into the system
  /// directory, where the core looks for them. Does nothing when they are
  /// already there, so it's safe to call before every launch.
  Future<void> installSupportFiles(
    String coreId, {
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final support = coreSupportFilesFor(coreId);
    if (support == null) return;
    if (await coreSupportFilesInstalled(coreId)) return;
    final response = await _dio.get<List<int>>(
      support.url,
      cancelToken: cancelToken,
      options: Options(responseType: ResponseType.bytes),
      onReceiveProgress: (received, total) {
        if (onProgress != null && total > 0) onProgress(received / total);
      },
    );
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw StateError('Empty support file download');
    }
    if (cancelToken?.cancelError case final error?) throw error;

    // A partial unpack would look installed, so the payload lands in a scratch
    // folder and only takes the real name once it's complete.
    final target = await coreSupportDirectory(support);
    final staging = Directory('${target.path}.part');
    if (await staging.exists()) await staging.delete(recursive: true);
    await staging.create(recursive: true);
    try {
      unpackSupportArchive(bytes, support.folder, staging);
      if (!await File('${staging.path}/${support.markerFile}').exists()) {
        throw StateError('Support files incomplete');
      }
      if (cancelToken?.cancelError case final error?) throw error;
      if (await target.exists()) await target.delete(recursive: true);
      await staging.rename(target.path);
    } catch (_) {
      if (await staging.exists()) await staging.delete(recursive: true);
      rethrow;
    }
  }

  /// Deletes the installed core file and its support files, and forgets it.
  Future<void> remove(String coreId) async {
    final dir = await coresDirectory();
    final file = File('${dir.path}/${coreFileName(coreId)}');
    if (await file.exists()) await file.delete();
    final support = coreSupportFilesFor(coreId);
    if (support != null) {
      final target = await coreSupportDirectory(support);
      if (await target.exists()) await target.delete(recursive: true);
    }
    await _markInstalled(coreId, false);
  }

  /// How much of the install is the core file itself, from the listed sizes, so
  /// both downloads share one progress bar.
  double _coreShare(String coreId, CoreSupportFiles support) {
    for (final core in downloadableCores) {
      if (core.coreId != coreId) continue;
      final coreOnly = (core.approxSizeMb - support.approxSizeMb).clamp(
        1.0,
        core.approxSizeMb,
      );
      return coreOnly / (coreOnly + support.approxSizeMb);
    }
    return 0.5;
  }

  /// The single core binary inside a buildbot zip, whatever it is named.
  Uint8List? _extractCore(List<int> zipBytes) {
    final archive = ZipDecoder().decodeBytes(zipBytes);
    for (final entry in archive) {
      if (!entry.isFile) continue;
      final name = entry.name.toLowerCase();
      if (name.endsWith('.so') ||
          name.endsWith('.dll') ||
          name.endsWith('.dylib')) {
        return entry.content;
      }
    }
    return null;
  }

  Future<void> _markInstalled(String coreId, bool value) async {
    final current = installed.toList();
    if (value) {
      if (!current.contains(coreId)) current.add(coreId);
    } else {
      current.remove(coreId);
    }
    await _store.setStringList(installedCoresPreferenceKey, current);
  }
}

/// Writes the entries under [folder] into [destination], flattening away the
/// zip's top-level folder. Entries outside that folder, and any path climbing
/// out of it, are skipped, since the archive comes off the network.
@visibleForTesting
void unpackSupportArchive(
  List<int> zipBytes,
  String folder,
  Directory destination,
) {
  final archive = ZipDecoder().decodeBytes(zipBytes);
  final prefix = '$folder/';
  for (final entry in archive) {
    if (!entry.isFile) continue;
    final name = entry.name.replaceAll('\\', '/');
    if (!name.startsWith(prefix)) continue;
    final relative = name.substring(prefix.length);
    if (relative.isEmpty ||
        relative.startsWith('/') ||
        relative.split('/').contains('..')) {
      continue;
    }
    final out = File('${destination.path}/$relative');
    out.parent.createSync(recursive: true);
    out.writeAsBytesSync(entry.readBytes() ?? const <int>[]);
  }
}
