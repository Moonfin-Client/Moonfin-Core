import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

/// Shelfmark data stays separate from Jellyfin library items. All calls use the
/// current Jellyfin origin and token. Public HTTPS cover URLs are display only.
class BooksRepository {
  BooksRepository(
    MediaServerClient client, {
    required this.username,
    @visibleForTesting Dio? dio,
  }) : _baseUrl = client.baseUrl,
       _token = client.accessToken ?? '',
       _releaseDeadline = const Duration(seconds: 240),
       _releaseDelay = Future.delayed,
       _dio =
           dio ??
           Dio(
             BaseOptions(
               connectTimeout: const Duration(seconds: 8),
               receiveTimeout: const Duration(seconds: 35),
               sendTimeout: const Duration(seconds: 8),
             ),
           );

  @visibleForTesting
  BooksRepository.forTest(
    String baseUrl,
    String token,
    Dio dio, {
    this.username = '',
    Duration releaseDeadline = const Duration(seconds: 240),
    Future<void> Function(Duration) releaseDelay = Future.delayed,
  }) : _baseUrl = baseUrl,
       _token = token,
       // ignore: prefer_initializing_formals
       _releaseDeadline = releaseDeadline,
       // ignore: prefer_initializing_formals
       _releaseDelay = releaseDelay,
       _dio = dio;

  final String _baseUrl;
  final String _token;
  final String username;
  final Dio _dio;
  final Duration _releaseDeadline;
  final Future<void> Function(Duration) _releaseDelay;

  String get _root =>
      '${_baseUrl.replaceFirst(RegExp(r'/$'), '')}/Moonfin/Books/v1';
  Options get _options => Options(
    headers: {'Authorization': 'MediaBrowser Token="$_token"'},
    contentType: Headers.jsonContentType,
    followRedirects: false,
    validateStatus: (_) => true,
  );

  Future<({int statusCode, dynamic data})> _request(
    String path, {
    Map<String, dynamic>? query,
    Object? body,
    Duration? receiveTimeout,
  }) async {
    if (_token.isEmpty || _baseUrl.isEmpty) throw const BooksApiException(401);
    try {
      final response = body == null
          ? await _dio.get(
              '$_root/$path',
              queryParameters: query,
              options: _options.copyWith(receiveTimeout: receiveTimeout),
            )
          : await _dio.post('$_root/$path', data: body, options: _options);
      final code = response.statusCode ?? 0;
      if (code < 200 || code >= 300) throw BooksApiException(code);
      var data = response.data;
      // The current proxy may serialize a JSON body as a JSON string.
      for (var i = 0; i < 2 && data is String; i++) {
        data = jsonDecode(data);
      }
      return (statusCode: code, data: data);
    } on BooksApiException {
      rethrow;
    } on DioException {
      throw const BooksApiException(0);
    } on FormatException {
      throw const BooksApiException(0);
    }
  }

  Future<void> status() async {
    await _request('Status');
  }

  Future<BooksSearchPage> search(
    String query,
    BooksMediaType type, {
    int page = 1,
  }) async {
    final data = _map(
      (await _request(
        'Search',
        query: {
          'query': query,
          'content_type': type.wire,
          'page': page,
          'limit': 40,
        },
      )).data,
    );
    return BooksSearchPage(
      books: _list(data['books']).map(BookResult.fromJson).toList(),
      hasMore: data['has_more'] == true,
      page: (data['page'] as num?)?.toInt() ?? page,
    );
  }

  Future<List<BookRelease>> releases(
    BookResult book,
    BooksMediaType type,
  ) async {
    final timer = Stopwatch()..start();
    Map<String, dynamic> query = {
      'provider': book.provider,
      'book_id': book.id,
      'content_type': type.wire,
      'title': book.title,
    };
    String? jobId;
    while (true) {
      Duration remaining() => _releaseDeadline - timer.elapsed;
      if (remaining() <= Duration.zero) throw const BooksApiException(0);
      final response = await _request(
        'Releases',
        query: query,
        receiveTimeout: const Duration(seconds: 35),
      ).timeout(remaining(), onTimeout: () => throw const BooksApiException(0));
      if (response.data is! Map) throw const BooksApiException(0);
      final data = _map(response.data);
      if (response.statusCode == 200) {
        if (data['releases'] is! List ||
            (data['releases'] as List).any((item) => item is! Map)) {
          throw const BooksApiException(0);
        }
        return _list(data['releases']).map(BookRelease.fromJson).toList();
      }
      if (response.statusCode != 202) throw const BooksApiException(0);
      final pendingId = data['job_id'];
      final retryAfter = data['retry_after'];
      if (data['status'] != 'pending' ||
          pendingId is! String ||
          !RegExp(r'^[A-Za-z0-9_-]{16,128}$').hasMatch(pendingId) ||
          (jobId != null && pendingId != jobId) ||
          retryAfter is! int ||
          retryAfter < 1) {
        throw const BooksApiException(0);
      }
      jobId = pendingId;
      query = {'job_id': jobId};
      final delay = Duration(seconds: retryAfter.clamp(1, 5));
      if (remaining() <= delay) throw const BooksApiException(0);
      await _releaseDelay(
        delay,
      ).timeout(remaining(), onTimeout: () => throw const BooksApiException(0));
    }
  }

  Future<List<BookDownload>> active() async {
    if (username.isEmpty) return const [];
    final data = _map((await _request('Status')).data);
    final entries = <BookDownload>[];
    for (final group in data.entries) {
      if (group.value is! Map) continue;
      for (final task in (group.value as Map).entries) {
        final value = _map(task.value);
        if (value['username'] != username) continue;
        entries.add(
          BookDownload(
            id: task.key.toString(),
            title:
                _string(value['title']) ??
                _string(value['book_title']) ??
                task.key.toString(),
            status: group.key,
            progress: (value['progress'] as num?)?.toDouble(),
          ),
        );
      }
    }
    return entries;
  }

  Future<void> download(
    BookResult book,
    BookRelease release,
    BooksMediaType type,
  ) async {
    final data = _map(
      (await _request(
        'Download',
        body: {
          'source': release.source,
          'source_id': release.sourceId,
          'title': book.title,
          if (book.authors.isNotEmpty) 'author': book.authors.join(', '),
          if (book.year != null) 'year': book.year,
          if (release.language != null) 'language': release.language,
          'content_type': type.wire,
          if (release.format != null) 'format': release.format,
          if (release.size != null) 'size': release.size,
        },
      )).data,
    );
    if (data['status'] != 'queued') throw const BooksApiException(0);
  }
}

class BooksApiException implements Exception {
  const BooksApiException(this.statusCode);
  final int statusCode;
}

enum BooksMediaType {
  ebook,
  audiobook;

  String get wire => name;
}

Map<String, dynamic> _map(dynamic value) =>
    value is Map ? Map<String, dynamic>.from(value) : <String, dynamic>{};
List<Map<String, dynamic>> _list(dynamic value) => value is List
    ? value
          .whereType<Map>()
          .map((item) => Map<String, dynamic>.from(item))
          .toList()
    : <Map<String, dynamic>>[];
String? _string(dynamic value) =>
    value is String && value.trim().isNotEmpty ? value : null;

class BooksSearchPage {
  const BooksSearchPage({
    required this.books,
    required this.hasMore,
    required this.page,
  });
  final List<BookResult> books;
  final bool hasMore;
  final int page;
}

class BookResult {
  const BookResult({
    required this.provider,
    required this.id,
    required this.title,
    required this.authors,
    this.year,
    this.coverUrl,
  });
  final String provider;
  final String id;
  final String title;
  final List<String> authors;
  final int? year;
  final String? coverUrl;
  factory BookResult.fromJson(Map<String, dynamic> json) => BookResult(
    provider: _string(json['provider']) ?? '',
    id: _string(json['provider_id']) ?? '',
    title: _string(json['title']) ?? '',
    authors: json['authors'] is List
        ? (json['authors'] as List).whereType<String>().toList()
        : const [],
    year: (json['publish_year'] as num?)?.toInt(),
    coverUrl: _publicCoverUrl(json['cover_url']),
  );
}

String? _publicCoverUrl(dynamic value) {
  if (value is! String) return null;
  final cover = Uri.tryParse(value);
  if (cover == null) return null;
  if (cover.scheme == 'https') return _safePublicHttpsUrl(value);

  // Shelfmark wraps an external image URL in its own cover route. Decode it
  // locally so the app never sends the image request through the Jellyfin API.
  if (cover.scheme.isNotEmpty ||
      cover.hasAuthority ||
      cover.pathSegments.length != 3 ||
      cover.pathSegments[0] != 'api' ||
      cover.pathSegments[1] != 'covers' ||
      cover.pathSegments[2].isEmpty ||
      cover.queryParametersAll['url']?.length != 1) {
    return null;
  }
  final encoded = cover.queryParametersAll['url']!.single;
  if (encoded.isEmpty || encoded.length > 4096) return null;
  try {
    return _safePublicHttpsUrl(
      utf8.decode(base64Url.decode(base64Url.normalize(encoded))),
    );
  } on FormatException {
    return null;
  }
}

String? _safePublicHttpsUrl(String value) {
  final uri = Uri.tryParse(value);
  if (uri == null ||
      uri.scheme != 'https' ||
      !uri.hasAuthority ||
      uri.userInfo.isNotEmpty ||
      uri.hasFragment ||
      uri.port != 443) {
    return null;
  }
  final host = uri.host.toLowerCase();
  if (host.length > 253 || host.contains(':')) return null; // No IP literals.
  final labels = host.split('.');
  if (labels.length < 2 ||
      labels.last.length < 2 ||
      !RegExp(r'^[a-z]+$').hasMatch(labels.last) ||
      const {
        'arpa',
        'corp',
        'example',
        'home',
        'internal',
        'invalid',
        'lan',
        'local',
        'localhost',
        'onion',
        'test',
      }.contains(labels.last)) {
    return null;
  }
  final labelPattern = RegExp(r'^[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?$');
  if (labels.any((label) => !labelPattern.hasMatch(label))) return null;
  return value;
}

class BookRelease {
  const BookRelease({
    required this.source,
    required this.sourceId,
    required this.title,
    this.format,
    this.language,
    this.size,
  });
  final String source;
  final String sourceId;
  final String title;
  final String? format;
  final String? language;
  final String? size;
  factory BookRelease.fromJson(Map<String, dynamic> json) => BookRelease(
    source: _string(json['source']) ?? '',
    sourceId: _string(json['source_id']) ?? '',
    title: _string(json['title']) ?? '',
    format: _string(json['format']),
    language: _string(json['language']),
    size: _string(json['size']),
  );
}

class BookDownload {
  const BookDownload({
    required this.id,
    required this.title,
    required this.status,
    this.progress,
  });
  final String id;
  final String title;
  final String status;
  final double? progress;
}
