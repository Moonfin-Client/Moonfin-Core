import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/auth/server_select_screen.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/repositories/server_repository.dart';

class _MockServerRepository extends Mock implements ServerRepository {}

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

  Future<({TextEditingController controller, Future<void> closed})>
  openDialog(WidgetTester tester) async {
    final controller = TextEditingController(text: 'http://localhos');
    late Future<void> closed;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                // Same presentation path as the real screen: the dialog is
                // wrapped by showFocusRestoringDialog's back-key handler.
                closed = showFocusRestoringDialog<void>(
                  context: context,
                  builder: (ctx) => AddServerDialog(
                    l10n: AppLocalizations.of(ctx),
                    controller: controller,
                    serverRepo: _MockServerRepository(),
                  ),
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

  testWidgets('backspace deletes text instead of closing the dialog', (
    tester,
  ) async {
    final (:controller, :closed) = await openDialog(tester);
    var didClose = false;
    closed.then((_) => didClose = true);

    // Desktop branch: plain TextField, autofocused on open.
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

    // Move focus off the field onto the Cancel button: backspace is now
    // "back", not text editing.
    tester
        .widget<OutlinedButton>(
          find.widgetWithText(OutlinedButton, 'Cancel'),
        )
        .focusNode
        ?.requestFocus();
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();

    expect(didClose, isTrue);
    expect(controller.text, 'http://localhos');
  });
}
