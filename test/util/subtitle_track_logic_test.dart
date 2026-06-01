import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/subtitle_track_logic.dart';
import 'fixture_loader.dart';

void main() {
  final streams = loadFixture('subtitle_streams.json');
  group('isExternalSubtitleStream', () {
    test('returns true when IsExternal flag is true', () {
      final stream = streams.firstWhere((s) => s['Index'] == 6);
      expect(isExternalSubtitleStream(stream), isTrue);
    });

    test('returns true when DeliveryMethod is external', () {
      final stream = streams.firstWhere((s) => s['Index'] == 7);
      expect(isExternalSubtitleStream(stream), isTrue);
    });

    test('returns false when neither flag is set', () {
      final stream = streams.firstWhere((s) => s['Index'] == 3);
      expect(isExternalSubtitleStream(stream), isFalse);
    });
  });
  group('isSdhSubtitleStream', () {
    test('returns true when IsHearingImpaired flag is true', () {
      final stream = streams.firstWhere((s) => s['Index'] == 4);
      expect(isSdhSubtitleStream(stream), isTrue);
    });

    test('returns true when title contains SDH keyword', () {
      final stream = streams.firstWhere((s) => s['Index'] == 5);
      expect(isSdhSubtitleStream(stream), isTrue);
    });

    test('returns false for a normal track', () {
      final stream = streams.firstWhere((s) => s['Index'] == 3);
      expect(isSdhSubtitleStream(stream), isFalse);
    });
  });
  group('sortedSubtitleStream', () {
    test('places internal streams before external streams', () {
      final sorted = sortedSubtitleStreams(streams);
      final firstExternal = sorted.indexWhere((s) => isExternalSubtitleStream(s));
      final lastInternal = sorted.lastIndexWhere((s) => !isExternalSubtitleStream(s));
      expect(lastInternal < firstExternal, isTrue);
    });
    test('preserves order within each group', () {
      final internals = streams.where((s) => !isExternalSubtitleStream(s)).toList();
      final sorted = sortedSubtitleStreams(streams);
      final sortedInternals = sorted.where((s) => !isExternalSubtitleStream(s)).toList();
      expect(sortedInternals.map((s) => s['Index']), internals.map((s) => s['Index']));
    });
  });
  group('computeEffectiveSubtitleIndex', () {
    test('returns selectedSubtitleIndex when set', (){ 
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: 99,
          activePlaybackSubtitleIndex: null,
          defaultToNone: false,
          preferredLanguage: 'eng',
          preferSdh: false,
        ),
        99
      );
    });
    test('returns activePlaybackSubtitleIndex when no selection', (){ 
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: 5,
          defaultToNone: false,
          preferredLanguage: 'eng',
          preferSdh: false,
        ),
        5
      );
    });
    // exclude forced track — IsDefault bonus would override language matching result
    final nonForced = streams.where((s) => s['IsForced'] != true).toList();
    test('selects preferred language track', (){ 
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: nonForced,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          defaultToNone: false,
          preferredLanguage: 'eng',
          preferSdh: false,
        ),
        3
      );
    });
    test('prefers SDH track when preferSdh is true', (){ 
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          defaultToNone: false,
          preferredLanguage: 'eng',
          preferSdh: true,
        ),
        4
      );
    });
    test('returns null when no preferred language set', (){ 
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          defaultToNone: false,
          preferredLanguage: '',
          preferSdh: false,
        ),
        null
      );
    });
    test('falls back to first stream when preferred language not found', (){ 
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: streams,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          defaultToNone: false,
          preferredLanguage: 'tha',
          preferSdh: false,
        ),
        2
      );
    });
    final czech = streams.where((s) => s['Language'] == 'ces').toList();
    test('cs does not match ces due to missing mapping', (){ 
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: czech,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          defaultToNone: false,
          preferredLanguage: 'cs',
          preferSdh: false,
        ),
        9
      );
    });
    test('ces matches Czech stream directly', (){ 
      expect(
        computeEffectiveSubtitleIndex(
          subtitleStreams: czech,
          selectedSubtitleIndex: null,
          activePlaybackSubtitleIndex: null,
          defaultToNone: false,
          preferredLanguage: 'ces',
          preferSdh: false,
        ),
        9
      );
    });
  });
}