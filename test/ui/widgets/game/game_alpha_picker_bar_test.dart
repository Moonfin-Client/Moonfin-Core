import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/game/game_alpha_picker_bar.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets('reports up navigation from a focused letter', (tester) async {
    final aFocus = FocusNode();
    addTearDown(aFocus.dispose);
    var upCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: GameAlphaPickerBar(
            selected: 'A',
            letterFocusNodes: {'A': aFocus},
            onNavigateUp: () => upCount++,
            onChanged: (_) {},
          ),
        ),
      ),
    );

    aFocus.requestFocus();
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();
    expect(upCount, 1);
  });
}
