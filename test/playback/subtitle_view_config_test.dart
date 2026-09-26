import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
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

/// Runs [body] with a real BuildContext, which the config needs for the screen height.
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
  });

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
  });

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
  });

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
  });
}
