import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/local_search_field.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late TextEditingController controller;
  late FocusNode focusNode;
  late List<String> reported;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    controller = TextEditingController();
    focusNode = FocusNode();
    reported = [];
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    controller.dispose();
    focusNode.dispose();
    await GetIt.instance.reset();
  });

  Future<void> pumpField(
    WidgetTester tester, {
    TextEditingController? withController,
  }) => tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: LocalSearchField(
          controller: withController ?? controller,
          focusNode: focusNode,
          onChanged: reported.add,
        ),
      ),
    ),
  );

  // The Apple TV keyboard hands its text over in one piece once Done is
  // pressed, so that one change is the whole search.
  testWidgets('the first change to the text is reported', (tester) async {
    await pumpField(tester);

    controller.text = 'alto';

    expect(reported, ['alto']);
  });

  testWidgets('text the field opened with is not reported again', (
    tester,
  ) async {
    controller.text = 'alto';
    await pumpField(tester);

    controller.selection = const TextSelection.collapsed(offset: 4);
    expect(reported, isEmpty);

    controller.text = 'altov';
    expect(reported, ['altov']);
  });

  testWidgets('the first change after the controller is swapped is reported', (
    tester,
  ) async {
    await pumpField(tester);
    controller.text = 'alto';
    final replacement = TextEditingController();
    addTearDown(replacement.dispose);
    await pumpField(tester, withController: replacement);

    replacement.text = 'alto';

    expect(reported, ['alto', 'alto']);
  });
}
