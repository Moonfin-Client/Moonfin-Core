import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/remote_control_dialog.dart';
import 'package:moonfin/ui/widgets/remote_search_sheet.dart';
import 'package:server_core/server_core.dart';

class _Api extends Fake implements SessionApi {
  List<Map<String, dynamic>> sessions = [];
  final commands = <(String, String)>[];
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
  @override
  Stream<ServerWebSocketMessage> get events => const Stream.empty();
}

void main() {
  late _Api api;
  setUp(() {
    api = _Api();
    GetIt.instance.registerSingleton<MediaServerClient>(_Client(api));
    GetIt.instance.registerSingleton<SocketHandler>(_Socket());
  });
  tearDown(() => GetIt.instance.reset());

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
