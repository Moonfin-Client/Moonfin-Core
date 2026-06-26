import 'dart:async';

import 'package:flutter/material.dart';

const bookDiscoverPageSize = 24;

const bookDiscoverSubjectsPrefKey = 'book_discover_subjects';
const bookDiscoverAudiobookGenresPrefKey = 'book_discover_audiobook_genres';

const bookDiscoverAccent = Color(0xFF32B9E8);

const bookDiscoverGenrePool = <String>[
  'architecture',
  'art__art_instruction',
  'history_of_art__art__design_styles',
  'dance',
  'design',
  'fashion',
  'film',
  'graphic_design',
  'music',
  'music_theory',
  'painting__paintings',
  'photography',
  'bears',
  'cats',
  'kittens',
  'dogs',
  'puppies',
  'fiction',
  'romance',
  'fantasy',
  'mystery_and_detective_stories',
  'magic',
  'literature',
  'plays',
  'short_stories',
  'young_adult_fiction',
  'sciencemathematics',
  'biology',
  'chemistry',
  'mathematics',
  'physics',
  'programming',
  'business',
  'management',
  'entrepreneurship',
  'business__economics',
  'success_in_business',
  'finance',
  'mystery',
  'science_fiction',
  'juvenile_fiction',
  'juvenile_literature',
  'stories_in_rhyme',
  'infancy',
  'bedtime',
  'picture_books',
  'history',
  'ancient_civilization',
  'archaeology',
  'anthropology',
  'cooking',
  'cookbooks',
  'mental_health',
  'exercise',
  'nutrition',
  'self-help',
  'biography',
  'autobiography',
  'religion',
  'political_science',
  'psychology',
  'place%3Abrazil',
  'place%3Aindia',
  'place%3Aindonesia',
  'place%3Aunited_states',
  'textbooks',
  'historical_fiction',
  'thriller',
  'horror',
  'poetry',
];

const bookDiscoverSubjectLabelOverrides = <String, String>{
  'art__art_instruction': 'Art Instruction',
  'history_of_art__art__design_styles': 'Art History',
  'painting__paintings': 'Painting',
  'mystery_and_detective_stories': 'Mystery and Detective Stories',
  'young_adult_fiction': 'Young Adult',
  'sciencemathematics': 'Science & Mathematics',
  'business__economics': 'Business Economics',
  'success_in_business': 'Business Success',
  'juvenile_fiction': "Children's",
  'juvenile_literature': 'Kids Books',
  'stories_in_rhyme': 'Stories in Rhyme',
  'place%3Abrazil': 'Brazil',
  'place%3Aindia': 'India',
  'place%3Aindonesia': 'Indonesia',
  'place%3Aunited_states': 'United States',
};

const librivoxGenrePool = <String>[
  'Action & Adventure',
  'Adventure Fiction',
  'Biography & Autobiography',
  "Children's Fiction",
  'Classical',
  'Detective Fiction',
  'Drama',
  'Fantasy Fiction',
  'General Fiction',
  'General Non-fiction',
  'Historical Fiction',
  'Horror & Supernatural Fiction',
  'Humor',
  'Humorous Fiction',
  'Mystery & Detective Stories',
  'Mythology',
  'Nature',
  'Naval Fiction',
  'Philosophy',
  'Plays',
  'Poetry',
  'Religion',
  'Romance',
  'Satire',
  'Science Fiction',
  'Short Stories',
  'Travel & Geography',
  'Tragedy',
  'War & Military Fiction',
  'Westerns',
];

const audiobookPlaceholderColors = <Color>[
  Color(0xFF1A5C9A),
  Color(0xFF2E7D32),
  Color(0xFF6A1B9A),
  Color(0xFF00695C),
  Color(0xFFC62828),
  Color(0xFF4527A0),
  Color(0xFF558B2F),
  Color(0xFF283593),
  Color(0xFF4E342E),
  Color(0xFF00838F),
];

String displayBookGenre(String slug) {
  final overridden = bookDiscoverSubjectLabelOverrides[slug];
  if (overridden != null) return overridden;

  final decoded = Uri.decodeComponent(slug);
  final normalized = decoded.replaceAll(RegExp(r'_+'), ' ').replaceAll(':', ' ');
  final words = normalized
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
      .toList();
  return words.join(' ');
}

class DiscoverBook {
  final String identity;
  final String title;
  final String author;
  final String? coverUrl;
  final String? workKey;
  final int? firstPublishYear;

  const DiscoverBook({
    required this.identity,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.workKey,
    required this.firstPublishYear,
  });

  factory DiscoverBook.fromOpenLibraryMap(Map<String, dynamic> map) {
    final key = map['key'] as String? ?? '';
    final title = (map['title'] as String? ?? '').trim();
    final authorNamesFromSearch =
        (map['author_name'] as List?)
            ?.whereType<String>()
            .map((name) => name.trim())
            .where((name) => name.isNotEmpty)
            .toList() ??
        const <String>[];
    final authorNamesFromWorks =
        (map['authors'] as List?)
            ?.whereType<Map>()
            .map((a) => (a['name'] as String? ?? '').trim())
            .where((name) => name.isNotEmpty)
            .toList() ??
        const <String>[];
    final author = authorNamesFromSearch.isNotEmpty
        ? authorNamesFromSearch.first
        : authorNamesFromWorks.isNotEmpty
        ? authorNamesFromWorks.first
        : 'Unknown Author';

    final coverId =
        (map['cover_i'] as num?)?.toInt() ?? (map['cover_id'] as num?)?.toInt();
    final coverUrl = coverId != null
        ? 'https://covers.openlibrary.org/b/id/$coverId-M.jpg'
        : null;
    final firstPublishYear = (map['first_publish_year'] as num?)?.toInt();

    return DiscoverBook(
      identity: key.isNotEmpty ? key : '$title::$author',
      title: title,
      author: author,
      coverUrl: coverUrl,
      workKey: key.startsWith('/works/') ? key : null,
      firstPublishYear: firstPublishYear,
    );
  }
}

class LibrivoxBook {
  final String id;
  final String title;
  final String authorName;
  final List<String> isbns;
  final String? description;
  final String? language;
  final int? copyrightYear;
  final int? sectionCount;
  final List<String> genres;
  final List<String> readerNames;
  final String? archiveUrl;
  final String? zipUrl;
  final String? rssUrl;
  final String? librivoxUrl;
  final int totalTimeSecs;

  const LibrivoxBook({
    required this.id,
    required this.title,
    required this.authorName,
    required this.isbns,
    required this.description,
    required this.language,
    required this.copyrightYear,
    required this.sectionCount,
    required this.genres,
    required this.readerNames,
    required this.archiveUrl,
    required this.zipUrl,
    required this.rssUrl,
    required this.librivoxUrl,
    required this.totalTimeSecs,
  });

  factory LibrivoxBook.fromMap(Map<String, dynamic> map) {
    final id = (map['id'] ?? '').toString().trim();
    final title = (map['title'] as String? ?? '').trim();
    final authors = (map['authors'] as List?) ?? const [];
    final authorName =
        authors
            .whereType<Map>()
            .map((a) {
              final first = (a['first_name'] as String? ?? '').trim();
              final last = (a['last_name'] as String? ?? '').trim();
              return [first, last].where((n) => n.isNotEmpty).join(' ');
            })
            .where((name) => name.isNotEmpty)
            .firstOrNull ??
        'Unknown Author';
    final isbns = <String>{};
    String? normalizeIsbn(dynamic raw) {
      final value = (raw ?? '').toString().trim();
      if (value.isEmpty) return null;
      final normalized = value
          .replaceAll(RegExp(r'[^0-9Xx]'), '')
          .toUpperCase();
      if (normalized.length == 10 || normalized.length == 13) {
        return normalized;
      }
      return null;
    }

    for (final key in const [
      'isbn',
      'isbn13',
      'isbn_13',
      'isbn10',
      'isbn_10',
    ]) {
      final raw = map[key];
      if (raw is List) {
        for (final item in raw) {
          final parsed = normalizeIsbn(item);
          if (parsed != null) isbns.add(parsed);
        }
      } else {
        final parsed = normalizeIsbn(raw);
        if (parsed != null) isbns.add(parsed);
      }
    }
    final description = (map['description'] as String?)?.trim();
    final language = (map['language'] as String?)?.trim();

    int? parseField(dynamic v) => v is num
        ? v.toInt()
        : v is String
        ? int.tryParse(v)
        : null;
    final copyrightYear = parseField(map['copyright_year']);
    final sectionCount = parseField(map['num_sections']);
    final totalTimeSecs = parseField(map['totaltimesecs']) ?? 0;
    final genres = ((map['genres'] as List?) ?? const <dynamic>[])
        .whereType<Map>()
        .map((g) => (g['name'] as String? ?? '').trim())
        .where((name) => name.isNotEmpty)
        .toSet()
        .toList();
    final readerNames = ((map['readers'] as List?) ?? const <dynamic>[])
        .whereType<Map>()
        .map((reader) {
          final first = (reader['first_name'] as String? ?? '').trim();
          final last = (reader['last_name'] as String? ?? '').trim();
          final display = (reader['display_name'] as String? ?? '').trim();
          if (display.isNotEmpty) return display;
          return [first, last].where((n) => n.isNotEmpty).join(' ');
        })
        .where((name) => name.isNotEmpty)
        .toSet()
        .toList();

    String? parseUrl(String key) {
      final v = (map[key] as String? ?? '').trim();
      return v.isEmpty ? null : v;
    }

    final archiveUrl = parseUrl('url_iarchive');
    final zipUrl = parseUrl('url_zip_file');
    final rssUrl = parseUrl('url_rss');
    final librivoxUrl = parseUrl('url_librivox');

    return LibrivoxBook(
      id: id,
      title: title,
      authorName: authorName,
      isbns: isbns.toList(),
      description: description,
      language: language,
      copyrightYear: copyrightYear,
      sectionCount: sectionCount,
      genres: genres,
      readerNames: readerNames,
      archiveUrl: archiveUrl,
      zipUrl: zipUrl,
      rssUrl: rssUrl,
      librivoxUrl: librivoxUrl,
      totalTimeSecs: totalTimeSecs,
    );
  }

  String? get preferredIsbn => isbns.firstOrNull;

  String get formattedDuration {
    if (totalTimeSecs <= 0) return '';
    final hours = totalTimeSecs ~/ 3600;
    final minutes = (totalTimeSecs % 3600) ~/ 60;
    if (hours > 0) return '${hours}h ${minutes}m';
    if (minutes > 0) return '${minutes}m';
    return '${totalTimeSecs}s';
  }
}

class HoverMarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const HoverMarqueeText({super.key, required this.text, required this.style});

  @override
  State<HoverMarqueeText> createState() => _HoverMarqueeTextState();
}

class _HoverMarqueeTextState extends State<HoverMarqueeText> {
  final ScrollController _controller = ScrollController();
  bool _hovering = false;
  bool _running = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _runMarquee() async {
    if (_running || !_hovering) return;
    _running = true;
    try {
      while (_hovering && mounted) {
        if (!_controller.hasClients) break;
        final max = _controller.position.maxScrollExtent;
        if (max <= 0) break;

        final forwardMs = (max * 24).clamp(700, 4200).toInt();
        final backwardMs = (max * 18).clamp(500, 3200).toInt();

        await _controller.animateTo(
          max,
          duration: Duration(milliseconds: forwardMs),
          curve: Curves.linear,
        );
        if (!_hovering || !mounted) break;
        await Future.delayed(const Duration(milliseconds: 240));
        if (!_hovering || !mounted) break;
        await _controller.animateTo(
          0,
          duration: Duration(milliseconds: backwardMs),
          curve: Curves.easeOut,
        );
        if (!_hovering || !mounted) break;
        await Future.delayed(const Duration(milliseconds: 200));
      }
    } finally {
      _running = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _hovering = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            unawaited(_runMarquee());
          }
        });
      },
      onExit: (_) {
        _hovering = false;
        if (_controller.hasClients) {
          _controller.animateTo(
            0,
            duration: const Duration(milliseconds: 160),
            curve: Curves.easeOut,
          );
        }
      },
      child: ClipRect(
        child: SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              widget.text,
              softWrap: false,
              overflow: TextOverflow.visible,
              maxLines: 1,
              style: widget.style,
            ),
          ),
        ),
      ),
    );
  }
}
