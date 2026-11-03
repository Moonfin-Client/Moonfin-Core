import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/user_menu_dialog.dart';
import 'package:server_core/server_core.dart';

class _Auth extends Fake implements AuthApi {
  _Auth(this.approves);

  final bool approves;
  final codes = <String>[];

  @override
  Future<bool> authorizeQuickConnect(String code, {String? userId}) async {
    codes.add(code);
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return approves;
  }
}

class _Client extends Fake implements MediaServerClient {
  _Client(this.serverType, this.authApi);

  @override
  final ServerType serverType;

  @override
  final AuthApi authApi;
}

class _Users extends Fake implements UserRepository {
  @override
  User? get currentUser => null;
}

void main() {
  tearDown(() => GetIt.instance.reset());

  Future<_Auth> approve(
    WidgetTester tester, {
    required ServerType type,
    required bool approves,
  }) async {
    final auth = _Auth(approves);
    GetIt.instance
      ..registerSingleton<MediaServerClient>(_Client(type, auth))
      ..registerSingleton<UserRepository>(_Users());
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showQuickConnectCodeDialog(context),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '48217730');
    await tester.tap(find.byType(FilledButton));
    await tester.pumpAndSettle();
    return auth;
  }

  testWidgets('approving on Silo closes the dialog cleanly and says so', (
    tester,
  ) async {
    final auth = await approve(tester, type: ServerType.silo, approves: true);

    expect(tester.takeException(), isNull);
    expect(auth.codes, ['48217730']);
    expect(find.byType(TextField), findsNothing);
    expect(
      find.text('Approved. The other device is signing in.'),
      findsOneWidget,
    );
  });

  testWidgets('a code no sign-in waits with closes cleanly too', (
    tester,
  ) async {
    await approve(tester, type: ServerType.silo, approves: false);

    expect(tester.takeException(), isNull);
    expect(
      find.textContaining('No sign-in is waiting with that code'),
      findsOneWidget,
    );
  });

  testWidgets('Jellyfin keeps its wording', (tester) async {
    await approve(tester, type: ServerType.jellyfin, approves: true);

    expect(tester.takeException(), isNull);
    expect(find.text('Quick Connect request authorized.'), findsOneWidget);
  });
}
