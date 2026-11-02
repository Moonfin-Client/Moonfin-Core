import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/auth/add_server_dialog.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/server_addition_state.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';

class _MockServerRepository extends Mock implements ServerRepository {}

final _server = Server(
  id: 'server-1',
  name: 'Living Room',
  address: 'http://localhos:8096',
  version: '10.11.0',
  serverType: ServerType.jellyfin,
  dateAdded: DateTime(2026),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
  });

  tearDown(() async {
    await GetIt.instance.reset();
    gAllowSelfSignedCertificates = false;
  });

  Future<({TextEditingController controller, Future<AddServerOutcome?> closed})>
  openDialog(
    WidgetTester tester, {
    ServerRepository? serverRepo,
    String address = 'http://localhos',
  }) async {
    final controller = TextEditingController(text: address);
    late Future<AddServerOutcome?> closed;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                closed = showAddServerDialog(
                  context: context,
                  controller: controller,
                  serverRepo: serverRepo ?? _MockServerRepository(),
                );
              },
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    return (controller: controller, closed: closed);
  }

  _MockServerRepository repoThatFinds(List<Server> saved) {
    final repo = _MockServerRepository();
    when(() => repo.servers).thenReturn(saved);
    when(
      () => repo.addServer(
        any(),
        offerSiloNative: any(named: 'offerSiloNative'),
      ),
    ).thenAnswer((_) async => _server);
    when(() => repo.deleteServer(any())).thenAnswer((_) async {});
    return repo;
  }

  testWidgets('backspace deletes text instead of closing the dialog', (
    tester,
  ) async {
    final (:controller, :closed) = await openDialog(tester);
    var didClose = false;
    closed.then((_) => didClose = true);

    // The desktop field, focused on open.
    expect(find.byType(TextField), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pump();

    expect(find.byType(AddServerDialog), findsOneWidget);
    expect(didClose, isFalse);
    expect(controller.text, 'http://localho');
  });

  testWidgets('backspace still closes the dialog when not editing text', (
    tester,
  ) async {
    final (:controller, :closed) = await openDialog(tester);
    var didClose = false;
    closed.then((_) => didClose = true);

    // Move focus off the field onto Connect: backspace is now "back", not
    // text editing, and an address filled in up front has no choices behind
    // it to go back to.
    tester
        .widget<FilledButton>(find.widgetWithText(FilledButton, 'Connect'))
        .focusNode
        ?.requestFocus();
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();

    expect(didClose, isTrue);
    expect(controller.text, 'http://localhos');
  });

  testWidgets('an untrusted certificate offers to allow self-signed ones', (
    tester,
  ) async {
    final repo = _MockServerRepository();
    when(() => repo.servers).thenReturn(const []);
    when(
      () => repo.addServer(
        any(),
        offerSiloNative: any(named: 'offerSiloNative'),
      ),
    ).thenAnswer((_) async => null);
    when(() => repo.lastFailure).thenReturn(
      const ServerUnableToConnect(
        candidatesTried: ['https://localhos', 'http://localhos'],
        untrustedCandidate: 'https://localhos',
      ),
    );
    await openDialog(tester, serverRepo: repo);

    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();

    expect(find.text(l10n.untrustedServerCertificate), findsOneWidget);

    await tester.tap(
      find.widgetWithText(TextButton, l10n.settingsAllowSelfSignedCerts),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.enable));
    await tester.pumpAndSettle();

    expect(gAllowSelfSignedCertificates, isTrue);
    expect(
      GetIt.instance<UserPreferences>().get(
        UserPreferences.allowSelfSignedCerts,
      ),
      isTrue,
    );
    verify(
      () => repo.addServer(
        'https://localhos',
        offerSiloNative: any(named: 'offerSiloNative'),
      ),
    ).called(1);
  });

  testWidgets('an empty address opens on the choices', (tester) async {
    final (controller: _, :closed) = await openDialog(tester, address: '');

    expect(find.text(l10n.addServerChooseHow), findsOneWidget);
    expect(find.byType(TextField), findsNothing);

    await tester.tap(find.text(l10n.signInWithPlex));
    await tester.pumpAndSettle();

    final outcome = await closed;
    expect(outcome, isA<AddServerPlexSignIn>());
    expect((outcome! as AddServerPlexSignIn).address, isNull);
  });

  testWidgets('Emby Connect closes with its own outcome', (tester) async {
    final (controller: _, :closed) = await openDialog(tester, address: '');

    await tester.tap(find.text(l10n.embyConnect));
    await tester.pumpAndSettle();

    expect(await closed, isA<AddServerEmbyConnect>());
  });

  testWidgets('back from the address field returns to the choices', (
    tester,
  ) async {
    await openDialog(tester, address: '');

    await tester.tap(find.text(l10n.serverAddress));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);

    await tester.tap(find.byTooltip(l10n.back));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsNothing);
    expect(find.text(l10n.addServerChooseHow), findsOneWidget);
  });

  testWidgets('a found server is shown before Continue signs in to it', (
    tester,
  ) async {
    final repo = repoThatFinds(const []);
    final (controller: _, :closed) = await openDialog(tester, serverRepo: repo);

    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();

    expect(find.text(l10n.addServerFound), findsOneWidget);
    expect(find.text('Living Room'), findsOneWidget);
    expect(find.text('Jellyfin'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, l10n.continueAction));
    await tester.pumpAndSettle();

    final outcome = await closed;
    expect((outcome! as AddServerSaved).serverId, 'server-1');
    verifyNever(() => repo.deleteServer(any()));
  });

  testWidgets('a different address removes the server the dialog just added', (
    tester,
  ) async {
    final repo = repoThatFinds(const []);
    await openDialog(tester, serverRepo: repo);

    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.addServerUseDifferentAddress));
    await tester.pumpAndSettle();

    verify(() => repo.deleteServer('server-1')).called(1);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(l10n.addServerFound), findsNothing);
  });

  testWidgets('a different address keeps a server that was already saved', (
    tester,
  ) async {
    final repo = repoThatFinds([_server]);
    await openDialog(tester, serverRepo: repo);

    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.addServerUseDifferentAddress));
    await tester.pumpAndSettle();

    verifyNever(() => repo.deleteServer(any()));
    expect(find.byType(TextField), findsOneWidget);
  });
}
