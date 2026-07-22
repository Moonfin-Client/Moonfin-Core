import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

Map<String, dynamic> _item(List<Map<String, dynamic>> sources) => {
  'Id': 'item1',
  'MediaSources': sources,
};

void main() {
  group('MediaStreamResolver.resolveStaticMediaSourceId', () {
    test('passes through a null or empty id', () {
      final item = _item([
        {'Id': 'a'},
      ]);
      expect(MediaStreamResolver.resolveStaticMediaSourceId(item, null), null);
      expect(MediaStreamResolver.resolveStaticMediaSourceId(item, ''), '');
    });

    test('keeps an id that matches a static source', () {
      final item = _item([
        {'Id': 'a'},
        {'Id': 'b'},
      ]);
      expect(MediaStreamResolver.resolveStaticMediaSourceId(item, 'b'), 'b');
    });

    test('keeps the id when the item has no cached sources', () {
      expect(
        MediaStreamResolver.resolveStaticMediaSourceId(_item([]), 'x'),
        'x',
      );
    });

    test('maps a live session id back to its static source', () {
      final item = _item([
        {'Id': 'a', 'LiveStreamId': 'live1'},
        {'Id': 'b'},
      ]);
      expect(
        MediaStreamResolver.resolveStaticMediaSourceId(item, 'live1'),
        'a',
      );
    });

    test('remaps a stale session id on a single version item', () {
      final item = _item([
        {'Id': 'a'},
      ]);
      expect(
        MediaStreamResolver.resolveStaticMediaSourceId(item, 'stale'),
        'a',
      );
    });

    test('keeps an unknown id when the item has several versions', () {
      // Servers whose source ids drift from the cached item, like remux,
      // still resolve the caller's pick. Collapsing to the first version
      // played the wrong file.
      final item = _item([
        {'Id': 'a'},
        {'Id': 'b'},
      ]);
      expect(
        MediaStreamResolver.resolveStaticMediaSourceId(item, 'unknown'),
        'unknown',
      );
    });
  });

  group('MediaStreamResolver.staticMediaSourceIds', () {
    test('returns the cached source ids', () {
      final item = _item([
        {'Id': 'a'},
        {'Id': 'b'},
      ]);
      expect(MediaStreamResolver.staticMediaSourceIds(item), {'a', 'b'});
    });

    test('returns empty when the item has no cached sources', () {
      expect(MediaStreamResolver.staticMediaSourceIds(_item([])), isEmpty);
      expect(MediaStreamResolver.staticMediaSourceIds({'Id': 'x'}), isEmpty);
    });
  });
}
