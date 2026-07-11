import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/book_document_service.dart';

Uint8List _buildEpub() {
  final archive = Archive();
  void add(String name, List<int> bytes) {
    archive.addFile(ArchiveFile(name, bytes.length, bytes));
  }

  add('META-INF/container.xml', utf8.encode('''
<?xml version="1.0"?>
<container><rootfiles>
<rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
</rootfiles></container>'''));

  add('OEBPS/content.opf', utf8.encode('''
<?xml version="1.0"?>
<package><manifest>
<item id="cover" href="text/cover.xhtml" media-type="application/xhtml+xml"/>
<item id="ch1" href="text/ch1.xhtml" media-type="application/xhtml+xml"/>
<item id="img1" href="images/pic.png" media-type="image/png"/>
</manifest>
<spine><itemref idref="cover"/><itemref idref="ch1"/></spine></package>'''));

  add('OEBPS/text/cover.xhtml', utf8.encode('''
<html><body><svg xmlns="http://www.w3.org/2000/svg">
<image xlink:href="../images/pic.png" width="600" height="800"/>
</svg></body></html>'''));

  add('OEBPS/text/ch1.xhtml', utf8.encode('''
<html><body>
<p>Hello</p>
<img src="../images/pic.png" alt="fig"/>
<img src="../images/missing.png" alt="gone"/>
<img src="https://example.com/remote.png"/>
<a href="ch2.xhtml">next</a>
</body></html>'''));

  add(
    'OEBPS/images/pic.png',
    base64Decode(
      'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==',
    ),
  );

  return Uint8List.fromList(ZipEncoder().encode(archive));
}

void main() {
  group('EPUB image inlining', () {
    late String cover;
    late String chapter;

    setUpAll(() {
      final chapters = BookDocumentService.extractEpubChapterHtml(_buildEpub());
      cover = chapters[0];
      chapter = chapters[1];
    });

    test('svg cover image is inlined as a data uri', () {
      expect(cover, contains('xlink:href="data:image/png;base64,'));
    });

    test('chapter img is inlined as a data uri', () {
      expect(chapter, contains('src="data:image/png;base64,'));
    });

    test('unresolvable img is dropped', () {
      expect(chapter, isNot(contains('missing.png')));
    });

    test('remote img is kept', () {
      expect(chapter, contains('https://example.com/remote.png'));
    });

    test('local links are neutralized', () {
      expect(chapter, contains('href="#"'));
    });

    test('text is preserved', () {
      expect(chapter, contains('<p>Hello</p>'));
    });
  });
}
