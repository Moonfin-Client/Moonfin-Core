import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/minimalist/widgets/minimalist_episode_card.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

AggregatedItem _episode({
  int? number = 1,
  String name = 'The Magic Xylophone',
  bool played = false,
}) => AggregatedItem(
  id: 'ep-1',
  serverId: 'srv1',
  rawData: {
    'Id': 'ep-1',
    'Name': name,
    'Type': 'Episode',
    if (number != null) 'IndexNumber': number,
    'UserData': {'Played': played},
  },
);

Future<void> _pump(
  WidgetTester tester, {
  AggregatedItem? episode,
  String? imageUrl,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      home: Scaffold(
        body: Center(
          child: MinimalistEpisodeCard(
            episode: episode ?? _episode(),
            imageUrl: imageUrl,
            width: 266,
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets('the title gets two lines, not one', (tester) async {
    // Read the widget rather than trusting find.text: a one-line clamp would
    // still find the string while truncating most real episode names.
    await _pump(tester);

    final title = tester.widget<Text>(find.text('The Magic Xylophone'));
    expect(title.maxLines, 2);
    expect(title.overflow, TextOverflow.ellipsis);
  });

  testWidgets('the number sits on the artwork', (tester) async {
    await _pump(tester, episode: _episode(number: 7));
    expect(find.text('7'), findsOneWidget);
  });

  testWidgets('an episode with no number just has no badge', (tester) async {
    await _pump(tester, episode: _episode(number: null));

    expect(find.text('The Magic Xylophone'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a card with no picture still draws', (tester) async {
    // Specials routinely have no still of their own, so this is the normal
    // case rather than the broken one.
    await _pump(tester, imageUrl: null);

    expect(find.byIcon(Icons.movie_outlined), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a watched episode says so', (tester) async {
    await _pump(tester, episode: _episode(played: true));
    expect(tester.takeException(), isNull);
  });

  testWidgets('focus does not change the size of a card', (tester) async {
    // A focused card that grows knocks the rail's scrolling out of step with
    // its own arithmetic, which clips the card you just moved to.
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        home: Scaffold(
          body: Row(
            children: [
              MinimalistEpisodeCard(
                key: const ValueKey('resting'),
                episode: _episode(),
                imageUrl: null,
                width: 266,
              ),
              MinimalistEpisodeCard(
                key: const ValueKey('focused'),
                episode: _episode(),
                imageUrl: null,
                width: 266,
                isFocused: true,
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    final resting = tester.getSize(find.byKey(const ValueKey('resting')));
    final focused = tester.getSize(find.byKey(const ValueKey('focused')));
    expect(focused.width, resting.width);
    expect(focused.width, 266);
  });
}
