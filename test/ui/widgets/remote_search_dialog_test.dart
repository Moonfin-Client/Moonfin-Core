import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/remote_control_dialog.dart';
import 'package:moonfin/ui/widgets/remote_search_sheet.dart';
import 'package:moonfin/ui/widgets/remote_navigation_pad.dart';
import 'package:server_core/server_core.dart';

class _Api extends Fake implements SessionApi {
  List<Map<String, dynamic>> sessions = [];
  final commands = <(String, String)>[];
  final volumeArguments = <String?>[];
  Completer<void>? barrier;
  final playCommands = <String>[];
  @override
  Future<void> sendPlayStateCommand(
    String id,
    String command, {
    int? seekPositionTicks,
  }) async {
    playCommands.add(command);
  }

  @override
  Future<List<Map<String, dynamic>>> getSessions({
    String? controllableByUserId,
  }) async => sessions;
  @override
  Future<void> sendGeneralCommand(
    String id,
    String name, {
    Map<String, String>? arguments,
  }) async {
    commands.add((id, name));
    if (name == 'SetVolume') volumeArguments.add(arguments?['Volume']);
    await barrier?.future;
  }
}

class _Client extends Fake implements MediaServerClient {
  _Client(this.sessionApi);
  @override
  final SessionApi sessionApi;
  @override
  String get userId => 'user';
  @override
  DeviceInfo get deviceInfo => const DeviceInfo(
    id: 'phone',
    name: 'Phone',
    appName: 'Moonfin',
    appVersion: 'test',
  );
}

class _Socket extends Fake implements SocketHandler {
  final controller = StreamController<ServerWebSocketMessage>.broadcast(
    sync: true,
  );
  @override
  Stream<ServerWebSocketMessage> get events => controller.stream;
}

void main() {
  late _Api api;
  late _Socket socket;
  setUp(() {
    api = _Api();
    socket = _Socket();
    GetIt.instance.registerSingleton<MediaServerClient>(_Client(api));
    GetIt.instance.registerSingleton<SocketHandler>(socket);
  });
  tearDown(() async {
    await socket.controller.close();
    await GetIt.instance.reset();
  });

  const navigationCommands = [
    'MoveUp',
    'MoveDown',
    'MoveLeft',
    'MoveRight',
    'Select',
    'Back',
    'GoHome',
    'GoToSearch',
    'SendString',
    'VolumeUp',
    'VolumeDown',
    'ToggleMute',
  ];

  Map<String, dynamic> target(
    String id, {
    String client = 'Moonfin for webOS',
    List<String> commands = navigationCommands,
  }) => {
    'Id': id,
    'DeviceId': id,
    'DeviceName': id,
    'Client': client,
    'SupportedCommands': commands,
  };

  Future<void> disposeRemote(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  }

  Future<void> tapCommand(WidgetTester tester, String command) async {
    final button = find.byKey(ValueKey('remote-$command'));
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pump();
  }

  Future<void> open(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showRemoteControlDialog(context),
              child: const Text('Remote'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Remote'));
    await tester.pumpAndSettle();
  }

  for (final nested in [false, true]) {
    testWidgets('idle target can open search (nested capabilities: $nested)', (
      tester,
    ) async {
      const commands = ['GoToSearch', 'SendString'];
      api.sessions = [
        {
          'Id': 'selected-tv',
          'DeviceId': 'tv',
          'DeviceName': 'Living room',
          'Client': 'Moonfin',
          if (nested)
            'Capabilities': {'SupportedCommands': commands}
          else
            'SupportedCommands': commands,
        },
      ];
      await open(tester);
      await tester.tap(find.text('Moonfin · Living room'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();
      expect(find.byType(RemoteSearchSheet), findsOneWidget);
      expect(api.commands, [('selected-tv', 'GoToSearch')]);
      expect(tester.testTextInput.isVisible, isTrue);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }

  testWidgets('idle TV has navigation and volume, with no playback controls', (
    tester,
  ) async {
    api.sessions = [target('tv')];
    await open(tester);
    await tester.tap(find.text('Moonfin for webOS · tv'));
    await tester.pumpAndSettle();
    expect(find.byType(RemoteNavigationPad), findsOneWidget);
    expect(find.text('Stop'), findsNothing);
    expect(find.byType(Slider), findsNothing);
    for (final command in [
      'MoveUp',
      'MoveDown',
      'MoveLeft',
      'MoveRight',
      'Select',
      'Back',
      'GoHome',
    ]) {
      await tapCommand(tester, command);
    }
    expect(api.commands.map((c) => c.$2), [
      'MoveUp',
      'MoveDown',
      'MoveLeft',
      'MoveRight',
      'Select',
      'Back',
      'GoHome',
    ]);
    final volume = find.byIcon(Icons.volume_up_rounded);
    await tester.ensureVisible(volume);
    await tester.tap(volume);
    await tester.pump();
    expect(api.commands.last, ('tv', 'VolumeUp'));
    await disposeRemote(tester);
  });

  testWidgets(
    'unsupported pad buttons are disabled and unknown idle volume is hidden',
    (tester) async {
      api.sessions = [
        target(
          'tv',
          client: 'Other',
          commands: ['MoveUp', 'Select', 'VolumeUp'],
        ),
      ];
      await open(tester);
      await tester.tap(find.text('Other · tv'));
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<IconButton>(find.byKey(const ValueKey('remote-MoveDown')))
            .onPressed,
        isNull,
      );
      expect(find.byKey(const ValueKey('remote-Back')), findsNothing);
      expect(find.byKey(const ValueKey('remote-GoHome')), findsNothing);
      expect(find.byIcon(Icons.volume_up_rounded), findsNothing);
      await disposeRemote(tester);
    },
  );

  testWidgets(
    'rapid taps stay ordered and target changes discard queued presses',
    (tester) async {
      api.sessions = [target('first'), target('second')];
      await open(tester);
      await tester.tap(find.text('Moonfin for webOS · first'));
      await tester.pumpAndSettle();
      final barrier = Completer<void>();
      api.barrier = barrier;
      await tapCommand(tester, 'MoveDown');
      await tapCommand(tester, 'Select');
      expect(api.commands, [('first', 'MoveDown')]);
      final second = find.text('Moonfin for webOS · second');
      await tester.scrollUntilVisible(second, -150);
      await tester.tap(second);
      await tester.pump();
      api.barrier = null;
      barrier.complete();
      await tester.pump();
      await tapCommand(tester, 'Select');
      expect(api.commands, [('first', 'MoveDown'), ('second', 'Select')]);
      await disposeRemote(tester);
    },
  );

  for (final state in [AppLifecycleState.paused, AppLifecycleState.hidden]) {
    testWidgets('$state cancels queued presses until resumed', (tester) async {
      api.sessions = [target('tv')];
      await open(tester);
      await tester.tap(find.text('Moonfin for webOS · tv'));
      await tester.pumpAndSettle();
      final barrier = Completer<void>();
      api.barrier = barrier;
      await tapCommand(tester, 'MoveDown');
      await tapCommand(tester, 'Select');
      tester.binding.handleAppLifecycleStateChanged(state);
      api.barrier = null;
      barrier.complete();
      await tester.pump();
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pumpAndSettle();
      expect(api.commands, [('tv', 'MoveDown')]);
      await tapCommand(tester, 'Back');
      expect(api.commands.last, ('tv', 'Back'));
      await disposeRemote(tester);
    });
  }

  testWidgets('server account changes cannot send to the captured old server', (
    tester,
  ) async {
    api.sessions = [target('tv')];
    await open(tester);
    await tester.tap(find.text('Moonfin for webOS · tv'));
    await tester.pumpAndSettle();
    await GetIt.instance.unregister<MediaServerClient>();
    final other = _Api();
    GetIt.instance.registerSingleton<MediaServerClient>(_Client(other));
    await tapCommand(tester, 'Select');
    expect(api.commands, isEmpty);
    expect(other.commands, isEmpty);
    await disposeRemote(tester);
  });

  testWidgets(
    'disconnect cancels queued navigation without choosing another TV',
    (tester) async {
      api.sessions = [target('tv'), target('other')];
      await open(tester);
      await tester.tap(find.text('Moonfin for webOS · tv'));
      await tester.pumpAndSettle();
      final barrier = Completer<void>();
      api.barrier = barrier;
      await tapCommand(tester, 'MoveDown');
      await tapCommand(tester, 'Select');
      api.sessions = [target('other')];
      socket.controller.add(const SessionEndedMessage(sessionId: 'tv'));
      api.barrier = null;
      barrier.complete();
      await tester.pumpAndSettle();
      expect(api.commands, [('tv', 'MoveDown')]);
      expect(find.byType(RemoteNavigationPad), findsNothing);
      await disposeRemote(tester);
    },
  );

  testWidgets(
    'failure discards queued presses and the next deliberate tap can retry',
    (tester) async {
      api.sessions = [target('tv')];
      await open(tester);
      await tester.tap(find.text('Moonfin for webOS · tv'));
      await tester.pumpAndSettle();
      final barrier = Completer<void>();
      api.barrier = barrier;
      await tapCommand(tester, 'MoveDown');
      await tapCommand(tester, 'Select');
      barrier.completeError(StateError('offline'));
      api.barrier = null;
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(api.commands, [('tv', 'MoveDown')]);
      await tapCommand(tester, 'Back');
      expect(api.commands.last, ('tv', 'Back'));
      await disposeRemote(tester);
    },
  );

  testWidgets(
    'Search waits for the in-flight press and cancels queued Select',
    (tester) async {
      api.sessions = [target('tv')];
      await open(tester);
      await tester.tap(find.text('Moonfin for webOS · tv'));
      await tester.pumpAndSettle();
      final barrier = Completer<void>();
      api.barrier = barrier;
      await tapCommand(tester, 'MoveDown');
      await tapCommand(tester, 'Select');
      await tester.ensureVisible(find.text('Search'));
      await tester.tap(find.text('Search'));
      await tester.tap(find.text('Search'));
      await tester.pump();
      expect(find.byType(RemoteSearchSheet), findsNothing);
      api.barrier = null;
      barrier.complete();
      await tester.pumpAndSettle();
      expect(api.commands, [('tv', 'MoveDown'), ('tv', 'GoToSearch')]);
      expect(find.byType(RemoteSearchSheet), findsOneWidget);
      await disposeRemote(tester);
    },
  );

  testWidgets('playback appearing and stopping preserves the navigation pad', (
    tester,
  ) async {
    final tv = target('tv');
    api.sessions = [tv];
    await open(tester);
    await tester.tap(find.text('Moonfin for webOS · tv'));
    await tester.pumpAndSettle();
    tv['NowPlayingItem'] = {'Name': 'Movie', 'RunTimeTicks': 600000000};
    tv['PlayState'] = {'PositionTicks': 100000000, 'IsPaused': false};
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    expect(find.byType(RemoteNavigationPad), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Stop'), 150);
    expect(find.text('Stop'), findsOneWidget);
    final pause = find.byIcon(Icons.pause_rounded);
    await tester.ensureVisible(pause);
    await tester.tap(pause);
    await tester.pumpAndSettle();
    expect(api.playCommands, ['PlayPause']);
    tv.remove('NowPlayingItem');
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.byType(RemoteNavigationPad), -150);
    expect(find.byType(RemoteNavigationPad), findsOneWidget);
    expect(find.text('Stop'), findsNothing);
    await disposeRemote(tester);
  });

  Finder volumeSlider() =>
      find.byWidgetPredicate((widget) => widget is Slider && widget.max == 100);

  Map<String, dynamic> playingTarget(String id, List<String> commands) => {
    ...target(id, commands: commands),
    'NowPlayingItem': {'Name': 'Movie', 'RunTimeTicks': 600000000},
    'PlayState': {'VolumeLevel': 40, 'IsMuted': false},
  };

  Future<void> changeVolume(WidgetTester tester, double value) async {
    final slider = tester.widget<Slider>(volumeSlider());
    slider.onChanged!(value);
    slider.onChangeEnd!(value);
    await tester.pump();
  }

  testWidgets(
    'rapid slider gestures send the newest value and reconcile reported volume',
    (tester) async {
      final tv = playingTarget('tv', ['SetVolume']);
      api.sessions = [tv];
      await open(tester);
      await tester.tap(find.text('Movie'));
      await tester.pumpAndSettle();
      final barrier = api.barrier = Completer<void>();
      await changeVolume(tester, 20);
      await changeVolume(tester, 30);
      await changeVolume(tester, 60);
      expect(api.volumeArguments, ['20']);
      expect(tester.widget<Slider>(volumeSlider()).value, 60);
      api.barrier = null;
      barrier.complete();
      await tester.pump();
      expect(api.volumeArguments, ['20', '60']);
      tv['PlayState'] = {'VolumeLevel': 55, 'IsMuted': false};
      await tester.pump(const Duration(milliseconds: 350));
      expect(tester.widget<Slider>(volumeSlider()).value, 55);
      // SetVolume support alone never enables a pretend Mute button.
      expect(
        tester
            .widget<IconButton>(
              find.widgetWithIcon(IconButton, Icons.volume_up_rounded),
            )
            .onPressed,
        isNull,
      );
      await disposeRemote(tester);
    },
  );

  for (final cancel in ['target', 'hidden', 'failure']) {
    testWidgets('$cancel discards queued volume and stale slider state', (
      tester,
    ) async {
      api.sessions = [
        playingTarget('tv', ['SetVolume']),
        target('other'),
      ];
      await open(tester);
      await tester.tap(find.text('Movie'));
      await tester.pumpAndSettle();
      final barrier = api.barrier = Completer<void>();
      await changeVolume(tester, 20);
      await changeVolume(tester, 60);
      if (cancel == 'target') {
        await tester.ensureVisible(find.text('Moonfin for webOS · other'));
        await tester.tap(find.text('Moonfin for webOS · other'));
      } else if (cancel == 'hidden') {
        tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
      }
      api.barrier = null;
      if (cancel == 'failure') {
        barrier.completeError(StateError('Disconnected'));
      } else {
        barrier.complete();
      }
      await tester.pump();
      expect(api.volumeArguments, ['20']);
      if (cancel == 'failure') {
        await tester.pump();
        expect(tester.widget<Slider>(volumeSlider()).value, 40);
        await changeVolume(tester, 25);
        expect(api.volumeArguments, ['20', '25']);
      }
      if (cancel == 'hidden') {
        tester.binding.handleAppLifecycleStateChanged(
          AppLifecycleState.resumed,
        );
        await tester.pump();
        expect(tester.widget<Slider>(volumeSlider()).value, 40);
      }
      await disposeRemote(tester);
    });
  }

  testWidgets(
    'playback without volume capabilities offers no volume operations',
    (tester) async {
      api.sessions = [playingTarget('tv', navigationCommands.take(9).toList())];
      await open(tester);
      await tester.tap(find.text('Movie'));
      await tester.pumpAndSettle();
      expect(volumeSlider(), findsNothing);
      expect(find.byIcon(Icons.volume_up_rounded), findsNothing);
      expect(find.byIcon(Icons.volume_down_rounded), findsNothing);
      expect(find.byIcon(Icons.volume_off_rounded), findsNothing);
      await disposeRemote(tester);
    },
  );

  testWidgets('refreshed capabilities drop unsupported queued navigation', (
    tester,
  ) async {
    api.sessions = [target('tv')];
    await open(tester);
    await tester.tap(find.text('Moonfin for webOS · tv'));
    await tester.pumpAndSettle();
    api.barrier = Completer<void>();
    await tapCommand(tester, 'MoveUp');
    await tapCommand(tester, 'Select');
    api.sessions = [
      target('tv', commands: ['MoveUp']),
    ];
    await tester.pump(const Duration(seconds: 5));
    await tester.pump();
    api.barrier!.complete();
    await tester.pumpAndSettle();
    expect(api.commands, [('tv', 'MoveUp')]);
    await disposeRemote(tester);
  });

  testWidgets(
    'playback-only clients stay listed without offering unsupported search',
    (tester) async {
      api.sessions = [
        {
          'Id': 'legacy',
          'DeviceId': 'tv',
          'DeviceName': 'Living room',
          'Client': 'Legacy',
          'SupportsMediaControl': true,
          'SupportedCommands': ['GoToSearch'],
        },
      ];
      await open(tester);
      await tester.tap(find.text('Legacy · Living room'));
      await tester.pumpAndSettle();
      expect(find.text('Search'), findsNothing);
      expect(api.commands, isEmpty);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    },
  );
}
