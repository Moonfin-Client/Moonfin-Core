import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:kindle_unpack/kindle_unpack.dart';

import 'book_reader_service.dart';

enum BookDocumentTheme {
  light,
  dark,
  sepia,
}

@immutable
class BookDocumentStyle {
  final String fontFamilyCss;
  final int fontSizePx;
  final double lineHeight;
  final int marginPx;
  final int maxWidthPx;
  final bool justify;
  final bool bold;

  final String? backgroundCss;
  final String? foregroundCss;
  final String? linkCss;

  const BookDocumentStyle({
    this.fontFamilyCss = 'Georgia, serif',
    this.fontSizePx = 18,
    this.lineHeight = 1.6,
    this.marginPx = 16,
    this.maxWidthPx = 800,
    this.justify = false,
    this.bold = false,
    this.backgroundCss,
    this.foregroundCss,
    this.linkCss,
  });

  static const BookDocumentStyle defaults = BookDocumentStyle();
}

class BookDocumentService {
  static Future<Uint8List> downloadBytes(
    List<Uri> uris,
    Map<String, String> headers,
  ) async {
    final client = HttpClient();
    try {
      HttpException? lastError;

      for (final uri in uris) {
        if (uri.scheme == 'file') {
          final file = File.fromUri(uri);
          if (await file.exists()) {
            return await file.readAsBytes();
          }

          lastError = HttpException('Missing local file for book data: $uri');
          continue;
        }

        final request = await client.getUrl(uri);
        headers.forEach(request.headers.add);
        final response = await request.close();
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return await consolidateHttpClientResponseBytes(response);
        }

        lastError = HttpException(
          'HTTP ${response.statusCode} while downloading book data from $uri',
        );
      }

      throw lastError ?? HttpException('Failed to download book data');
    } finally {
      client.close(force: true);
    }
  }

  /// Convert a Kindle document (MOBI/AZW/AZW3/KF8) into EPUB bytes so it can be
  /// rendered through the normal EPUB pipeline. Parsing is CPU heavy, so run
  /// this off the UI isolate with compute(). Throws if the file is DRM
  /// protected or an unsupported Kindle variant.
  static Uint8List convertKindleToEpub(Uint8List bytes) {
    return KindleBook.fromBytes(bytes).toEpub();
  }

  static Future<String?> probeExtensionFromResponse(
    List<Uri> uris,
    Map<String, String> headers,
  ) async {
    final client = HttpClient();
    try {
      for (final uri in uris) {
        if (uri.scheme == 'file') {
          final fromUri = BookReaderService.extractExtensionFromFileName(
            uri.pathSegments.isEmpty ? uri.path : uri.pathSegments.last,
          );
          if (BookReaderService.isSupportedExtension(fromUri)) {
            return fromUri;
          }
          continue;
        }

        final request = await client.getUrl(uri);
        headers.forEach(request.headers.add);
        request.headers.set(HttpHeaders.rangeHeader, 'bytes=0-0');
        final response = await request.close();

        if (response.statusCode < 200 || response.statusCode >= 400) {
          await response.drain<void>();
          continue;
        }

        final disposition = response.headers.value('content-disposition');
        final mime = response.headers.contentType?.mimeType.toLowerCase();
        await response.drain<void>();

        final fromDisposition =
            BookReaderService.extractExtensionFromContentDisposition(disposition);
        if (BookReaderService.isSupportedExtension(fromDisposition)) {
          return fromDisposition;
        }

        final fromMime = BookReaderService.extensionFromMime(mime);
        if (BookReaderService.isSupportedExtension(fromMime)) {
          return fromMime;
        }

        final fromUri = BookReaderService.extractExtensionFromFileName(
          uri.pathSegments.isEmpty ? uri.path : uri.pathSegments.last,
        );
        if (BookReaderService.isSupportedExtension(fromUri)) {
          return fromUri;
        }
      }
    } finally {
      client.close(force: true);
    }

    return null;
  }

  static List<String> extractEpubChapterHtml(
    Uint8List bytes, {
    BookDocumentTheme theme = BookDocumentTheme.light,
    BookDocumentStyle? style,
  }) {
    return _extractEpubChapterHtmlInternal(bytes, theme: theme, style: style);
  }

  /// Parses the table of contents from an EPUB (NCX or EPUB3 nav).
  /// Returns a flat ordered list of entries. Each entry contains a human-readable
  /// [title], the [chapterIndex] matching the corresponding index into the list
  /// returned by [extractEpubChapterHtml], and a [depth] for indentation
  /// (0 = top-level, 1 = sub-section, etc.).
  /// Returns an empty list if no TOC can be found.
  static List<({String title, int chapterIndex, int depth})> extractEpubTocEntries(
    Uint8List bytes,
  ) {
    try {
      final archive = ZipDecoder().decodeBytes(bytes);
      final files = <String, List<int>>{};
      for (final file in archive.files) {
        if (file.isFile) {
          files[file.name] = file.content;
        }
      }
      final containerBytes = files['META-INF/container.xml'];
      if (containerBytes == null) return const [];
      final opfRelPath = _parseEpubContainer(utf8.decode(containerBytes));
      final opfDir = opfRelPath.contains('/')
          ? opfRelPath.substring(0, opfRelPath.lastIndexOf('/'))
          : '';
      final opfBytes = files[opfRelPath];
      if (opfBytes == null) return const [];
      final opfStr = utf8.decode(opfBytes);

      final spine = _parseEpubOpf(opfStr);
      final hrefToIndex = <String, int>{};
      for (var i = 0; i < spine.chapterHrefs.length; i++) {
        final h = spine.chapterHrefs[i];
        hrefToIndex[h] = i;
        final basename = h.contains('/') ? h.substring(h.lastIndexOf('/') + 1) : h;
        hrefToIndex.putIfAbsent(basename, () => i);
      }

      final ncxItemMatch = RegExp(
        r'<item\b[^>]*media-type="application/x-dtbncx\+xml"[^>]*/?>',
        caseSensitive: false,
      ).firstMatch(opfStr);
      if (ncxItemMatch != null) {
        final ncxHref = RegExp(r'href="([^"]+)"')
            .firstMatch(ncxItemMatch.group(0)!)
            ?.group(1);
        if (ncxHref != null) {
          final ncxPath = opfDir.isEmpty ? ncxHref : '$opfDir/$ncxHref';
          final ncxBytes = files[ncxPath];
          if (ncxBytes != null) {
            return _parseNcxEntries(utf8.decode(ncxBytes), hrefToIndex);
          }
        }
      }

      final navItemMatch = RegExp(
        r'<item\b[^>]*properties="[^"]*\bnav\b[^"]*"[^>]*/?>',
        caseSensitive: false,
      ).firstMatch(opfStr);
      if (navItemMatch != null) {
        final navHref = RegExp(r'href="([^"]+)"')
            .firstMatch(navItemMatch.group(0)!)
            ?.group(1);
        if (navHref != null) {
          final navPath = opfDir.isEmpty ? navHref : '$opfDir/$navHref';
          final navBytes = files[navPath];
          if (navBytes != null) {
            return _parseEpub3NavEntries(utf8.decode(navBytes), hrefToIndex);
          }
        }
      }
      return const [];
    } catch (_) {
      return const [];
    }
  }

  static List<({String title, int chapterIndex, int depth})> _parseNcxEntries(
    String ncx,
    Map<String, int> hrefToIndex,
  ) {
    final result = <({String title, int chapterIndex, int depth})>[];
    var depth = 0;
    String? pendingTitle;
    final tokenReg = RegExp(
      r'<navPoint\b|</navPoint\b|<text[^>]*>(.*?)</text>|<content\b[^>]+src="([^"]*)"',
      dotAll: true,
      caseSensitive: false,
    );
    for (final m in tokenReg.allMatches(ncx)) {
      final tag = m.group(0)!.toLowerCase();
      if (tag.startsWith('<navpoint') && !tag.startsWith('</')) {
        depth++;
        pendingTitle = null;
      } else if (tag.startsWith('</navpoint')) {
        if (depth > 0) depth--;
      } else if (m.group(1) != null) {
        pendingTitle = m.group(1)!.replaceAll(RegExp(r'<[^>]+>'), '').trim();
      } else if (m.group(2) != null && pendingTitle != null) {
        var src = m.group(2)!;
        if (src.contains('#')) src = src.substring(0, src.indexOf('#'));
        src = Uri.decodeFull(src.trim());
        final basename = src.contains('/')
            ? src.substring(src.lastIndexOf('/') + 1)
            : src;
        final idx = hrefToIndex[src] ?? hrefToIndex[basename];
        if (idx != null && pendingTitle.isNotEmpty) {
          result.add((title: pendingTitle, chapterIndex: idx, depth: depth - 1));
        }
        pendingTitle = null;
      }
    }
    return result;
  }

  static List<({String title, int chapterIndex, int depth})> _parseEpub3NavEntries(
    String navHtml,
    Map<String, int> hrefToIndex,
  ) {
    final result = <({String title, int chapterIndex, int depth})>[];
    final tocNavStart = RegExp(
      r'<nav\b[^>]*epub:type="[^"]*toc[^"]*"',
      caseSensitive: false,
    ).firstMatch(navHtml)?.start ?? 0;
    var listDepth = 0;
    final reg = RegExp(
      r'<ol\b|</ol\b|<a\b[^>]+href="([^"]*)"[^>]*>(.*?)</a>',
      dotAll: true,
      caseSensitive: false,
    );
    for (final m in reg.allMatches(navHtml, tocNavStart)) {
      final tag = m.group(0)!.toLowerCase();
      if (tag.startsWith('<ol')) {
        listDepth++;
      } else if (tag.startsWith('</ol')) {
        if (listDepth > 0) listDepth--;
      } else if (m.group(1) != null) {
        var href = m.group(1)!;
        if (href.contains('#')) href = href.substring(0, href.indexOf('#'));
        href = Uri.decodeFull(href.trim());
        final basename = href.contains('/')
            ? href.substring(href.lastIndexOf('/') + 1)
            : href;
        final idx = hrefToIndex[href] ?? hrefToIndex[basename];
        final title = (m.group(2) ?? '')
            .replaceAll(RegExp(r'<[^>]+>'), '')
            .trim();
        if (idx != null && title.isNotEmpty) {
          result.add((title: title, chapterIndex: idx, depth: (listDepth - 1).clamp(0, 10)));
        }
      }
    }
    return result;
  }

  static List<String> _extractEpubChapterHtmlInternal(
    Uint8List bytes, {
    BookDocumentTheme theme = BookDocumentTheme.light,
    BookDocumentStyle? style,
  }) {
    final archive = ZipDecoder().decodeBytes(bytes);

    final files = <String, List<int>>{};
    for (final file in archive.files) {
      if (file.isFile) {
        files[file.name] = file.content;
      }
    }

    final containerBytes = files['META-INF/container.xml'];
    if (containerBytes == null) {
      throw StateError('Invalid EPUB: missing META-INF/container.xml');
    }

    final opfRelPath = _parseEpubContainer(utf8.decode(containerBytes));
    final opfDir = opfRelPath.contains('/')
        ? opfRelPath.substring(0, opfRelPath.lastIndexOf('/'))
        : '';

    final opfBytes = files[opfRelPath];
    if (opfBytes == null) {
      throw StateError('Invalid EPUB: missing OPF at $opfRelPath');
    }

    final spine = _parseEpubOpf(utf8.decode(opfBytes));

    final cssBuffer = StringBuffer();
    for (final cssHref in spine.cssHrefs) {
      final cssPath = opfDir.isEmpty ? cssHref : '$opfDir/$cssHref';
      final cssBytes = files[cssPath];
      if (cssBytes != null) {
        cssBuffer.writeln(utf8.decode(cssBytes));
      }
    }

    final chapters = <String>[];
    for (final chapterHref in spine.chapterHrefs) {
      final chapterPath = opfDir.isEmpty ? chapterHref : '$opfDir/$chapterHref';
      final chapterBytes = files[chapterPath];
      if (chapterBytes == null) {
        continue;
      }

      final chapterDir = chapterPath.contains('/')
          ? chapterPath.substring(0, chapterPath.lastIndexOf('/'))
          : '';
      final chapterBody = _extractHtmlBody(utf8.decode(chapterBytes));
      final sanitized = _inlineLocalImages(chapterBody, chapterDir, files);
      chapters.add(_wrapEpubChapterHtml(
        cssBuffer.toString(),
        sanitized,
        theme: theme,
        style: style,
      ));
    }

    if (chapters.isEmpty) {
      throw StateError('Invalid EPUB: no readable chapters found in spine');
    }

    return chapters;
  }

  static String _parseEpubContainer(String xml) {
    final match = RegExp(r'full-path="([^"]+)"').firstMatch(xml);
    if (match == null) {
      throw StateError('Invalid EPUB: no rootfile in container.xml');
    }

    return match.group(1)!;
  }

  static ({List<String> chapterHrefs, List<String> cssHrefs}) _parseEpubOpf(
    String xml,
  ) {
    final manifest = <String, ({String href, String mediaType})>{};
    final itemRegex = RegExp(r'<item\b([^>]*)/?\s*>', caseSensitive: false);
    for (final m in itemRegex.allMatches(xml)) {
      final attrs = m.group(1)!;
      final id = RegExp(r'id="([^"]+)"').firstMatch(attrs)?.group(1);
      final href = RegExp(r'href="([^"]+)"').firstMatch(attrs)?.group(1);
      final mt = RegExp(r'media-type="([^"]+)"').firstMatch(attrs)?.group(1);
      if (id != null && href != null && mt != null) {
        manifest[id] = (href: Uri.decodeFull(href), mediaType: mt);
      }
    }

    final chapterHrefs = <String>[];
    final spineRegex = RegExp(
      r'<itemref\b([^>]*)/?\s*>',
      caseSensitive: false,
    );
    for (final m in spineRegex.allMatches(xml)) {
      final idref =
          RegExp(r'idref="([^"]+)"').firstMatch(m.group(1)!)?.group(1);
      if (idref != null && manifest.containsKey(idref)) {
        chapterHrefs.add(manifest[idref]!.href);
      }
    }

    final cssHrefs = manifest.values
        .where((item) => item.mediaType == 'text/css')
        .map((item) => item.href)
        .toList();

    return (chapterHrefs: chapterHrefs, cssHrefs: cssHrefs);
  }

  static String _extractHtmlBody(String html) {
    final match = RegExp(
      r'<body[^>]*>(.*)</body>',
      dotAll: true,
      caseSensitive: false,
    ).firstMatch(html);
    return match?.group(1) ?? html;
  }

  /// Images that would inflate the chapter HTML beyond reason are dropped
  /// instead of inlined so a single oversized scan cannot crash the webview.
  static const _maxInlineImageBytes = 10 * 1024 * 1024;

  static final _imgSrcAttr =
      RegExp(r'''src\s*=\s*["']([^"']*)["']''', caseSensitive: false);
  static final _svgImageHref = RegExp(
    r'''(?:xlink:)?href\s*=\s*["']([^"']*)["']''',
    caseSensitive: false,
  );

  /// The chapter HTML is loaded into the webview as a bare string with no
  /// base URL, so relative image paths have nothing to resolve against.
  /// Embedded images are inlined as data URIs instead. Images that cannot be
  /// resolved are dropped so no broken icon renders, and leftover local links
  /// are neutralized so taps stay inside the reader.
  static String _inlineLocalImages(
    String body,
    String baseDir,
    Map<String, List<int>> files,
  ) {
    var resolved = body.replaceAllMapped(
      RegExp(r'<img\b[^>]*>', caseSensitive: false),
      (match) {
        final tag = match.group(0) ?? '';
        final srcMatch = _imgSrcAttr.firstMatch(tag);
        final src = srcMatch?.group(1);
        if (src == null) {
          return '';
        }

        final isRemote = src.startsWith('http://') ||
            src.startsWith('https://') ||
            src.startsWith('data:');
        if (isRemote) {
          return tag;
        }

        final dataUri = _imageDataUri(src, baseDir, files);
        if (dataUri == null) {
          return '';
        }
        return tag.replaceFirst(srcMatch!.group(0)!, 'src="$dataUri"');
      },
    );

    // SVG image elements, the usual markup for EPUB cover pages.
    resolved = resolved.replaceAllMapped(
      RegExp(r'<image\b[^>]*>', caseSensitive: false),
      (match) {
        final tag = match.group(0) ?? '';
        final hrefMatch = _svgImageHref.firstMatch(tag);
        final href = hrefMatch?.group(1);
        if (href == null ||
            href.startsWith('http://') ||
            href.startsWith('https://') ||
            href.startsWith('data:')) {
          return tag;
        }

        final dataUri = _imageDataUri(href, baseDir, files);
        if (dataUri == null) {
          return '';
        }
        final attr = hrefMatch!.group(0)!;
        final attrName = attr.toLowerCase().startsWith('xlink:')
            ? 'xlink:href'
            : 'href';
        return tag.replaceFirst(attr, '$attrName="$dataUri"');
      },
    );

    resolved = resolved.replaceAllMapped(
      RegExp(
        r'(src|href)="(?!https?://|data:|#|mailto:)([^"]+)"',
        caseSensitive: false,
      ),
      (match) => '${match.group(1)}="#"',
    );

    return resolved;
  }

  static String? _imageDataUri(
    String href,
    String baseDir,
    Map<String, List<int>> files,
  ) {
    var path = href.trim();
    final fragment = path.indexOf('#');
    if (fragment >= 0) path = path.substring(0, fragment);
    final query = path.indexOf('?');
    if (query >= 0) path = path.substring(0, query);
    try {
      path = Uri.decodeFull(path);
    } catch (_) {}
    if (path.isEmpty) return null;

    final mime = _imageMimeFor(path);
    if (mime == null) return null;

    final bytes = files[_resolveZipPath(baseDir, path)] ??
        _findByBasename(path, files);
    if (bytes == null || bytes.length > _maxInlineImageBytes) return null;
    return 'data:$mime;base64,${base64Encode(bytes)}';
  }

  /// Resolves a relative href against a directory inside the zip, collapsing
  /// any . and .. segments.
  static String _resolveZipPath(String baseDir, String relative) {
    if (relative.startsWith('/')) return relative.substring(1);
    final segments = [
      if (baseDir.isNotEmpty) ...baseDir.split('/'),
      ...relative.split('/'),
    ];
    final resolved = <String>[];
    for (final segment in segments) {
      if (segment.isEmpty || segment == '.') continue;
      if (segment == '..') {
        if (resolved.isNotEmpty) resolved.removeLast();
        continue;
      }
      resolved.add(segment);
    }
    return resolved.join('/');
  }

  /// Fallback for EPUBs whose hrefs do not resolve cleanly against the base
  /// directory, so a plain filename still finds its bytes.
  static List<int>? _findByBasename(
    String path,
    Map<String, List<int>> files,
  ) {
    final basename =
        path.contains('/') ? path.substring(path.lastIndexOf('/') + 1) : path;
    if (basename.isEmpty) return null;
    for (final entry in files.entries) {
      if (entry.key == basename || entry.key.endsWith('/$basename')) {
        return entry.value;
      }
    }
    return null;
  }

  static String? _imageMimeFor(String path) {
    final dot = path.lastIndexOf('.');
    if (dot < 0) return null;
    return switch (path.substring(dot + 1).toLowerCase()) {
      'jpg' || 'jpeg' => 'image/jpeg',
      'png' => 'image/png',
      'gif' => 'image/gif',
      'webp' => 'image/webp',
      'svg' => 'image/svg+xml',
      'bmp' => 'image/bmp',
      'avif' => 'image/avif',
      _ => null,
    };
  }

  static String _wrapEpubChapterHtml(
    String css,
    String body, {
    required BookDocumentTheme theme,
    BookDocumentStyle? style,
  }) {
    final s = style ?? BookDocumentStyle.defaults;

    final themeColors = switch (theme) {
      BookDocumentTheme.light => (
          background: '#fafafa',
          foreground: '#222222',
          link: '#1b4f9c',
        ),
      BookDocumentTheme.dark => (
          background: '#121212',
          foreground: '#e7e7e7',
          link: '#8ab4f8',
        ),
      BookDocumentTheme.sepia => (
          background: '#f4ecd8',
          foreground: '#3e3023',
          link: '#6b4e2a',
        ),
    };

    final background = s.backgroundCss ?? themeColors.background;
    final foreground = s.foregroundCss ?? themeColors.foreground;
    final link = s.linkCss ?? themeColors.link;
    final textAlign = s.justify ? 'justify' : 'initial';
    final fontWeight = s.bold ? '600' : 'normal';

    return '''<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    $css

    * { box-sizing: border-box; }
    html {
      -webkit-text-size-adjust: 100%;
      background: $background !important;
    }
    body {
      font-family: ${s.fontFamilyCss} !important;
      font-size: ${s.fontSizePx}px !important;
      font-weight: $fontWeight;
      line-height: ${s.lineHeight} !important;
      text-align: $textAlign;
      padding: ${s.marginPx}px;
      margin: 0 auto;
      max-width: ${s.maxWidthPx}px;
      background: $background !important;
      overflow-wrap: anywhere;
      -webkit-hyphens: auto;
      hyphens: auto;
    }
    body, body *:not(a) {
      color: $foreground !important;
      -webkit-text-fill-color: $foreground !important;
      background-color: transparent !important;
      border-color: $foreground !important;
    }
    a, a * {
      color: $link !important;
      -webkit-text-fill-color: $link !important;
    }
    img, svg, picture { max-width: 100%; height: auto; }
  </style>
</head>
<body>
$body
</body>
</html>''';
  }
}
