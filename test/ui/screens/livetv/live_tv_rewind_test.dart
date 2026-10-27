import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/log_service.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/platform/pip_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_player_screen.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/util/platform_detection.dart';

class _Client extends Mock implements MediaServerClient {}

class _LiveTvApi extends Mock implements LiveTvApi {}

class _Log extends Fake implements LogService {
  @override
  void playback(
    String message, {
    LogLevel level = LogLevel.debug,
    Object? error,
  }) {}
}

class _Screensaver extends Fake implements ScreensaverController {
  @override
  void setPlaybackActive(bool active) {}
}

class _Backend extends Fake implements PlayerBackend {
  LiveSeekWindow? window;
  final volumes = <double>[];

  @override
  LiveSeekWindow? get liveSeekWindow => window;

  @override
  Future<void> setVolume(double volume) async => volumes.add(volume);

  @override
  Stream<void> get tracksChangedStream => const Stream.empty();

  @override
  List<EmbeddedCaptionTrack> get embeddedCaptionTracks => const [];

  @override
  Future<void> configureSubtitleStyle({
    int? textColor,
    int? backgroundColor,
    int? strokeColor,
    double? fontSize,
    int? fontWeight,
    double? verticalOffset,
  }) async {}
}

class _Manager extends PlaybackManager {
  _Manager(this.fakeBackend);

  final _Backend fakeBackend;
  final seeks = <Duration>[];
  final resumes = <bool>[];
  final _bringup = StreamController<PlaybackBringupState>.broadcast();

  @override
  PlayerBackend? get backend => fakeBackend;

  @override
  Stream<PlaybackBringupState> get bringupStateStream => _bringup.stream;

  @override
  Future<void> playItems(
    List<dynamic> items, {
    int startIndex = 0,
    Duration startPosition = Duration.zero,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    String? mediaSourceId,
    bool audioSelectionExplicit = false,
    bool subtitleSelectionExplicit = false,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
    bool autoPlay = true,
    bool carryTrackSelections = false,
  }) async {
    final id = (items.first as AggregatedItem).id;
    _bringup
      ..add(
        PlaybackBringupState(
          phase: PlaybackBringupPhase.opening,
          sessionToken: 1,
          itemId: id,
        ),
      )
      ..add(
        PlaybackBringupState(
          phase: PlaybackBringupPhase.ready,
          sessionToken: 1,
          itemId: id,
        ),
      );
    state.setPlaying(true);
  }

  @override
  Future<void> seekTo(Duration position) async {
    seeks.add(position);
    state.setPosition(position);
  }

  @override
  Future<void> resume() async {
    resumes.add(true);
    state.setPlaying(true);
  }

  @override
  Future<void> pause() async => state.setPlaying(false);

  @override
  Future<void> stop({bool userInitiated = true}) async {}
}

// Issue #1189: a live stream that keeps a window, like an internet channel's
// HLS playlist, can be rewound through it and brought back to live.
void main() {
  late _Manager manager;
  late _Backend backend;
  late AppLocalizations l10n;

  const twoHours = Duration(hours: 2);

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('en'));
  });

  setUp(() async {
    PlatformDetection.setTvMode(true);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final liveTv = _LiveTvApi();
    when(
      () => liveTv.getGuide(
        channelIds: any(named: 'channelIds'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer((_) async => const <String, dynamic>{'Items': []});
    when(liveTv.getTimers).thenAnswer((_) async => const <String, dynamic>{});
    final client = _Client();
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.userId).thenReturn('user');
    when(() => client.liveTvApi).thenReturn(liveTv);

    backend = _Backend();
    manager = _Manager(backend);
    GetIt.instance
      ..registerSingleton<PlaybackManager>(manager)
      ..registerSingleton<UserPreferences>(UserPreferences(store))
      ..registerSingleton<MediaServerClient>(client)
      ..registerSingleton<ScreensaverController>(_Screensaver())
      ..registerSingleton<PipService>(PipService())
      ..registerSingleton<LogService>(_Log());
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    manager.dispose();
    await GetIt.instance.reset();
  });

  Future<void> pumpPlayer(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: const LiveTvPlayerScreen(
          channels: [
            GuideChannel(id: 'ard', name: 'Das Erste', rawData: {}),
          ],
          startIndex: 0,
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  Future<void> hideControls(WidgetTester tester) async {
    await tester.pump(const Duration(seconds: 6));
    expect(find.byTooltip(l10n.liveTvJumpToLive), findsNothing);
  }

  Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyEvent(key);
    await tester.pump();
  }

  testWidgets('a long window shows the rewind controls at live', (
    tester,
  ) async {
    backend.window = const LiveSeekWindow(start: Duration.zero, edge: twoHours);
    manager.state.setPosition(twoHours);
    await pumpPlayer(tester);

    expect(find.byTooltip(l10n.playerTooltipSeekBack), findsOneWidget);
    expect(find.byTooltip(l10n.playerTooltipSeekForward), findsOneWidget);
    expect(find.byTooltip(l10n.liveTvJumpToLive), findsOneWidget);
    expect(find.text(l10n.liveBadge), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('presses add up into one seek back', (tester) async {
    backend.window = const LiveSeekWindow(start: Duration.zero, edge: twoHours);
    manager.state.setPosition(twoHours);
    await pumpPlayer(tester);
    await hideControls(tester);

    await press(tester, LogicalKeyboardKey.arrowLeft);
    await press(tester, LogicalKeyboardKey.arrowLeft);
    expect(find.text('-0:20'), findsOneWidget);
    expect(manager.seeks, isEmpty);

    await tester.pump(const Duration(milliseconds: 700));
    expect(manager.seeks, [twoHours - const Duration(seconds: 20)]);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('Jump to Live goes back to the edge and plays', (tester) async {
    backend.window = const LiveSeekWindow(start: Duration.zero, edge: twoHours);
    manager.state.setPosition(const Duration(minutes: 30));
    await pumpPlayer(tester);
    await manager.pause();
    await tester.pump();

    await tester.tap(find.byTooltip(l10n.liveTvJumpToLive));
    await tester.pump();

    expect(manager.seeks, [twoHours]);
    expect(manager.resumes, isNotEmpty);
    expect(find.text(l10n.liveBadge), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a rewind never goes past the oldest kept moment', (
    tester,
  ) async {
    backend.window = const LiveSeekWindow(start: Duration.zero, edge: twoHours);
    manager.state.setPosition(const Duration(seconds: 5));
    await pumpPlayer(tester);
    await hideControls(tester);

    await press(tester, LogicalKeyboardKey.arrowLeft);
    await tester.pump(const Duration(milliseconds: 700));

    expect(manager.seeks, [Duration.zero]);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('once in the buttons, left and right move between them', (
    tester,
  ) async {
    backend.window = const LiveSeekWindow(start: Duration.zero, edge: twoHours);
    manager.state.setPosition(twoHours);
    await pumpPlayer(tester);
    await hideControls(tester);

    await press(tester, LogicalKeyboardKey.arrowLeft);
    await tester.pump(const Duration(milliseconds: 700));
    await press(tester, LogicalKeyboardKey.arrowDown);
    expect(FocusManager.instance.primaryFocus?.debugLabel, 'LiveTvPlayPause');

    await press(tester, LogicalKeyboardKey.arrowRight);
    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      'LiveTvSkipForward',
    );
    expect(manager.seeks, hasLength(1));

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('the buttons join the row when the window turns up', (
    tester,
  ) async {
    await pumpPlayer(tester);
    expect(find.byTooltip(l10n.playerTooltipSeekBack), findsNothing);
    await press(tester, LogicalKeyboardKey.arrowDown);
    expect(FocusManager.instance.primaryFocus?.debugLabel, 'LiveTvPlayPause');

    backend.window = const LiveSeekWindow(start: Duration.zero, edge: twoHours);
    manager.state.setPosition(twoHours);
    await tester.pump();
    expect(find.byTooltip(l10n.playerTooltipSeekBack), findsOneWidget);

    await press(tester, LogicalKeyboardKey.arrowRight);
    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      'LiveTvSkipForward',
    );

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('the remote rewind key steps back', (tester) async {
    backend.window = const LiveSeekWindow(start: Duration.zero, edge: twoHours);
    manager.state.setPosition(twoHours);
    await pumpPlayer(tester);

    await press(tester, LogicalKeyboardKey.mediaRewind);
    await tester.pump(const Duration(milliseconds: 700));

    expect(manager.seeks, [twoHours - const Duration(seconds: 10)]);

    await tester.pumpWidget(const SizedBox());
  });

  // Issue #1880: the remote's play and pause buttons work on live channels.
  testWidgets('the remote play and pause buttons pause and resume', (
    tester,
  ) async {
    await pumpPlayer(tester);

    await press(tester, LogicalKeyboardKey.mediaPlayPause);
    expect(manager.state.isPlaying, isFalse);
    await press(tester, LogicalKeyboardKey.mediaPlayPause);
    expect(manager.state.isPlaying, isTrue);
    await press(tester, LogicalKeyboardKey.mediaPause);
    expect(manager.state.isPlaying, isFalse);
    await press(tester, LogicalKeyboardKey.mediaPlay);
    expect(manager.state.isPlaying, isTrue);

    await tester.pumpWidget(const SizedBox());
  });

  for (final window in [
    null,
    const LiveSeekWindow(start: Duration.zero, edge: Duration(seconds: 30)),
  ]) {
    testWidgets('no rewind without a window to rewind through ($window)', (
      tester,
    ) async {
      backend.window = window;
      await pumpPlayer(tester);

      expect(find.byTooltip(l10n.playerTooltipSeekBack), findsNothing);
      expect(find.byTooltip(l10n.liveTvJumpToLive), findsNothing);
      await hideControls(tester);
      await press(tester, LogicalKeyboardKey.arrowLeft);
      await tester.pump(const Duration(milliseconds: 700));
      expect(manager.seeks, isEmpty);

      await tester.pumpWidget(const SizedBox());
    });
  }

  // Issue #1921: Live TV on desktop gets a volume slider and mute button.
  group('volume', () {
    Slider slider(WidgetTester tester) =>
        tester.widget<Slider>(find.byType(Slider));

    testWidgets(
      'desktop starts at the saved level and keeps a new one',
      (tester) async {
        PlatformDetection.setTvMode(false);
        final prefs = GetIt.instance<UserPreferences>();
        await prefs.set(UserPreferences.playerVolume, 40.0);
        await pumpPlayer(tester);

        expect(backend.volumes, [40]);
        expect(slider(tester).value, 0.4);

        slider(tester).onChanged!(0.75);
        await tester.pump(const Duration(milliseconds: 500));
        expect(backend.volumes.last, 75);
        expect(prefs.get(UserPreferences.playerVolume), 75);

        manager.reportVolumeState(volume: 20, isMuted: false);
        await tester.pump();
        expect(slider(tester).value, 0.2);

        await tester.pumpWidget(const SizedBox());
      },
      variant: TargetPlatformVariant.only(TargetPlatform.linux),
    );

    testWidgets(
      'desktop mute goes back to the level it left',
      (tester) async {
        PlatformDetection.setTvMode(false);
        await pumpPlayer(tester);
        slider(tester).onChanged!(0.6);
        await tester.pump();

        await tester.tap(find.byTooltip(l10n.mute));
        await tester.pump();
        expect(backend.volumes.last, 0);

        await tester.tap(find.byTooltip(l10n.unmute));
        await tester.pump();
        expect(backend.volumes.last, 60);

        await tester.pumpWidget(const SizedBox());
      },
      variant: TargetPlatformVariant.only(TargetPlatform.linux),
    );

    testWidgets('TV leaves the volume to the remote', (tester) async {
      await pumpPlayer(tester);

      expect(find.byType(Slider), findsNothing);
      expect(find.byTooltip(l10n.mute), findsNothing);
      expect(backend.volumes, isEmpty);

      await tester.pumpWidget(const SizedBox());
    });
  });
}
