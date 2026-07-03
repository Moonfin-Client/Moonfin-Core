import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:archive_extract/archive_extract.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:rar/rar.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/reader_settings.dart';
import '../../../data/repositories/offline_repository.dart';
import '../../../data/services/book_document_service.dart';
import '../../../data/services/book_reader_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/reader_settings_store.dart';
import '../../../util/platform_detection.dart';
import '../../../l10n/app_localizations.dart';
import '../../../l10n/current_app_localizations.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/reader/reader_chrome_bar.dart';
import '../../widgets/reader/reader_contents_hub.dart';
import '../../widgets/reader/reader_settings_sheet.dart';

class BookReaderScreen extends StatefulWidget {
  final String itemId;
  final String? serverId;
  final int? initialPosition;
  final String? initialMode;

  const BookReaderScreen({
    super.key,
    required this.itemId,
    this.serverId,
    this.initialPosition,
    this.initialMode,
  });

  @override
  State<BookReaderScreen> createState() => _BookReaderScreenState();
}

enum _ReaderMode { web, comic, pdf, epub, fallback }

enum _ComicLayout { single, double, vertical }

enum _ComicDirection { ltr, rtl }

class _BookReaderScreenState extends State<BookReaderScreen>
    with WidgetsBindingObserver {
  AggregatedItem? _item;
  String? _extension;
  String? _error;
  bool _loading = true;
  bool _loadingContent = false;
  bool _markingPlayed = false;
  _ReaderMode _mode = _ReaderMode.web;
  InAppWebViewController? _webController;
  Uri? _webUri;
  Map<String, String> _webHeaders = const {};
  final PdfViewerController _pdfController = PdfViewerController();
  final PageController _pageController = PageController();
  final TransformationController _comicTransformController =
      TransformationController();
  final ScrollController _comicVerticalController = ScrollController();
  List<ArchiveFile> _comicEntries = const [];
  final Map<int, Uint8List> _comicPageCache = {};
  final Map<int, double> _comicAspectRatios = {};
  double? _comicMeasuredAspect;
  int _comicDecodeWidth = 1080;
  int _currentComicPage = 0;
  double _comicZoom = 1.0;
  _ComicLayout _comicLayout = _ComicLayout.single;
  _ComicDirection _comicDirection = _ComicDirection.ltr;
  bool _filmstripVisible = false;

  PdfTextSearcher? _pdfSearcher;
  final TextEditingController _pdfSearchField = TextEditingController();
  bool _pdfSearchVisible = false;
  int _webLoadProgress = 0;
  String? _fallbackMessage;
  Uri? _fallbackExternalUri;
  bool _overlayVisible = true;
  Uint8List? _pdfBytes;
  int _currentPdfPage = 1;
  int _pdfPageCount = 0;
  List<String> _epubChapterHtml = const [];
  int _currentEpubChapter = 0;
  Uint8List? _epubBytes;
  final Map<String, List<String>> _epubThemeCache = {};
  Timer? _comicStateSaveDebounce;
  Timer? _pdfPageSaveDebounce;
  List<_BookmarkEntry> _bookmarks = const [];
  List<_HighlightEntry> _highlights = const [];
  List<({String title, int chapterIndex, int depth})> _epubTocEntries =
      const [];
  List<({String title, int page, int depth})> _pdfOutline = const [];
  static const int _comicCacheRadius = 3;
  static const double _defaultComicAspect = 0.66;
  static const String _fixedLayoutInvertPrefKey =
      'book_reader_fixed_layout_invert';
  static const String _comicLayoutPrefKey = 'book_reader_comic_layout';
  static const String _comicDirectionPrefKey = 'book_reader_comic_direction';
  ReaderSettings _settings = ReaderSettings.defaults;
  bool _invertFixedLayout = false;

  ReaderThemeColors get _pageColors =>
      _settings.resolveColors(Theme.of(context).brightness);

  Color get _readerAccent => AppColorScheme.accent;

  bool get _useNativeHtmlEpub =>
      !kIsWeb &&
      (PlatformDetection.isMacOS ||
          PlatformDetection.isLinux ||
          PlatformDetection.isWindows);

  ReaderThemeColors get _fixedLayoutChromeColors => ReaderThemeColors(
    background: _invertFixedLayout
        ? const Color(0xFFF2F2F2)
        : const Color(0xFF0A0A0A),
    foreground: _invertFixedLayout ? const Color(0xFF1A1A1A) : Colors.white,
    link: const Color(0xFF6FA8FF),
    isDark: !_invertFixedLayout,
  );

  Widget _readerDimWarmthOverlay() {
    final dim = 1.0 - _settings.brightness;
    final warmth = _settings.warmth;
    if (dim <= 0.001 && warmth <= 0.001) {
      return const SizedBox.shrink();
    }
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            if (dim > 0.001)
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black.withValues(alpha: dim * 0.7),
                ),
              ),
            if (warmth > 0.001)
              Positioned.fill(
                child: ColoredBox(
                  color: const Color(
                    0xFFFF9B2E,
                  ).withValues(alpha: warmth * 0.28),
                ),
              ),
          ],
        ),
      ),
    );
  }

  BookDocumentStyle _epubStyle() {
    final colors = _pageColors;
    return BookDocumentStyle(
      fontFamilyCss: _settings.fontFamilyCss,
      fontSizePx: _settings.fontSizePx,
      lineHeight: _settings.lineHeight,
      marginPx: _settings.marginPx,
      maxWidthPx: _settings.maxWidthPx,
      justify: _settings.justify,
      bold: _settings.bold,
      backgroundCss: colors.backgroundCss,
      foregroundCss: colors.foregroundCss,
      linkCss: colors.linkCss,
    );
  }

  bool get _supportsEmbeddedWebView {
    if (kIsWeb) {
      return false;
    }

    return PlatformDetection.isAndroid ||
        PlatformDetection.isIOS ||
        PlatformDetection.isMacOS;
  }

  bool get _supportsInAppEpub {
    if (_supportsEmbeddedWebView) {
      return true;
    }

    return !kIsWeb &&
        (PlatformDetection.isLinux || PlatformDetection.isWindows);
  }

  bool get _supportsRarExtraction {
    if (kIsWeb) {
      return false;
    }

    return PlatformDetection.isAndroid ||
        PlatformDetection.isIOS ||
        PlatformDetection.isMacOS;
  }

  bool get _supportsCb7Extraction {
    if (kIsWeb) {
      return false;
    }

    return PlatformDetection.isAndroid ||
        PlatformDetection.isIOS ||
        PlatformDetection.isMacOS ||
        PlatformDetection.isLinux;
  }

  bool get _desktopInputEnabled => PlatformDetection.useDesktopUi;

  int get _comicPageCount => _comicEntries.length;

  bool get _comicVerticalActive =>
      _mode == _ReaderMode.comic && _comicLayout == _ComicLayout.vertical;

  bool get _twoPageSpreadActive {
    if (_mode != _ReaderMode.comic || _comicLayout != _ComicLayout.double) {
      return false;
    }

    final size = MediaQuery.maybeOf(context)?.size;
    if (size == null) {
      return false;
    }

    return size.width > size.height && size.width >= 700;
  }

  int get _comicViewportCount {
    if (_twoPageSpreadActive) {
      return (_comicPageCount + 1) ~/ 2;
    }

    return _comicPageCount;
  }

  String get _comicProgressKeyPrefix {
    final item = _item;
    if (item == null) {
      return 'book_reader_comic_unknown';
    }

    return 'book_reader_comic_${item.serverId}_${item.id}';
  }

  String get _twoPageSpreadPrefKey => 'book_reader_comic_two_page_spread';

  String get _epubProgressPrefKey {
    final item = _item;
    if (item == null) return 'book_reader_epub_unknown_chapter';
    return 'book_reader_epub_${item.serverId}_${item.id}_chapter';
  }

  String get _pdfProgressPrefKey {
    final item = _item;
    if (item == null) return 'book_reader_pdf_unknown_page';
    return 'book_reader_pdf_${item.serverId}_${item.id}_page';
  }

  String get _bookmarkPrefKey {
    final item = _item;
    if (item == null) return 'book_reader_bookmarks_unknown';
    return 'book_reader_bookmarks_${item.serverId}_${item.id}';
  }

  String get _highlightPrefKey {
    final item = _item;
    if (item == null) return 'book_reader_highlights_unknown';
    return 'book_reader_highlights_${item.serverId}_${item.id}';
  }

  MediaServerClient _resolveClient() {
    final factory = GetIt.instance<MediaServerClientFactory>();
    if (widget.serverId == null) {
      return GetIt.instance<MediaServerClient>();
    }

    return factory.getClientIfExists(widget.serverId!) ??
        GetIt.instance<MediaServerClient>();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    unawaited(_loadDisplayPreferences());
    _loadAndPrepare();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _comicStateSaveDebounce?.cancel();
    _pdfPageSaveDebounce?.cancel();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _pageController.dispose();
    _comicTransformController.dispose();
    _comicVerticalController.dispose();
    _pdfSearcher?.dispose();
    _pdfSearchField.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_loading && !_loadingContent) {
      _refreshItem();
    }
  }

  Future<void> _loadAndPrepare() async {
    await _loadItem();
    if (_item != null && _error == null) {
      await Future.wait([
        _loadBookmarks(),
        _loadHighlights(),
        _prepareReaderContent(),
      ]);
    }
  }

  Future<void> _refreshItem() async {
    await _loadItem(isRefreshing: true);
  }

  Future<void> _loadItem({bool isRefreshing = false}) async {
    final client = _resolveClient();

    if (!isRefreshing) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }

    try {
      final raw = await client.itemsApi.getItem(widget.itemId);
      final item = AggregatedItem(
        id: widget.itemId,
        serverId: widget.serverId ?? client.baseUrl,
        rawData: raw,
      );
      final extension = BookReaderService.detectExtension(item);

      if (extension != null &&
          !BookReaderService.isSupportedExtension(extension)) {
        if (!mounted) return;
        final l10n = AppLocalizations.of(context);
        setState(() {
          _item = item;
          _extension = extension;
          _loading = false;
          _error = l10n.unsupportedBookFormat(extension);
        });
        return;
      }

      setState(() {
        _item = item;
        _extension = extension;
        _loading = false;
        if (!isRefreshing) {
          _error = null;
        }
      });
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = l10n.failedToLoadBookDetails('$e');
      });
    }
  }

  Future<void> _prepareReaderContent() async {
    final item = _item;
    if (item == null) {
      return;
    }

    Uri? fallbackUriCandidate;

    setState(() {
      _loadingContent = true;
      _error = null;
      _fallbackMessage = null;
      _comicEntries = const [];
      _comicPageCache.clear();
      _comicAspectRatios.clear();
      _comicMeasuredAspect = null;
      _currentComicPage = 0;
      _comicZoom = 1.0;
      _webLoadProgress = 0;
      _webController = null;
      _fallbackExternalUri = null;
      _overlayVisible = true;
      _pdfBytes = null;
      _currentPdfPage = 1;
      _pdfPageCount = 0;
      _epubChapterHtml = const [];
      _currentEpubChapter = 0;
      _epubBytes = null;
      _epubThemeCache.clear();
    });

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _resetComicZoom();

    try {
      final offlineRepo = GetIt.instance<OfflineRepository>();
      final offlineItem = await offlineRepo.getItem(item.id);
      final localFilePath = offlineItem?.downloadStatus == 2
          ? offlineItem?.localFilePath
          : null;

      final List<Uri> uris;
      final Map<String, String> headers;
      if (localFilePath != null && await File(localFilePath).exists()) {
        final localUri = File(localFilePath).uri;
        uris = [localUri];
        headers = const {};
        fallbackUriCandidate = localUri;
      } else {
        final client = _resolveClient();
        uris = BookReaderService.buildDownloadUris(client, item);
        fallbackUriCandidate = uris.isNotEmpty ? uris.first : null;
        headers = BookReaderService.buildAuthHeaders(client);
      }

      var ext = _extension ?? '';
      if (ext.isEmpty && localFilePath != null) {
        ext =
            BookReaderService.extractExtensionFromFileName(localFilePath) ?? '';
      }
      if (ext.isEmpty) {
        final probedExt = await BookDocumentService.probeExtensionFromResponse(
          uris,
          headers,
        );
        if (probedExt != null) {
          ext = probedExt;
          if (mounted) {
            setState(() {
              _extension = probedExt;
            });
          }
        }
      }

      if (ext == 'cbz' ||
          ext == 'zip' ||
          ext == 'cbt' ||
          ext == 'cbr' ||
          ext == 'cb7') {
        final entries = await _extractComicEntriesForExtension(
          uris,
          headers,
          ext,
        );
        if (entries.isEmpty) {
          throw StateError(
            currentAppLocalizations().noImagePagesFoundInArchive(ext),
          );
        }

        if (!mounted) {
          return;
        }

        setState(() {
          _mode = _ReaderMode.comic;
          _comicEntries = entries;
        });

        await _restoreComicState();
        _primeComicCacheAround(_currentComicPage);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _precacheComicNeighbors(_currentComicPage);
          }
        });
      } else if (ext == 'pdf') {
        final bytes = await BookDocumentService.downloadBytes(uris, headers);
        if (!mounted) return;
        setState(() {
          _mode = _ReaderMode.pdf;
          _pdfBytes = bytes;
          _currentPdfPage = 1;
          _pdfPageCount = 0;
        });
      } else if (ext == 'epub') {
        if (!_supportsInAppEpub) {
          if (!mounted) {
            return;
          }

          final l10n = AppLocalizations.of(context);
          setState(() {
            _mode = _ReaderMode.fallback;
            _fallbackMessage = l10n.epubUnavailableOnPlatform;
            _fallbackExternalUri = fallbackUriCandidate;
          });
          return;
        }

        await _prepareEpubReader(uris, headers);
      } else {
        final unsupportedDoc = ext == 'mobi' || ext == 'azw' || ext == 'azw3';
        if (unsupportedDoc) {
          if (!mounted) return;
          final l10n = AppLocalizations.of(context);
          setState(() {
            _mode = _ReaderMode.fallback;
            _fallbackMessage = l10n.formatCannotRenderInApp(ext);
            _fallbackExternalUri = uris.isNotEmpty ? uris.first : null;
          });
          return;
        }

        if (!_supportsEmbeddedWebView) {
          if (!mounted) return;
          final l10n = AppLocalizations.of(context);
          setState(() {
            _mode = _ReaderMode.fallback;
            _fallbackMessage = l10n.embeddedRenderingUnavailable;
          });
          return;
        }

        final uri = await _resolveReadableUri(uris, headers);

        if (!mounted) return;
        setState(() {
          _mode = _ReaderMode.web;
          _webController = null;
          _webUri = uri;
          _webHeaders = headers;
          _webLoadProgress = 0;
        });
      }
    } catch (e) {
      if (!mounted) {
        return;
      }

      final l10n = AppLocalizations.of(context);
      setState(() {
        _mode = _ReaderMode.fallback;
        _fallbackMessage = l10n.failedToOpenInAppReader('$e');
        _fallbackExternalUri = fallbackUriCandidate;
        _error = l10n.failedToOpenInAppReader('$e');
      });
    } finally {
      if (mounted) {
        setState(() {
          _loadingContent = false;
        });
      }
    }
  }

  Future<void> _openFallbackExternally() async {
    final uri = _fallbackExternalUri;
    if (uri == null) {
      return;
    }

    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context).couldNotOpenExternalViewer,
          ),
        ),
      );
    }
  }

  Future<void> _prepareEpubReader(
    List<Uri> uris,
    Map<String, String> headers,
  ) async {
    final bytes = await BookDocumentService.downloadBytes(uris, headers);
    final chapterHtml = _resolveEpubChapterHtml(bytes, _currentEpubTheme);
    final tocEntries = BookDocumentService.extractEpubTocEntries(bytes);
    if (mounted && tocEntries.isNotEmpty) {
      setState(() => _epubTocEntries = tocEntries);
    }

    final prefs = await SharedPreferences.getInstance();
    final initialChapter =
        (widget.initialMode == 'epub' && widget.initialPosition != null)
        ? widget.initialPosition!
        : (prefs.getInt(_epubProgressPrefKey) ?? 0);
    final savedChapter = initialChapter.clamp(0, chapterHtml.length - 1);

    if (!mounted) {
      return;
    }

    setState(() {
      _mode = _ReaderMode.epub;
      _webController = null;
      _epubBytes = bytes;
      _epubChapterHtml = chapterHtml;
      _currentEpubChapter = savedChapter;
      _webLoadProgress = _useNativeHtmlEpub ? 100 : 0;
    });
    await prefs.setInt(_epubProgressPrefKey, savedChapter);
  }

  bool _shouldAllowEpubNavigation(String url, {required bool isMainFrame}) {
    if (!isMainFrame) {
      return true;
    }

    final uri = Uri.tryParse(url);
    if (uri == null) {
      return false;
    }
    if (!uri.hasScheme) {
      return false;
    }

    const allowedSchemes = {'about', 'data', 'http', 'https', 'file'};
    return allowedSchemes.contains(uri.scheme.toLowerCase());
  }

  Future<void> _loadEpubChapter(int index) async {
    if (_epubChapterHtml.isEmpty) {
      return;
    }

    final clamped = index.clamp(0, _epubChapterHtml.length - 1);

    final controller = _webController;
    if (controller != null) {
      await controller.loadData(data: _epubChapterHtml[clamped]);
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _currentEpubChapter = clamped;
      _webLoadProgress = controller == null ? 100 : 0;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_epubProgressPrefKey, clamped);
  }

  Future<void> _goToPdfPage(int targetPage) async {
    final count = _pdfPageCount;
    if (count <= 0) {
      return;
    }

    final clamped = targetPage.clamp(1, count);
    await _pdfController.goToPage(pageNumber: clamped);
    if (!mounted) {
      return;
    }

    setState(() {
      _currentPdfPage = clamped;
    });
  }

  Future<void> _nextPdfPage() => _goToPdfPage(_currentPdfPage + 1);

  Future<void> _previousPdfPage() => _goToPdfPage(_currentPdfPage - 1);

  void _toggleOverlay() {
    setState(() {
      _overlayVisible = !_overlayVisible;
    });
    if (_overlayVisible) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }
  }

  Future<Uri> _resolveReadableUri(
    List<Uri> uris,
    Map<String, String> headers,
  ) async {
    final client = HttpClient();
    final l10n = AppLocalizations.of(context);
    try {
      HttpException? lastError;

      for (final uri in uris) {
        if (uri.scheme == 'file') {
          final file = File.fromUri(uri);
          if (await file.exists()) {
            return uri;
          }

          lastError = HttpException(l10n.missingLocalFileForReader('$uri'));
          continue;
        }

        var request = await client.openUrl('HEAD', uri);
        headers.forEach(request.headers.add);
        var response = await request.close();

        if (response.statusCode == HttpStatus.methodNotAllowed ||
            response.statusCode == HttpStatus.notImplemented) {
          await response.drain<void>();
          request = await client.getUrl(uri);
          headers.forEach(request.headers.add);
          request.headers.set(HttpHeaders.rangeHeader, 'bytes=0-0');
          response = await request.close();
        }

        if (response.statusCode >= 200 && response.statusCode < 400) {
          await response.drain<void>();
          return uri;
        }

        await response.drain<void>();
        lastError = HttpException(
          l10n.httpStatusWhileOpeningBookData(response.statusCode, '$uri'),
        );
      }

      throw lastError ?? HttpException(l10n.noReadableBookEndpointAvailable);
    } finally {
      client.close(force: true);
    }
  }

  Future<List<ArchiveFile>> _extractComicEntriesForExtension(
    List<Uri> uris,
    Map<String, String> headers,
    String extension,
  ) async {
    final bytes = await BookDocumentService.downloadBytes(uris, headers);

    switch (extension) {
      case 'cbz':
      case 'zip':
      case 'cbt':
        return _extractComicEntries(bytes, extension);
      case 'cbr':
        return _extractCbrEntries(bytes);
      case 'cb7':
        return _extractCb7Entries(bytes);
      default:
        throw UnsupportedError(
          currentAppLocalizations().unsupportedComicArchiveFormat(extension),
        );
    }
  }

  Future<List<ArchiveFile>> _extractCbrEntries(Uint8List bytes) async {
    final workspace = await Directory.systemTemp.createTemp('moonfin_cbr_');
    try {
      final archiveFile = File('${workspace.path}/archive.cbr');
      await archiveFile.writeAsBytes(bytes, flush: true);

      final outputDir = Directory('${workspace.path}/out');
      await outputDir.create(recursive: true);

      if (!kIsWeb) {
        try {
          await ArchiveExtract.extract7z(
            archivePath: archiveFile.path,
            destinationPath: outputDir.path,
          );
          final entries = await _readExtractedComicEntries(outputDir);
          if (entries.isNotEmpty) {
            return entries;
          }
        } catch (_) {}
      }

      if (!_supportsRarExtraction) {
        throw UnsupportedError(
          currentAppLocalizations().cbrExtractionPluginUnavailable,
        );
      }

      if (await outputDir.exists()) {
        await outputDir.delete(recursive: true);
      }
      await outputDir.create(recursive: true);

      final Map<dynamic, dynamic> result;
      try {
        result = await Rar.extractRarFile(
          rarFilePath: archiveFile.path,
          destinationPath: outputDir.path,
        );
      } on MissingPluginException {
        throw UnsupportedError(
          currentAppLocalizations().cbrExtractionPluginUnavailable,
        );
      }

      if (result['success'] != true) {
        final message =
            result['message']?.toString() ??
            currentAppLocalizations().failedToExtractCbrArchive;
        throw StateError(message);
      }

      return await _readExtractedComicEntries(outputDir);
    } finally {
      await workspace.delete(recursive: true);
    }
  }

  Future<List<ArchiveFile>> _extractCb7Entries(Uint8List bytes) async {
    if (!_supportsCb7Extraction) {
      throw UnsupportedError(
        currentAppLocalizations().cb7ExtractionUnavailable,
      );
    }

    final workspace = await Directory.systemTemp.createTemp('moonfin_cb7_');
    try {
      final archiveFile = File('${workspace.path}/archive.cb7');
      await archiveFile.writeAsBytes(bytes, flush: true);

      final outputDir = Directory('${workspace.path}/out');
      await outputDir.create(recursive: true);

      await ArchiveExtract.extract7z(
        archivePath: archiveFile.path,
        destinationPath: outputDir.path,
      );

      return await _readExtractedComicEntries(outputDir);
    } on MissingPluginException {
      throw UnsupportedError(
        currentAppLocalizations().cb7ExtractionPluginUnavailable,
      );
    } finally {
      await workspace.delete(recursive: true);
    }
  }

  Future<List<ArchiveFile>> _readExtractedComicEntries(
    Directory outputDir,
  ) async {
    final files =
        outputDir
            .listSync(recursive: true, followLinks: false)
            .whereType<File>()
            .where((file) => _isImageFileName(file.path))
            .toList()
          ..sort(
            (a, b) => a.path.toLowerCase().compareTo(b.path.toLowerCase()),
          );

    final entries = <ArchiveFile>[];
    for (final file in files) {
      final data = await file.readAsBytes();
      final relativeName = file.path
          .substring(outputDir.path.length + 1)
          .replaceAll('\\', '/');
      entries.add(ArchiveFile(relativeName, data.length, data));
    }

    return entries;
  }

  List<ArchiveFile> _extractComicEntries(Uint8List bytes, String extension) {
    final archive = extension == 'cbt'
        ? TarDecoder().decodeBytes(bytes)
        : ZipDecoder().decodeBytes(bytes);

    return archive.files
        .where((file) => file.isFile && _isImageFileName(file.name))
        .toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  bool _isImageFileName(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.gif');
  }

  Uint8List? _comicPageBytesAt(int index) {
    final cached = _comicPageCache[index];
    if (cached != null) {
      return cached;
    }

    if (index < 0 || index >= _comicEntries.length) {
      return null;
    }

    final bytes = _comicEntries[index].content;
    _comicPageCache[index] = bytes;
    _trimComicCache(index);
    return bytes;
  }

  void _primeComicCacheAround(int centerIndex) {
    for (
      var i = centerIndex - _comicCacheRadius;
      i <= centerIndex + _comicCacheRadius;
      i++
    ) {
      _comicPageBytesAt(i);
    }
    _trimComicCache(centerIndex);
  }

  void _trimComicCache(int centerIndex) {
    _comicPageCache.removeWhere(
      (index, _) => (index - centerIndex).abs() > _comicCacheRadius,
    );
  }

  ImageProvider _comicImageProvider(Uint8List bytes) =>
      ResizeImage(MemoryImage(bytes), width: _comicDecodeWidth);

  void _precacheComicNeighbors(int centerIndex) {
    if (!mounted) {
      return;
    }
    for (final i in [
      centerIndex + 1,
      centerIndex + 2,
      centerIndex - 1,
    ]) {
      if (i < 0 || i >= _comicPageCount) {
        continue;
      }
      final bytes = _comicPageBytesAt(i);
      if (bytes == null) {
        continue;
      }
      precacheImage(_comicImageProvider(bytes), context);
    }
  }

  int _viewportFromPageIndex(int pageIndex) {
    if (_twoPageSpreadActive) {
      return pageIndex ~/ 2;
    }

    return pageIndex;
  }

  int _pageIndexFromViewport(int viewportIndex) {
    if (_twoPageSpreadActive) {
      return viewportIndex * 2;
    }

    return viewportIndex;
  }

  String _currentComicPageLabel() {
    if (_comicPageCount == 0) {
      return '0/0';
    }

    if (_twoPageSpreadActive) {
      final first = _currentComicPage + 1;
      final second = (_currentComicPage + 2).clamp(1, _comicPageCount);
      if (first == second) {
        return '$first/$_comicPageCount';
      }

      return '$first-$second/$_comicPageCount';
    }

    return '${_currentComicPage + 1}/$_comicPageCount';
  }

  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_bookmarkPrefKey) ?? const [];
    final entries = raw
        .map((s) {
          try {
            return _BookmarkEntry.fromJson(s);
          } catch (_) {
            return null;
          }
        })
        .whereType<_BookmarkEntry>()
        .toList();
    if (mounted) {
      setState(() {
        _bookmarks = entries;
      });
    }
  }

  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _bookmarkPrefKey,
      _bookmarks.map((b) => b.toJson()).toList(),
    );
  }

  Future<void> _loadHighlights() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_highlightPrefKey) ?? const [];
    final entries = raw
        .map((s) {
          try {
            return _HighlightEntry.fromJson(s);
          } catch (_) {
            return null;
          }
        })
        .whereType<_HighlightEntry>()
        .toList();
    if (mounted) {
      setState(() => _highlights = entries);
    }
  }

  Future<void> _saveHighlights() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _highlightPrefKey,
      _highlights.map((h) => h.toJson()).toList(),
    );
  }

  Future<void> _addHighlight(String rawText) async {
    final text = rawText.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (text.isEmpty || _mode != _ReaderMode.epub) {
      return;
    }
    final snippet = text.length > 280 ? '${text.substring(0, 280)}…' : text;
    if (_highlights.any(
      (h) => h.chapterIndex == _currentEpubChapter && h.text == snippet,
    )) {
      return;
    }
    setState(() {
      _highlights = [
        _HighlightEntry(
          chapterIndex: _currentEpubChapter,
          text: snippet,
          createdAt: DateTime.now(),
        ),
        ..._highlights,
      ];
    });
    await _saveHighlights();
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Highlight saved')));
    }
  }

  Future<void> _deleteHighlight(int index) async {
    if (index < 0 || index >= _highlights.length) return;
    setState(() {
      _highlights = [..._highlights]..removeAt(index);
    });
    await _saveHighlights();
  }

  String _currentPositionLabel() {
    final l10n = AppLocalizations.of(context);
    return switch (_mode) {
      _ReaderMode.epub => l10n.chapterNumber(_currentEpubChapter + 1),
      _ReaderMode.pdf => l10n.pageLabel(_currentPdfPage),
      _ReaderMode.comic => l10n.pageLabel(_currentComicPage + 1),
      _ => l10n.position,
    };
  }

  int _currentPositionIndex() {
    return switch (_mode) {
      _ReaderMode.epub => _currentEpubChapter,
      _ReaderMode.pdf => _currentPdfPage,
      _ReaderMode.comic => _currentComicPage,
      _ => 0,
    };
  }

  Future<void> _addCurrentBookmark() async {
    final label = _currentPositionLabel();
    final position = _currentPositionIndex();
    final mode = _mode;

    if (_bookmarks.any((b) => b.mode == mode && b.position == position)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).bookmarkAlreadySaved(label),
            ),
          ),
        );
      }
      return;
    }

    final entry = _BookmarkEntry(
      mode: mode,
      position: position,
      label: label,
      createdAt: DateTime.now(),
    );

    setState(() {
      _bookmarks = [..._bookmarks, entry]
        ..sort((a, b) => a.position.compareTo(b.position));
    });
    await _saveBookmarks();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).bookmarkAdded(label)),
        ),
      );
    }
  }

  Future<void> _deleteBookmark(int index) async {
    final updated = List<_BookmarkEntry>.from(_bookmarks)..removeAt(index);
    setState(() {
      _bookmarks = updated;
    });
    await _saveBookmarks();
  }

  Future<void> _jumpToBookmarkPosition(_BookmarkEntry bookmark) async {
    switch (bookmark.mode) {
      case _ReaderMode.epub:
        await _loadEpubChapter(bookmark.position);
      case _ReaderMode.pdf:
        await _goToPdfPage(bookmark.position);
      case _ReaderMode.comic:
        await _goToComicPage(bookmark.position);
      default:
        break;
    }
  }

  double _readerProgressFraction() {
    switch (_mode) {
      case _ReaderMode.epub:
        final count = _epubChapterHtml.length;
        if (count <= 1) return 0;
        return ((_currentEpubChapter + 1) / count).clamp(0.0, 1.0);
      case _ReaderMode.pdf:
        if (_pdfPageCount <= 1) return 0;
        return (_currentPdfPage / _pdfPageCount).clamp(0.0, 1.0);
      case _ReaderMode.comic:
        if (_comicPageCount <= 1) return 0;
        return ((_currentComicPage + 1) / _comicPageCount).clamp(0.0, 1.0);
      default:
        return 0;
    }
  }

  String _readerProgressCaption() {
    final pct = (_readerProgressFraction() * 100).round();
    return '$pct%';
  }

  int _estimateEpubChapterMinutes() {
    if (_currentEpubChapter < 0 ||
        _currentEpubChapter >= _epubChapterHtml.length) {
      return 0;
    }
    final text = _epubChapterHtml[_currentEpubChapter]
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    if (text.isEmpty) return 0;
    final words = text.split(' ').length;
    return (words / 200).ceil().clamp(1, 600);
  }

  String _formatBookmarkDate(DateTime dt, AppLocalizations l10n) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return l10n.justNow;
    if (diff.inHours < 1) return l10n.minutesAgo(diff.inMinutes);
    if (diff.inDays < 1) return l10n.hoursAgo(diff.inHours);
    if (diff.inDays < 7) return l10n.daysAgo(diff.inDays);
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }

  Future<void> _restoreComicState() async {
    final prefs = await SharedPreferences.getInstance();
    final initialPage =
        (widget.initialMode == 'comic' && widget.initialPosition != null)
        ? widget.initialPosition!
        : (prefs.getInt('${_comicProgressKeyPrefix}_page') ?? 0);
    final savedPage = initialPage;
    final savedZoom = prefs.getDouble('${_comicProgressKeyPrefix}_zoom') ?? 1.0;

    final clampedPage = savedPage.clamp(0, _comicPageCount - 1);

    if (!mounted) {
      return;
    }

    setState(() {
      _currentComicPage = clampedPage;
    });

    _setComicZoom(savedZoom);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_pageController.hasClients) {
        return;
      }

      final viewport = _viewportFromPageIndex(_currentComicPage);
      _pageController.jumpToPage(viewport);
    });
  }

  Future<void> _saveComicState() async {
    final item = _item;
    if (item == null || _mode != _ReaderMode.comic) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${_comicProgressKeyPrefix}_page', _currentComicPage);
    await prefs.setDouble('${_comicProgressKeyPrefix}_zoom', _comicZoom);
  }

  void _scheduleComicStateSave() {
    _comicStateSaveDebounce?.cancel();
    _comicStateSaveDebounce = Timer(const Duration(milliseconds: 250), () {
      _saveComicState();
    });
  }

  Future<void> _goToComicPage(int target) async {
    if (_comicPageCount == 0) {
      return;
    }

    final clamped = target.clamp(0, _comicPageCount - 1);

    if (_comicVerticalActive) {
      if (_comicVerticalController.hasClients) {
        final max = _comicVerticalController.position.maxScrollExtent;
        final offset = _comicPageCount > 1
            ? max * (clamped / (_comicPageCount - 1))
            : 0.0;
        await _comicVerticalController.animateTo(
          offset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
      if (mounted) {
        setState(() => _currentComicPage = clamped);
      }
      await _saveComicState();
      return;
    }

    final normalized = _pageIndexFromViewport(_viewportFromPageIndex(clamped));
    if (normalized == _currentComicPage) {
      return;
    }

    if (_pageController.hasClients) {
      await _pageController.animateToPage(
        _viewportFromPageIndex(clamped),
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
      );
    }

    if (mounted) {
      setState(() {
        _currentComicPage = normalized;
      });
    }

    await _saveComicState();
  }

  int get _comicNavigationStep => _twoPageSpreadActive ? 2 : 1;

  Future<void> _nextComicPage() =>
      _goToComicPage(_currentComicPage + _comicNavigationStep);

  Future<void> _previousComicPage() =>
      _goToComicPage(_currentComicPage - _comicNavigationStep);

  void _handleComicTap(TapUpDetails details) {
    if (_comicZoom > 1.01) {
      _toggleOverlay();
      return;
    }
    final width = MediaQuery.sizeOf(context).width;
    final edge = width * 0.3;
    final x = details.localPosition.dx;
    final rtl = _comicDirection == _ComicDirection.rtl;
    if (x < edge) {
      rtl ? _nextComicPage() : _previousComicPage();
    } else if (x > width - edge) {
      rtl ? _previousComicPage() : _nextComicPage();
    } else {
      _toggleOverlay();
    }
  }

  void _resetComicZoom() {
    _setComicZoom(1.0);
  }

  void _setComicZoom(double value) {
    final clamped = value.clamp(1.0, 5.0);
    _comicTransformController.value = Matrix4.identity()
      ..scaleByDouble(clamped, clamped, clamped, 1.0);
    if (mounted) {
      setState(() {
        _comicZoom = clamped;
      });
    }

    _scheduleComicStateSave();
  }

  void _zoomComicIn() {
    _setComicZoom(_comicZoom + 0.2);
  }

  void _zoomComicOut() {
    _setComicZoom(_comicZoom - 0.2);
  }

  void _toggleComicZoom() {
    if (_comicZoom > 1.01) {
      _resetComicZoom();
    } else {
      _setComicZoom(2.2);
    }
  }

  void _handleComicPointerSignal(PointerSignalEvent event) {
    if (!_desktopInputEnabled || event is! PointerScrollEvent) {
      return;
    }

    final keys = HardwareKeyboard.instance.logicalKeysPressed;
    final zoomGesture =
        keys.contains(LogicalKeyboardKey.controlLeft) ||
        keys.contains(LogicalKeyboardKey.controlRight) ||
        keys.contains(LogicalKeyboardKey.metaLeft) ||
        keys.contains(LogicalKeyboardKey.metaRight);

    if (zoomGesture) {
      if (event.scrollDelta.dy > 0) {
        _zoomComicOut();
      } else {
        _zoomComicIn();
      }
      return;
    }

    if (event.scrollDelta.dy > 0) {
      _nextComicPage();
    } else if (event.scrollDelta.dy < 0) {
      _previousComicPage();
    }
  }

  KeyEventResult _onComicKey(FocusNode _, KeyEvent event) {
    if (!_desktopInputEnabled ||
        event is! KeyDownEvent ||
        _mode != _ReaderMode.comic) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowRight ||
        key == LogicalKeyboardKey.pageDown ||
        key == LogicalKeyboardKey.space) {
      _nextComicPage();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.pageUp) {
      _previousComicPage();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.home) {
      _goToComicPage(0);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.end) {
      _goToComicPage(_comicPageCount - 1);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.equal ||
        key == LogicalKeyboardKey.numpadAdd) {
      _zoomComicIn();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.minus ||
        key == LogicalKeyboardKey.numpadSubtract) {
      _zoomComicOut();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.digit0 || key == LogicalKeyboardKey.numpad0) {
      _resetComicZoom();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _openContentsHub() {
    final l10n = AppLocalizations.of(context);
    final isPlayed = _item?.isPlayed ?? false;
    final isFixedLayout =
        _mode == _ReaderMode.pdf || _mode == _ReaderMode.comic;

    final chapters = <ReaderHubEntry>[];
    if (_mode == _ReaderMode.epub) {
      for (final e in _epubTocEntries) {
        chapters.add(
          ReaderHubEntry(
            title: e.title,
            trailing: l10n.chapterNumber(e.chapterIndex + 1),
            depth: e.depth,
            isCurrent: e.chapterIndex == _currentEpubChapter,
            onTap: () => _loadEpubChapter(e.chapterIndex),
          ),
        );
      }
    } else if (_mode == _ReaderMode.pdf) {
      for (final e in _pdfOutline) {
        chapters.add(
          ReaderHubEntry(
            title: e.title,
            trailing: l10n.pageLabel(e.page),
            depth: e.depth,
            isCurrent: e.page == _currentPdfPage,
            onTap: () => _goToPdfPage(e.page),
          ),
        );
      }
    }

    final bookmarks = <ReaderHubEntry>[
      for (final entry in _bookmarks.asMap().entries)
        ReaderHubEntry(
          title: entry.value.label,
          trailing: _formatBookmarkDate(entry.value.createdAt, l10n),
          onTap: () => _jumpToBookmarkPosition(entry.value),
          onDelete: () => _deleteBookmark(entry.key),
        ),
    ];

    final highlights = <ReaderHubEntry>[
      for (final entry in _highlights.asMap().entries)
        ReaderHubEntry(
          title: entry.value.text,
          trailing: l10n.chapterNumber(entry.value.chapterIndex + 1),
          onTap: () => _loadEpubChapter(entry.value.chapterIndex),
          onDelete: () => _deleteHighlight(entry.key),
        ),
    ];

    showReaderContentsHub(
      context: context,
      accent: _readerAccent,
      pageColors: _pageColors,
      chapters: chapters,
      bookmarks: bookmarks,
      highlights: highlights,
      isPlayed: isPlayed,
      onToggleRead: () => _setPlayed(!isPlayed),
      onReload: _prepareReaderContent,
      progressLabel: _readerProgressCaption(),
      extraActionLabel: isFixedLayout ? l10n.invertColorsFixedLayout : null,
      extraActionIcon: isFixedLayout ? Icons.invert_colors : null,
      onExtraAction: isFixedLayout
          ? () => _setFixedLayoutInvert(!_invertFixedLayout)
          : null,
    );
  }

  BookDocumentTheme get _currentEpubTheme =>
      _pageColors.isDark ? BookDocumentTheme.dark : BookDocumentTheme.light;

  Color get _readerBackgroundColor => _pageColors.background;

  Future<void> _loadDisplayPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final invert = prefs.getBool(_fixedLayoutInvertPrefKey) ?? false;
    final settings = await ReaderSettingsStore.load();

    final layoutName = prefs.getString(_comicLayoutPrefKey);
    final legacyTwoPage = prefs.getBool(_twoPageSpreadPrefKey) ?? false;
    final layout = layoutName != null
        ? _ComicLayout.values.firstWhere(
            (e) => e.name == layoutName,
            orElse: () => _ComicLayout.single,
          )
        : (legacyTwoPage ? _ComicLayout.double : _ComicLayout.single);
    final directionName = prefs.getString(_comicDirectionPrefKey);
    final direction = _ComicDirection.values.firstWhere(
      (e) => e.name == directionName,
      orElse: () => _ComicDirection.ltr,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _settings = settings;
      _invertFixedLayout = invert;
      _comicLayout = layout;
      _comicDirection = direction;
    });
  }

  Future<void> _setComicLayout(_ComicLayout layout) async {
    if (_comicLayout == layout) return;
    final previousPage = _currentComicPage;
    setState(() => _comicLayout = layout);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_comicLayoutPrefKey, layout.name);

    if (layout != _ComicLayout.vertical) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _goToComicPage(previousPage);
      });
    }
  }

  Future<void> _setComicDirection(_ComicDirection direction) async {
    if (_comicDirection == direction) return;
    setState(() => _comicDirection = direction);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_comicDirectionPrefKey, direction.name);
  }

  void _openReaderSettings() {
    showReaderSettingsSheet(
      context: context,
      settings: _settings,
      accent: _readerAccent,
      pageColors: _pageColors,
      onChanged: _applyReaderSettings,
    );
  }

  Future<void> _applyReaderSettings(ReaderSettings next) async {
    final epubAffecting = next.epubStyleKey != _settings.epubStyleKey;
    setState(() {
      _settings = next;
    });
    if (epubAffecting && _mode == _ReaderMode.epub) {
      await _refreshEpubTheme();
    }
    await ReaderSettingsStore.save(next);
  }

  Future<void> _setFixedLayoutInvert(bool value) async {
    setState(() {
      _invertFixedLayout = value;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_fixedLayoutInvertPrefKey, value);
  }

  Future<void> _refreshEpubTheme() async {
    final bytes = _epubBytes;
    if (bytes == null || _mode != _ReaderMode.epub) {
      return;
    }

    final currentIndex = _epubChapterHtml.isEmpty
        ? 0
        : _currentEpubChapter.clamp(0, _epubChapterHtml.length - 1);
    final themed = _resolveEpubChapterHtml(bytes, _currentEpubTheme);

    if (!mounted) {
      return;
    }

    setState(() {
      _epubChapterHtml = themed;
      _currentEpubChapter = currentIndex;
    });

    await _webController?.loadData(data: themed[currentIndex]);
  }

  List<({String title, int page, int depth})> _flattenPdfOutline(
    List<PdfOutlineNode> nodes,
    int depth,
  ) {
    final result = <({String title, int page, int depth})>[];
    for (final node in nodes) {
      final page = node.dest?.pageNumber;
      if (page != null && page > 0) {
        result.add((title: node.title, page: page, depth: depth));
      }
      result.addAll(_flattenPdfOutline(node.children, depth + 1));
    }
    return result;
  }

  List<String> _resolveEpubChapterHtml(
    Uint8List bytes,
    BookDocumentTheme theme,
  ) {
    final key = _settings.epubStyleKey;
    final cached = _epubThemeCache[key];
    if (cached != null) {
      return cached;
    }

    final chapters = BookDocumentService.extractEpubChapterHtml(
      bytes,
      theme: theme,
      style: _epubStyle(),
    );
    _epubThemeCache[key] = chapters;
    return chapters;
  }

  Widget _maybeInvertFixedLayout(Widget child) {
    if (!_invertFixedLayout) {
      return child;
    }

    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -1,
        0,
        0,
        0,
        255,
        0,
        -1,
        0,
        0,
        255,
        0,
        0,
        -1,
        0,
        255,
        0,
        0,
        0,
        1,
        0,
      ]),
      child: child,
    );
  }

  Future<void> _setPlayed(bool isPlayed) async {
    final item = _item;
    if (item == null || _markingPlayed) {
      return;
    }

    setState(() {
      _markingPlayed = true;
      _error = null;
    });

    final client = _resolveClient();
    final l10n = AppLocalizations.of(context);

    try {
      if (isPlayed) {
        await client.userLibraryApi.markPlayed(item.id);
      } else {
        await client.userLibraryApi.unmarkPlayed(item.id);
      }

      await _refreshItem();

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isPlayed ? l10n.markedAsRead : l10n.markedAsUnread),
        ),
      );
    } catch (e) {
      if (!mounted) {
        return;
      }

      setState(() {
        _error = l10n.failedToUpdateReadState('$e');
      });
    } finally {
      if (mounted) {
        setState(() {
          _markingPlayed = false;
        });
      }
    }
  }

  String _formatDuration(Duration? value) {
    if (value == null) {
      return 'Unknown';
    }

    if (value.inHours > 0) {
      final minutes = (value.inMinutes % 60).toString().padLeft(2, '0');
      return '${value.inHours}:$minutes';
    }

    final minutes = value.inMinutes;
    final seconds = (value.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (PlatformDetection.isAppleTV) {
      return const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(48),
            child: Text(
              'Reading books is not supported on Apple TV.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    final fullscreenReader =
        _mode == _ReaderMode.comic ||
        _mode == _ReaderMode.pdf ||
        _mode == _ReaderMode.web ||
        _mode == _ReaderMode.epub;

    if (!_loading && fullscreenReader) {
      if (_mode != _ReaderMode.comic) {
        return _buildDocumentFullscreen();
      }
      return _buildComicFullscreen();
    }

    final item = _item;
    final l10n = AppLocalizations.of(context);
    final title = item?.name ?? l10n.bookReader;
    final canOpen =
        item != null &&
        (_extension == null ||
            BookReaderService.isSupportedExtension(_extension));
    final playedPercentage = item?.playedPercentage;
    final playbackPosition = item?.playbackPosition;
    final hasProgress = (playedPercentage ?? 0) > 0;
    final isPlayed = item?.isPlayed ?? false;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const AdaptiveIcon(Icons.menu_book),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          if (_extension != null)
                            Chip(
                              label: Text(l10n.formatExtension(_extension!)),
                            ),
                          if (hasProgress)
                            Chip(
                              label: Text(
                                '${l10n.percentRead(playedPercentage!.toStringAsFixed(0))}'
                                '${playbackPosition != null ? ' (${_formatDuration(playbackPosition)})' : ''}',
                              ),
                            )
                          else if (isPlayed)
                            Chip(label: Text(l10n.finished)),
                          OutlinedButton.icon(
                            onPressed: _markingPlayed
                                ? null
                                : () => _setPlayed(!isPlayed),
                            icon: _markingPlayed
                                ? const SizedBox(
                                    width: 14,
                                    height: 14,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : AdaptiveIcon(
                                    isPlayed
                                        ? Icons.check_circle
                                        : Icons.check_circle_outline,
                                  ),
                            label: Text(
                              _markingPlayed
                                  ? l10n.updating
                                  : (isPlayed
                                        ? l10n.markUnread
                                        : l10n.markAsRead),
                            ),
                          ),
                          FilledButton.icon(
                            onPressed: _loadingContent || !canOpen
                                ? null
                                : _prepareReaderContent,
                            icon: _loadingContent
                                ? const SizedBox(
                                    width: 14,
                                    height: 14,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const AdaptiveIcon(Icons.refresh),
                            label: Text(l10n.reloadReader),
                          ),
                        ],
                      ),
                      if (_error != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          _error!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(child: _buildReaderSurface()),
              ],
            ),
    );
  }

  Widget _buildComicFullscreen() {
    final item = _item;
    final l10n = AppLocalizations.of(context);
    final title = item?.name ?? l10n.bookReader;

    return Scaffold(
      backgroundColor: _invertFixedLayout ? Colors.white : Colors.black,
      body: _loadingContent
          ? const Center(child: CircularProgressIndicator())
          : _comicEntries.isEmpty
          ? Center(
              child: Text(
                l10n.noPagesFound,
                style: const TextStyle(color: Colors.white),
              ),
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(child: _buildComicContent(l10n)),

                _readerDimWarmthOverlay(),

                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    ignoring: !_overlayVisible,
                    child: AnimatedOpacity(
                      opacity: _overlayVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: ReaderTopBar(
                        title: title,
                        pageColors: _fixedLayoutChromeColors,
                        onBack: () => Navigator.of(context).pop(),
                        onContents: _openContentsHub,
                        onSettings: () {},
                        showSettings: false,
                        onBookmark: _addCurrentBookmark,
                        hasBookmarks: _bookmarks.isNotEmpty,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    ignoring: !_overlayVisible,
                    child: AnimatedOpacity(
                      opacity: _overlayVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildComicControlsBar(),
                          if (_filmstripVisible) _buildComicFilmstrip(),
                          ReaderBottomBar(
                            pageColors: _fixedLayoutChromeColors,
                            accent: _readerAccent,
                            leftLabel: _currentComicPageLabel(),
                            captionLabel: _readerProgressCaption(),
                            value:
                                (_viewportFromPageIndex(_currentComicPage) + 1)
                                    .toDouble(),
                            min: 1,
                            max: _comicViewportCount > 0
                                ? _comicViewportCount.toDouble()
                                : 1,
                            divisions: _comicViewportCount > 1
                                ? _comicViewportCount - 1
                                : null,
                            onPrev: _currentComicPage > 0
                                ? _previousComicPage
                                : null,
                            onNext: _currentComicPage < _comicPageCount - 1
                                ? _nextComicPage
                                : null,
                            onChanged: (value) {
                              final viewport = value.round() - 1;
                              _goToComicPage(_pageIndexFromViewport(viewport));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildComicContent(AppLocalizations l10n) {
    final mq = MediaQuery.of(context);
    _comicDecodeWidth = (mq.size.width * mq.devicePixelRatio)
        .clamp(1, 2048)
        .round();
    if (_comicVerticalActive) {
      return _buildComicVertical(l10n);
    }
    return _buildComicPaged(l10n);
  }

  Widget _buildComicPaged(AppLocalizations l10n) {
    return Focus(
      autofocus: true,
      onKeyEvent: _onComicKey,
      child: Listener(
        onPointerSignal: _handleComicPointerSignal,
        child: PageView.builder(
          controller: _pageController,
          reverse: _comicDirection == _ComicDirection.rtl,
          itemCount: _comicViewportCount,
          onPageChanged: (viewportIndex) {
            final pageIndex = _pageIndexFromViewport(viewportIndex);
            _resetComicZoom();
            _primeComicCacheAround(pageIndex);
            _precacheComicNeighbors(pageIndex);
            setState(() {
              _currentComicPage = pageIndex;
            });
            _saveComicState();
          },
          itemBuilder: (context, viewportIndex) {
            final leftIndex = _pageIndexFromViewport(viewportIndex);
            final leftBytes = _comicPageBytesAt(leftIndex);
            if (leftBytes == null) {
              return Center(
                child: Text(
                  l10n.failedToDecodePageImage,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            final rightIndex = _twoPageSpreadActive ? leftIndex + 1 : null;
            final rightBytes =
                rightIndex != null && rightIndex < _comicPageCount
                ? _comicPageBytesAt(rightIndex)
                : null;

            final pages = <Widget>[
              Expanded(
                child: _ComicPageImage(
                  bytes: leftBytes,
                  decodeWidth: _comicDecodeWidth,
                ),
              ),
              if (_twoPageSpreadActive) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: rightBytes != null
                      ? _ComicPageImage(
                          bytes: rightBytes,
                          decodeWidth: _comicDecodeWidth,
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ];

            return GestureDetector(
              onTapUp: _handleComicTap,
              onDoubleTap: _toggleComicZoom,
              child: InteractiveViewer(
                transformationController: _comicTransformController,
                minScale: 1,
                maxScale: 5,
                onInteractionEnd: (_) {
                  final zoom = _comicTransformController.value
                      .getMaxScaleOnAxis();
                  if (mounted) {
                    setState(() {
                      _comicZoom = zoom;
                    });
                  }
                  _saveComicState();
                },
                child: _maybeInvertFixedLayout(
                  SizedBox.expand(
                    child: _twoPageSpreadActive
                        ? Row(
                            textDirection:
                                _comicDirection == _ComicDirection.rtl
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            children: pages,
                          )
                        : _ComicPageImage(
                            bytes: leftBytes,
                            decodeWidth: _comicDecodeWidth,
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildComicVertical(AppLocalizations l10n) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;
        if (metrics.maxScrollExtent > 0 && _comicPageCount > 1) {
          final fraction = (metrics.pixels / metrics.maxScrollExtent).clamp(
            0.0,
            1.0,
          );
          final page = (fraction * (_comicPageCount - 1)).round();
          if (page != _currentComicPage) {
            _currentComicPage = page;
            _primeComicCacheAround(page);
            _precacheComicNeighbors(page);
          }
        }
        if (notification is ScrollEndNotification) {
          if (mounted) {
            setState(() {});
          }
          _scheduleComicStateSave();
        }
        return false;
      },
      child: GestureDetector(
        onTap: _toggleOverlay,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth.isFinite
                ? constraints.maxWidth
                : MediaQuery.sizeOf(context).width;
            return ListView.builder(
              controller: _comicVerticalController,
              itemCount: _comicPageCount,
              itemBuilder: (context, index) {
                final aspect =
                    _comicAspectRatios[index] ??
                    _comicMeasuredAspect ??
                    _defaultComicAspect;
                final estimatedHeight = aspect > 0 ? width / aspect : width;
                final bytes = _comicPageBytesAt(index);
                if (bytes == null) {
                  return SizedBox(height: estimatedHeight);
                }
                return _maybeInvertFixedLayout(
                  _ComicVerticalPage(
                    key: ValueKey<int>(index),
                    bytes: bytes,
                    width: width,
                    decodeWidth: _comicDecodeWidth,
                    initialAspect: aspect,
                    onAspect: (value) {
                      _comicAspectRatios[index] = value;
                      _comicMeasuredAspect ??= value;
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildComicFilmstrip() {
    return Container(
      height: 92,
      color: Colors.black.withValues(alpha: 0.55),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _comicPageCount,
        itemBuilder: (context, index) {
          final selected = index == _currentComicPage;
          final bytes = _comicEntries[index].content;
          return GestureDetector(
            onTap: () => _goToComicPage(index),
            child: Container(
              width: 54,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selected ? _readerAccent : Colors.white24,
                  width: selected ? 2 : 1,
                ),
                borderRadius: AppRadius.circular(4),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.memory(
                bytes,
                fit: BoxFit.cover,
                cacheWidth: 110,
                gaplessPlayback: true,
                errorBuilder: (context, error, stack) =>
                    const ColoredBox(color: Colors.white10),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildComicControlsBar() {
    final accent = _readerAccent;
    const double controlHeight = 36;

    Widget pill(String label, bool selected, VoidCallback onTap) {
      return Padding(
        padding: const EdgeInsets.only(right: 6),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: controlHeight,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: selected ? accent : Colors.white.withValues(alpha: 0.14),
              borderRadius: AppRadius.circular(controlHeight / 2),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.white70,
                fontSize: 13,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      );
    }

    Widget iconToggle(
      IconData icon,
      bool active,
      String tooltip,
      VoidCallback onTap,
    ) {
      return Tooltip(
        message: tooltip,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 6),
            width: controlHeight,
            height: controlHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: active ? accent : Colors.white.withValues(alpha: 0.14),
              shape: BoxShape.circle,
            ),
            child: AdaptiveIcon(
              icon,
              size: 18,
              color: active ? Colors.white : Colors.white70,
            ),
          ),
        ),
      );
    }

    final paged = _comicLayout != _ComicLayout.vertical;
    return Container(
      color: Colors.black.withValues(alpha: 0.55),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  pill(
                    'Single',
                    _comicLayout == _ComicLayout.single,
                    () => _setComicLayout(_ComicLayout.single),
                  ),
                  pill(
                    'Two-page',
                    _comicLayout == _ComicLayout.double,
                    () => _setComicLayout(_ComicLayout.double),
                  ),
                  pill(
                    'Vertical',
                    _comicLayout == _ComicLayout.vertical,
                    () => _setComicLayout(_ComicLayout.vertical),
                  ),
                ],
              ),
            ),
          ),
          if (paged)
            iconToggle(
              _comicDirection == _ComicDirection.rtl
                  ? Icons.format_textdirection_r_to_l
                  : Icons.format_textdirection_l_to_r,
              _comicDirection == _ComicDirection.rtl,
              _comicDirection == _ComicDirection.rtl
                  ? 'Right to left (manga)'
                  : 'Left to right',
              () => _setComicDirection(
                _comicDirection == _ComicDirection.rtl
                    ? _ComicDirection.ltr
                    : _ComicDirection.rtl,
              ),
            ),
          iconToggle(
            Icons.view_carousel_outlined,
            _filmstripVisible,
            'Thumbnails',
            () => setState(() => _filmstripVisible = !_filmstripVisible),
          ),
          iconToggle(
            Icons.invert_colors,
            _invertFixedLayout,
            'Invert colors',
            () => _setFixedLayoutInvert(!_invertFixedLayout),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentFullscreen() {
    final l10n = AppLocalizations.of(context);
    final title = _item?.name ?? l10n.bookReader;
    final isEpub = _mode == _ReaderMode.epub;
    final isPdf = _mode == _ReaderMode.pdf;
    final chapterCount = _epubChapterHtml.length;
    final pdfPageCount = _pdfPageCount;

    final chromeColors = isPdf ? _fixedLayoutChromeColors : _pageColors;
    final epubMinutes = isEpub ? _estimateEpubChapterMinutes() : 0;

    return Scaffold(
      backgroundColor: _readerBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReaderTopBar(
            title: title,
            subtitle: isEpub && chapterCount > 1
                ? l10n.chapterNumber(_currentEpubChapter + 1)
                : null,
            pageColors: chromeColors,
            onBack: () => Navigator.of(context).pop(),
            onContents: _openContentsHub,
            onSettings: _openReaderSettings,
            onBookmark: _addCurrentBookmark,
            hasBookmarks: _bookmarks.isNotEmpty,
            showSettings: isEpub,
            onSearch: isPdf ? _togglePdfSearch : null,
          ),
          if (isPdf && _pdfSearchVisible) _buildPdfSearchBar(chromeColors),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(child: _buildReaderSurface()),
                _readerDimWarmthOverlay(),
                if (isPdf) _buildPdfZoomControls(),
              ],
            ),
          ),
          if (isEpub && chapterCount > 1)
            ReaderBottomBar(
              pageColors: chromeColors,
              accent: _readerAccent,
              leftLabel: '${_currentEpubChapter + 1} / $chapterCount',
              rightLabel: epubMinutes > 0 ? '~$epubMinutes min' : null,
              captionLabel: _readerProgressCaption(),
              value: (_currentEpubChapter + 1).toDouble(),
              min: 1,
              max: chapterCount.toDouble(),
              divisions: chapterCount > 1 ? chapterCount - 1 : null,
              onPrev: _currentEpubChapter > 0
                  ? () => _loadEpubChapter(_currentEpubChapter - 1)
                  : null,
              onNext: _currentEpubChapter < chapterCount - 1
                  ? () => _loadEpubChapter(_currentEpubChapter + 1)
                  : null,
              onChanged: (value) => _loadEpubChapter(value.round() - 1),
            ),
          if (isPdf && pdfPageCount > 1)
            ReaderBottomBar(
              pageColors: chromeColors,
              accent: _readerAccent,
              leftLabel: '$_currentPdfPage / $pdfPageCount',
              captionLabel: _readerProgressCaption(),
              value: _currentPdfPage.toDouble(),
              min: 1,
              max: pdfPageCount.toDouble(),
              divisions: pdfPageCount > 1 ? pdfPageCount - 1 : null,
              onPrev: _currentPdfPage > 1 ? _previousPdfPage : null,
              onNext: _currentPdfPage < pdfPageCount ? _nextPdfPage : null,
              onChanged: (value) => _goToPdfPage(value.round()),
            ),
        ],
      ),
    );
  }

  void _togglePdfSearch() {
    setState(() => _pdfSearchVisible = !_pdfSearchVisible);
    if (!_pdfSearchVisible) {
      _pdfSearchField.clear();
      _pdfSearcher?.resetTextSearch();
    }
  }

  void _runPdfSearch(String query) {
    if (query.trim().isEmpty) {
      _pdfSearcher?.resetTextSearch();
      return;
    }
    _pdfSearcher?.startTextSearch(query, caseInsensitive: true);
  }

  Widget _buildPdfSearchBar(ReaderThemeColors colors) {
    final accent = _readerAccent;
    return Material(
      color: colors.background,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 8, 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _pdfSearchField,
                autofocus: true,
                style: TextStyle(color: colors.foreground),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search in document',
                  hintStyle: TextStyle(
                    color: colors.foreground.withValues(alpha: 0.5),
                  ),
                  prefixIcon: AdaptiveIcon(Icons.search, color: accent, size: 20),
                  border: const OutlineInputBorder(),
                ),
                onChanged: _runPdfSearch,
                onSubmitted: (_) => _pdfSearcher?.goToNextMatch(),
              ),
            ),

            if (_pdfSearcher != null)
              ListenableBuilder(
                listenable: _pdfSearcher!,
                builder: (context, _) {
                  final searcher = _pdfSearcher!;
                  final total = searcher.matches.length;
                  final current = searcher.currentIndex;
                  final label = total == 0
                      ? '0'
                      : '${(current ?? 0) + 1}/$total';
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: colors.foreground.withValues(alpha: 0.7),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: AdaptiveIcon(
                          Icons.keyboard_arrow_up,
                          color: colors.foreground,
                        ),
                        onPressed: total == 0 ? null : searcher.goToPrevMatch,
                      ),
                      IconButton(
                        icon: AdaptiveIcon(
                          Icons.keyboard_arrow_down,
                          color: colors.foreground,
                        ),
                        onPressed: total == 0 ? null : searcher.goToNextMatch,
                      ),
                    ],
                  );
                },
              ),
            IconButton(
              icon: AdaptiveIcon(Icons.close, color: colors.foreground),
              onPressed: _togglePdfSearch,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPdfZoomControls() {
    return Positioned(
      right: 12,
      bottom: 12,
      child: IgnorePointer(
        ignoring: !_overlayVisible,
        child: AnimatedOpacity(
          opacity: _overlayVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 250),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _PdfRoundButton(
                icon: Icons.add,
                onPressed: () => _pdfController.zoomUp(),
              ),
              const SizedBox(height: 8),
              _PdfRoundButton(
                icon: Icons.remove,
                onPressed: () => _pdfController.zoomDown(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReaderSurface() {
    if (_loadingContent) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context).preparingInAppReader,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    if (_mode == _ReaderMode.pdf) {
      final bytes = _pdfBytes;
      if (bytes == null) {
        return Center(
          child: Text(AppLocalizations.of(context).pdfDataNotAvailable),
        );
      }
      return ColoredBox(
        color: _readerBackgroundColor,
        child: _maybeInvertFixedLayout(
          PdfViewer.data(
            bytes,
            sourceName: 'book.pdf',
            controller: _pdfController,
            params: PdfViewerParams(
              pagePaintCallbacks: [
                (canvas, pageRect, page) => _pdfSearcher
                    ?.pageTextMatchPaintCallback(canvas, pageRect, page),
              ],
              onViewerReady: (document, controller) async {
                _pdfSearcher ??= PdfTextSearcher(controller)
                  ..addListener(() {
                    if (mounted) setState(() {});
                  });
                if (!mounted) {
                  return;
                }
                final pageCount = controller.pageCount;
                final prefs = await SharedPreferences.getInstance();
                final initialPage =
                    (widget.initialMode == 'pdf' &&
                        widget.initialPosition != null)
                    ? widget.initialPosition!
                    : (prefs.getInt(_pdfProgressPrefKey) ?? 1);
                final savedPage = initialPage.clamp(1, pageCount);
                final outline = await document.loadOutline();
                if (mounted) {
                  final flat = _flattenPdfOutline(outline, 0);
                  setState(() {
                    _pdfPageCount = pageCount;
                    _currentPdfPage = savedPage;
                    if (flat.isNotEmpty) _pdfOutline = flat;
                  });
                }
                if (mounted && savedPage > 1) {
                  await controller.goToPage(pageNumber: savedPage);
                }
              },
              onPageChanged: (pageNumber) {
                if (!mounted || pageNumber == null) {
                  return;
                }
                setState(() {
                  _currentPdfPage = pageNumber;
                });
                _pdfPageSaveDebounce?.cancel();
                _pdfPageSaveDebounce = Timer(
                  const Duration(milliseconds: 300),
                  () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setInt(_pdfProgressPrefKey, pageNumber);
                  },
                );
              },
            ),
          ),
        ),
      );
    }

    if (_mode == _ReaderMode.fallback) {
      final l10n = AppLocalizations.of(context);
      final ext = _extension == null ? '' : '.$_extension';
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AdaptiveIcon(Icons.desktop_windows_outlined, size: 56),
                const SizedBox(height: 12),
                Text(
                  l10n.readerFallbackModeActive,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  _fallbackMessage ??
                      l10n.platformCannotHostDocumentEngine(ext),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.reloadReaderPlatformHint,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (_fallbackExternalUri != null) ...[
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: _openFallbackExternally,
                    icon: const AdaptiveIcon(Icons.open_in_new),
                    label: Text(l10n.openExternally),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    if (_mode == _ReaderMode.epub && _useNativeHtmlEpub) {
      if (_epubChapterHtml.isEmpty) {
        return Center(
          child: Text(AppLocalizations.of(context).noEpubChaptersFound),
        );
      }

      final chapter =
          _epubChapterHtml[_currentEpubChapter.clamp(
            0,
            _epubChapterHtml.length - 1,
          )];
      final colors = _pageColors;

      return ColoredBox(
        color: colors.background,
        child: SingleChildScrollView(
          key: ValueKey<String>(
            'epub-native-${_settings.epubStyleKey}-$_currentEpubChapter',
          ),
          padding: EdgeInsets.symmetric(
            horizontal: _settings.marginPx.toDouble(),
            vertical: 20,
          ),

          child: SelectionArea(
            child: HtmlWidget(
              chapter,
              textStyle: TextStyle(
                color: colors.foreground,
                fontSize: _settings.fontSizePx.toDouble(),
                height: _settings.lineHeight,
                fontWeight: _settings.bold ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      );
    }

    final l10n = AppLocalizations.of(context);
    final isEpub = _mode == _ReaderMode.epub;

    if (isEpub && _epubChapterHtml.isEmpty) {
      return Center(child: Text(l10n.noEpubChaptersFound));
    }
    if (!isEpub && _webUri == null) {
      return Center(child: Text(_error ?? l10n.readerNotReady));
    }

    final settings = InAppWebViewSettings(
      javaScriptEnabled: true,
      transparentBackground: true,
      supportZoom: false,
      useShouldOverrideUrlLoading: true,

      mediaPlaybackRequiresUserGesture: true,
    );

    final webView = InAppWebView(
      key: ValueKey<String>(isEpub ? 'epub-web' : 'reader-web'),
      initialData: isEpub
          ? InAppWebViewInitialData(
              data:
                  _epubChapterHtml[_currentEpubChapter.clamp(
                    0,
                    _epubChapterHtml.length - 1,
                  )],
            )
          : null,
      initialUrlRequest: isEpub
          ? null
          : URLRequest(url: WebUri.uri(_webUri!), headers: _webHeaders),
      initialSettings: settings,

      contextMenu: isEpub
          ? ContextMenu(
              menuItems: [
                ContextMenuItem(
                  id: 1,
                  title: 'Highlight',
                  action: () async {
                    final selected = await _webController?.getSelectedText();
                    if (selected != null && selected.trim().isNotEmpty) {
                      await _addHighlight(selected);
                    }
                  },
                ),
              ],
            )
          : null,
      onWebViewCreated: (controller) {
        _webController = controller;
      },
      onProgressChanged: (controller, progress) {
        if (!mounted) return;
        setState(() => _webLoadProgress = progress);
      },
      onLoadStop: (controller, url) {
        if (!mounted) return;
        setState(() => _webLoadProgress = 100);
      },
      shouldOverrideUrlLoading: (controller, action) async {
        if (!isEpub) {
          return NavigationActionPolicy.ALLOW;
        }
        final url = action.request.url?.toString() ?? '';
        final isMainFrame = action.isForMainFrame;
        return _shouldAllowEpubNavigation(url, isMainFrame: isMainFrame)
            ? NavigationActionPolicy.ALLOW
            : NavigationActionPolicy.CANCEL;
      },
      onReceivedError: (controller, request, error) {
        final isMainFrame = request.isForMainFrame ?? true;
        if (!isMainFrame || !mounted) return;
        final l10n = AppLocalizations.of(context);
        final description = '${error.type}: ${error.description}';
        setState(() {
          _mode = _ReaderMode.fallback;
          _fallbackMessage = isEpub
              ? l10n.epubRendererFailed(0, description)
              : l10n.embeddedRendererFailed(0, description);
        });
      },
    );

    return Stack(
      children: [
        Positioned.fill(child: webView),
        if (_webLoadProgress < 100)
          Align(
            alignment: Alignment.topCenter,
            child: LinearProgressIndicator(value: _webLoadProgress / 100),
          ),
      ],
    );
  }
}

class _BookmarkEntry {
  final _ReaderMode mode;
  final int position;
  final String label;
  final DateTime createdAt;

  const _BookmarkEntry({
    required this.mode,
    required this.position,
    required this.label,
    required this.createdAt,
  });

  String toJson() {
    return '{"mode":"${mode.name}","position":$position,"label":${_jsonString(label)},"createdAt":"${createdAt.toIso8601String()}"}';
  }

  static String _jsonString(String s) =>
      '"${s.replaceAll(r'\', r'\\').replaceAll('"', r'\"')}"';

  factory _BookmarkEntry.fromJson(String raw) {
    final map = <String, dynamic>{};

    final clean = raw.trim();
    final pairs = RegExp(
      r'"(\w+)"\s*:\s*(?:"([^"]*)"|([\d]+))',
    ).allMatches(clean);
    for (final m in pairs) {
      final key = m.group(1)!;
      final strVal = m.group(2);
      final numVal = m.group(3);
      map[key] = strVal ?? int.parse(numVal!);
    }
    final modeName = map['mode'] as String? ?? 'epub';
    final mode = _ReaderMode.values.firstWhere(
      (e) => e.name == modeName,
      orElse: () => _ReaderMode.epub,
    );
    return _BookmarkEntry(
      mode: mode,
      position: map['position'] as int? ?? 0,
      label: map['label'] as String? ?? '',
      createdAt:
          DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}

class _HighlightEntry {
  final int chapterIndex;
  final String text;
  final DateTime createdAt;

  const _HighlightEntry({
    required this.chapterIndex,
    required this.text,
    required this.createdAt,
  });

  String toJson() => jsonEncode({
    'chapterIndex': chapterIndex,
    'text': text,
    'createdAt': createdAt.toIso8601String(),
  });

  factory _HighlightEntry.fromJson(String raw) {
    final map = jsonDecode(raw) as Map<String, dynamic>;
    return _HighlightEntry(
      chapterIndex: (map['chapterIndex'] as num?)?.toInt() ?? 0,
      text: map['text'] as String? ?? '',
      createdAt:
          DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}

class _PdfRoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _PdfRoundButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.55),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: AdaptiveIcon(icon, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}

Widget _comicImageError(BuildContext context, Object error, StackTrace? stack) =>
    const Center(
      child: AdaptiveIcon(Icons.broken_image_outlined, color: Colors.white38, size: 64),
    );

class _ComicPageImage extends StatelessWidget {
  final Uint8List bytes;
  final int decodeWidth;

  const _ComicPageImage({required this.bytes, required this.decodeWidth});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: ResizeImage(MemoryImage(bytes), width: decodeWidth),
        fit: BoxFit.contain,
        gaplessPlayback: true,
        filterQuality: FilterQuality.medium,
        errorBuilder: _comicImageError,
      ),
    );
  }
}

class _ComicVerticalPage extends StatefulWidget {
  final Uint8List bytes;
  final double width;
  final int decodeWidth;
  final double initialAspect;
  final ValueChanged<double> onAspect;

  const _ComicVerticalPage({
    super.key,
    required this.bytes,
    required this.width,
    required this.decodeWidth,
    required this.initialAspect,
    required this.onAspect,
  });

  @override
  State<_ComicVerticalPage> createState() => _ComicVerticalPageState();
}

class _ComicVerticalPageState extends State<_ComicVerticalPage> {
  late final ImageProvider _provider = ResizeImage(
    MemoryImage(widget.bytes),
    width: widget.decodeWidth,
  );
  ImageStream? _stream;
  ImageStreamListener? _listener;
  double? _aspect;

  @override
  void initState() {
    super.initState();
    final stream = _provider.resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener(
      (info, _) {
        final h = info.image.height;
        if (h <= 0) {
          return;
        }
        final aspect = info.image.width / h;
        widget.onAspect(aspect);
        if (mounted && (_aspect == null || (_aspect! - aspect).abs() > 0.001)) {
          setState(() => _aspect = aspect);
        }
      },
      onError: (_, _) {},
    );
    stream.addListener(listener);
    _stream = stream;
    _listener = listener;
  }

  @override
  void dispose() {
    if (_stream != null && _listener != null) {
      _stream!.removeListener(_listener!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aspect = _aspect ?? widget.initialAspect;
    final height = aspect > 0 ? widget.width / aspect : widget.width;
    return SizedBox(
      width: widget.width,
      height: height,
      child: Image(
        image: _provider,
        fit: BoxFit.fitWidth,
        gaplessPlayback: true,
        filterQuality: FilterQuality.medium,
        errorBuilder: _comicImageError,
      ),
    );
  }
}
