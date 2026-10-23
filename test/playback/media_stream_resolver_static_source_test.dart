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

  group('MediaStreamResolver.isStreamlessStaticSource', () {
    test('is true for a lone cached source with no streams', () {
      expect(
        MediaStreamResolver.isStreamlessStaticSource(
          _item([
            {'Id': '3', 'MediaStreams': <dynamic>[]},
          ]),
          '3',
        ),
        isTrue,
      );
      expect(
        MediaStreamResolver.isStreamlessStaticSource(
          _item([
            {'Id': '3'},
          ]),
          '3',
        ),
        isTrue,
      );
    });

    test('is false when the source lists its streams', () {
      final item = _item([
        {
          'Id': 'a',
          'MediaStreams': [
            {'Type': 'Video'},
          ],
        },
      ]);
      expect(MediaStreamResolver.isStreamlessStaticSource(item, 'a'), isFalse);
    });

    test('is false for a live TV channel', () {
      final channel = {
        'Type': 'TvChannel',
        ..._item([
          {'Id': 'mediasource_94399', 'MediaStreams': <dynamic>[]},
        ]),
      };
      expect(
        MediaStreamResolver.isStreamlessStaticSource(
          channel,
          'mediasource_94399',
        ),
        isFalse,
      );
    });

    test('is false when the item lists its own streams', () {
      final item = {
        ..._item([
          {'Id': 'source-1'},
        ]),
        'MediaStreams': [
          {'Type': 'Subtitle', 'Index': 2, 'Codec': 'srt'},
        ],
      };
      expect(
        MediaStreamResolver.isStreamlessStaticSource(item, 'source-1'),
        isFalse,
      );
    });

    test('is false when the item has several versions', () {
      // The id is the caller's pick between versions, so it has to be sent.
      final item = _item([
        {'Id': 'a', 'MediaStreams': <dynamic>[]},
        {'Id': 'b', 'MediaStreams': <dynamic>[]},
      ]);
      expect(MediaStreamResolver.isStreamlessStaticSource(item, 'a'), isFalse);
    });

    test('is false for no id, another id, or no cached sources', () {
      final item = _item([
        {'Id': '3', 'MediaStreams': <dynamic>[]},
      ]);
      expect(MediaStreamResolver.isStreamlessStaticSource(item, null), isFalse);
      expect(MediaStreamResolver.isStreamlessStaticSource(item, ''), isFalse);
      expect(MediaStreamResolver.isStreamlessStaticSource(item, 'x'), isFalse);
      expect(
        MediaStreamResolver.isStreamlessStaticSource(_item([]), '3'),
        isFalse,
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

  group('MediaStreamResolver.canRetryWithoutMediaSourceId', () {
    bool canRetry(Map<String, dynamic> item, String? id) =>
        MediaStreamResolver.canRetryWithoutMediaSourceId(item, id);

    test('a single version item retries even with its own id', () {
      expect(
        canRetry(
          _item([
            {'Id': 'a'},
          ]),
          'a',
        ),
        isTrue,
      );
    });

    test('a stale id retries, an explicit version pick does not', () {
      final item = _item([
        {'Id': 'a'},
        {'Id': 'b'},
      ]);
      expect(canRetry(item, 'x'), isTrue);
      expect(canRetry(item, 'b'), isFalse);
    });

    test('no id or no cached sources never retries', () {
      expect(
        canRetry(
          _item([
            {'Id': 'a'},
          ]),
          null,
        ),
        isFalse,
      );
      expect(canRetry(_item([]), 'a'), isFalse);
    });
  });
}
