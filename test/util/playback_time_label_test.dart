import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/util/playback_time_label.dart';

/// The ends at label is localized, so these tests need a real context.
Future<BuildContext> _localizedContext(WidgetTester tester) async {
  late BuildContext captured;
  await tester.pumpWidget(
    MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) {
          captured = context;
          return const SizedBox.shrink();
        },
      ),
    ),
  );
  return captured;
}

void main() {
  group('formatPlaybackDuration', () {
    test('drops the hour part below one hour', () {
      expect(
        formatPlaybackDuration(const Duration(minutes: 4, seconds: 5)),
        '4:05',
      );
      expect(formatPlaybackDuration(Duration.zero), '0:00');
    });

    test('includes hours with zero-padded minutes and seconds', () {
      expect(
        formatPlaybackDuration(
          const Duration(hours: 1, minutes: 58, seconds: 33),
        ),
        '1:58:33',
      );
      expect(
        formatPlaybackDuration(const Duration(hours: 2, seconds: 7)),
        '2:00:07',
      );
    });

    test('clamps negative values to zero', () {
      expect(formatPlaybackDuration(const Duration(seconds: -30)), '0:00');
    });
  });

  group('formatPlaybackTrailingTime', () {
    const duration = Duration(hours: 1, minutes: 58, seconds: 33);
    const position = Duration(minutes: 42, seconds: 10);

    testWidgets('totalDuration shows the full runtime', (tester) async {
      final context = await _localizedContext(tester);
      expect(
        formatPlaybackTrailingTime(
          context,
          position: position,
          duration: duration,
          mode: PlaybackTimeDisplay.totalDuration,
          use24Hour: true,
        ),
        '1:58:33',
      );
    });

    testWidgets('timeRemaining shows the negated remainder', (tester) async {
      final context = await _localizedContext(tester);
      expect(
        formatPlaybackTrailingTime(
          context,
          position: position,
          duration: duration,
          mode: PlaybackTimeDisplay.timeRemaining,
          use24Hour: true,
        ),
        '-1:16:23',
      );
    });

    testWidgets('timeRemaining never goes below zero', (tester) async {
      final context = await _localizedContext(tester);
      expect(
        formatPlaybackTrailingTime(
          context,
          position: duration + const Duration(seconds: 5),
          duration: duration,
          mode: PlaybackTimeDisplay.timeRemaining,
          use24Hour: true,
        ),
        '-0:00',
      );
    });

    testWidgets('endsAt renders a 24 hour wall-clock time', (tester) async {
      final context = await _localizedContext(tester);
      final label = formatPlaybackTrailingTime(
        context,
        position: position,
        duration: duration,
        mode: PlaybackTimeDisplay.endsAt,
        use24Hour: true,
      );
      expect(label, matches(RegExp(r'^Ends at \d{2}:\d{2}$')));
    });

    testWidgets('endsAt honours the 12 hour clock preference', (tester) async {
      final context = await _localizedContext(tester);
      final label = formatPlaybackTrailingTime(
        context,
        position: position,
        duration: duration,
        mode: PlaybackTimeDisplay.endsAt,
        use24Hour: false,
      );
      expect(label, matches(RegExp(r'^Ends at \d{1,2}:\d{2} (AM|PM)$')));
    });

    testWidgets('endsAt accounts for playback speed', (tester) async {
      final context = await _localizedContext(tester);
      final normal = formatPlaybackEndsAt(
        context,
        position: Duration.zero,
        duration: const Duration(hours: 2),
        use24Hour: true,
      );
      final doubled = formatPlaybackEndsAt(
        context,
        position: Duration.zero,
        duration: const Duration(hours: 2),
        use24Hour: true,
        playbackSpeed: 2.0,
      );
      expect(normal, isNot(doubled));
    });

    testWidgets('every mode falls back to the duration when it is unknown', (
      tester,
    ) async {
      final context = await _localizedContext(tester);
      for (final mode in PlaybackTimeDisplay.values) {
        expect(
          formatPlaybackTrailingTime(
            context,
            position: Duration.zero,
            duration: Duration.zero,
            mode: mode,
            use24Hour: true,
          ),
          '0:00',
          reason: 'mode $mode should fall back to the duration',
        );
      }
    });
  });

  group('formatPlaybackTimeSlot', () {
    const duration = Duration(hours: 1, minutes: 58, seconds: 33);
    const position = Duration(minutes: 42, seconds: 10);

    String slot(BuildContext context, PlaybackTimeSlot value) {
      return formatPlaybackTimeSlot(
        context,
        slot: value,
        position: position,
        duration: duration,
        use24Hour: true,
      );
    }

    testWidgets('none collapses to an empty label', (tester) async {
      final context = await _localizedContext(tester);
      expect(slot(context, PlaybackTimeSlot.none), isEmpty);
    });

    testWidgets('elapsed shows how far into the item playback is', (
      tester,
    ) async {
      final context = await _localizedContext(tester);
      expect(slot(context, PlaybackTimeSlot.elapsed), '42:10');
    });

    testWidgets('the remaining modes match the trailing labels', (tester) async {
      final context = await _localizedContext(tester);
      expect(slot(context, PlaybackTimeSlot.totalDuration), '1:58:33');
      expect(slot(context, PlaybackTimeSlot.timeRemaining), '-1:16:23');
      expect(
        slot(context, PlaybackTimeSlot.endsAt),
        matches(RegExp(r'^Ends at \d{2}:\d{2}$')),
      );
    });

    testWidgets('only none renders nothing', (tester) async {
      final context = await _localizedContext(tester);
      for (final value in PlaybackTimeSlot.values) {
        expect(
          slot(context, value).isEmpty,
          value == PlaybackTimeSlot.none,
          reason: 'slot $value',
        );
      }
    });
  });
}
