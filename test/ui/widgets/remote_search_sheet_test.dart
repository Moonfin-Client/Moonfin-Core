import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/remote_search_sheet.dart';
import 'package:server_core/server_core.dart';

class _SessionApi extends Fake implements SessionApi {
  final commands = <(String, String, Map<String, String>)>[];
  bool failText = false;
  Future<void>? textDelay;

  @override
  Future<void> sendGeneralCommand(
    String id,
    String name, {
    Map<String, String>? arguments,
  }) async {
    commands.add((id, name, arguments ?? {}));
    if (name == 'SendString') {
      await textDelay;
      if (failText) throw StateError('offline');
    }
  }

  List<String> get sentText => commands
      .where((c) => c.$2 == 'SendString')
      .map((c) => c.$3['String']!)
      .toList();
}

Future<void> _open(
  WidgetTester tester,
  _SessionApi api,
  ValueNotifier<bool> connected, {
  bool live = true,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [Locale('en')],
      home: Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            child: const Text('Open remote'),
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (_) => RemoteSearchSheet(
                sessionApi: api,
                sessionId: 'lg-session',
                deviceName: 'Living room',
                liveUpdates: live,
                connected: connected,
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Open remote'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets(
    'opens the phone keyboard and sends replacement text and clear',
    (tester) async {
      final api = _SessionApi();
      final connected = ValueNotifier(true);
      await _open(tester, api, connected);
      expect(tester.testTextInput.isVisible, isTrue);
      expect(api.commands.single.$2, 'GoToSearch');
      await tester.enterText(find.byType(TextField), 'alien');
      await tester.pump(const Duration(milliseconds: 250));
      expect(api.sentText, ['alien']);
      await tester.tap(find.byTooltip('Clear'));
      await tester.pump(const Duration(milliseconds: 250));
      expect(api.sentText, ['alien', '']);
      expect(api.commands.every((c) => c.$1 == 'lg-session'), isTrue);
      await tester.pumpWidget(const SizedBox());
      connected.dispose();
    },
    variant: TargetPlatformVariant({
      TargetPlatform.android,
      TargetPlatform.iOS,
    }),
  );

  testWidgets('previews and replaces IME composition without changing it', (
    tester,
  ) async {
    final api = _SessionApi();
    final connected = ValueNotifier(true);
    await _open(tester, api, connected);
    tester.testTextInput.updateEditingValue(
      const TextEditingValue(
        text: 'に',
        selection: TextSelection.collapsed(offset: 1),
        composing: TextRange(start: 0, end: 1),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(api.sentText, ['に']);
    expect(
      tester
          .widget<TextField>(find.byType(TextField))
          .controller!
          .value
          .composing,
      const TextRange(start: 0, end: 1),
    );
    tester.testTextInput.updateEditingValue(
      const TextEditingValue(
        text: '日本',
        selection: TextSelection.collapsed(offset: 2),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(api.sentText, ['に', '日本']);
    await tester.pumpWidget(const SizedBox());
    connected.dispose();
  });

  testWidgets(
    'predictive words update live and autocorrect replaces the preview',
    (tester) async {
      final api = _SessionApi();
      final connected = ValueNotifier(true);
      await _open(tester, api, connected);
      for (final text in ['a', 'al', 'alien']) {
        final value = TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
          composing: TextRange(start: 0, end: text.length),
        );
        tester.testTextInput.updateEditingValue(value);
        await tester.pump(const Duration(milliseconds: 250));
        expect(
          tester.widget<TextField>(find.byType(TextField)).controller!.value,
          value,
        );
      }
      expect(api.sentText, ['a', 'al', 'alien']);
      expect(tester.testTextInput.isVisible, isTrue);
      tester.testTextInput.updateEditingValue(
        const TextEditingValue(
          text: 'Alien',
          selection: TextSelection.collapsed(offset: 5),
        ),
      );
      await tester.pump(const Duration(milliseconds: 250));
      expect(api.sentText.last, 'Alien');
      await tester.tap(find.byTooltip('Clear'));
      await tester.pump(const Duration(milliseconds: 250));
      expect(api.sentText.last, '');
      await tester.pumpWidget(const SizedBox());
      connected.dispose();
    },
    variant: TargetPlatformVariant({
      TargetPlatform.android,
      TargetPlatform.iOS,
    }),
  );

  for (final keyboardSubmit in [false, true]) {
    testWidgets(
      '${keyboardSubmit ? 'keyboard Search' : 'app Done'} finishes a composing word',
      (tester) async {
        final api = _SessionApi();
        final connected = ValueNotifier(true);
        await _open(tester, api, connected);
        tester.testTextInput.updateEditingValue(
          const TextEditingValue(
            text: 'alien',
            selection: TextSelection.collapsed(offset: 5),
            composing: TextRange(start: 0, end: 5),
          ),
        );
        if (keyboardSubmit) {
          await tester.testTextInput.receiveAction(TextInputAction.search);
        } else {
          await tester.tap(find.text('Done'));
        }
        await tester.pumpAndSettle();
        expect(api.sentText, ['alien']);
        expect(find.byType(RemoteSearchSheet), findsNothing);
        await tester.pumpWidget(const SizedBox());
        connected.dispose();
      },
      variant: TargetPlatformVariant({
        TargetPlatform.android,
        TargetPlatform.iOS,
      }),
    );
  }

  testWidgets('Done waits for in-flight text and sends the latest edit once', (
    tester,
  ) async {
    final pending = Completer<void>();
    final api = _SessionApi()..textDelay = pending.future;
    final connected = ValueNotifier(true);
    await _open(tester, api, connected);
    await tester.enterText(find.byType(TextField), 'ali');
    await tester.pump(const Duration(milliseconds: 250));
    expect(api.sentText, ['ali']);
    await tester.enterText(find.byType(TextField), 'alien');
    await tester.tap(find.text('Done'));
    await tester.tap(find.text('Done'));
    await tester.pump();
    expect(find.byType(RemoteSearchSheet), findsOneWidget);
    pending.complete();
    await tester.pump();
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    await tester.pumpAndSettle();
    expect(api.sentText, ['ali', 'alien']);
    expect(find.byType(RemoteSearchSheet), findsNothing);
    expect(find.text('Open remote'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    connected.dispose();
  });

  testWidgets('Done failure stays open and Retry finishes the newest phrase', (
    tester,
  ) async {
    final api = _SessionApi()..failText = true;
    final connected = ValueNotifier(true);
    await _open(tester, api, connected);
    await tester.enterText(find.byType(TextField), 'old');
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
    expect(find.byType(RemoteSearchSheet), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'new');
    api.failText = false;
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(api.sentText, ['old', 'new']);
    expect(find.byType(RemoteSearchSheet), findsNothing);
    await tester.pumpWidget(const SizedBox());
    connected.dispose();
  });

  testWidgets('moving the cursor does not cancel a pending edit', (
    tester,
  ) async {
    final api = _SessionApi();
    final connected = ValueNotifier(true);
    await _open(tester, api, connected);
    await tester.enterText(find.byType(TextField), 'alien');
    tester.testTextInput.updateEditingValue(
      const TextEditingValue(
        text: 'alien',
        selection: TextSelection.collapsed(offset: 2),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(api.sentText, ['alien']);
    await tester.pumpWidget(const SizedBox());
    connected.dispose();
  });

  testWidgets('unknown receivers get one explicit standard SendString', (
    tester,
  ) async {
    final api = _SessionApi();
    final connected = ValueNotifier(true);
    await _open(tester, api, connected, live: false);
    await tester.enterText(find.byType(TextField), 'alien');
    await tester.pump(const Duration(milliseconds: 300));
    expect(api.sentText, isEmpty);
    await tester.tap(find.text('Send'));
    await tester.pumpAndSettle();
    expect(api.sentText, ['alien']);
    expect(api.commands.last.$3, {'String': 'alien'});
    expect(find.byType(RemoteSearchSheet), findsNothing);
    await tester.pumpWidget(const SizedBox());
    connected.dispose();
  });

  testWidgets('disconnect drops pending edits; reconnect starts a new input', (
    tester,
  ) async {
    final api = _SessionApi();
    final connected = ValueNotifier(true);
    await _open(tester, api, connected);
    final initialId = api.commands.single.$3['MoonfinInputId'];
    await tester.enterText(find.byType(TextField), 'old');
    connected.value = false;
    await tester.pump(const Duration(milliseconds: 300));
    expect(api.sentText, isEmpty);
    connected.value = true;
    await tester.pump();
    await tester.enterText(find.byType(TextField), 'new');
    await tester.pump(const Duration(milliseconds: 300));
    expect(api.sentText, ['new']);
    expect(api.commands.last.$3['MoonfinInputId'], isNot(initialId));
    await tester.pumpWidget(const SizedBox());
    connected.dispose();
  });

  testWidgets('send failure retains the phrase for an explicit retry', (
    tester,
  ) async {
    final api = _SessionApi()..failText = true;
    final connected = ValueNotifier(true);
    await _open(tester, api, connected);
    await tester.enterText(find.byType(TextField), 'alien');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump();
    expect(find.text('Retry'), findsOneWidget);
    api.failText = false;
    await tester.tap(find.text('Retry'));
    await tester.pump();
    expect(api.sentText, ['alien', 'alien']);
    expect(find.text('Retry'), findsNothing);
    await tester.pumpWidget(const SizedBox());
    connected.dispose();
  });

  for (final state in [AppLifecycleState.paused, AppLifecycleState.hidden]) {
    testWidgets('$state cancels pending text without replaying it on resume', (
      tester,
    ) async {
      final api = _SessionApi();
      final connected = ValueNotifier(true);
      await _open(tester, api, connected);
      final firstId = api.commands.single.$3['MoonfinInputId'];
      await tester.enterText(find.byType(TextField), 'old');
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
      if (state == AppLifecycleState.paused) {
        tester.binding.handleAppLifecycleStateChanged(state);
      }
      await tester.pump(const Duration(milliseconds: 300));
      expect(api.sentText, isEmpty);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump(const Duration(milliseconds: 300));
      expect(api.sentText, isEmpty);
      await tester.enterText(find.byType(TextField), 'new');
      await tester.pump(const Duration(milliseconds: 300));
      expect(api.sentText, ['new']);
      expect(api.commands.last.$3['MoonfinInputId'], isNot(firstId));
      await tester.pumpWidget(const SizedBox());
      connected.dispose();
    });
  }

  testWidgets('one-shot retry sends the latest edited phrase', (tester) async {
    final api = _SessionApi()..failText = true;
    final connected = ValueNotifier(true);
    await _open(tester, api, connected, live: false);
    await tester.enterText(find.byType(TextField), 'old');
    await tester.tap(find.text('Send'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'new');
    api.failText = false;
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(api.sentText, ['old', 'new']);
    expect(find.byType(RemoteSearchSheet), findsNothing);
    await tester.pumpWidget(const SizedBox());
    connected.dispose();
  });
}
