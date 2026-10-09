import 'package:dio/dio.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart'
    show EmojiPicker;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/achievements_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/achievements_screen.dart';
import 'package:moonfin/ui/widgets/focus/dpad_list_tile.dart';
import 'package:moonfin/ui/widgets/settings/preference_tiles.dart';
import 'package:moonfin/ui/widgets/settings/settings_panel.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../support/achievement_plugin_fake.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AchievementPluginAdapter adapter;

  // In setUp rather than a test body, where fake time keeps these requests
  // from finishing.
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    adapter = AchievementPluginAdapter();
    final service = AchievementsService(
      dio: Dio()..httpClientAdapter = adapter,
    );
    final client = buildAchievementClient();
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<AchievementsService>(service);
    await service.refreshAvailability(client);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester, Widget screen) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: screen,
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('friends are split by presence and say what they are doing', (
    tester,
  ) async {
    await pump(tester, const FriendsScreen());

    expect(find.text('Online'), findsOneWidget);
    expect(find.text('Offline'), findsOneWidget);
    expect(find.text('Watching Severance · Pilot'), findsOneWidget);
    expect(find.text('Last watched Heat'), findsOneWidget);
    expect(find.text('1 waiting for you'), findsOneWidget);
    expect(find.text('2 unread messages'), findsOneWidget);
  });

  testWidgets('simple mode has no requests or people search', (tester) async {
    adapter.friendsSimpleMode = true;
    await pump(tester, const FriendsScreen());

    expect(find.text('Friend requests'), findsNothing);
    expect(find.text('Add friends'), findsNothing);
    expect(find.text('Messages'), findsOneWidget);
  });

  testWidgets('a request is accepted from the requests screen', (tester) async {
    await pump(tester, const FriendsScreen());
    await tester.tap(find.text('Friend requests'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Margaret'));
    await tester.pumpAndSettle();
    expect(find.text('Margaret wants to be friends'), findsOneWidget);
    await tester.tap(find.text('Accept'));
    await tester.pumpAndSettle();

    expect(find.text('No friend requests.'), findsOneWidget);
    expect(
      adapter.requests,
      contains(
        'POST /Plugins/AchievementBadges/users/user1/friends/user4/accept',
      ),
    );
  });

  testWidgets('the people search leaves out the user, friends and pending', (
    tester,
  ) async {
    await pump(tester, const FriendsScreen());
    await tester.tap(find.text('Add friends'));
    await tester.pumpAndSettle();

    expect(find.text('Barbara'), findsOneWidget);
    expect(find.text('Ada'), findsNothing);
    expect(find.text('Grace'), findsNothing);
    expect(find.text('Margaret'), findsNothing);

    await tester.enterText(find.byType(TextField), 'zz');
    await tester.pumpAndSettle();
    expect(find.text('No one matches that name.'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'bar');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Barbara'));
    await tester.pumpAndSettle();
    expect(find.text('Request sent to Barbara'), findsOneWidget);
  });

  testWidgets('a friend opens onto their card and a chat', (tester) async {
    await pump(tester, const FriendsScreen());
    await tester.tap(find.text('Grace'));
    await tester.pumpAndSettle();

    expect(find.text('Cinephile'), findsOneWidget);
    expect(find.text('40 of 200 badges'), findsOneWidget);
    expect(find.text('Open Severance · Pilot'), findsOneWidget);

    await tester.tap(find.text('Send message'));
    await tester.pumpAndSettle();
    expect(find.text('No spoilers please'), findsOneWidget);
  });

  testWidgets('a chat sends a message and marks the rest read', (tester) async {
    await pump(
      tester,
      const FriendChatScreen(
        conversationId: 'conv-grace',
        title: 'Grace',
        otherUserId: 'user2',
      ),
    );

    expect(find.text('Did you finish it?'), findsOneWidget);
    expect(adapter.unread, 0);

    await tester.enterText(find.byType(TextField), 'On my way');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pumpAndSettle();

    expect(find.text('On my way'), findsOneWidget);
    expect(adapter.chat.last['text'], 'On my way');
  });

  testWidgets('a chat stops reading while the app is in the background', (
    tester,
  ) async {
    const read =
        'GET /Plugins/AchievementBadges/users/user1/conversations/conv-grace/messages';
    final binding = tester.binding;
    await pump(
      tester,
      const FriendChatScreen(
        conversationId: 'conv-grace',
        title: 'Grace',
        otherUserId: 'user2',
      ),
    );

    binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    adapter.requests.clear();
    await tester.pump(const Duration(seconds: 20));
    expect(adapter.requests, isNot(contains(read)));

    binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(adapter.requests, contains(read));
  });

  testWidgets('an own message can be edited', (tester) async {
    adapter.chat.add({
      'id': 'msg-3',
      'fromUserId': 'user1',
      'fromUserName': 'Ada',
      'text': 'Typo hree',
      'sentAt': DateTime.now().toUtc().toIso8601String(),
    });
    await pump(
      tester,
      const FriendChatScreen(conversationId: 'conv-grace', title: 'Grace'),
    );

    await tester.tap(find.text('Typo hree'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Edit'));
    await tester.pumpAndSettle();
    expect(find.text('Editing message'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Typo here');
    await tester.tap(find.byIcon(Icons.check));
    await tester.pumpAndSettle();

    expect(find.text('Typo here'), findsOneWidget);
    expect(find.text('Editing message'), findsNothing);
  });

  testWidgets('an unread chat lays out on a phone', (tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await pump(tester, const FriendsScreen());
    await tester.tap(find.text('Messages'));
    await tester.pumpAndSettle();

    expect(find.text('Grace'), findsOneWidget);
    expect(find.text('No spoilers please'), findsOneWidget);
    // The unread count sits on the avatar, like the nav buttons draw it.
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('on TV, down from the newest message reaches the text field', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    addTearDown(() => PlatformDetection.setTvMode(false));
    // The side panel's width on a TV. How close the field and the send button
    // come out depends on the device, so this checks the wiring rather than
    // one layout.
    tester.view.physicalSize = const Size(420, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await pump(
      tester,
      const FriendChatScreen(conversationId: 'conv-grace', title: 'Grace'),
    );

    Focus.of(tester.element(find.text('No spoilers please'))).requestFocus();
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    // A focused TV field keeps animating, so it never settles.
    await tester.pump(const Duration(milliseconds: 300));

    expect(FocusManager.instance.primaryFocus?.debugLabel, 'ChatComposer');
  });

  testWidgets('on TV, a bubble is not boxed in a tile as wide as the chat', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    addTearDown(() => PlatformDetection.setTvMode(false));
    await pump(
      tester,
      const FriendChatScreen(conversationId: 'conv-grace', title: 'Grace'),
    );

    expect(
      find.ancestor(
        of: find.text('No spoilers please'),
        matching: find.byType(TvFocusHighlight),
      ),
      findsNothing,
    );
    expect(
      tester.getSize(find.text('No spoilers please')).width,
      lessThan(tester.getSize(find.byType(ListView)).width / 2),
    );
  });

  testWidgets('left and right move the caret in the chat field', (
    tester,
  ) async {
    await pump(
      tester,
      const FriendChatScreen(conversationId: 'conv-grace', title: 'Grace'),
    );

    await tester.enterText(find.byType(TextField), 'abc');
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();

    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.controller!.selection.baseOffset, 2);
  });

  testWidgets('an emoji picked goes into the message field', (tester) async {
    await pump(
      tester,
      const FriendChatScreen(conversationId: 'conv-grace', title: 'Grace'),
    );

    await tester.tap(find.byTooltip('Emoji'));
    await tester.pumpAndSettle();
    expect(find.byType(EmojiPicker), findsOneWidget);

    // Recents start empty, so move to the first real category.
    await tester.tap(find.byType(Tab).at(1));
    await tester.pumpAndSettle();
    await tester.tap(
      find
          .descendant(
            of: find.byType(EmojiPicker),
            matching: find.byType(MaterialButton),
          )
          .first,
    );
    await tester.pump();

    final field = tester.widget<TextField>(find.byType(TextField).first);
    expect(field.controller!.text, isNotEmpty);
  });

  testWidgets('an emoji next to text gets the emoji style', (tester) async {
    adapter.chat.add({
      'id': 'msg-3',
      'fromUserId': 'user2',
      'fromUserName': 'Grace',
      'text': '\u{1F600} see you',
      'sentAt': '2026-09-20T18:30:00Z',
    });
    await pump(
      tester,
      const FriendChatScreen(conversationId: 'conv-grace', title: 'Grace'),
    );

    final text = tester.widget<Text>(find.text('\u{1F600} see you'));
    final spans = (text.textSpan! as TextSpan).children!.cast<TextSpan>();
    final emoji = spans.firstWhere((span) => span.text == '\u{1F600}');
    final words = spans.firstWhere((span) => span.text == ' see you');
    expect(emoji.style?.fontFamilyFallback, contains('Apple Color Emoji'));
    expect(words.style?.fontFamilyFallback, isNull);
  });

  testWidgets('on TV, select opens a photo and select closes it', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    addTearDown(() => PlatformDetection.setTvMode(false));
    adapter.chat.add({
      'id': 'msg-3',
      'fromUserId': 'user2',
      'fromUserName': 'Grace',
      'text': 'Look',
      'attachmentId': 'att-1',
      'sentAt': '2026-09-20T18:30:00Z',
    });
    await pump(
      tester,
      const FriendChatScreen(conversationId: 'conv-grace', title: 'Grace'),
    );

    Focus.of(tester.element(find.text('Look'))).requestFocus();
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();
    expect(find.byType(InteractiveViewer), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();
    expect(find.byType(InteractiveViewer), findsNothing);
  });

  testWidgets('a group chat shows with its members and unread count', (
    tester,
  ) async {
    adapter.extraThreads.add({
      'conversationId': 'conv-group',
      'type': 'group',
      'participants': [
        {'userId': 'user2', 'userName': 'Grace'},
        {'userId': 'user3', 'userName': 'Linus'},
      ],
      'otherUserId': 'user2',
      'otherUserName': 'Grace, Linus',
      'lastMessage': '',
      'lastFromMe': false,
      'lastAt': '2026-09-20T18:00:00Z',
      'unreadCount': 3,
      'hasAttachment': false,
    });
    await pump(tester, const FriendsScreen());
    await tester.tap(find.text('Messages'));
    await tester.pumpAndSettle();

    expect(find.text('Grace, Linus'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('awkward emoji text renders whole, in bubbles and the field', (
    tester,
  ) async {
    const samples = [
      '\u{1F600}\u{1F600}',
      'a\u{1F600}b',
      '❤️ ok',
      '1️⃣ go',
      '\u{1F1EB}\u{1F1F7}x',
      '\u{1F44D}\u{1F3FD}ok',
      '\u{1F468}‍\u{1F469}‍\u{1F467} family',
      'plain text',
    ];
    for (var i = 0; i < samples.length; i++) {
      adapter.chat.add({
        'id': 'msg-x$i',
        'fromUserId': 'user2',
        'fromUserName': 'Grace',
        'text': samples[i],
        'sentAt': '2026-09-20T18:30:00Z',
      });
    }
    await pump(
      tester,
      const FriendChatScreen(conversationId: 'conv-grace', title: 'Grace'),
    );

    for (final sample in samples) {
      final text = tester.widget<Text>(find.text(sample));
      expect(text.textSpan!.toPlainText(), sample);
    }

    await tester.enterText(find.byType(TextField), 'hi \u{1F600} there');
    await tester.pump();
    expect(tester.takeException(), isNull);
  });

  testWidgets('the playback mute sits under message notifications', (
    tester,
  ) async {
    await pump(tester, const FriendsScreen());
    await tester.tap(find.text('Privacy'));
    await tester.pumpAndSettle();
    expect(find.text('Mute During Playback'), findsOneWidget);

    // Drawn like the other switches here, on by default, and saved on tap.
    final prefs = GetIt.instance<UserPreferences>();
    final mute = find.ancestor(
      of: find.text('Mute During Playback'),
      matching: find.byType(DpadSwitchListTile),
    );
    expect(tester.widget<DpadSwitchListTile>(mute).value, isTrue);
    await tester.tap(find.text('Mute During Playback'));
    await tester.pumpAndSettle();
    expect(prefs.get(UserPreferences.muteChatBannersDuringPlayback), isFalse);

    await tester.tap(find.text('Message Notifications'));
    await tester.pumpAndSettle();
    expect(find.text('Mute During Playback'), findsNothing);
  });

  testWidgets('opened on its own in the side panel, back closes it', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => SettingsPanel.open(context, const FriendsScreen()),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('Messages'), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Messages'), findsNothing);
    expect(find.text('open'), findsOneWidget);
  });
}
