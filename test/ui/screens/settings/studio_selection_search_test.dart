import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/home_row_toggles_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final itemsApi = _ItemsApi();
    when(
      () => itemsApi.getStudios(
        userId: any(named: 'userId'),
        recursive: any(named: 'recursive'),
        includeItemTypes: any(named: 'includeItemTypes'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        fields: any(named: 'fields'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'a', 'Name': 'A24'},
          {'Id': 'p', 'Name': 'Paramount'},
          {'Id': 'pa', 'Name': 'Paramount Animation'},
        ],
      },
    );
    final client = _Client();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userId).thenReturn('user');
    GetIt.instance
      ..registerSingleton<UserPreferences>(UserPreferences(store))
      ..registerSingleton<MediaServerClient>(client);
  });

  tearDown(GetIt.instance.reset);

  Future<void> pumpDialog(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: StudioSelectionDialog(selectedIdsCsv: '')),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('the search box narrows the studio list by name', (tester) async {
    await pumpDialog(tester);
    expect(find.text('A24'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'para');
    await tester.pumpAndSettle();

    expect(find.text('A24'), findsNothing);
    expect(find.text('Paramount'), findsOneWidget);
    expect(find.text('Paramount Animation'), findsOneWidget);
  });

  testWidgets('backspace in the search box deletes instead of closing', (
    tester,
  ) async {
    await pumpDialog(tester);
    await tester.enterText(find.byType(TextField), 'para');
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();

    expect(find.byType(StudioSelectionDialog), findsOneWidget);
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      'par',
    );
  });
}
