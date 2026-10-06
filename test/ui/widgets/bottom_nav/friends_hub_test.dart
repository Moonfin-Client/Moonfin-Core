import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/services/achievements_service.dart';
import 'package:moonfin/preference/user_preferences.dart';

import 'bottom_nav_fakes.dart';

class _FakeAchievements extends ChangeNotifier implements AchievementsService {
  _FakeAchievements({required this.socialAvailable});

  @override
  final bool socialAvailable;

  @override
  int get socialBadgeCount => 2;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUp(setUpBottomNav);
  tearDown(tearDownBottomNav);

  Future<void> openHub(WidgetTester tester) async {
    usePhoneView(tester);
    await tester.pumpWidget(bottomNavApp());
    await tester.pump();
    await tester.tap(find.text('You'));
    await tester.pumpAndSettle();
  }

  testWidgets('the bottom navbar hub lists Friends with what is waiting', (
    tester,
  ) async {
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.showFriendsButton,
      true,
    );
    GetIt.instance.registerSingleton<AchievementsService>(
      _FakeAchievements(socialAvailable: true),
    );
    await openHub(tester);

    expect(find.text('Friends'), findsOneWidget);
    // Once on the avatar and once on the row.
    expect(find.text('2'), findsNWidgets(2));
  });

  testWidgets('Friends stays out of the hub until it\'s turned on', (
    tester,
  ) async {
    GetIt.instance.registerSingleton<AchievementsService>(
      _FakeAchievements(socialAvailable: true),
    );
    await openHub(tester);

    expect(find.text('Friends'), findsNothing);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('no Friends without the plugin', (tester) async {
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.showFriendsButton,
      true,
    );
    GetIt.instance.registerSingleton<AchievementsService>(
      _FakeAchievements(socialAvailable: false),
    );
    await openHub(tester);

    expect(find.text('Friends'), findsNothing);
    expect(find.text('Settings'), findsOneWidget);
  });
}
