import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../util/platform_detection.dart';
import '../../../screens/book/discover/discover_book_detail_screen.dart';
import '../../../screens/book/discover/librivox_authors_screen.dart';
import '../../../screens/book/discover/librivox_book_detail_screen.dart';
import '../../adaptive/sf_symbol.dart';
import 'book_discovery_models.dart';

const _bookAccent = bookDiscoverAccent;

class BookDiscoverTab extends StatefulWidget {
  final String libraryId;
  final bool isAudiobook;

  const BookDiscoverTab({
    super.key,
    required this.libraryId,
    required this.isAudiobook,
  });

  @override
  State<BookDiscoverTab> createState() => _BookDiscoverTabState();
}

class _BookDiscoverTabState extends State<BookDiscoverTab> {
  final Dio _discoverDio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 12),
    ),
  );

  List<String> _discoverGenres = const ['fantasy', 'romance', 'science_fiction'];
  final Map<String, List<DiscoverBook>> _discoverBooksByGenre = {};
  final Map<String, ScrollController> _discoverRowControllers = {};
  final Set<String> _discoverLoadingGenres = {};
  final Set<String> _discoverFailedGenres = {};
  bool _discoverInitialized = false;
  bool _discoverBootstrapping = false;

  List<String> _discoverAudiobookGenres = const [
    'Science Fiction',
    'Fantasy Fiction',
    'Mystery & Detective Stories',
  ];
  final Map<String, List<LibrivoxBook>> _discoverAudiobooksByGenre = {};
  final Map<String, ScrollController> _discoverAudiobookRowControllers = {};
  final Set<String> _discoverAudiobookLoadingGenres = {};
  final Set<String> _discoverAudiobookFailedGenres = {};
  bool _discoverAudiobookInitialized = false;
  bool _discoverAudiobookBootstrapping = false;
  final Map<String, String?> _librivoxCoverCache = {};

  @override
  void initState() {
    super.initState();
    unawaited(_loadDiscoverPreferences());
    if (widget.isAudiobook) {
      unawaited(_bootstrapAudiobookDiscovery());
    } else {
      unawaited(_bootstrapDiscovery());
    }
  }

  @override
  void dispose() {
    for (final controller in _discoverRowControllers.values) {
      controller.dispose();
    }
    for (final controller in _discoverAudiobookRowControllers.values) {
      controller.dispose();
    }
    _discoverDio.close(force: true);
    super.dispose();
  }

  Future<void> _loadDiscoverPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    final storedSubjects = prefs
        .getStringList(bookDiscoverSubjectsPrefKey)
        ?.where(bookDiscoverGenrePool.contains)
        .toSet()
        .toList();

    final storedAudiobookGenres = prefs
        .getStringList(bookDiscoverAudiobookGenresPrefKey)
        ?.where(librivoxGenrePool.contains)
        .toSet()
        .toList();

    if (!mounted) return;

    final nextSubjects = (storedSubjects == null || storedSubjects.isEmpty)
        ? _discoverGenres
        : (storedSubjects
            ..sort(
              (a, b) => displayBookGenre(a).compareTo(displayBookGenre(b)),
            ));
    final nextAudiobookGenres =
        (storedAudiobookGenres == null || storedAudiobookGenres.isEmpty)
        ? _discoverAudiobookGenres
        : (storedAudiobookGenres..sort());

    final subjectsChanged =
        nextSubjects.length != _discoverGenres.length ||
        nextSubjects.any((s) => !_discoverGenres.contains(s));
    final audiobookChanged =
        nextAudiobookGenres.length != _discoverAudiobookGenres.length ||
        nextAudiobookGenres.any((g) => !_discoverAudiobookGenres.contains(g));

    if (!subjectsChanged && !audiobookChanged) return;

    setState(() {
      if (subjectsChanged) {
        _discoverGenres = nextSubjects;
        _discoverInitialized = false;
        _discoverBooksByGenre.clear();
        _discoverLoadingGenres.clear();
        _discoverFailedGenres.clear();
        for (final controller in _discoverRowControllers.values) {
          controller.dispose();
        }
        _discoverRowControllers.clear();
      }

      if (audiobookChanged) {
        _discoverAudiobookGenres = nextAudiobookGenres;
        _discoverAudiobookInitialized = false;
        _discoverAudiobooksByGenre.clear();
        _discoverAudiobookLoadingGenres.clear();
        _discoverAudiobookFailedGenres.clear();
        for (final controller in _discoverAudiobookRowControllers.values) {
          controller.dispose();
        }
        _discoverAudiobookRowControllers.clear();
      }
    });

    if (subjectsChanged && !widget.isAudiobook) {
      unawaited(_bootstrapDiscovery());
    }
    if (audiobookChanged && widget.isAudiobook) {
      unawaited(_bootstrapAudiobookDiscovery());
    }
  }

  Future<void> _bootstrapDiscovery() async {
    if (_discoverBootstrapping) return;
    _discoverBootstrapping = true;
    try {
      await Future.wait(
        _discoverGenres.map(
          (subject) => _loadDiscoverPage(subject, reset: true),
        ),
      );
      if (mounted) {
        setState(() => _discoverInitialized = true);
      }
    } finally {
      _discoverBootstrapping = false;
    }
  }

  ScrollController _controllerForDiscoverSubject(String subject) {
    return _discoverRowControllers.putIfAbsent(subject, ScrollController.new);
  }

  Future<void> _scrollDiscoverSubjectRow(String subject, int direction) async {
    final controller = _controllerForDiscoverSubject(subject);
    if (!controller.hasClients) return;

    final viewport = controller.position.viewportDimension;
    final scrollAmount = (viewport * 0.84).clamp(180.0, 420.0);
    final target = (controller.offset + (scrollAmount * direction)).clamp(
      0.0,
      controller.position.maxScrollExtent,
    );
    if ((target - controller.offset).abs() < 1) return;

    await controller.animateTo(
      target,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _loadDiscoverPage(String subject, {bool reset = false}) async {
    if (_discoverLoadingGenres.contains(subject)) return;

    setState(() {
      _discoverLoadingGenres.add(subject);
      _discoverFailedGenres.remove(subject);
      if (reset) {
        _discoverBooksByGenre[subject] = <DiscoverBook>[];
      }
    });

    try {
      final subjectKey = Uri.decodeComponent(subject);
      final response = await _discoverDio.get<Map<String, dynamic>>(
        'https://openlibrary.org/search.json',
        queryParameters: {
          'q': 'subject_key:"$subjectKey"',
          'sort': 'trending',
          'limit': bookDiscoverPageSize,
          'page': 1,
        },
      );
      final data = response.data ?? const <String, dynamic>{};
      final docs = (data['docs'] as List?) ?? const [];
      final parsed = docs
          .whereType<Map>()
          .map(
            (w) =>
                DiscoverBook.fromOpenLibraryMap(Map<String, dynamic>.from(w)),
          )
          .where((book) => book.title.trim().isNotEmpty)
          .toList();

      if (!mounted) return;
      setState(() {
        _discoverBooksByGenre[subject] = parsed;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _discoverFailedGenres.add(subject));
    } finally {
      if (mounted) {
        setState(() => _discoverLoadingGenres.remove(subject));
      }
    }
  }

  Future<void> _showDiscoverGenreSheet() async {
    final temp = {..._discoverGenres};
    final result = await showGeneralDialog<List<String>>(
      context: context,
      barrierDismissible: true,
      barrierLabel: AppLocalizations.of(context).close,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (context, _, _) => const SizedBox.shrink(),
      transitionBuilder: (context, animation, _, _) {
        final width = MediaQuery.of(
          context,
        ).size.width.clamp(320.0, 420.0).toDouble();
        final sortedSubjects = bookDiscoverGenrePool.toList()
          ..sort((a, b) => displayBookGenre(a).compareTo(displayBookGenre(b)));
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Material(
              color: const Color(0xFFF0F7FF),
              child: SizedBox(
                width: width,
                child: SafeArea(
                  child: StatefulBuilder(
                    builder: (context, setPanelState) => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(
                                    context,
                                  ).discoverySubjects,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF13233A),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const AdaptiveIcon(Icons.close_rounded),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppLocalizations.of(context).pickDiscoverySubjects,
                            style: const TextStyle(color: Color(0xFF5C7290)),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              itemCount: sortedSubjects.length,
                              itemBuilder: (context, index) {
                                final subject = sortedSubjects[index];
                                final selected = temp.contains(subject);
                                return CheckboxListTile(
                                  value: selected,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: const Color(0xFF0D47A1),
                                  checkColor: Colors.white,
                                  side: ThemeRegistry.active.borders.chipBorder
                                      .copyWith(
                                        color: const Color(0xFF5C7290),
                                        width: 2,
                                      ),
                                  title: Text(
                                    displayBookGenre(subject),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF13233A),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setPanelState(() {
                                      if (value == true) {
                                        temp.add(subject);
                                      } else if (temp.length > 1) {
                                        temp.remove(subject);
                                      }
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(temp.toList()),
                              child: Text(AppLocalizations.of(context).apply),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    if (result == null || result.isEmpty || !mounted) return;
    final sortedResult = result.toList()
      ..sort((a, b) => displayBookGenre(a).compareTo(displayBookGenre(b)));
    final changed =
        sortedResult.length != _discoverGenres.length ||
        sortedResult.any((s) => !_discoverGenres.contains(s));
    if (!changed) return;

    setState(() {
      _discoverGenres = sortedResult;
      _discoverInitialized = false;
      _discoverBooksByGenre.clear();
      _discoverLoadingGenres.clear();
      _discoverFailedGenres.clear();
      for (final controller in _discoverRowControllers.values) {
        controller.dispose();
      }
      _discoverRowControllers.clear();
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(bookDiscoverSubjectsPrefKey, sortedResult);
    await _bootstrapDiscovery();
  }

  Future<void> _bootstrapAudiobookDiscovery() async {
    if (_discoverAudiobookBootstrapping) return;
    _discoverAudiobookBootstrapping = true;
    try {
      await Future.wait(
        _discoverAudiobookGenres.map(
          (genre) => _loadAudiobookDiscoverPage(genre, reset: true),
        ),
      );
      if (mounted) {
        setState(() => _discoverAudiobookInitialized = true);
      }
    } finally {
      _discoverAudiobookBootstrapping = false;
    }
  }

  ScrollController _controllerForAudiobookDiscoverGenre(String genre) {
    return _discoverAudiobookRowControllers.putIfAbsent(
      genre,
      ScrollController.new,
    );
  }

  Future<void> _scrollAudiobookDiscoverRow(String genre, int direction) async {
    final controller = _controllerForAudiobookDiscoverGenre(genre);
    if (!controller.hasClients) return;

    final viewport = controller.position.viewportDimension;
    final scrollAmount = (viewport * 0.84).clamp(180.0, 420.0);
    final target = (controller.offset + (scrollAmount * direction)).clamp(
      0.0,
      controller.position.maxScrollExtent,
    );
    if ((target - controller.offset).abs() < 1) return;

    await controller.animateTo(
      target,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _loadAudiobookDiscoverPage(
    String genre, {
    bool reset = false,
  }) async {
    if (_discoverAudiobookLoadingGenres.contains(genre)) return;

    setState(() {
      _discoverAudiobookLoadingGenres.add(genre);
      _discoverAudiobookFailedGenres.remove(genre);
      if (reset) {
        _discoverAudiobooksByGenre[genre] = <LibrivoxBook>[];
      }
    });

    try {
      final response = await _discoverDio.get<Map<String, dynamic>>(
        'https://librivox.org/api/feed/audiobooks/',
        queryParameters: {
          'format': 'json',
          'genre': genre,
          'sort_field': 'popularity',
          'sort_order': 'desc',
          'limit': bookDiscoverPageSize,
        },
      );
      final data = response.data ?? const <String, dynamic>{};
      final books = (data['books'] as List?) ?? const [];
      final parsed = books
          .whereType<Map>()
          .map((b) => LibrivoxBook.fromMap(Map<String, dynamic>.from(b)))
          .where((book) => book.title.isNotEmpty)
          .toList();

      if (!mounted) return;
      setState(() {
        _discoverAudiobooksByGenre[genre] = parsed;
      });
      unawaited(_fetchCoversForBooks(parsed));
    } catch (_) {
      if (!mounted) return;
      setState(() => _discoverAudiobookFailedGenres.add(genre));
    } finally {
      if (mounted) {
        setState(() => _discoverAudiobookLoadingGenres.remove(genre));
      }
    }
  }

  Future<void> _fetchCoversForBooks(List<LibrivoxBook> books) async {
    const batchSize = 8;
    final unresolved = <LibrivoxBook>[];
    final immediateUpdates = <String, String?>{};

    for (final book in books) {
      if (_librivoxCoverCache.containsKey(book.id) ||
          immediateUpdates.containsKey(book.id)) {
        continue;
      }
      final archiveCover = _archiveCoverUrlForBook(book);
      if (archiveCover != null) {
        immediateUpdates[book.id] = archiveCover;
        continue;
      }
      final isbnCover = _isbnCoverUrlForBook(book);
      if (isbnCover != null) {
        immediateUpdates[book.id] = isbnCover;
        continue;
      }
      unresolved.add(book);
    }

    if (mounted && immediateUpdates.isNotEmpty) {
      setState(() => _librivoxCoverCache.addAll(immediateUpdates));
    }

    for (var i = 0; i < unresolved.length; i += batchSize) {
      if (!mounted) return;
      final batch = unresolved.skip(i).take(batchSize).toList();
      final results = await Future.wait(
        batch.map(_searchOpenLibraryCoverForBook),
      );
      if (!mounted) return;
      setState(() {
        for (var j = 0; j < batch.length; j++) {
          _librivoxCoverCache[batch[j].id] = results[j];
        }
      });
    }
  }

  String? _archiveCoverUrlForBook(LibrivoxBook book) {
    final archiveUrl = book.archiveUrl;
    if ((archiveUrl ?? '').isEmpty) return null;
    final uri = Uri.tryParse(archiveUrl!);
    final segments = uri?.pathSegments.where((s) => s.isNotEmpty).toList();
    final identifier = segments?.isNotEmpty == true ? segments!.last : null;
    if (identifier == null || identifier.isEmpty) return null;
    return 'https://archive.org/services/img/$identifier';
  }

  String? _isbnCoverUrlForBook(LibrivoxBook book) {
    final isbn = book.preferredIsbn;
    if (isbn == null || isbn.isEmpty) return null;
    return 'https://covers.openlibrary.org/b/isbn/$isbn-M.jpg?default=false';
  }

  Future<String?> _searchOpenLibraryCoverForBook(LibrivoxBook book) async {
    try {
      final response = await _discoverDio.get<Map<String, dynamic>>(
        'https://openlibrary.org/search.json',
        queryParameters: {
          'q': '${book.title} ${book.authorName}',
          'limit': 1,
          'fields': 'cover_i',
        },
      );
      final docs = (response.data?['docs'] as List?) ?? const [];
      final coverId = docs.whereType<Map>().firstOrNull?['cover_i'] as num?;
      return coverId != null
          ? 'https://covers.openlibrary.org/b/id/${coverId.toInt()}-M.jpg'
          : null;
    } catch (_) {
      return null;
    }
  }

  Future<void> _showAudiobookGenreSheet() async {
    final temp = {..._discoverAudiobookGenres};
    final l10n = AppLocalizations.of(context);
    final result = await showGeneralDialog<List<String>>(
      context: context,
      barrierDismissible: true,
      barrierLabel: l10n.closeGenrePanel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (context, _, _) => const SizedBox.shrink(),
      transitionBuilder: (context, animation, _, _) {
        final width = MediaQuery.of(
          context,
        ).size.width.clamp(320.0, 420.0).toDouble();
        final sortedGenres = librivoxGenrePool.toList()..sort();
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Material(
              color: const Color(0xFFF0F7FF),
              child: SizedBox(
                width: width,
                child: SafeArea(
                  child: StatefulBuilder(
                    builder: (context, setPanelState) => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).audiobookGenres,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF13233A),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const AdaptiveIcon(Icons.close_rounded),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppLocalizations.of(context).pickAudiobookGenres,
                            style: const TextStyle(color: Color(0xFF5C7290)),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              itemCount: sortedGenres.length,
                              itemBuilder: (context, index) {
                                final genre = sortedGenres[index];
                                final selected = temp.contains(genre);
                                return CheckboxListTile(
                                  value: selected,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: const Color(0xFF0D47A1),
                                  checkColor: Colors.white,
                                  side: ThemeRegistry.active.borders.chipBorder
                                      .copyWith(
                                        color: const Color(0xFF5C7290),
                                        width: 2,
                                      ),
                                  title: Text(
                                    genre,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF13233A),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setPanelState(() {
                                      if (value == true) {
                                        temp.add(genre);
                                      } else if (temp.length > 1) {
                                        temp.remove(genre);
                                      }
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(temp.toList()),
                              child: Text(AppLocalizations.of(context).apply),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    if (result == null || result.isEmpty || !mounted) return;
    final sortedResult = result.toList()..sort();
    final changed =
        sortedResult.length != _discoverAudiobookGenres.length ||
        sortedResult.any((s) => !_discoverAudiobookGenres.contains(s));
    if (!changed) return;

    setState(() {
      _discoverAudiobookGenres = sortedResult;
      _discoverAudiobookInitialized = false;
      _discoverAudiobooksByGenre.clear();
      _discoverAudiobookLoadingGenres.clear();
      _discoverAudiobookFailedGenres.clear();
      for (final controller in _discoverAudiobookRowControllers.values) {
        controller.dispose();
      }
      _discoverAudiobookRowControllers.clear();
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(bookDiscoverAudiobookGenresPrefKey, sortedResult);
    await _bootstrapAudiobookDiscovery();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile =
        PlatformDetection.useMobileUi || MediaQuery.sizeOf(context).width < 600;
    return Padding(
      padding: EdgeInsets.fromLTRB(isMobile ? 16 : 60, 0, isMobile ? 16 : 60, 0),
      child: widget.isAudiobook
          ? _buildAudiobookDiscoverCard(isMobile: isMobile)
          : _buildDiscoverCard(isMobile: isMobile),
    );
  }

  Widget _buildBookIconButton({
    required IconData icon,
    required VoidCallback onTap,
    Color backgroundColor = const Color(0x1FEAF4FF),
    Color foregroundColor = const Color(0xFFEAF4FF),
  }) {
    return InkWell(
      borderRadius: AppRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppRadius.circular(20),
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.cardBorder.copyWith(
              color: foregroundColor.withAlpha(28),
            ),
          ),
        ),
        child: AdaptiveIcon(icon, color: foregroundColor),
      ),
    );
  }

  Widget _buildDiscoverCard({required bool isMobile}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: AppRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A0F2E4D),
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(
        isMobile ? 18 : 28,
        isMobile ? 22 : 30,
        isMobile ? 18 : 28,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).discover,
                      style: const TextStyle(
                        color: Color(0xFF13233A),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      AppLocalizations.of(context).trendingTitlesOpenLibrary,
                      style: TextStyle(
                        color: Color(0xFF5C7290),
                        fontSize: 14,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _buildBookIconButton(
                icon: Icons.tune_rounded,
                onTap: _showDiscoverGenreSheet,
                foregroundColor: const Color(0xFF1D3654),
                backgroundColor: const Color(0xFFE2F0FF),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _discoverGenres
                .map(
                  (genre) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDEEFF),
                      borderRadius: AppRadius.circular(999),
                    ),
                    child: Text(
                      displayBookGenre(genre),
                      style: const TextStyle(
                        color: Color(0xFF1D3654),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 14),
          if (_discoverBootstrapping && !_discoverInitialized)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Center(
                child: CircularProgressIndicator(color: _bookAccent),
              ),
            )
          else
            ..._discoverGenres.map((genre) => _buildDiscoverGenreRow(genre)),
        ],
      ),
    );
  }

  Widget _buildDiscoverGenreRow(String genre) {
    final items = _discoverBooksByGenre[genre] ?? const <DiscoverBook>[];
    final isLoading = _discoverLoadingGenres.contains(genre);
    final hasFailed = _discoverFailedGenres.contains(genre);
    final rowController = _controllerForDiscoverSubject(genre);
    final canScrollRow = items.length > 2 && !isLoading;

    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  displayBookGenre(genre),
                  style: const TextStyle(
                    color: Color(0xFF13233A),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context).booksCount(items.length),
                style: const TextStyle(
                  color: Color(0xFF5C7290),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                tooltip: AppLocalizations.of(context).scrollLeft,
                onPressed: canScrollRow
                    ? () => _scrollDiscoverSubjectRow(genre, -1)
                    : null,
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF16304D),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFFD7E3F0),
                  disabledForegroundColor: const Color(0xFF90A5BC),
                ),
                icon: const AdaptiveIcon(Icons.chevron_left_rounded),
              ),
              IconButton(
                tooltip: AppLocalizations.of(context).scrollRight,
                onPressed: canScrollRow
                    ? () => _scrollDiscoverSubjectRow(genre, 1)
                    : null,
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF16304D),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFFD7E3F0),
                  disabledForegroundColor: const Color(0xFF90A5BC),
                ),
                icon: const AdaptiveIcon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (items.isEmpty && isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: CircularProgressIndicator(color: _bookAccent),
              ),
            )
          else if (items.isEmpty && hasFailed)
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).couldNotLoadSubject,
                    style: const TextStyle(color: Color(0xFF5C7290)),
                  ),
                ),
                TextButton(
                  onPressed: () => _loadDiscoverPage(genre, reset: true),
                  child: Text(AppLocalizations.of(context).retry),
                ),
              ],
            )
          else
            SizedBox(
              height: 240,
              child: ListView.separated(
                controller: rowController,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) => SizedBox(
                  width: 140,
                  child: _buildDiscoverBookCard(items[index]),
                ),
              ),
            ),
          const SizedBox(height: 8),
          if (isLoading && items.isNotEmpty)
            const SizedBox(
              height: 30,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: _bookAccent,
                ),
              ),
            )
          else
            const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildDiscoverBookCard(DiscoverBook item) {
    return InkWell(
      borderRadius: AppRadius.circular(18),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => DiscoverBookDetailScreen(book: item),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: AppRadius.circular(18),
              child: item.coverUrl == null
                  ? Container(
                      color: const Color(0xFF2C77B7),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const AdaptiveIcon(
                        Icons.auto_stories_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: item.coverUrl!,
                      fit: BoxFit.cover,
                      errorWidget: (_, _, _) => Container(
                        color: const Color(0xFF2C77B7),
                        alignment: Alignment.center,
                        child: const AdaptiveIcon(
                          Icons.auto_stories_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 8),
          HoverMarqueeText(
            text: item.title,
            style: const TextStyle(
              color: Color(0xFF13233A),
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2),
          HoverMarqueeText(
            text: item.author,
            style: const TextStyle(color: Color(0xFF5C7290), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildAudiobookDiscoverCard({required bool isMobile}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: AppRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A0F2E4D),
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(
        isMobile ? 18 : 28,
        isMobile ? 22 : 30,
        isMobile ? 18 : 28,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).discoverAudiobooks,
                      style: const TextStyle(
                        color: Color(0xFF13233A),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      AppLocalizations.of(context).librivoxDescription,
                      style: const TextStyle(
                        color: Color(0xFF5C7290),
                        fontSize: 14,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _buildBookIconButton(
                icon: Icons.people_alt_rounded,
                onTap: () {
                  final allBooks = _discoverAudiobooksByGenre.values
                      .expand((b) => b)
                      .toList();
                  final unique = {
                    for (final b in allBooks) b.id: b,
                  }.values.toList();
                  if (unique.isEmpty) return;
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => LibrivoxAuthorsScreen(
                        books: unique,
                        coverCache: Map.unmodifiable(_librivoxCoverCache),
                      ),
                    ),
                  );
                },
                foregroundColor: const Color(0xFF1D3654),
                backgroundColor: const Color(0xFFE2F0FF),
              ),
              const SizedBox(width: 4),
              _buildBookIconButton(
                icon: Icons.tune_rounded,
                onTap: _showAudiobookGenreSheet,
                foregroundColor: const Color(0xFF1D3654),
                backgroundColor: const Color(0xFFE2F0FF),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _discoverAudiobookGenres
                .map(
                  (genre) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDEEFF),
                      borderRadius: AppRadius.circular(999),
                    ),
                    child: Text(
                      genre,
                      style: const TextStyle(
                        color: Color(0xFF1D3654),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 14),
          if (_discoverAudiobookBootstrapping && !_discoverAudiobookInitialized)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Center(
                child: CircularProgressIndicator(color: _bookAccent),
              ),
            )
          else
            ..._discoverAudiobookGenres.map(_buildAudiobookDiscoverGenreRow),
        ],
      ),
    );
  }

  Widget _buildAudiobookDiscoverGenreRow(String genre) {
    final items = _discoverAudiobooksByGenre[genre] ?? const <LibrivoxBook>[];
    final isLoading = _discoverAudiobookLoadingGenres.contains(genre);
    final hasFailed = _discoverAudiobookFailedGenres.contains(genre);
    final rowController = _controllerForAudiobookDiscoverGenre(genre);
    final canScrollRow = items.length > 2 && !isLoading;

    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  genre,
                  style: const TextStyle(
                    color: Color(0xFF13233A),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context).titlesCount(items.length),
                style: const TextStyle(
                  color: Color(0xFF5C7290),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                tooltip: AppLocalizations.of(context).scrollLeft,
                onPressed: canScrollRow
                    ? () => _scrollAudiobookDiscoverRow(genre, -1)
                    : null,
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF16304D),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFFD7E3F0),
                  disabledForegroundColor: const Color(0xFF90A5BC),
                ),
                icon: const AdaptiveIcon(Icons.chevron_left_rounded),
              ),
              IconButton(
                tooltip: AppLocalizations.of(context).scrollRight,
                onPressed: canScrollRow
                    ? () => _scrollAudiobookDiscoverRow(genre, 1)
                    : null,
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF16304D),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFFD7E3F0),
                  disabledForegroundColor: const Color(0xFF90A5BC),
                ),
                icon: const AdaptiveIcon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (items.isEmpty && isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: CircularProgressIndicator(color: _bookAccent),
              ),
            )
          else if (items.isEmpty && hasFailed)
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).couldNotLoadGenre,
                    style: const TextStyle(color: Color(0xFF5C7290)),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      _loadAudiobookDiscoverPage(genre, reset: true),
                  child: Text(AppLocalizations.of(context).retry),
                ),
              ],
            )
          else
            SizedBox(
              height: 200,
              child: ListView.separated(
                controller: rowController,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) => SizedBox(
                  width: 150,
                  child: _buildLibrivoxBookCard(items[index]),
                ),
              ),
            ),
          const SizedBox(height: 8),
          if (isLoading && items.isNotEmpty)
            const SizedBox(
              height: 30,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: _bookAccent,
                ),
              ),
            )
          else
            const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildAudiobookCoverPlaceholder(Color color, String duration) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color, color.withAlpha(180)],
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AdaptiveIcon(Icons.headphones_rounded, color: Colors.white, size: 32),
          if (duration.isNotEmpty) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
                borderRadius: AppRadius.circular(999),
              ),
              child: Text(
                duration,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLibrivoxBookCard(LibrivoxBook book) {
    final colorIndex =
        book.id.hashCode.abs() % audiobookPlaceholderColors.length;
    final placeholderColor = audiobookPlaceholderColors[colorIndex];
    final coverUrl = _librivoxCoverCache[book.id];
    final hasCover =
        _librivoxCoverCache.containsKey(book.id) && coverUrl != null;
    final resolvedCover = coverUrl;

    return InkWell(
      borderRadius: AppRadius.circular(18),
      onTap: () {
        final allBooksById = <String, LibrivoxBook>{};
        for (final bookList in _discoverAudiobooksByGenre.values) {
          for (final discoveredBook in bookList) {
            allBooksById[discoveredBook.id] = discoveredBook;
          }
        }
        final allBooks = allBooksById.values.toList();
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => LibrivoxBookDetailScreen(
              book: book,
              coverUrl: coverUrl,
              allBooks: allBooks,
              coverCache: Map.of(_librivoxCoverCache),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: AppRadius.circular(18),
              child: hasCover
                  ? CachedNetworkImage(
                      imageUrl: resolvedCover ?? '',
                      fit: BoxFit.cover,
                      errorWidget: (_, _, _) => _buildAudiobookCoverPlaceholder(
                        placeholderColor,
                        book.formattedDuration,
                      ),
                    )
                  : _buildAudiobookCoverPlaceholder(
                      placeholderColor,
                      book.formattedDuration,
                    ),
            ),
          ),
          const SizedBox(height: 8),
          HoverMarqueeText(
            text: book.title,
            style: const TextStyle(
              color: Color(0xFF13233A),
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2),
          HoverMarqueeText(
            text: book.authorName,
            style: const TextStyle(color: Color(0xFF5C7290), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
