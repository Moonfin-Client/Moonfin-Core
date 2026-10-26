import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/playback/native_apple_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/ui/screens/playback/appletv_player_host_screen.dart';
import 'package:moonfin/ui/widgets/playback/player_loading_overlay.dart';
import 'package:playback_core/playback_core.dart';

import '../../../util/media_segment_fakes.dart';

class _MockPlaybackManager extends Mock implements PlaybackManager {}

class _SegmentClient extends Fake implements MediaServerClient {
  final items = FakeItemsApi();

  @override
  ServerType get serverType => ServerType.jellyfin;

  @override
  ItemsApi get itemsApi => items;

  @override
  ImageApi get imageApi => _EmptyImageApi();

  @override
  TrickplayApi? get trickplayApi => null;
}

class _EmptyImageApi extends Fake implements ImageApi {}

const _control = MethodChannel('moonfin/native_apple_player_control');
const _events = MethodChannel('moonfin/native_apple_player_events');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => registerFallbackValue(Duration.zero));

  late _MockPlaybackManager manager;
  late QueueService queue;
  late PlayerState playerState;
  late StreamController<PlaybackBringupState> bringupController;

  setUp(() {
    manager = _MockPlaybackManager();
    queue = QueueService();
    playerState = PlayerState();
    bringupController = StreamController<PlaybackBringupState>.broadcast();

    when(() => manager.bringupState).thenReturn(
      const PlaybackBringupState(phase: PlaybackBringupPhase.preparing),
    );
    when(
      () => manager.bringupStateStream,
    ).thenAnswer((_) => bringupController.stream);
    when(() => manager.queueService).thenReturn(queue);
    when(
      () => manager.sessionEndedStream,
    ).thenAnswer((_) => const Stream<void>.empty());
    when(() => manager.state).thenReturn(playerState);
    when(() => manager.secondarySubtitleOffset).thenReturn(0.0);
    when(
      () => manager.stop(userInitiated: any(named: 'userInitiated')),
    ).thenAnswer((_) async {});

    GetIt.instance.registerSingleton<PlaybackManager>(manager);
  });

  tearDown(() async {
    await GetIt.instance.reset();
    await bringupController.close();
    queue.dispose();
    playerState.dispose();
  });

  testWidgets('tvOS host refreshes subtitle appearance and routes segment controls', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.cinemaModeSkipEnabled, true);
    await prefs.set(UserPreferences.mediaSegmentActions, 'intro:askToSkip');
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    final backend = NativeApplePlayerBackend(prefs);
    addTearDown(backend.dispose);
    GetIt.instance.registerSingleton<NativeApplePlayerBackend>(backend);
    final client = _SegmentClient();
    client.items.segments = [
      segmentJson(id: 'intro', type: 'Intro', startMs: 5000, endMs: 10000),
    ];
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    when(() => manager.isOfflinePlayback).thenReturn(false);
    when(() => manager.isTranscodeForced).thenReturn(false);
    when(() => manager.playbackDeferredToExternalPlayer).thenReturn(false);
    when(() => manager.seekTo(any())).thenAnswer((_) async {});
    when(() => manager.nextInQueue()).thenAnswer((_) async => queue.next());
    when(
      () => manager.configureSecondarySubtitleStyle(
        fontSize: any(named: 'fontSize'),
        verticalOffset: any(named: 'verticalOffset'),
        textColor: any(named: 'textColor'),
      ),
    ).thenAnswer((_) async {});

    final calls = <MethodCall>[];
    final messenger = tester.binding.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(_control, (call) async {
      calls.add(call);
      return null;
    });
    messenger.setMockMethodCallHandler(_events, (_) async => null);
    addTearDown(() {
      messenger.setMockMethodCallHandler(_control, null);
      messenger.setMockMethodCallHandler(_events, null);
    });
    queue.setQueue([
      {'Id': 'intro', '__moonfinIsPreroll': true, 'RunTimeTicks': 900000000},
      {'Id': 'short', '__moonfinIsPreroll': true, 'RunTimeTicks': 50000000},
      {'Id': 'movie', 'RunTimeTicks': 900000000},
    ]);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: const AppleTvPlayerHostScreen(),
      ),
    );
    await tester.pump();

    calls.clear();

    await prefs.set(UserPreferences.secondarySubtitleSizeAdjustment, 10.0);
    await tester.pump();
    final updates = calls.where((call) => call.method == 'setUiMetadata').toList();
    expect(updates, hasLength(1));
    final metadata = updates.single.arguments as Map;
    expect((metadata['subtitleControls'] as Map)['sizeAdjustment'], 10.0);

    calls.clear();
    await prefs.set(UserPreferences.cinemaModeSkipEnabled, true);
    await tester.pump();
    expect(calls.where((call) => call.method == 'setUiMetadata'), isEmpty);

    Future<void> send(Map<String, Object> data) async {
      await messenger.handlePlatformMessage(
        _events.name,
        const StandardMethodCodec().encodeSuccessEnvelope(data),
        (_) {},
      );
      await tester.pump();
    }

    await prefs.set(UserPreferences.cinemaModeSkipEnabled, false);
    await tester.pump();
    playerState.setPosition(const Duration(seconds: 6));
    await tester.pump();
    expect(calls.where((c) => c.method == 'showSkipSegment').length, 1);
    await prefs.set(UserPreferences.cinemaModeSkipEnabled, true);
    await tester.pump();
    await send({'event': 'skipSegment'});
    verifyNever(() => manager.seekTo(any()));
    await send({'event': 'seek', 'positionMs': 8000});
    verify(() => manager.seekTo(const Duration(seconds: 8))).called(1);
    await send({'event': 'seek', 'positionMs': 30000, 'isForwardSkip': true});
    verify(() => manager.nextInQueue()).called(1);
    expect(queue.currentIndex, 1);
    await tester.pump(const Duration(milliseconds: 400));
    await send({'event': 'seek', 'positionMs': 35000, 'isForwardSkip': true});
    verify(() => manager.nextInQueue()).called(1);
    expect(queue.currentIndex, 2);
    await send({'event': 'seek', 'positionMs': 13000, 'isForwardSkip': true});
    verify(() => manager.seekTo(const Duration(seconds: 13))).called(1);
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('uses a white native spinner throughout tvOS bring-up', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AppleTvPlayerHostScreen()));

    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    expect(find.byType(PlayerLoadingOverlay), findsNothing);
    final spinner = tester.widget<CupertinoActivityIndicator>(
      find.byType(CupertinoActivityIndicator),
    );
    expect(spinner.radius, 20);
    expect(spinner.color, Colors.white);

    bringupController.add(
      const PlaybackBringupState(phase: PlaybackBringupPhase.resolving),
    );
    await tester.pump();
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);

    bringupController.add(
      const PlaybackBringupState(phase: PlaybackBringupPhase.ready),
    );
    await tester.pump();
    expect(find.byType(CupertinoActivityIndicator), findsNothing);
  });

  testWidgets('removes tvOS launch feedback after startup failure', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AppleTvPlayerHostScreen()));

    bringupController.add(
      const PlaybackBringupState(phase: PlaybackBringupPhase.failed),
    );
    await tester.pump();

    expect(find.byType(CupertinoActivityIndicator), findsNothing);
  });
}
