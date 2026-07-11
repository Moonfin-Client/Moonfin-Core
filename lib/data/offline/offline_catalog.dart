import 'dart:async';
import 'dart:convert';

import '../database/offline_database.dart';
import '../repositories/offline_repository.dart';

/// One completed download with its parsed (and live-position-merged) server
/// metadata.
class OfflineEntry {
  final DownloadedItem row;

  /// The full server item JSON stored at download time, with `UserData`
  /// overridden from the row's live `playbackPositionTicks` (updated by the
  /// offline playback tracker) so resume/played state is always current.
  final Map<String, dynamic> metadata;

  OfflineEntry(this.row, this.metadata);

  String get id => row.itemId;
  String get type => row.type;

  String? get sortName {
    final sort = metadata['SortName'] as String?;
    if (sort != null && sort.isNotEmpty) return sort;
    return metadata['Name'] as String? ?? row.name;
  }

  List<String> get genres =>
      ((metadata['Genres'] as List?) ?? const []).whereType<String>().toList();

  Map<String, dynamic>? get userData =>
      (metadata['UserData'] as Map?)?.cast<String, dynamic>();

  int? get runTimeTicks => (metadata['RunTimeTicks'] as num?)?.toInt();

  bool get isPlayed => userData?['Played'] == true;

  bool get isFavorite => userData?['IsFavorite'] == true;
}

/// In-memory snapshot of all completed downloads, shared by the offline API
/// implementations. Image URLs must resolve synchronously, so the catalog is
/// warmed once at startup and re-warmed (debounced) whenever the downloads
/// table changes.
class OfflineCatalog {
  final OfflineRepository _repo;

  List<OfflineEntry> _entries = const [];
  Map<String, OfflineEntry> _byId = const {};
  StreamSubscription<List<DownloadedItem>>? _sub;
  Timer? _debounce;
  final _changes = StreamController<void>.broadcast();

  OfflineCatalog(this._repo);

  List<OfflineEntry> get entries => _entries;

  Stream<void> get changes => _changes.stream;

  OfflineEntry? byId(String itemId) => _byId[itemId];

  Future<void> warm() async {
    await _rebuild();
    _sub ??= _repo.watchItems().listen((_) {
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 400), () {
        _rebuild().then((_) => _changes.add(null));
      });
    });
  }

  Future<void> _rebuild() async {
    final rows = await _repo.getItems(onlyCompleted: true);
    final entries = <OfflineEntry>[];
    final byId = <String, OfflineEntry>{};
    for (final row in rows) {
      Map<String, dynamic> metadata;
      try {
        final decoded = jsonDecode(row.metadataJson);
        metadata = decoded is Map<String, dynamic>
            ? Map<String, dynamic>.from(decoded)
            : <String, dynamic>{};
      } catch (_) {
        metadata = <String, dynamic>{};
      }
      if (metadata.isEmpty) {
        metadata = {'Id': row.itemId, 'Name': row.name, 'Type': row.type};
      }
      _mergeLivePosition(metadata, row);
      final entry = OfflineEntry(row, metadata);
      entries.add(entry);
      byId[row.itemId] = entry;
    }
    _entries = entries;
    _byId = byId;
  }

  /// The metadata snapshot's UserData reflects download time, but the row's
  /// position column is what offline playback updates. Merging them means the
  /// UI, which reads UserData, always sees the live position.
  void _mergeLivePosition(Map<String, dynamic> metadata, DownloadedItem row) {
    final userData = <String, dynamic>{
      ...?(metadata['UserData'] as Map?)?.cast<String, dynamic>(),
    };
    final ticks = row.playbackPositionTicks;
    final runtime = (metadata['RunTimeTicks'] as num?)?.toInt();
    if (ticks > 0) {
      if (runtime != null && runtime > 0 && ticks >= runtime * 0.9) {
        userData['Played'] = true;
        userData['PlaybackPositionTicks'] = 0;
        userData.remove('PlayedPercentage');
      } else {
        userData['PlaybackPositionTicks'] = ticks;
        if (runtime != null && runtime > 0) {
          userData['PlayedPercentage'] = (ticks / runtime) * 100.0;
        }
      }
    }
    metadata['UserData'] = userData;
  }

  void dispose() {
    _debounce?.cancel();
    _sub?.cancel();
    _changes.close();
  }
}
