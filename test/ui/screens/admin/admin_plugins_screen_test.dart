import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/admin/plugins/admin_plugins_screen.dart';
import 'package:moonfin/ui/screens/admin/providers/admin_user_providers.dart';
import 'package:server_core/server_core.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    GetIt.instance.registerSingleton<MediaServerClient>(
      _MockMediaServerClient(),
    );
  });

  tearDown(() => GetIt.instance.reset());

  Future<void> pumpScreen(
    WidgetTester tester, {
    required List<PluginInfo> installedPlugins,
    List<PackageInfo> availablePackages = const [],
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          adminInstalledPluginsProvider.overrideWith(
            (ref) async => installedPlugins,
          ),
          adminAvailablePackagesProvider.overrideWith(
            (ref) async => availablePackages,
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: AdminPluginsScreen()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('installed filters use filter-specific empty states', (
    tester,
  ) async {
    await pumpScreen(tester, installedPlugins: const []);
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));

    expect(find.text(l10n.adminPluginsNoneInstalled), findsOneWidget);

    await tester.tap(find.text(l10n.adminPluginsActive));
    await tester.pumpAndSettle();

    expect(find.text(l10n.adminPluginsNoneActive), findsOneWidget);

    await tester.tap(find.text(l10n.adminPluginsRestartRequired));
    await tester.pumpAndSettle();

    expect(find.text(l10n.all), findsOneWidget);
    expect(find.text(l10n.adminPluginsActive), findsOneWidget);
    expect(find.text(l10n.adminPluginsRestartRequired), findsOneWidget);
    expect(find.text(l10n.adminPluginsNoneRequireRestart), findsOneWidget);
  });
}
