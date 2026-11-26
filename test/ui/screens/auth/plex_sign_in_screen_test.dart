import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/plex_repository.dart';
import 'package:moonfin/data/services/plex_tv_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/auth/plex_sign_in_screen.dart';

class _PlexTv extends Mock implements PlexTvService {}

class _Repository extends Mock implements PlexRepository {}

void main() {
  testWidgets('a failed server connection keeps Free TV selectable', (
    tester,
  ) async {
    final tv = _PlexTv();
    final repo = _Repository();
    GetIt.instance.registerSingleton<PlexTvService>(tv);
    GetIt.instance.registerSingleton<PlexRepository>(repo);
    addTearDown(() => GetIt.instance.reset());
    const server = PlexServer(
      id: 'pms',
      name: 'Home PMS',
      version: '1',
      accessToken: 'pms',
      connections: [],
    );
    when(tv.createPin).thenAnswer(
      (_) async => PlexPin(id: 1, code: 'TEST', expiresAt: DateTime.utc(2100)),
    );
    when(() => tv.checkPin(1)).thenAnswer((_) async => 'token');
    when(() => repo.loadServers('token')).thenAnswer((_) async => [server]);
    when(() => repo.connect(server, 'token')).thenAnswer((_) async => false);
    when(() => repo.connectCloud('token')).thenAnswer((_) async => false);

    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: PlexSignInScreen(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    await tester.tap(find.text(server.name));
    await tester.pumpAndSettle();
    final l10n = AppLocalizations.of(
      tester.element(find.byType(PlexSignInScreen)),
    );
    expect(find.text(l10n.unableToConnectTo(server.name)), findsOneWidget);
    expect(find.text(server.name), findsOneWidget);
    await tester.tap(find.text(l10n.plexFreeTvCloudTitle));
    await tester.pump();
    verify(() => repo.connectCloud('token')).called(1);
  });
}
