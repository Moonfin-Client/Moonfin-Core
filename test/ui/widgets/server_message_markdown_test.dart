import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/server_messages_dialog.dart';

void main() {
  group('stripMarkdown', () {
    test('drops heading, quote and list markers', () {
      expect(stripMarkdown('## Maintenance'), 'Maintenance');
      expect(stripMarkdown('> heads up'), 'heads up');
      expect(stripMarkdown('- first\n- second'), 'first\nsecond');
      expect(stripMarkdown('* starred'), 'starred');
    });

    test('drops emphasis and code marks but keeps the words', () {
      expect(stripMarkdown('**bold** and *italic*'), 'bold and italic');
      expect(stripMarkdown('__strong__ and _thin_'), 'strong and thin');
      expect(stripMarkdown('use `curl` here'), 'use curl here');
    });

    test('keeps the link text and drops the URL', () {
      expect(
        stripMarkdown('see [the notes](https://example.com/a_b)'),
        'see the notes',
      );
    });

    test('collapses blank lines so the preview stays on few lines', () {
      expect(stripMarkdown('one\n\n\ntwo'), 'one\ntwo');
    });

    test('leaves plain text alone', () {
      expect(
        stripMarkdown('Server reboot at 2am, sorry for the noise.'),
        'Server reboot at 2am, sorry for the noise.',
      );
    });

    test('a hash inside a sentence is not a heading', () {
      expect(stripMarkdown('issue #1234 is fixed'), 'issue #1234 is fixed');
    });
  });
}
