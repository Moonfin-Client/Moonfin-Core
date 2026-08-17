import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/track_selector_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _footerKey = Key('delay-footer');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() => GetIt.instance.reset());

  Future<void> openSelector(WidgetTester tester, int trackCount) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => TrackSelectorDialog.show(
              context,
              title: 'Subtitle track',
              options: [
                for (var i = 0; i < trackCount; i++)
                  TrackOption(label: 'Track $i'),
              ],
              footer: const SizedBox(
                key: _footerKey,
                height: 120,
                child: Text('Subtitle delay'),
              ),
            ),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('a long list keeps the footer past its last track', (
    tester,
  ) async {
    await openSelector(tester, 40);

    final scrollable = find.descendant(
      of: find.byType(Dialog),
      matching: find.byType(Scrollable),
    );
    expect(find.byKey(_footerKey).hitTestable(), findsNothing);

    await tester.scrollUntilVisible(
      find.byKey(_footerKey),
      300,
      scrollable: scrollable,
    );
    await tester.pumpAndSettle();

    expect(find.byKey(_footerKey).hitTestable(), findsOneWidget);
    expect(find.text('Track 39'), findsOneWidget);
  });

  testWidgets('a short list still shows the footer without scrolling', (
    tester,
  ) async {
    await openSelector(tester, 2);

    expect(find.byKey(_footerKey).hitTestable(), findsOneWidget);
    expect(find.text('Track 1'), findsOneWidget);
  });
}
