import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_media_type_badge.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_status_dot.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
  });

  tearDown(() => GetIt.instance.reset());

  Widget seerrCard(int status) => MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: MediaCard(
        title: 'Lupin',
        width: 150,
        aspectRatio: 2 / 3,
        itemType: 'Series',
        seerrMediaType: 'tv',
        seerrStatus: status,
        onTap: () {},
      ),
    ),
  );

  testWidgets('a banner sits above the type badge and skips titles nobody '
      'has requested', (tester) async {
    await prefs.set(UserPreferences.seerrBadgeStyle, SeerrBadgeStyle.banner);
    await tester.pumpWidget(seerrCard(SeerrMediaStatus.partiallyAvailable));

    expect(find.text('PARTIALLY AVAILABLE'), findsOneWidget);
    expect(find.byType(SeerrStatusDot), findsNothing);
    final card = tester.getTopLeft(find.byType(MediaCard));
    final type = tester.getTopLeft(find.byType(SeerrMediaTypeBadge));
    expect(type.dy - card.dy, greaterThanOrEqualTo(kSeerrStatusBannerHeight));

    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(seerrCard(SeerrMediaStatus.unknown));
    expect(find.byType(SeerrStatusBanner), findsNothing);
  });

  testWidgets('the badge style keeps the dot and turning badges off drops '
      'both', (tester) async {
    await tester.pumpWidget(seerrCard(SeerrMediaStatus.partiallyAvailable));
    expect(find.byType(SeerrStatusDot), findsOneWidget);
    expect(find.byType(SeerrStatusBanner), findsNothing);

    await prefs.set(UserPreferences.showSeerrAvailabilityBadges, false);
    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(seerrCard(SeerrMediaStatus.partiallyAvailable));
    expect(find.byType(SeerrStatusDot), findsNothing);
    expect(find.byType(SeerrStatusBanner), findsNothing);
  });
}
