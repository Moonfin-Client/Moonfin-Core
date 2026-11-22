import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/di/modules/preference_module.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/settings_side_panel.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late PreferenceStore store;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = PreferenceStore();
    await store.init();
    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    await GetIt.instance.reset();
    resetServerNetworkOverrides();
  });

  Future<void> pump(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: networkSettingsScreenForTesting(),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// Opens the editor behind [title], types [value] and saves.
  Future<void> setValue(WidgetTester tester, String title, String value) async {
    await tester.ensureVisible(find.text(title));
    await tester.tap(find.text(title));
    await tester.pumpAndSettle();

    final field = find.byType(TextField);
    expect(field, findsOneWidget);
    await tester.enterText(field, value);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
  }

  testWidgets('the screen names the proxy and the client identity sections', (
    tester,
  ) async {
    await pump(tester);

    expect(find.text('Network'), findsOneWidget);
    expect(find.text('Proxy'), findsOneWidget);
    expect(find.text('Proxy address'), findsOneWidget);
    expect(find.text('Client identity'), findsOneWidget);
    expect(find.text('User-Agent'), findsOneWidget);
    expect(find.text('Client name'), findsOneWidget);
  });

  testWidgets('a saved proxy reaches the network layer straight away', (
    tester,
  ) async {
    await pump(tester);

    await setValue(tester, 'Proxy address', '127.0.0.1:7897');

    expect(store.get(UserPreferences.proxyUrl), '127.0.0.1:7897');
    expect(gServerProxyUrl, '127.0.0.1:7897');
    expect(serverProxyFindProxy, 'PROXY 127.0.0.1:7897');
  });

  testWidgets('a saved user agent and client name reach the network layer', (
    tester,
  ) async {
    await pump(tester);

    await setValue(tester, 'User-Agent', 'Mozilla/5.0 (compatible; Test/1.0)');
    await setValue(tester, 'Client name', 'Emby Web');

    expect(gServerUserAgentOverride, 'Mozilla/5.0 (compatible; Test/1.0)');
    expect(gServerClientNameOverride, 'Emby Web');
    expect(serverUserAgent, 'Mozilla/5.0 (compatible; Test/1.0)');
    expect(serverClientName('Moonfin'), 'Emby Web');
  });

  testWidgets('Emby settings are independent and are restored at startup', (
    tester,
  ) async {
    await pump(tester);

    Future<void> pick(String title, String option) async {
      await tester.ensureVisible(find.text(title));
      await tester.tap(find.text(title));
      await tester.pumpAndSettle();
      await tester.tap(find.text(option));
      await tester.pumpAndSettle();
    }

    await pick('Authorization header', 'X-Emby-Authorization');
    expect(
      gEmbyAuthorizationHeader,
      EmbyAuthorizationHeader.xEmbyAuthorization,
    );
    expect(gEmbyAuthorizationScheme, EmbyAuthorizationScheme.emby);

    await pick('Authorization scheme', 'MediaBrowser');
    await setValue(tester, 'Device name (Device)', 'Tablet');
    await setValue(tester, 'Device ID (DeviceId)', 'custom-device-id');
    await setValue(tester, 'Client version (Version)', '6.0.6');

    expect(gEmbyAuthorizationScheme, EmbyAuthorizationScheme.mediaBrowser);
    expect(gEmbyDeviceNameOverride, 'Tablet');
    expect(gEmbyDeviceIdOverride, 'custom-device-id');
    expect(gEmbyClientVersionOverride, '6.0.6');
    expect(store.get(UserPreferences.embyDeviceName), 'Tablet');
    expect(store.get(UserPreferences.embyDeviceId), 'custom-device-id');
    expect(store.get(UserPreferences.embyClientVersion), '6.0.6');

    await tester.pumpWidget(const SizedBox.shrink());
    await GetIt.instance.reset();
    resetServerNetworkOverrides();
    registerPreferenceModule(store);

    expect(
      gEmbyAuthorizationHeader,
      EmbyAuthorizationHeader.xEmbyAuthorization,
    );
    expect(gEmbyAuthorizationScheme, EmbyAuthorizationScheme.mediaBrowser);
    expect(gEmbyDeviceNameOverride, 'Tablet');
    expect(gEmbyDeviceIdOverride, 'custom-device-id');
    expect(gEmbyClientVersionOverride, '6.0.6');
  });

  testWidgets('an emptied proxy falls back to a direct connection', (
    tester,
  ) async {
    await pump(tester);

    await setValue(tester, 'Proxy address', '127.0.0.1:7897');
    expect(serverProxyFindProxy, 'PROXY 127.0.0.1:7897');

    await setValue(tester, 'Proxy address', '   ');

    expect(serverProxyFindProxy, isNull);
  });

  testWidgets('custom headers can be saved, edited and removed', (
    tester,
  ) async {
    await pump(tester);

    final addHeader = find.text('Add request header');
    await tester.ensureVisible(addHeader);
    await tester.tap(addHeader);
    await tester.pumpAndSettle();

    Future<void> enter(String label, String value) async {
      await tester.enterText(find.widgetWithText(TextFormField, label), value);
    }

    await enter('Server URL', 'https://example.test/emby');
    await enter('Header name', 'X-Custom-Header');
    await enter('Header value', 'first');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(gServerRequestHeaders.single.origin, 'https://example.test');
    expect(gServerRequestHeaders.single.value, 'first');
    final stored = UserPreferences.decodeServerRequestHeaders(
      store.get(UserPreferences.serverRequestHeaders),
    );
    expect(stored.single.toJson(), gServerRequestHeaders.single.toJson());
    expect(find.text('first'), findsNothing);

    Future<void> openHeader() async {
      final row = find.text('X-Custom-Header');
      await tester.ensureVisible(row);
      await tester.tap(row);
      await tester.pumpAndSettle();
    }

    await openHeader();
    await enter('Header value', 'updated');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(gServerRequestHeaders.single.value, 'updated');

    await openHeader();
    await tester.tap(find.text('Remove'));
    await tester.pumpAndSettle();
    expect(gServerRequestHeaders, isEmpty);
    expect(store.get(UserPreferences.serverRequestHeaders), isEmpty);
  });
}
