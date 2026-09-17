import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/playback/letterbox_croppers.dart';
import 'package:moonfin/ui/widgets/keyboard_shortcuts/keyboard_shortcut_reference.dart';
import 'package:moonfin/util/platform_detection.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('en'));
  });

  test('every section lists shortcuts with keys and an action', () {
    final sections = keyboardShortcutSections(l10n);
    expect(sections, isNotEmpty);
    for (final section in sections) {
      expect(section.title, isNotEmpty);
      expect(section.scope, isNotEmpty);
      expect(section.shortcuts, isNotEmpty, reason: section.title);
      for (final shortcut in section.shortcuts) {
        expect(shortcut.keys, isNotEmpty, reason: shortcut.action);
        expect(shortcut.keys.every((k) => k.isNotEmpty), isTrue);
        expect(shortcut.action, isNotEmpty);
      }
    }
  });

  test('the player section covers the keys the player handles', () {
    final player = keyboardShortcutSections(l10n)
        .firstWhere((s) => s.title == l10n.keyboardShortcutsSectionPlayer);
    final keys = player.shortcuts.expand((s) => s.keys).toSet();
    expect(keys, containsAll(['K', 'J', 'L', 'M', 'C', 'H', 'I', ',', '.']));
    if (letterboxCropAvailable()) {
      expect(keys, contains('B'));
    }
  });

  // The reader only takes keyboard input on the desktop UI, so its section
  // follows that flag wherever the tests happen to run.
  final readerSection = [
    if (PlatformDetection.useDesktopUi) l10n.keyboardShortcutsSectionReader,
  ];

  test('settings shows every section and the key that opens the list', () {
    final sections = keyboardShortcutSections(l10n);
    expect(sections.map((s) => s.title), [
      l10n.keyboardShortcutsSectionApp,
      l10n.keyboardShortcutsSectionPlayer,
      ...readerSection,
    ]);
    final appActions = sections.first.shortcuts.map((s) => s.action);
    expect(appActions, contains(l10n.shortcutShowShortcuts));
  });

  test('each screen gets the app keys plus its own, minus the ? row', () {
    final cases = {
      KeyboardShortcutContext.browse: [l10n.keyboardShortcutsSectionApp],
      KeyboardShortcutContext.player: [
        l10n.keyboardShortcutsSectionApp,
        l10n.keyboardShortcutsSectionPlayer,
      ],
      KeyboardShortcutContext.reader: [
        l10n.keyboardShortcutsSectionApp,
        ...readerSection,
      ],
    };
    for (final entry in cases.entries) {
      final sections = keyboardShortcutSections(l10n, context: entry.key);
      expect(sections.map((s) => s.title), entry.value, reason: entry.key.name);
      final actions = sections.expand((s) => s.shortcuts).map((s) => s.action);
      expect(actions, isNot(contains(l10n.shortcutShowShortcuts)));
    }
  });

  testWidgets('the list renders a key cap for every key', (tester) async {
    final sections = keyboardShortcutSections(l10n);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: KeyboardShortcutList(sections: sections),
          ),
        ),
      ),
    );
    for (final section in sections) {
      expect(find.text(section.title), findsOneWidget);
      expect(find.text(section.scope), findsOneWidget);
    }
    expect(find.text('F1'), findsOneWidget);
    expect(find.text(l10n.shortcutShowShortcuts), findsOneWidget);
  });
}
