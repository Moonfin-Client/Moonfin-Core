import '../data/database/offline_database.dart';

/// One row in the saved media list. A movie or a track stands on its own, and
/// every episode saved from the same series is collected under one entry so the
/// list says how much of that series is actually on the device.
class DownloadGroup {
  DownloadGroup({
    required this.key,
    required this.title,
    required this.items,
    this.seriesId,
  });

  /// Stable identity for the row, which is the item id for a single download
  /// and the series id for a series.
  final String key;
  final String title;

  /// Null for anything that is not part of a series.
  final String? seriesId;

  /// The single download, or the saved episodes in playing order.
  final List<DownloadedItem> items;

  bool get isSeries => seriesId != null;

  DownloadedItem get first => items.first;

  int get totalBytes =>
      items.fold(0, (sum, item) => sum + item.fileSizeBytes);

  List<String> get itemIds =>
      items.map((item) => item.itemId).toList(growable: false);
}

/// Collects saved downloads into the rows the saved media list shows.
///
/// Episodes carrying a series id gather under that series, everything else
/// stands alone. Rows are ordered by how much space they take, matching the
/// flat list this replaces, and episodes within a series run in playing order
/// so a viewer can see which ones they have.
List<DownloadGroup> groupDownloads(List<DownloadedItem> items) {
  const seriesPrefix = 'series:';
  final grouped = <String, List<DownloadedItem>>{};

  for (final item in items) {
    final seriesId = item.seriesId;
    final key =
        item.type == 'Episode' && seriesId != null && seriesId.isNotEmpty
        ? '$seriesPrefix$seriesId'
        : 'item:${item.itemId}';
    grouped.putIfAbsent(key, () => <DownloadedItem>[]).add(item);
  }

  final built = <DownloadGroup>[];
  grouped.forEach((key, saved) {
    final seriesId = key.startsWith(seriesPrefix)
        ? key.substring(seriesPrefix.length)
        : null;
    if (seriesId != null) {
      saved.sort(_byEpisodeOrder);
    }
    built.add(
      DownloadGroup(
        key: key,
        title: seriesId != null
            ? (saved.first.seriesName ?? saved.first.name)
            : saved.first.name,
        seriesId: seriesId,
        items: saved,
      ),
    );
  });

  built.sort((a, b) => b.totalBytes.compareTo(a.totalBytes));
  return built;
}

/// Season then episode, with anything unnumbered falling to the end by name so
/// specials and oddly tagged files still land somewhere predictable.
int _byEpisodeOrder(DownloadedItem a, DownloadedItem b) {
  final season = (a.parentIndexNumber ?? 1 << 30)
      .compareTo(b.parentIndexNumber ?? 1 << 30);
  if (season != 0) return season;
  final episode =
      (a.indexNumber ?? 1 << 30).compareTo(b.indexNumber ?? 1 << 30);
  if (episode != 0) return episode;
  return a.name.compareTo(b.name);
}

/// The short "S2 E5" style label for a saved episode, or null when the file
/// carries no numbering to show.
String? episodeNumberLabel(DownloadedItem item) {
  final season = item.parentIndexNumber;
  final episode = item.indexNumber;
  if (season == null && episode == null) return null;
  if (season == null) return 'E$episode';
  if (episode == null) return 'S$season';
  return 'S$season E$episode';
}

/// What a system notification calls a download: "Series S1E1" for a
/// numbered episode, otherwise the item's own [name]. An episode title on
/// its own says nothing about which show just finished.
String downloadNotificationLabel({
  required String name,
  String? seriesName,
  int? season,
  int? episode,
}) {
  final series = seriesName?.trim();
  if (series == null || series.isEmpty || season == null || episode == null) {
    return name;
  }
  return '$series S${season}E$episode';
}
