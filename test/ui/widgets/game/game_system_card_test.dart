import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/game/game_system_card.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  testWidgets('supports localized count, RTL, and large text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.linear(3)),
            child: Scaffold(
              body: Center(
                child: SizedBox(width: 360, height: 320, child: _Card()),
              ),
            ),
          ),
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('707 items'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
  });
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return GameSystemCard(
      libraryId: 'retro',
      system: const GameSystem(
        id: 'atari2600',
        name: 'Atari 2600 with a long localized name',
        core: 'stella',
        gameCount: 707,
      ),
      games: const [],
      gameCount: 707,
      onTap: () {},
    );
  }
}
