import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/media_segment.dart';
import 'package:moonfin/data/utils/media_segment_actions.dart';
import 'package:moonfin/preference/preference_constants.dart';

void main() {
  group('parseMediaSegmentActions', () {
    test('reads every configurable type, not just intro and outro', () {
      final actions = parseMediaSegmentActions(
        'intro:askToSkip,recap:skip,preview:doNothing,'
        'commercial:skip,outro:askToSkip',
      );

      expect(actions[MediaSegmentType.intro], MediaSegmentAction.askToSkip);
      expect(actions[MediaSegmentType.recap], MediaSegmentAction.skip);
      expect(actions[MediaSegmentType.preview], MediaSegmentAction.nothing);
      expect(actions[MediaSegmentType.commercial], MediaSegmentAction.skip);
      expect(actions[MediaSegmentType.outro], MediaSegmentAction.askToSkip);
    });

    test('a type with no entry is absent rather than defaulted', () {
      final actions = parseMediaSegmentActions('intro:askToSkip');

      expect(actions.containsKey(MediaSegmentType.recap), isFalse);
    });

    test('an unrecognised action falls back to doing nothing', () {
      final actions = parseMediaSegmentActions('intro:sometimes');

      expect(actions[MediaSegmentType.intro], MediaSegmentAction.nothing);
    });

    // This is read on every position tick during playback, so one bad
    // entry must not take the rest of the map with it.
    test('malformed entries are skipped without losing the good ones', () {
      final actions = parseMediaSegmentActions(
        'intro:askToSkip,,:skip,garbage,recap:skip',
      );

      expect(actions[MediaSegmentType.intro], MediaSegmentAction.askToSkip);
      expect(actions[MediaSegmentType.recap], MediaSegmentAction.skip);
    });

    test('an empty value yields no actions', () {
      expect(parseMediaSegmentActions(''), isEmpty);
    });
  });

  group('serializeMediaSegmentActions', () {
    test('round trips the shipped default unchanged', () {
      const shippedDefault = 'intro:askToSkip,outro:askToSkip';

      expect(
        serializeMediaSegmentActions(parseMediaSegmentActions(shippedDefault)),
        shippedDefault,
      );
    });

    test('writes in a stable order regardless of input order', () {
      final actions = parseMediaSegmentActions(
        'outro:skip,recap:skip,intro:skip',
      );

      expect(
        serializeMediaSegmentActions(actions),
        'intro:skip,recap:skip,outro:skip',
      );
    });

    test('omits types that have no action', () {
      expect(
        serializeMediaSegmentActions({
          MediaSegmentType.recap: MediaSegmentAction.askToSkip,
        }),
        'recap:askToSkip',
      );
    });
  });

  group('withMediaSegmentAction', () {
    test('adds a type the stored value never mentioned', () {
      expect(
        withMediaSegmentAction(
          'intro:askToSkip,outro:askToSkip',
          MediaSegmentType.recap,
          MediaSegmentAction.askToSkip,
        ),
        'intro:askToSkip,recap:askToSkip,outro:askToSkip',
      );
    });

    test('replaces one type and leaves the others alone', () {
      expect(
        withMediaSegmentAction(
          'intro:askToSkip,outro:askToSkip',
          MediaSegmentType.intro,
          MediaSegmentAction.skip,
        ),
        'intro:skip,outro:askToSkip',
      );
    });

    test('every action survives a write and read back', () {
      for (final action in MediaSegmentAction.values) {
        final stored =
            withMediaSegmentAction('', MediaSegmentType.recap, action);

        expect(
          parseMediaSegmentActions(stored)[MediaSegmentType.recap],
          action,
          reason: 'action $action should round trip',
        );
      }
    });
  });
}
