import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../widgets/book/discover/book_discovery_models.dart';

class DiscoverBookDetailScreen extends StatefulWidget {
  final DiscoverBook book;

  const DiscoverBookDetailScreen({super.key, required this.book});

  @override
  State<DiscoverBookDetailScreen> createState() =>
      _DiscoverBookDetailScreenState();
}

class _DiscoverBookDetailScreenState extends State<DiscoverBookDetailScreen> {
  late final Future<_OpenLibraryWorkDetail?> _detailFuture;

  @override
  void initState() {
    super.initState();
    _detailFuture = _loadDetail();
  }

  Future<_OpenLibraryWorkDetail?> _loadDetail() async {
    final workKey = widget.book.workKey;
    if (workKey == null) return null;

    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 4),
        receiveTimeout: const Duration(seconds: 8),
      ),
    );
    try {
      final workFuture = dio.get<Map<String, dynamic>>(
        'https://openlibrary.org$workKey.json',
      );
      final editionFuture = _loadOpenLibraryEditionDescription(dio, workKey);
      final googleFuture = _loadGoogleBooksDescription(dio);

      final workMap = (await workFuture).data;
      if (workMap == null) return null;

      String? editionDescription;
      try {
        editionDescription = await editionFuture.timeout(
          const Duration(milliseconds: 1600),
        );
      } catch (_) {
        editionDescription = null;
      }

      String? googleDescription;
      if (editionDescription == null || editionDescription.trim().isEmpty) {
        try {
          googleDescription = await googleFuture.timeout(
            const Duration(milliseconds: 1600),
          );
        } catch (_) {
          googleDescription = null;
        }
      }

      final detailFromWork = _OpenLibraryWorkDetail.fromMap(workMap);
      final description =
          editionDescription ?? googleDescription ?? detailFromWork.description;

      return _OpenLibraryWorkDetail(
        description: description,
        subjects: detailFromWork.subjects,
      );
    } catch (_) {
      return null;
    } finally {
      dio.close(force: true);
    }
  }

  Future<String?> _loadOpenLibraryEditionDescription(
    Dio dio,
    String workKey,
  ) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://openlibrary.org$workKey/editions.json',
        queryParameters: const {'limit': 30},
      );
      final data = response.data;
      if (data == null) return null;

      final entries =
          (data['entries'] as List?)?.whereType<Map>().toList() ??
          const <Map>[];
      for (final entry in entries) {
        final description = _OpenLibraryWorkDetail.extractDescription(entry);
        if (description != null && description.trim().isNotEmpty) {
          return description.trim();
        }
      }
    } catch (_) {

    }
    return null;
  }

  Future<String?> _loadGoogleBooksDescription(Dio dio) async {
    try {
      final query =
          'intitle:${widget.book.title} inauthor:${widget.book.author}';
      final response = await dio.get<Map<String, dynamic>>(
        'https://www.googleapis.com/books/v1/volumes',
        queryParameters: {
          'q': query,
          'printType': 'books',
          'maxResults': 5,
          'orderBy': 'relevance',
        },
      );
      final data = response.data;
      if (data == null) return null;
      final items =
          (data['items'] as List?)
              ?.whereType<Map<String, dynamic>>()
              .toList() ??
          const <Map<String, dynamic>>[];
      for (final item in items) {
        final volumeInfo = item['volumeInfo'];
        if (volumeInfo is! Map) continue;
        final description = (volumeInfo['description'] as String?)?.trim();
        if (description != null && description.isNotEmpty) {
          return description;
        }
      }
    } catch (_) {

    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0F182A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.details),
      ),
      body: SafeArea(
        child: FutureBuilder<_OpenLibraryWorkDetail?>(
          future: _detailFuture,
          builder: (context, snapshot) {
            final detail = snapshot.data;
            final description = detail?.description;
            final subjects = detail?.subjects ?? const <String>[];
            final width = MediaQuery.sizeOf(context).width;
            final horizontalPadding = width >= 1200
                ? 72.0
                : width >= 800
                ? 40.0
                : 20.0;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                4,
                horizontalPadding,
                24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                          child: ClipRRect(
                            borderRadius: AppRadius.circular(16),
                            child: book.coverUrl == null
                                ? Container(
                                    color: const Color(0xFF2C77B7),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.auto_stories_rounded,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: book.coverUrl!,
                                    fit: BoxFit.cover,
                                    errorWidget: (_, _, _) => Container(
                                      color: const Color(0xFF2C77B7),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.auto_stories_rounded,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.15,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              book.author,
                              style: const TextStyle(
                                color: Color(0xFF9EDBFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (book.firstPublishYear != null) ...[
                              const SizedBox(height: 8),
                              Text(
                                l10n.firstPublished(book.firstPublishYear!),
                                style: const TextStyle(
                                  color: Color(0xFFBDD8EE),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.overview,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (snapshot.connectionState == ConnectionState.waiting)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircularProgressIndicator(color: bookDiscoverAccent),
                    )
                  else
                    Text(
                      (description == null || description.trim().isEmpty)
                          ? l10n.noOpenLibraryOverview
                          : description,
                      style: const TextStyle(
                        color: Color(0xFFD7E8F6),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  if (subjects.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text(
                      l10n.subjects,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: subjects
                          .take(24)
                          .map(
                            (s) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    ThemeRegistry.active.borders.chipBackground,
                                borderRadius:
                                    ThemeRegistry.active.borders.chipRadius,
                                border: Border.fromBorderSide(
                                  ThemeRegistry.active.borders.chipBorder,
                                ),
                              ),
                              child: Text(
                                s,
                                style: const TextStyle(
                                  color: Color(0xFFD7E8F6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OpenLibraryWorkDetail {
  final String? description;
  final List<String> subjects;

  const _OpenLibraryWorkDetail({
    required this.description,
    required this.subjects,
  });

  factory _OpenLibraryWorkDetail.fromMap(Map<String, dynamic> map) {
    final description = extractDescription(map);

    final subjects = ((map['subjects'] as List?) ?? const <dynamic>[])
        .whereType<String>()
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    return _OpenLibraryWorkDetail(description: description, subjects: subjects);
  }

  static String? extractDescription(Map map) {
    final dynamic rawDescription = map['description'];
    if (rawDescription is String) {
      return rawDescription;
    }
    if (rawDescription is Map) {
      return rawDescription['value'] as String?;
    }

    final dynamic rawFirstSentence = map['first_sentence'];
    if (rawFirstSentence is String) {
      return rawFirstSentence;
    }
    if (rawFirstSentence is Map) {
      return rawFirstSentence['value'] as String?;
    }

    return null;
  }
}
