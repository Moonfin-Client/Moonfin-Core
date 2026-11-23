import '../services/stream_url_builder.dart' show normalizeXtreamBaseUrl;

enum PlaylistSourceType { m3uUrl, m3uFile, xtreamCodes }

class XtreamCredentials {
  final String serverUrl;
  final String username;
  final String password;

  const XtreamCredentials({
    required this.serverUrl,
    required this.username,
    required this.password,
  });

  String get normalizedUrl => normalizeXtreamBaseUrl(serverUrl);

  String get baseUrl => '$normalizedUrl/player_api.php';
}

class XtreamCategory {
  final String id;
  final String name;

  const XtreamCategory({required this.id, required this.name});

  factory XtreamCategory.fromJson(Map<String, dynamic> json) {
    return XtreamCategory(
      id:
          (json['category_id'] ?? json['categoryId'] ?? json['id'])
              ?.toString() ??
          '',
      name:
          (json['category_name'] ?? json['categoryName'] ?? json['name'])
              ?.toString()
              .trim() ??
          '',
    );
  }
}

class XtreamStream {
  final int id;
  final String name;
  final String? streamIcon;
  final String? epgChannelId;
  final int? channelNumber;
  final String categoryId;
  final String? categoryName;
  final String? containerExtension;
  final bool tvArchive;
  final int? tvArchiveDurationDays;

  /// When the provider added the movie, or last changed the series.
  final DateTime? addedAt;

  final XtreamDetails details;

  const XtreamStream({
    required this.id,
    required this.name,
    this.streamIcon,
    this.epgChannelId,
    this.channelNumber,
    required this.categoryId,
    this.categoryName,
    this.containerExtension,
    this.tvArchive = false,
    this.tvArchiveDurationDays,
    this.addedAt,
    this.details = const XtreamDetails(),
  });

  factory XtreamStream.fromJson(Map<String, dynamic> json) {
    final icon = json['stream_icon']?.toString();
    final cover = json['cover']?.toString();

    return XtreamStream(
      id:
          int.tryParse(json['stream_id']?.toString() ?? '') ??
          int.tryParse(json['series_id']?.toString() ?? '') ??
          int.tryParse(json['num']?.toString() ?? '') ??
          0,
      // Panels often pad names with spaces, which would also sort them first.
      name: json['name']?.toString().trim() ?? '',
      streamIcon: (icon != null && icon.isNotEmpty)
          ? icon
          : ((cover != null && cover.isNotEmpty) ? cover : null),
      epgChannelId: json['epg_channel_id']?.toString(),
      channelNumber: int.tryParse(json['num']?.toString() ?? ''),
      categoryId: json['category_id']?.toString() ?? '',
      categoryName: (json['category_name'] ?? json['category'])?.toString(),
      containerExtension: json['container_extension']?.toString(),
      tvArchive: json['tv_archive']?.toString() == '1',
      tvArchiveDurationDays: int.tryParse(
        json['tv_archive_duration']?.toString() ?? '',
      ),
      addedAt: _epochSeconds(json['added'] ?? json['last_modified']),
      details: XtreamDetails.fromJson(json),
    );
  }
}

/// Catalog details a panel may send with a list entry or from get_vod_info
/// and get_series_info. Whatever the panel leaves blank stays null.
class XtreamDetails {
  final String? plot;
  final String? genre;
  final int? year;
  final double? rating;
  final int? durationSeconds;
  final String? backdropUrl;
  final int? tmdbId;

  const XtreamDetails({
    this.plot,
    this.genre,
    this.year,
    this.rating,
    this.durationSeconds,
    this.backdropUrl,
    this.tmdbId,
  });

  factory XtreamDetails.fromJson(Map<String, dynamic> json) {
    String? text(List<String> keys) {
      for (final key in keys) {
        final value = json[key]?.toString().trim();
        if (value != null && value.isNotEmpty) return value;
      }
      return null;
    }

    int? positive(String? value) {
      final n = int.tryParse(value ?? '');
      return n != null && n > 0 ? n : null;
    }

    final released = text([
      'year',
      'releaseDate',
      'releasedate',
      'release_date',
    ]);
    final rating = double.tryParse(text(['rating']) ?? '');
    final backdrop = json['backdrop_path'];
    return XtreamDetails(
      plot: text(['plot', 'description']),
      genre: text(['genre']),
      year: positive(RegExp(r'(19|20)\d{2}').firstMatch(released ?? '')?[0]),
      rating: rating != null && rating > 0 ? rating : null,
      durationSeconds:
          positive(text(['duration_secs'])) ??
          _clockSeconds(text(['duration'])),
      backdropUrl: switch (backdrop) {
        List() =>
          backdrop
              .map((b) => b.toString().trim())
              .where((b) => b.isNotEmpty)
              .firstOrNull,
        String() when backdrop.trim().isNotEmpty => backdrop.trim(),
        _ => null,
      },
      tmdbId: positive(text(['tmdb_id', 'tmdb'])),
    );
  }
}

/// "01:42:10" style durations. Anything else isn't a duration.
int? _clockSeconds(String? value) {
  final parts = value?.split(':');
  if (parts == null || parts.length != 3) return null;
  final [h, m, s] = [for (final p in parts) int.tryParse(p)];
  if (h == null || m == null || s == null) return null;
  final total = h * 3600 + m * 60 + s;
  return total > 0 ? total : null;
}

DateTime? _epochSeconds(Object? value) {
  final seconds = int.tryParse(value?.toString() ?? '');
  if (seconds == null || seconds <= 0) return null;
  return DateTime.fromMillisecondsSinceEpoch(seconds * 1000, isUtc: true);
}
