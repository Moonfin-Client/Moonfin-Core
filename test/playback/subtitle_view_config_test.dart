import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/playback/subtitle_style.dart';
import 'package:moonfin/playback/subtitle_view_config.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

StreamResolutionResult _resolution(List<Map<String, dynamic>> streams) =>
    StreamResolutionResult(
      streamUrl: 'https://host/stream',
      mediaSourceId: 'source',
      playMethod: StreamPlayMethod.directPlay,
      mediaStreams: streams,
    );

SubtitleStyle _style({
  int strokeColor = 0xFF000000,
  double strokeScale = 1,
  int shadowColor = 0,
}) => SubtitleStyle(
  textColor: 0xFFFFFFFF,
  backgroundColor: 0,
  strokeColor: strokeColor,
  fontSize: 20,
  fontWeight: 400,
  verticalOffset: 0,
  strokeScale: strokeScale,
  shadowColor: shadowColor,
  shadowOffset: 0.1,
  shadowBlur: 0.05,
);

/// Runs [body] with a real BuildContext, which the config needs for the
/// screen height.
Future<void> _withContext(
  WidgetTester tester,
  void Function(BuildContext context) body,
) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Builder(
        builder: (context) {
          body(context);
          return const SizedBox.shrink();
        },
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Desktop never shows the text view, since mpv draws its own subtitles
  // there, so the visibility cases run as Android.
  final android = TargetPlatformVariant.only(TargetPlatform.android);

  // Both players draw their subtitles through this.
  testWidgets('a text subtitle is drawn by the subtitle view', (tester) async {
    final prefs = await _prefs();
    await _withContext(tester, (context) {
      final config = buildSubtitleViewConfiguration(
        context: context,
        prefs: prefs,
        resolution: _resolution([
          {'Index': 2, 'Codec': 'subrip'},
        ]),
        subtitleStreamIndex: 2,
      );
      expect(config.visible, isTrue);
    });
  }, variant: android);

  // ASS and PGS paint themselves, so the text view would draw them twice.
  testWidgets('a self-rendering subtitle hides the subtitle view', (
    tester,
  ) async {
    final prefs = await _prefs();
    await _withContext(tester, (context) {
      for (final codec in ['ass', 'pgssub']) {
        final config = buildSubtitleViewConfiguration(
          context: context,
          prefs: prefs,
          resolution: _resolution([
            {'Index': 2, 'Codec': codec},
          ]),
          subtitleStreamIndex: 2,
        );
        expect(config.visible, isFalse, reason: codec);
      }
    });
  }, variant: android);

  testWidgets('no selected subtitle leaves the view available', (tester) async {
    final prefs = await _prefs();
    await _withContext(tester, (context) {
      final config = buildSubtitleViewConfiguration(
        context: context,
        prefs: prefs,
        resolution: _resolution([
          {'Index': 2, 'Codec': 'ass'},
        ]),
        subtitleStreamIndex: null,
      );
      expect(config.visible, isTrue);
    });
  }, variant: android);

  // A live channel's first tune has no stream list.
  testWidgets('an unresolved stream still yields a config', (tester) async {
    final prefs = await _prefs();
    await _withContext(tester, (context) {
      final config = buildSubtitleViewConfiguration(
        context: context,
        prefs: prefs,
        resolution: null,
        subtitleStreamIndex: 2,
      );
      expect(config.visible, isTrue);
      expect(config.style.fontSize, greaterThan(0));
    });
  }, variant: android);

  test('the drop shadow is painted first so the outline sits over it', () {
    final shadows = subtitleShadows(_style(shadowColor: 0x80000000), 40)!;

    expect(shadows, hasLength(9));
    expect(shadows.first.offset, const Offset(4, 4));
    expect(shadows.first.blurRadius, 2);
    expect(shadows.first.color, const Color(0x80000000));
  });

  test('a wider stroke pushes the outline ring out', () {
    double reach(List<Shadow> shadows) => shadows
        .map((s) => math.max(s.offset.dx.abs(), s.offset.dy.abs()))
        .reduce(math.max);

    expect(
      reach(subtitleShadows(_style(strokeScale: 2), 40)!),
      reach(subtitleShadows(_style(), 40)!) * 2,
    );
  });

  test('a wide stroke fills in rather than drawing spaced copies', () {
    final offsets = [
      for (final shadow in subtitleShadows(_style(strokeScale: 4), 40)!)
        shadow.offset,
    ];

    // At 40 the outline reaches 10 out and the copies sit at most 2.5 apart,
    // under a stem, so no spot in the band is left showing through.
    for (var x = -10.0; x <= 10; x += 0.5) {
      for (var y = -10.0; y <= 10; y += 0.5) {
        final nearest = offsets
            .map((o) => (o - Offset(x, y)).distance)
            .reduce(math.min);
        expect(nearest, lessThanOrEqualTo(2.5), reason: '($x, $y)');
      }
    }
  });

  test('no outline and no shadow leaves the text bare', () {
    expect(subtitleShadows(_style(strokeColor: 0), 40), isNull);
    expect(
      subtitleShadows(_style(strokeColor: 0, shadowColor: 0xFF000000), 40),
      hasLength(1),
    );
  });
}
