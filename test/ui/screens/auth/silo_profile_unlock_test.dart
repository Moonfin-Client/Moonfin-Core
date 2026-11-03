import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/services/silo_token_storage.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/auth/silo_profile_unlock.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Factory extends Fake implements MediaServerClientFactory {
  _Factory(this.client);

  final MediaServerClient client;

  @override
  MediaServerClient getClient({
    required String serverId,
    required ServerType serverType,
    required String baseUrl,
  }) => client;
}

SiloTokens _pair(String n) => SiloTokens(
  accessToken: 'access-$n',
  refreshToken: 'refresh-$n',
  expiresAt: DateTime.utc(2100),
  lifetime: const Duration(hours: 1),
);

void main() {
  final getIt = GetIt.instance;

  tearDown(getIt.reset);

  testWidgets("closing another account's PIN prompt keeps the session", (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final store = AuthenticationStore();
    await store.init();
    await SiloTokenStorage(store).save('s1', 'b', _pair('b'));
    final client = SiloMediaServerClient(
      baseUrl: 'https://silo.example',
      deviceInfo: const DeviceInfo(
        id: 'device',
        name: 'Device',
        appName: 'Moonfin',
        appVersion: '1.0.0',
      ),
    );
    client.session.setTokens(_pair('a'));
    client.profileId = 'a-main';
    getIt
      ..registerSingleton<AuthenticationStore>(store)
      ..registerSingleton<MediaServerClientFactory>(_Factory(client));

    bool? unlocked;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                unlocked = await unlockSiloProfileIfNeeded(
                  context,
                  server: Server(
                    id: 's1',
                    name: 'Silo',
                    address: 'https://silo.example',
                    version: '1',
                    serverType: ServerType.silo,
                    dateAdded: DateTime.utc(2026),
                  ),
                  user: PrivateUser(
                    id: 'b-teen',
                    name: 'Teen',
                    serverId: 's1',
                    accessToken: 'access-b',
                    lastUsed: DateTime.utc(2026),
                    siloAccountId: 'b',
                    siloHasPin: true,
                  ),
                );
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(unlocked, isFalse);
    expect(client.session.tokens?.refreshToken, 'refresh-a');
    expect(client.profileId, 'a-main');
  });
}
