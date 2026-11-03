import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/login_state.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/auth/silo_password_change_dialog.dart';

SiloNewPasswordIssue? _check(String password, {String? confirmation}) =>
    checkSiloNewPassword(
      newPassword: password,
      confirmation: confirmation ?? password,
      temporaryPassword: 'temporary',
      minimumLength: 8,
      maximumBytes: 72,
    );

void main() {
  group('checkSiloNewPassword', () {
    test('accepts a password within the limits', () {
      expect(_check('brand new pass'), isNull);
    });

    test('counts the minimum in characters', () {
      expect(_check('short'), SiloNewPasswordIssue.tooShort);
      // Seven characters, fourteen bytes: still too short.
      expect(_check('ééééééé'), SiloNewPasswordIssue.tooShort);
      expect(_check('éééééééé'), isNull);
    });

    test('counts the maximum in UTF-8 bytes', () {
      expect(_check('a' * 72), isNull);
      expect(_check('a' * 73), SiloNewPasswordIssue.tooLong);
      // 40 characters, 80 bytes.
      expect(_check('é' * 40), SiloNewPasswordIssue.tooLong);
    });

    test('refuses the temporary password and a mismatch', () {
      expect(_check('temporary'), SiloNewPasswordIssue.sameAsTemporary);
      expect(
        _check('brand new pass', confirmation: 'brand new pas'),
        SiloNewPasswordIssue.mismatch,
      );
    });
  });

  group('SiloPasswordChangeDialog', () {
    late List<String> submitted;
    late int cancelled;
    late LoginState answer;
    SiloPasswordChangeOutcome? outcome;
    late bool closed;

    setUp(() {
      submitted = [];
      cancelled = 0;
      answer = const Authenticated(userId: 'main', serverId: 's1');
      outcome = null;
      closed = false;
    });

    Future<void> open(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  outcome = await SiloPasswordChangeDialog.show(
                    context,
                    minimumLength: 8,
                    maximumBytes: 72,
                    temporaryPassword: 'temporary',
                    onSubmit: (password) async {
                      submitted.add(password);
                      return answer;
                    },
                    onCancel: () async => cancelled++,
                  );
                  closed = true;
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

    Future<void> type(
      WidgetTester tester,
      String password,
      String confirm,
    ) async {
      final fields = find.byType(TextField);
      await tester.enterText(fields.at(0), password);
      await tester.enterText(fields.at(1), confirm);
      await tester.tap(find.text('Change password'));
      await tester.pumpAndSettle();
    }

    testWidgets('a mistake is shown without sending anything', (tester) async {
      await open(tester);

      await type(tester, 'brand new pass', 'something else');

      expect(find.text("The passwords don't match"), findsOneWidget);
      expect(submitted, isEmpty);
      expect(closed, isFalse);
    });

    testWidgets('a refused password keeps the dialog open with the reason', (
      tester,
    ) async {
      answer = const SiloPasswordChangeRejected(detail: 'Too guessable.');
      await open(tester);

      await type(tester, 'brand new pass', 'brand new pass');

      expect(submitted, ['brand new pass']);
      expect(find.text('Too guessable.'), findsOneWidget);
      expect(closed, isFalse);
    });

    testWidgets('a failed request asks to try again', (tester) async {
      answer = const SiloPasswordChangeRejected();
      await open(tester);

      await type(tester, 'brand new pass', 'brand new pass');

      expect(
        find.text("Couldn't change the password. Try again."),
        findsOneWidget,
      );
      expect(closed, isFalse);
    });

    testWidgets('any other answer closes it with the new password', (
      tester,
    ) async {
      await open(tester);

      await type(tester, 'brand new pass', 'brand new pass');

      expect(closed, isTrue);
      expect(outcome?.state, isA<Authenticated>());
      expect(outcome?.newPassword, 'brand new pass');
      expect(cancelled, 0);
    });

    testWidgets('Cancel ends the login and returns null', (tester) async {
      await open(tester);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(closed, isTrue);
      expect(outcome, isNull);
      expect(cancelled, 1);
      expect(submitted, isEmpty);
    });
  });
}
