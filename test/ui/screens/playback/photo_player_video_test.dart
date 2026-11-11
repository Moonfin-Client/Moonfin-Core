import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/navigation/focus_route_observer.dart';
import 'package:moonfin/ui/screens/playback/photo_player_screen.dart';
import 'package:moonfin/ui/widgets/adaptive/sf_symbol.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockImageApi extends Mock implements ImageApi {}

class _MockFactory extends Mock implements MediaServerClientFactory {}

class _MockManager extends Mock implements PlaybackManager {}

Map<String, dynamic> _entry(String id, String name, String type) => {
  'Id': id,
  'ServerId': 'server-from-data',
  'Name': name,
  'Type': type,
  'ParentId': 'album',
};

final _names = {
  Icons.arrow_back: 'back',
  Icons.skip_previous: 'previous',
  Icons.skip_next: 'next',
  Icons.play_arrow: 'slideshow',
  Icons.pause: 'pause',
  Icons.play_circle_fill: 'play video',
};

final _album = [
  _entry('photo1', 'Photo 1', 'Photo'),
  _entry('video2', 'Video 2', 'Video'),
  _entry('photo3', 'Photo 3', 'Photo'),
];

void main() {
  late _MockItemsApi items;
  late _MockManager manager;
  late GoRouter router;
  var playItemsCalls = <List<dynamic>>[];

  setUpAll(() {
    registerFallbackValue(_MockClient());
  });

  setUp(() {
    playItemsCalls = [];
    items = _MockItemsApi();
    manager = _MockManager();
    final images = _MockImageApi();
    final client = _MockClient();
    final factory = _MockFactory();
    when(() => client.itemsApi).thenReturn(items);
    when(() => client.imageApi).thenReturn(images);
    when(() => factory.serverIdOf(any())).thenReturn('registered-server');
    when(
      () => images.getPrimaryImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://localhost/photo.jpg');
    when(() => items.getItem(any())).thenAnswer((invocation) async {
      final id = invocation.positionalArguments.first as String;
      return _album.firstWhere((e) => e['Id'] == id);
    });
    when(
      () => items.getItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer((_) async => {'Items': _album});

    var preparing = false;
    when(() => manager.beginPlaybackPreparation()).thenAnswer((_) {
      preparing = true;
    });
    when(() => manager.skipExternalRoutingOnce()).thenReturn(null);
    when(() => manager.consumeSkipExternalRoutingOnce()).thenReturn(false);
    when(() => manager.cancelPlaybackPreparation()).thenAnswer((_) {
      preparing = false;
    });
    when(() => manager.playbackDeferredToExternalPlayer).thenReturn(false);
    when(() => manager.bringupState).thenAnswer(
      (_) => preparing
          ? const PlaybackBringupState(phase: PlaybackBringupPhase.preparing)
          : const PlaybackBringupState.idle(),
    );
    when(() => manager.playItems(any())).thenAnswer((invocation) async {
      playItemsCalls.add(invocation.positionalArguments.first as List<dynamic>);
      preparing = false;
    });

    GetIt.instance
      ..registerSingleton<MediaServerClient>(client)
      ..registerSingleton<MediaServerClientFactory>(factory)
      ..registerSingleton<PlaybackManager>(manager);
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    router.dispose();
    await GetIt.instance.reset();
  });

  Future<void> pumpViewer(
    WidgetTester tester,
    String openOn, {
    bool tv = false,
  }) async {
    PlatformDetection.setTvMode(tv);
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    router = GoRouter(
      observers: [FocusRouteObserver()],
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => PhotoPlayerScreen(itemId: openOn),
        ),
        GoRoute(
          path: Destinations.videoPlayer,
          builder: (_, _) => const Scaffold(body: Text('video player')),
        ),
      ],
    );
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
    await tester.pump(const Duration(milliseconds: 500));
  }

  Future<void> next(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.skip_next));
    await tester.pump(const Duration(milliseconds: 500));
  }

  final playButton = find.byIcon(Icons.play_circle_fill);

  /// The photo's loading spinner never stops animating, so these screens
  /// can't pumpAndSettle.
  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 4; i++) {
      await tester.pump(const Duration(milliseconds: 250));
    }
  }

  testWidgets('the album loads photos and videos together', (tester) async {
    await pumpViewer(tester, 'photo1');

    verify(
      () => items.getItems(
        parentId: 'album',
        includeItemTypes: ['Photo', 'Video'],
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        limit: any(named: 'limit'),
      ),
    ).called(1);
    expect(find.text('1 / 3'), findsOneWidget);
  });

  testWidgets('only a video shows the play button', (tester) async {
    await pumpViewer(tester, 'photo1');
    expect(find.text('Photo 1'), findsOneWidget);
    expect(playButton, findsNothing);

    await next(tester);
    expect(find.text('Video 2'), findsOneWidget);
    expect(playButton, findsOneWidget);

    await next(tester);
    expect(find.text('Photo 3'), findsOneWidget);
    expect(playButton, findsNothing);
  });

  testWidgets('playing loads the full item and starts it by the registered '
      'server id', (tester) async {
    await pumpViewer(tester, 'photo1');
    await next(tester);
    await tester.tap(playButton);
    await settle(tester);

    verify(() => items.getItem('video2')).called(1);
    expect(playItemsCalls, hasLength(1));
    final started = playItemsCalls.single.single as AggregatedItem;
    expect(started.id, 'video2');
    expect(started.serverId, 'registered-server');
    expect(find.text('video player'), findsOneWidget);
  });

  testWidgets('back from the player returns to the same video', (tester) async {
    await pumpViewer(tester, 'photo1');
    await next(tester);
    await tester.tap(playButton);
    await settle(tester);
    expect(find.text('video player'), findsOneWidget);

    router.pop();
    await settle(tester);

    expect(find.text('Video 2'), findsOneWidget);
    expect(find.text('2 / 3'), findsOneWidget);
    expect(playButton, findsOneWidget);
    // Returning never starts the video again.
    expect(playItemsCalls, hasLength(1));
  });

  testWidgets('a video that fails to start shows a message and can be '
      'retried', (tester) async {
    await pumpViewer(tester, 'photo1');
    await next(tester);

    var failing = true;
    when(() => items.getItem('video2')).thenAnswer((_) async {
      if (failing) throw Exception('server down');
      return _album[1];
    });

    await tester.tap(playButton);
    await settle(tester);
    expect(find.text('Failed to play Video 2'), findsOneWidget);
    expect(find.text('video player'), findsNothing);
    expect(playItemsCalls, isEmpty);

    failing = false;
    await tester.tap(playButton);
    await settle(tester);
    expect(playItemsCalls, hasLength(1));
    expect(find.text('video player'), findsOneWidget);
  });

  testWidgets('playing a video stops a running slideshow', (tester) async {
    await pumpViewer(tester, 'photo1');
    await next(tester);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    expect(find.byIcon(Icons.pause), findsOneWidget);

    await tester.tap(playButton);
    await settle(tester);
    router.pop();
    await settle(tester);
    await tester.pump(const Duration(seconds: 20));

    // Still on the video, where a running slideshow would have moved on.
    expect(playButton, findsOneWidget);
    await tester.tapAt(const Offset(100, 300));
    await settle(tester);
    expect(find.byIcon(Icons.pause), findsNothing);
    expect(find.text('Video 2'), findsOneWidget);
  });

  group('with a remote', () {
    Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
      await tester.sendKeyEvent(key);
      await tester.pump(const Duration(milliseconds: 100));
    }

    String focusedIcon() {
      final focus = FocusManager.instance.primaryFocus;
      final context = focus?.context;
      if (context == null) return 'nothing';
      final button = context.findAncestorWidgetOfExactType<IconButton>();
      final icon = button?.icon;
      if (icon is AdaptiveIcon) return _names[icon.icon] ?? '${icon.icon}';
      return '${icon.runtimeType}';
    }

    testWidgets('the remote can reach the play button and start the video '
        'once', (tester) async {
      await pumpViewer(tester, 'video2', tv: true);
      await tester.pump(const Duration(seconds: 1));
      // The route lands on the back arrow, the first control in the tree.
      expect(focusedIcon(), 'back');

      await press(tester, LogicalKeyboardKey.arrowDown);
      await press(tester, LogicalKeyboardKey.arrowRight);
      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focusedIcon(), 'next');
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedIcon(), 'play video');

      await press(tester, LogicalKeyboardKey.select);
      await settle(tester);
      expect(playItemsCalls, hasLength(1));
      expect(find.text('video player'), findsOneWidget);
    });

    testWidgets('once the controls hide, an arrow key still brings focus to '
        'the play button', (tester) async {
      await pumpViewer(tester, 'video2', tv: true);
      await tester.pump(const Duration(seconds: 6));
      expect(find.byIcon(Icons.skip_next), findsNothing);
      expect(playButton, findsOneWidget);

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedIcon(), 'play video');
      await press(tester, LogicalKeyboardKey.select);
      await settle(tester);
      expect(playItemsCalls, hasLength(1));
    });

    testWidgets('the remote can start the video again after returning from '
        'the player', (tester) async {
      await pumpViewer(tester, 'video2', tv: true);
      await tester.pump(const Duration(seconds: 6));
      await press(tester, LogicalKeyboardKey.arrowDown);
      await press(tester, LogicalKeyboardKey.select);
      await settle(tester);
      expect(find.text('video player'), findsOneWidget);

      router.pop();
      await settle(tester);
      await tester.pump(const Duration(seconds: 1));
      expect(playButton, findsOneWidget);

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedIcon(), 'play video');
      await press(tester, LogicalKeyboardKey.select);
      await settle(tester);
      expect(playItemsCalls, hasLength(2));
    });
  });
}
