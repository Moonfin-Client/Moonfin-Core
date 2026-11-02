import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/playback/track_picker.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Backend extends Fake implements MediaKitPlayerBackend {
  @override
  double subtitleDelaySeconds = 0;
  _Backend({
    this.secondaryStyle = false,
    this.secondarySize = false,
    this.secondaryColor = false,
  });
  final bool secondaryStyle;
  final bool secondarySize;
  final bool secondaryColor;
  final audioDelays = <double>[];
  final primaryOffsets = <double>[];

  @override
  bool get supportsSecondarySubtitleDelay => true;
  @override
  bool get supportsSecondarySubtitleStyle => secondaryStyle;
  @override
  bool get supportsSecondarySubtitleSize => secondaryStyle || secondarySize;
  @override
  bool get supportsSecondarySubtitleColor => secondaryStyle || secondaryColor;
  @override
  bool get supportsSecondarySubtitlePosition => true;

  @override
  Future<void> configureSubtitleStyle({
    int? textColor,
    int? backgroundColor,
    int? strokeColor,
    double? fontSize,
    int? fontWeight,
    double? verticalOffset,
  }) async {
    if (verticalOffset != null) primaryOffsets.add(verticalOffset);
  }

  @override
  Future<void> configureSecondarySubtitleStyle({
    double? fontSize,
    double? verticalOffset,
    int? textColor,
  }) async {}

  @override
  Future<void> setAudioDelay(double seconds) async => audioDelays.add(seconds);
}

class _Manager extends PlaybackManager {
  _Manager(this._backend, {this.resolution, this.primaryIndex, this.secondaryIndex});

  final PlayerBackend _backend;
  final StreamResolutionResult? resolution;
  final int? primaryIndex;
  final int? secondaryIndex;

  @override
  int? get subtitleStreamIndex => primaryIndex;

  @override
  int? get secondarySubtitleStreamIndex => secondaryIndex;

  @override
  StreamResolutionResult? get currentResolution => resolution;

  @override
  PlayerBackend? get backend => _backend;

  @override
  bool canUseAsSecondarySubtitle(int index) =>
      resolution?.mediaStreams.any((stream) => stream['Index'] == index &&
          {'srt', 'subrip', 'vtt', 'webvtt'}.contains(stream['Codec'])) ??
      false;
}

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('en'));
  });

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    TrackPicker.resetDelays();
  });

  tearDown(() => GetIt.instance.reset());

  Future<void> openPicker(
    WidgetTester tester,
    PlaybackManager manager, {
    bool secondary = false,
    bool audio = true,
    ValueChanged<bool>? onDialogOpenChanged,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => TrackPicker.show(
              context,
              manager: manager,
              audio: audio && !secondary,
              secondary: secondary,
              clientFor: (_) => throw UnimplementedError(),
              onDialogOpenChanged: onDialogOpenChanged,
            ),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('reports its dialog opening and closing', (tester) async {
    final events = <bool>[];
    await openPicker(tester, PlaybackManager(), onDialogOpenChanged: events.add);
    expect(find.byType(Dialog), findsOneWidget);
    expect(events, [true]);

    Navigator.of(tester.element(find.byType(Dialog))).pop();
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsNothing);
    expect(events, [true, false]);
  });

  // Issue #1141: the delay is set from a bar that leaves the picture in view
  // rather than from under the track list.
  testWidgets('the audio delay opens in a bar that leaves the picture undimmed', (
    tester,
  ) async {
    final backend = _Backend();
    final events = <bool>[];
    await openPicker(tester, _Manager(backend), onDialogOpenChanged: events.add);
    expect(find.text(l10n.none), findsOneWidget);
    expect(find.byType(AnimatedModalBarrier), findsOneWidget);

    await tester.tap(find.text(l10n.audioDelay));
    await tester.pumpAndSettle();
    expect(find.text(l10n.audioTrack), findsNothing);
    expect(find.byType(AnimatedModalBarrier), findsNothing);

    await tester.tap(find.byTooltip(l10n.delayPlusMs(100)));
    await tester.pump();
    expect(find.text('+100 ms'), findsOneWidget);
    expect(backend.audioDelays, [0.1]);
    expect(TrackPicker.audioDelay, 0.1);

    Navigator.of(tester.element(find.byType(Dialog))).pop();
    await tester.pumpAndSettle();
    expect(events, [true, false, true, false]);
  });

  testWidgets('the secondary subtitle delay opens in the same bar', (
    tester,
  ) async {
    final manager = _Manager(_Backend());
    addTearDown(manager.dispose);
    await openPicker(tester, manager, secondary: true);

    await tester.tap(find.text(l10n.subtitleDelay));
    await tester.pumpAndSettle();
    expect(find.text(l10n.secondarySubtitleTrack), findsNothing);
    await tester.tap(find.byTooltip(l10n.delayPlusMs(100)));
    await tester.pump();
    expect(manager.secondarySubtitleDelaySeconds, 0.1);
  });

  testWidgets('secondary size can be exposed without a color override', (
    tester,
  ) async {
    final manager = _Manager(_Backend(secondarySize: true));
    addTearDown(manager.dispose);
    await openPicker(tester, manager, secondary: true);

    expect(find.text(l10n.subtitleSize), findsOneWidget);
    expect(find.text(l10n.verticalOffset), findsOneWidget);
    expect(find.text(l10n.textFillColor), findsNothing);
  });

  testWidgets('the delay bar starts with Reset focused for a remote', (
    tester,
  ) async {
    final backend = _Backend();
    await openPicker(tester, _Manager(backend));
    await tester.tap(find.text(l10n.audioDelay));
    await tester.pumpAndSettle();
    expect(Focus.of(tester.element(find.text(l10n.reset))).hasPrimaryFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(backend.audioDelays, [0.1]);
  });

  testWidgets('unnamed subtitle slots show labels and keep controls above the track list', (tester) async {
    final manager = _Manager(
      _Backend(secondaryStyle: true)..subtitleDelaySeconds = 1.25,
      primaryIndex: 2,
      secondaryIndex: 3,
      resolution: StreamResolutionResult(
        streamUrl: 'https://host/stream',
        mediaSourceId: 'source',
        playMethod: StreamPlayMethod.directPlay,
        mediaStreams: [
          {'Type': 'Subtitle', 'Index': 2, 'Codec': 'subrip'},
          {'Type': 'Subtitle', 'Index': 3, 'Codec': 'subrip'},
        ],
      ),
    );
    addTearDown(manager.dispose);
    await openPicker(tester, manager, audio: false);
    expect(find.text(l10n.streamTypeFallback('Subtitle', 1)), findsOneWidget);
    expect(find.text(l10n.streamTypeFallback('Subtitle', 2)), findsOneWidget);
    expect(find.text(l10n.off), findsNothing);
    expect(find.text('+1250 ms'), findsOneWidget);
    expect(find.text(l10n.subtitleSize), findsOneWidget);
    expect(find.text(l10n.verticalOffset), findsOneWidget);
    expect(find.byIcon(Icons.av_timer), findsOneWidget);
    await tester.tap(find.text(l10n.primarySubtitleSlot));
    await tester.pumpAndSettle();
    expect(find.text(l10n.subtitleSize), findsNothing);
    expect(find.text(l10n.subtitleDelay), findsNothing);
    expect(find.textContaining(l10n.streamTypeFallback('Subtitle', 1)), findsOneWidget);
  });

  testWidgets('the primary and secondary step waits for the setting', (tester) async {
    final manager = _Manager(
      _Backend(secondaryStyle: true),
      primaryIndex: 2,
      resolution: StreamResolutionResult(
        streamUrl: 'https://host/stream',
        mediaSourceId: 'source',
        playMethod: StreamPlayMethod.directPlay,
        mediaStreams: [
          {'Type': 'Subtitle', 'Index': 2, 'Codec': 'subrip'},
          {'Type': 'Subtitle', 'Index': 3, 'Codec': 'subrip'},
        ],
      ),
    );
    addTearDown(manager.dispose);
    await openPicker(tester, manager, audio: false);
    expect(find.text(l10n.secondarySubtitleSlot), findsNothing);
    expect(find.textContaining(l10n.streamTypeFallback('Subtitle', 2)), findsOneWidget);
    Navigator.of(tester.element(find.byType(Dialog))).pop();
    await tester.pumpAndSettle();

    await GetIt.instance<UserPreferences>().set(
      UserPreferences.secondarySubtitlesEnabled,
      true,
    );
    await openPicker(tester, manager, audio: false);
    expect(find.text(l10n.primarySubtitleSlot), findsOneWidget);
    expect(find.text(l10n.secondarySubtitleSlot), findsOneWidget);
  });

  testWidgets('appearance follows available text tracks, while delay stays visible', (tester) async {
    for (final (codecs, showAppearance) in [
      (<String>[], false), (['pgssub'], false), (['pgs', 'dvdsub'], false),
      (['pgssub', 'subrip'], true), (['ass', 'ssa'], true), (['webvtt'], true),
      (['mov_text'], true), (['tx3g'], true),
    ]) {
      for (final method in [StreamPlayMethod.directPlay, StreamPlayMethod.transcode]) {
        for (final selected in [-1, 2]) {
          final manager = _Manager(
            _Backend()..subtitleDelaySeconds = 1.25,
            primaryIndex: selected,
            resolution: StreamResolutionResult(
              streamUrl: 'https://host/stream', mediaSourceId: 'source', playMethod: method,
              mediaStreams: [for (var i = 0; i < codecs.length; i++)
                {'Type': 'Subtitle', 'Index': i + 2, 'Codec': codecs[i]}],
            ),
          );
          addTearDown(manager.dispose);
          await openPicker(tester, manager, audio: false);
          expect(find.text(l10n.subtitleSize), showAppearance ? findsOneWidget : findsNothing);
          expect(find.text(l10n.verticalOffset), showAppearance ? findsOneWidget : findsNothing);
          expect(find.text(l10n.subtitleDelay), findsOneWidget);
          expect(find.text('+1250 ms'), findsOneWidget);
          if (!showAppearance) expect(find.text(l10n.secondarySubtitleSlot), findsNothing);
          Navigator.of(tester.element(find.byType(Dialog))).pop();
          await tester.pumpAndSettle();
        }
      }
    }
  });

  testWidgets('primary offset uses 2% steps and stops at 36%', (tester) async {
    final prefs = GetIt.instance<UserPreferences>();
    final backend = _Backend();
    final manager = _Manager(
      backend,
      primaryIndex: 2,
      resolution: StreamResolutionResult(
        streamUrl: 'https://host/stream',
        mediaSourceId: 'source',
        playMethod: StreamPlayMethod.directPlay,
        mediaStreams: [
          {'Type': 'Subtitle', 'Index': 2, 'Codec': 'subrip'},
        ],
      ),
    );
    addTearDown(manager.dispose);
    await openPicker(tester, manager, audio: false);
    final increase = find.byTooltip(l10n.increaseValue(l10n.verticalOffset));
    for (var i = 0; i < 17; i++) {
      await tester.tap(increase);
      await tester.pumpAndSettle();
    }
    expect(prefs.get(UserPreferences.subtitlesOffsetPosition), 0.36);
    expect(backend.primaryOffsets.last, 0.36);
    expect(find.text('36%'), findsOneWidget);
  });

  testWidgets('legacy primary offset snaps to the 2% grid on first edit', (
    tester,
  ) async {
    final prefs = GetIt.instance<UserPreferences>();
    final backend = _Backend();
    final manager = _Manager(
      backend,
      primaryIndex: 2,
      resolution: StreamResolutionResult(
        streamUrl: 'https://host/stream',
        mediaSourceId: 'source',
        playMethod: StreamPlayMethod.directPlay,
        mediaStreams: [
          {'Type': 'Subtitle', 'Index': 2, 'Codec': 'subrip'},
        ],
      ),
    );
    addTearDown(manager.dispose);

    await prefs.set(UserPreferences.subtitlesOffsetPosition, 0.05);
    await openPicker(tester, manager, audio: false);
    expect(find.text('5%'), findsOneWidget);
    await tester.tap(find.byTooltip(l10n.increaseValue(l10n.verticalOffset)));
    await tester.pumpAndSettle();
    expect(prefs.get(UserPreferences.subtitlesOffsetPosition), 0.06);

    Navigator.of(tester.element(find.byType(Dialog))).pop();
    await tester.pumpAndSettle();
    await prefs.set(UserPreferences.subtitlesOffsetPosition, 0.50);
    await openPicker(tester, manager, audio: false);
    expect(find.text('36%'), findsOneWidget);
    await tester.tap(find.byTooltip(l10n.decreaseValue(l10n.verticalOffset)));
    await tester.pumpAndSettle();
    expect(prefs.get(UserPreferences.subtitlesOffsetPosition), 0.36);
  });

  testWidgets('secondary offset runs from Default through +6% in 2% steps', (
    tester,
  ) async {
    final prefs = GetIt.instance<UserPreferences>();
    final manager = _Manager(_Backend(secondaryStyle: true));
    addTearDown(manager.dispose);
    await openPicker(tester, manager, secondary: true);
    for (final (increase, expected) in [
      (false, 0), (true, 2), (true, 4), (true, 6), (true, 6),
    ]) {
      final tooltip = increase ? l10n.increaseValue(l10n.verticalOffset)
          : l10n.decreaseValue(l10n.verticalOffset);
      await tester.tap(find.byTooltip(tooltip));
      await tester.pumpAndSettle();
      expect(prefs.get(UserPreferences.secondarySubtitleOffsetPosition), expected / 100);
      expect(manager.secondarySubtitleOffset, expected / 100);
      if (expected == 0) {
        expect(find.text(l10n.defaultLabel), findsWidgets);
      } else {
        expect(find.text('+$expected%'), findsOneWidget);
      }
    }
  });

}
