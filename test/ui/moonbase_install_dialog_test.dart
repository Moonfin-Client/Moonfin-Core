import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/setup/moonbase_install_dialog.dart';
import 'package:moonfin/ui/widgets/sign_in_qr_code.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakePluginsApi extends Fake implements AdminPluginsApi {
  _FakePluginsApi(this.repos);

  final List<RepositoryInfo> repos;
  List<RepositoryInfo>? saved;
  final installs = <Map<String, String?>>[];

  @override
  Future<List<RepositoryInfo>> getRepositories() async => repos;

  @override
  Future<void> setRepositories(List<RepositoryInfo> repositories) async =>
      saved = repositories;

  @override
  Future<void> installPackage(
    String name, {
    String? assemblyGuid,
    String? version,
    String? repositoryUrl,
    String? updateClass,
  }) async {
    installs.add({
      'name': name,
      'guid': assemblyGuid,
      'version': version,
      'repo': repositoryUrl,
    });
  }
}

class _FakeSystemApi extends Fake implements AdminSystemApi {
  int restarts = 0;
  bool failNext = false;

  @override
  Future<void> restartServer() async {
    restarts++;
    if (failNext) {
      failNext = false;
      throw Exception('Server is busy');
    }
  }
}

class _FakeClient implements MediaServerClient {
  _FakeClient(this.serverType);

  @override
  final ServerType serverType;

  final plugins = _FakePluginsApi(const []);
  final system = _FakeSystemApi();

  @override
  AdminPluginsApi get adminPluginsApi => plugins;

  @override
  AdminSystemApi get adminSystemApi => system;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _other = RepositoryInfo(name: 'Other', url: 'https://example.com/m.json');

void main() {
  final l10n = AppLocalizationsEn();

  group('moonbaseFeatures', () {
    test('Jellyfin and Emby get the full plugin', () {
      for (final type in [ServerType.jellyfin, ServerType.emby]) {
        final features = moonbaseFeatures(l10n, type);
        expect(features, contains(l10n.setupTourBulletRequests));
        expect(features, contains(l10n.moonbaseFeatureGames));
        expect(features, contains(l10n.moonbaseFeatureCalendar));
        expect(features, isNot(contains(l10n.moonbaseFeatureCollections)));
      }
    });

    test('Plex and Silo get the smaller set, and Silo has no calendar', () {
      final plex = moonbaseFeatures(l10n, ServerType.plex);
      final silo = moonbaseFeatures(l10n, ServerType.silo);
      for (final features in [plex, silo]) {
        expect(features, contains(l10n.moonbaseFeatureSync));
        expect(features, contains(l10n.moonbaseFeatureCollections));
        expect(features, isNot(contains(l10n.setupTourBulletRequests)));
        expect(features, isNot(contains(l10n.moonbaseFeatureRows)));
      }
      expect(plex, contains(l10n.moonbaseFeatureCalendar));
      expect(silo, isNot(contains(l10n.moonbaseFeatureCalendar)));
    });

    test('each server links its own install steps', () {
      expect(
        moonbaseGuideUrl(ServerType.silo),
        'https://github.com/Moonfin-Client/Plugin/wiki/Installation#silo',
      );
    });
  });

  group('installMoonbase', () {
    test('adds the repository next to the others, then installs', () async {
      final api = _FakePluginsApi([_other]);
      await installMoonbase(api);
      expect(api.saved!.map((r) => r.url), [_other.url, moonbaseManifestUrl]);
      expect(api.installs.single, {
        'name': 'Moonbase',
        'guid': '8c5d0e91-4f2a-4b6d-9e3f-1a7c8d9e0f2b',
        'version': null,
        'repo': moonbaseManifestUrl,
      });
    });

    test('leaves the repositories alone when Moonbase is already there', () async {
      final api = _FakePluginsApi([
        _other,
        const RepositoryInfo(name: 'Mine', url: moonbaseManifestUrl),
      ]);
      await installMoonbase(api);
      expect(api.saved, isNull);
      expect(api.installs, hasLength(1));
    });

    test('turns a disabled Moonbase repository back on', () async {
      final api = _FakePluginsApi([
        const RepositoryInfo(
          name: 'Mine',
          url: moonbaseManifestUrl,
          enabled: false,
        ),
        _other,
      ]);
      await installMoonbase(api);
      expect(api.saved!.map((r) => (r.url, r.enabled)), [
        (_other.url, true),
        (moonbaseManifestUrl, true),
      ]);
    });
  });

  group('the dialog', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    });

    tearDown(() async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
      await GetIt.instance.reset();
    });

    bool? result;

    Future<void> open(
      WidgetTester tester,
      MediaServerClient client, {
      required bool isAdmin,
    }) async {
      result = null;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => TextButton(
                onPressed: () async => result = await showMoonbaseDialog(
                  context,
                  client,
                  isAdmin: isAdmin,
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets('a Jellyfin admin installs, then restarts', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      final client = _FakeClient(ServerType.jellyfin);
      await open(tester, client, isAdmin: true);

      expect(find.byType(SignInQrCode), findsNothing);
      await tester.tap(find.text(l10n.install));
      await tester.pumpAndSettle();
      expect(client.plugins.installs, hasLength(1));
      expect(find.text(l10n.setupMoonbaseInstalled), findsOneWidget);

      await tester.tap(find.text(l10n.adminRestartServer));
      await tester.pumpAndSettle();
      expect(client.system.restarts, 1);
      expect(find.text(l10n.setupMoonbaseRestarting), findsOneWidget);
      expect(result, isTrue);
    });

    testWidgets('a failed restart is tried again, not the install', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      final client = _FakeClient(ServerType.jellyfin);
      client.system.failNext = true;
      await open(tester, client, isAdmin: true);

      await tester.tap(find.text(l10n.install));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.adminRestartServer));
      await tester.pumpAndSettle();
      expect(find.text('Server is busy'), findsOneWidget);

      await tester.tap(find.text(l10n.tryAgain));
      await tester.pumpAndSettle();
      expect(client.plugins.installs, hasLength(1));
      expect(client.system.restarts, 2);
      expect(result, isTrue);
    });

    testWidgets('someone else on a TV gets a QR code to send the admin', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await open(tester, _FakeClient(ServerType.jellyfin), isAdmin: false);

      expect(find.text(l10n.install), findsNothing);
      expect(find.text(l10n.setupMoonbaseAskAdmin), findsOneWidget);
      final qr = tester.widget<SignInQrCode>(find.byType(SignInQrCode));
      expect(qr.data, moonbaseGuideUrl(ServerType.jellyfin));
    });

    testWidgets('an Emby admin on a phone gets a link to the steps', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
      await open(tester, _FakeClient(ServerType.emby), isAdmin: true);

      expect(find.text(l10n.install), findsNothing);
      expect(find.byType(SignInQrCode), findsNothing);
      expect(find.text(l10n.setupMoonbaseManualSteps), findsOneWidget);
      expect(find.text(l10n.openLink), findsOneWidget);
    });
  });
}
