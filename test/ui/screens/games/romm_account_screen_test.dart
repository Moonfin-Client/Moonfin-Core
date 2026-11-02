import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/games/romm_account_screen.dart';
import 'package:moonfin/ui/widgets/sign_in_qr_code.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockGamesApi extends Mock implements GamesApi {}

const _pending = RommAccount(
  available: true,
  linked: false,
  pending: RommLinkCode(
    userCode: 'ABCD1234',
    verificationUrl: 'http://romm.lan/pair/device',
    verificationUrlComplete: 'http://romm.lan/pair/device?code=ABCD1234',
    intervalSeconds: 5,
  ),
);

void main() {
  late _MockGamesApi games;

  setUp(() async {
    await GetIt.instance.reset();
    final client = _MockMediaServerClient();
    games = _MockGamesApi();
    when(() => client.gamesApi).thenReturn(games);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: RommAccountScreen(),
      ),
    );
    await tester.pump();
  }

  testWidgets('links, polls until approved, then offers Unlink', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    when(() => games.getRommAccount()).thenAnswer(
      (_) async => const RommAccount(available: true, linked: false),
    );
    when(() => games.startRommLink()).thenAnswer((_) async => _pending);
    await pumpScreen(tester);

    await tester.tap(find.text('Link RomM account'));
    await tester.pump();
    expect(find.text('ABCD1234'), findsOneWidget);
    expect(find.text('Open RomM'), findsOneWidget);
    expect(find.byType(SignInQrCode), findsNothing);

    when(() => games.getRommAccount()).thenAnswer(
      (_) async =>
          const RommAccount(available: true, linked: true, username: 'axl'),
    );
    await tester.pump(const Duration(seconds: 5));
    await tester.pump();
    expect(find.text('Linked as axl'), findsOneWidget);
    expect(find.text('Unlink'), findsOneWidget);
  });

  testWidgets('shows the code as a QR on TV, with the remote on Cancel', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await tester.binding.setSurfaceSize(const Size(1280, 720));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    when(() => games.getRommAccount()).thenAnswer((_) async => _pending);
    when(() => games.unlinkRomm()).thenAnswer(
      (_) async => const RommAccount(available: true, linked: false),
    );
    await pumpScreen(tester);
    await tester.pump();

    expect(find.byType(SignInQrCode), findsOneWidget);
    expect(find.text('Open RomM'), findsNothing);
    expect(find.textContaining('http://romm.lan/pair/device'), findsOneWidget);
    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      'romm_account_action',
    );

    await tester.tap(find.text('Cancel'));
    await tester.pump();
    await tester.pump();
    verify(() => games.unlinkRomm()).called(1);
    expect(find.text('Link RomM account'), findsOneWidget);
    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      'romm_account_action',
    );
  });

  testWidgets('explains an expired code, with the remote on Link', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    when(() => games.getRommAccount()).thenAnswer(
      (_) async => const RommAccount(
        available: true,
        linked: false,
        error: 'expired',
      ),
    );
    await pumpScreen(tester);

    expect(find.textContaining('expired'), findsOneWidget);
    expect(find.text('Link RomM account'), findsOneWidget);
    await tester.pump();
    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      'romm_account_action',
    );
  });
}
