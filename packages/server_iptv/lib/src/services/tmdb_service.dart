import 'package:dio/dio.dart';

/// A movie or show matched on TMDB, carrying the artwork and metadata used to
/// upgrade provider supplied VOD entries.
class TmdbResult {
  final int id;
  final String? posterPath;
  final String? backdropPath;
  final String? logoPath;
  final double? voteAverage;
  final String? overview;
  final String? releaseDate;
  final String? tagline;
  final int? runtime;
  final List<String> genres;

  const TmdbResult({
    required this.id,
    this.posterPath,
    this.backdropPath,
    this.logoPath,
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.tagline,
    this.runtime,
    this.genres = const [],
  });

  /// Reads a search result or a details answer, which share their fields.
  /// Only details carry the genres, tagline, runtime and logos.
  factory TmdbResult.fromJson(Map<String, dynamic> json) {
    final logos = [
      ...?(json['images'] as Map?)?['logos'] as List?,
    ].whereType<Map>().toList();
    // An English logo first, then a language neutral one.
    final logo =
        logos.where((l) => l['iso_639_1'] == 'en').firstOrNull ??
        logos.where((l) => l['iso_639_1'] == null).firstOrNull ??
        logos.firstOrNull;
    final episodeRunTimes = json['episode_run_time'] as List?;
    final tagline = json['tagline']?.toString().trim();
    return TmdbResult(
      id: json['id'] as int? ?? 0,
      posterPath: json['poster_path']?.toString(),
      backdropPath: json['backdrop_path']?.toString(),
      logoPath: logo?['file_path']?.toString(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      overview: json['overview']?.toString(),
      releaseDate: (json['release_date'] ?? json['first_air_date'])?.toString(),
      tagline: tagline == null || tagline.isEmpty ? null : tagline,
      runtime:
          (json['runtime'] as num?)?.toInt() ??
          (episodeRunTimes?.firstOrNull as num?)?.toInt(),
      genres: [
        for (final genre in (json['genres'] as List? ?? const []))
          if ((genre as Map)['name']?.toString() case final name?
              when name.isNotEmpty)
            name,
      ],
    );
  }

  int? get year {
    if (releaseDate == null || releaseDate!.length < 4) return null;
    return int.tryParse(releaseDate!.substring(0, 4));
  }

  String? get posterUrl =>
      posterPath != null ? 'https://image.tmdb.org/t/p/w500$posterPath' : null;

  String? get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w780$backdropPath'
      : null;

  String? get logoUrl =>
      logoPath != null ? 'https://image.tmdb.org/t/p/w500$logoPath' : null;
}

/// Thin TMDB client. The API key comes from a caller supplied provider so the
/// package stays free of preference storage, and every call degrades to null
/// on failure since enrichment is strictly best effort.
class TmdbService {
  final Dio _dio;
  final String? Function() _apiKeyProvider;

  static const _baseUrl = 'https://api.themoviedb.org/3';

  TmdbService({String? Function()? apiKeyProvider, Dio? dio})
    : _apiKeyProvider = apiKeyProvider ?? (() => null),
      _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: _baseUrl,
              connectTimeout: const Duration(seconds: 6),
              receiveTimeout: const Duration(seconds: 6),
            ),
          );

  bool get isConfigured {
    final key = _apiKeyProvider();
    return key != null && key.trim().isNotEmpty;
  }

  Future<TmdbResult?> searchMovie(String title, {int? year}) =>
      _search('movie', title, {'year': ?year});

  Future<TmdbResult?> searchTv(String title, {int? year}) =>
      _search('tv', title, {'first_air_date_year': ?year});

  Future<TmdbResult?> getMovieDetails(int tmdbId) => _details('movie', tmdbId);

  Future<TmdbResult?> getTvDetails(int tmdbId) => _details('tv', tmdbId);

  Future<TmdbResult?> _search(
    String kind,
    String title,
    Map<String, int> extra,
  ) async {
    final data = await _get('/search/$kind', {'query': title, ...extra});
    final first = (data?['results'] as List?)?.firstOrNull;
    return first is Map<String, dynamic> ? TmdbResult.fromJson(first) : null;
  }

  Future<TmdbResult?> _details(String kind, int tmdbId) async {
    final data = await _get('/$kind/$tmdbId', {
      'append_to_response': 'images',
      'include_image_language': 'en,null',
    });
    return data == null ? null : TmdbResult.fromJson(data);
  }

  Future<Map<String, dynamic>?> _get(
    String path,
    Map<String, Object> query,
  ) async {
    if (!isConfigured) return null;
    try {
      final response = await _dio.get(
        path,
        queryParameters: {'api_key': _apiKeyProvider(), ...query},
      );
      return response.data is Map<String, dynamic>
          ? response.data as Map<String, dynamic>
          : null;
    } catch (_) {
      return null;
    }
  }
}
