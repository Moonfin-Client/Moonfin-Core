import 'dart:async';

import 'package:flutter/foundation.dart';

import '../providers/offline_providers.dart';
import '../repositories/offline_repository.dart';
import 'download_service.dart';

/// Whether there is any saved media worth opening the downloads screen for.
///
/// Counts a completed file on disk, or a transfer still running. A queued or
/// in-flight download counts so that starting your first one still leaves a
/// way in to watch it or cancel it.
///
/// Shell rows don't count. Saving an episode also writes a Series and a Season
/// row that are marked complete and carry artwork but hold no file, and the
/// saved media list already drops those in [partitionDownloadCatalog]. Asking
/// the same question here keeps the nav entry and the screen in step.
class SavedMediaPresence extends ChangeNotifier {
  SavedMediaPresence(OfflineRepository repository, this._downloads) {
    _running = _hasRunningDownload;
    _sub = repository
        .watchItems(onlyCompleted: true)
        .map(partitionDownloadCatalog)
        .listen((catalog) => _update(saved: catalog.items.isNotEmpty));
    _downloads.addListener(_onDownloadsChanged);
  }

  final DownloadService _downloads;
  StreamSubscription<void>? _sub;
  bool _saved = false;
  bool _running = false;

  bool get hasSavedMedia => _saved || _running;

  /// A finished transfer stays in the map rather than being taken out of it,
  /// so the complete and failed ones have to be skipped to tell whether
  /// anything is actually moving.
  bool get _hasRunningDownload => _downloads.activeDownloads.values.any(
    (progress) => !progress.isComplete && progress.error == null,
  );

  void _onDownloadsChanged() => _update(running: _hasRunningDownload);

  /// Only tells anyone when the answer changes. The download service reports
  /// progress as it goes, and a nav bar that rebuilt on every tick of it would
  /// be redrawing three times a second for a question it asks once.
  void _update({bool? saved, bool? running}) {
    final before = hasSavedMedia;
    if (saved != null) _saved = saved;
    if (running != null) _running = running;
    if (hasSavedMedia != before) notifyListeners();
  }

  @override
  void dispose() {
    unawaited(_sub?.cancel());
    _downloads.removeListener(_onDownloadsChanged);
    super.dispose();
  }
}
