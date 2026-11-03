import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/auth/silo_profile_unlock.dart';
import 'package:server_silo/server_silo.dart';

void main() {
  late List<String> sent;
  late bool? closedWith;

  Future<void> open(
    WidgetTester tester,
    Future<SiloPinResult> Function(String pin) answer,
  ) async {
    sent = [];
    closedWith = null;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                closedWith = await SiloPinDialog.show(
                  context,
                  profileName: 'Teen',
                  onSubmit: (pin) {
                    sent.add(pin);
                    return answer(pin);
                  },
                );
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  Future<void> enter(WidgetTester tester, String pin) async {
    await tester.enterText(find.byType(TextField), pin);
    await tester.tap(find.text('Unlock'));
    await tester.pumpAndSettle();
  }

  testWidgets('names the profile; the right PIN closes it unlocked', (
    tester,
  ) async {
    await open(tester, (_) async => const SiloPinAccepted('pvt_1'));

    expect(find.text('PIN for Teen'), findsOneWidget);
    await enter(tester, 'correct horse');

    expect(sent, ['correct horse']);
    expect(closedWith, isTrue);
    expect(find.byType(SiloPinDialog), findsNothing);
  });

  testWidgets('a wrong PIN stays open, says so and clears the field', (
    tester,
  ) async {
    await open(tester, (_) async => const SiloPinRejected());

    await enter(tester, '0000');

    expect(find.text("That PIN isn't right."), findsOneWidget);
    expect(find.byType(SiloPinDialog), findsOneWidget);
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      isEmpty,
    );
    expect(closedWith, isNull);
  });

  testWidgets('a lockout says how long is left', (tester) async {
    await open(
      tester,
      (_) async => const SiloPinLocked(Duration(seconds: 287)),
    );

    await enter(tester, '1');

    expect(
      find.text('Too many wrong PINs. Try again in 5 minutes.'),
      findsOneWidget,
    );
  });

  testWidgets('a lockout without a time', (tester) async {
    await open(tester, (_) async => const SiloPinLocked(null));

    await enter(tester, '1');

    expect(
      find.text('Too many wrong PINs. Try again later.'),
      findsOneWidget,
    );
  });

  testWidgets('a failed check says so; nothing is sent for an empty PIN', (
    tester,
  ) async {
    await open(
      tester,
      (_) async => throw DioException(
        requestOptions: RequestOptions(path: '/x'),
        type: DioExceptionType.connectionError,
      ),
    );

    await tester.tap(find.text('Unlock'));
    await tester.pumpAndSettle();
    expect(sent, isEmpty);

    await enter(tester, '1');
    expect(
      find.text("The PIN couldn't be checked. Try again."),
      findsOneWidget,
    );
  });

  testWidgets('a PIN longer than Silo allows is wrong without a check', (
    tester,
  ) async {
    await open(tester, (_) async => const SiloPinAccepted('pvt_1'));

    await enter(tester, 'x' * 73);

    expect(sent, isEmpty);
    expect(find.text("That PIN isn't right."), findsOneWidget);
  });

  testWidgets('Cancel closes it locked', (tester) async {
    await open(tester, (_) async => const SiloPinAccepted('pvt_1'));

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(closedWith, isFalse);
    expect(sent, isEmpty);
  });
}
