import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

const Set<String> sponsorBlockDefaultCategories = {
  'sponsor',
  'selfpromo',
  'interaction',
  'intro',
  'outro',
  'preview',
  'music_offtopic',
  'filler',
};

class SponsorBlockService {
  static const _requestTimeout = Duration(seconds: 4);
  static const _successTtl = Duration(hours: 12);
  static const _emptyTtl = Duration(minutes: 30);

  final Dio _dio;
  final Map<String, _CacheEntry> _cache = <String, _CacheEntry>{};

  SponsorBlockService({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<SponsorBlockSegment>> fetchSegments(
    String videoId, {
    required Set<String> categories,
  }) async {
    final normalizedVideoId = videoId.trim();
    if (normalizedVideoId.isEmpty || categories.isEmpty) {
      return const <SponsorBlockSegment>[];
    }

    final sortedCategories = categories.toList()..sort();
    final cacheKey = '$normalizedVideoId|${sortedCategories.join(',')}';
    final now = DateTime.now();
    final cached = _cache[cacheKey];
    if (cached != null && cached.expiresAt.isAfter(now)) {
      return cached.segments;
    }

    try {
      // Only a short hash prefix leaves the device, so SponsorBlock can't tell
      // which trailer is playing among the videos that share it.
      final prefix = sha256
          .convert(utf8.encode(normalizedVideoId))
          .toString()
          .substring(0, 4);
      final response = await _dio.get<List<dynamic>>(
        'https://sponsor.ajay.app/api/skipSegments/$prefix',
        queryParameters: <String, dynamic>{
          'categories': jsonEncode(sortedCategories),
        },
        options: Options(
          sendTimeout: _requestTimeout,
          receiveTimeout: _requestTimeout,
        ),
      );

      final match = (response.data ?? const <dynamic>[])
          .whereType<Map>()
          .where((entry) => entry['videoID'] == normalizedVideoId)
          .firstOrNull;
      final raw = match?['segments'] as List? ?? const <dynamic>[];
      final parsed = _normalizeSegments(
        raw
            .whereType<Map>()
            .map(
              (entry) =>
                  SponsorBlockSegment.fromJson(entry.cast<String, dynamic>()),
            )
            .whereType<SponsorBlockSegment>()
            .toList(),
      );

      _cache[cacheKey] = _CacheEntry(
        segments: parsed,
        expiresAt: now.add(parsed.isEmpty ? _emptyTtl : _successTtl),
      );
      return parsed;
    } catch (_) {
      _cache[cacheKey] = _CacheEntry(
        segments: const <SponsorBlockSegment>[],
        expiresAt: now.add(_emptyTtl),
      );
      return const <SponsorBlockSegment>[];
    }
  }

  List<SponsorBlockSegment> _normalizeSegments(
    List<SponsorBlockSegment> segments,
  ) {
    if (segments.isEmpty) return const <SponsorBlockSegment>[];
    final ordered = List<SponsorBlockSegment>.from(segments)
      ..sort((a, b) => a.start.compareTo(b.start));

    final merged = <SponsorBlockSegment>[];
    for (final segment in ordered) {
      if (merged.isEmpty) {
        merged.add(segment);
        continue;
      }

      final last = merged.last;
      if (segment.start <= last.end) {
        merged[merged.length - 1] = SponsorBlockSegment(
          id: '${last.id}|${segment.id}',
          category: last.category,
          start: last.start,
          end: segment.end > last.end ? segment.end : last.end,
        );
      } else {
        merged.add(segment);
      }
    }

    return List.unmodifiable(merged);
  }
}

class SponsorBlockSegment {
  final String id;
  final String category;
  final Duration start;
  final Duration end;

  const SponsorBlockSegment({
    required this.id,
    required this.category,
    required this.start,
    required this.end,
  });

  Duration get duration => end - start;

  static SponsorBlockSegment? fromJson(Map<String, dynamic> json) {
    final range = json['segment'];
    if (range is! List || range.length < 2) return null;

    final startSeconds = _asDouble(range[0]);
    final endSeconds = _asDouble(range[1]);
    if (startSeconds == null || endSeconds == null) return null;
    if (startSeconds < 0 || endSeconds <= startSeconds) return null;

    final category = (json['category'] as String? ?? '').trim();
    if (category.isEmpty) return null;

    final start = Duration(milliseconds: (startSeconds * 1000).round());
    final end = Duration(milliseconds: (endSeconds * 1000).round());
    if (end <= start) return null;

    return SponsorBlockSegment(
      id: '$category:${start.inMilliseconds}-${end.inMilliseconds}',
      category: category,
      start: start,
      end: end,
    );
  }

  static double? _asDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}

class SponsorBlockSkipSession {
  static const _minSegmentDuration = Duration(milliseconds: 800);

  List<SponsorBlockSegment> _segments = const <SponsorBlockSegment>[];
  SponsorBlockSegment? _activeSegment;

  void setSegments(List<SponsorBlockSegment> segments) {
    _segments = segments;
    _activeSegment = null;
  }

  void clear() {
    _segments = const <SponsorBlockSegment>[];
    _activeSegment = null;
  }

  SponsorBlockSkipDecision checkPosition(Duration position) {
    if (_segments.isEmpty) {
      _activeSegment = null;
      return SponsorBlockSkipDecision.none;
    }

    for (final segment in _segments) {
      if (position >= segment.start && position < segment.end) {
        if (segment.duration < _minSegmentDuration) {
          return SponsorBlockSkipDecision.none;
        }

        if (_activeSegment?.id == segment.id) {
          return SponsorBlockSkipDecision.none;
        }

        _activeSegment = segment;
        return SponsorBlockSkipDecision(skipTo: segment.end, segment: segment);
      }
    }

    _activeSegment = null;
    return SponsorBlockSkipDecision.none;
  }
}

class SponsorBlockSkipDecision {
  final Duration? skipTo;
  final SponsorBlockSegment? segment;

  const SponsorBlockSkipDecision({this.skipTo, this.segment});

  static const none = SponsorBlockSkipDecision();

  bool get shouldSkip => skipTo != null;
}

class _CacheEntry {
  final List<SponsorBlockSegment> segments;
  final DateTime expiresAt;

  const _CacheEntry({required this.segments, required this.expiresAt});
}
