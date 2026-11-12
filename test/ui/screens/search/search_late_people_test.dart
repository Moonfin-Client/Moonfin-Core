import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/recent_searches_store.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/services/server_messages_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/search/search_screen.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_number_chip.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The search screen renders inside the navigation chrome, so the whole
// chrome's dependency set has to be standing.
class _FakeUserRepository extends Fake implements UserRepository {
  @override
  User? get currentUser => null;

  @override
  Stream<User?> get currentUserStream => const Stream.empty();
}

class _FakeUserViewsRepository extends ChangeNotifier
    implements UserViewsRepository {
  @override
  Future<List<AggregatedLibrary>> getUserViews() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakePluginSyncService extends ChangeNotifier
    implements PluginSyncService {
  Map<String, dynamic>? smartAnswer;

  @override
  bool get seerrAvailable => false;

  @override
  bool get calendarAvailable => false;

  @override
  bool get smartSearchEnabled => smartAnswer != null;

  @override
  Future<Map<String, dynamic>?> fetchSmartSearch(
    MediaServerClient client,
    String query, {
    int limit = 20,
  }) async => smartAnswer;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSeerrRepository extends Fake implements SeerrRepository {
  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  bool get isAvailable => true;

  @override
  Future<SeerrDiscoverPage> search(
    String query, {
    String? mediaType,
    int limit = 20,
    int offset = 0,
  }) async => const SeerrDiscoverPage();
}

class _FakeSessionRepository extends Fake implements SessionRepository {
  @override
  String? get activeUserId => null;
}

class _FakeGameLibraryRegistry extends Fake implements GameLibraryRegistry {
  @override
  Future<void> refresh() async {}
}

class _FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();

  @override
  final QueueService queueService = QueueService();
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

class _FakeServerMessages extends ChangeNotifier
    implements ServerMessagesService {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

/// Finds a movie and a folder straight away and holds the people search until
/// the test lets it answer.
class _FakeItemsApi extends Fake implements ItemsApi {
  // Made on the first search so it completes inside the test's fake clock.
  Completer<Map<String, dynamic>>? people;

  @override
  Future<Map<String, dynamic>> getPersons({
    required String searchTerm,
    int? limit,
    String? fields,
    String? enableImageTypes,
  }) => (people ??= Completer()).future;

  @override
  dynamic noSuchMethod(Invocation invocation) => Future.value(const {
    'Items': [
      {
        'Id': 'm1',
        'Name': 'Movie One',
        'Type': 'Movie',
        'ProductionYear': 2024,
      },
      {'Id': 'f1', 'Name': 'Folder One', 'Type': 'Folder'},
    ],
  });
}

void main() {
  late _FakeItemsApi itemsApi;
  late _FakePluginSyncService pluginSync;
  late _MockClient client;

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    itemsApi = _FakeItemsApi();
    pluginSync = _FakePluginSyncService();

    client = _MockClient();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.imageApi).thenReturn(_MockImageApi());
    when(() => client.gamesApi).thenReturn(null);
    when(() => client.baseUrl).thenReturn('http://jf');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);

    final getIt = GetIt.instance;
    getIt.registerSingleton<PreferenceStore>(store);
    getIt.registerSingleton<UserPreferences>(UserPreferences(store));
    getIt.registerSingleton<UserRepository>(_FakeUserRepository());
    getIt.registerSingleton<UserViewsRepository>(_FakeUserViewsRepository());
    getIt.registerSingleton<PluginSyncService>(pluginSync);
    getIt.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, _FakeSessionRepository()),
    );
    getIt.registerSingleton<GameLibraryRegistry>(_FakeGameLibraryRegistry());
    getIt.registerSingleton<PlaybackManager>(_FakePlaybackManager());
    getIt.registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
    getIt.registerSingleton<ServerMessagesService>(_FakeServerMessages());
    getIt.registerSingleton<MediaServerClient>(client);
    getIt.registerSingleton<SearchRepository>(SearchRepository(client));
    getIt.registerSingleton<RecentSearchesStore>(RecentSearchesStore(store));
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    NavigationLayout.chromeFocusRoots.clear();
    await GetIt.instance.reset();
  });

  Future<void> searchWithPeoplePending(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SearchScreen(initialQuery: 'one'),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
  }

  Future<void> peopleAnswer(WidgetTester tester) async {
    itemsApi.people!.complete({
      'Items': [
        {'Id': 'p1', 'Name': 'Person One'},
      ],
    });
    await tester.pumpAndSettle();
  }

  testWidgets('results show while people are still searching', (tester) async {
    await searchWithPeoplePending(tester);

    expect(find.text('Movie One'), findsOneWidget);
    expect(find.text('Person One'), findsNothing);

    await peopleAnswer(tester);

    expect(find.text('Person One'), findsOneWidget);
  });

  testWidgets('a channel shows its number in the guide chip under its name', (
    tester,
  ) async {
    final liveTv = _MockLiveTvApi();
    when(
      () => liveTv.getChannels(
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'c1', 'Name': 'Channel One', 'ChannelNumber': '1007'},
          {'Id': 'c2', 'Name': 'One Sport'},
        ],
      },
    );
    when(() => client.liveTvApi).thenReturn(liveTv);

    await searchWithPeoplePending(tester);

    Finder card(String name) =>
        find.ancestor(of: find.text(name), matching: find.byType(MediaCard));
    final chip = find.byType(ChannelNumberChip);

    // The number sits under the channel's name, at its left edge, and the
    // name keeps the whole line. The channel without a number next to it
    // takes the same card, its name on the same line, and no chip. Returns
    // the channel's card and how far below its top the name starts.
    (Rect, double) expectChannels(String what) {
      final channel = tester.getRect(card('Channel One'));
      final title = tester.getRect(find.text('Channel One'));
      expect(chip, findsOneWidget, reason: what);
      expect(tester.widget<ChannelNumberChip>(chip).number, '1007');
      expect(find.text('1007'), findsOneWidget, reason: what);
      final chipRect = tester.getRect(chip);
      expect(title.left, closeTo(channel.left, 0.01), reason: what);
      expect(title.width, closeTo(channel.width, 0.01), reason: what);
      expect(chipRect.left, closeTo(channel.left, 0.01), reason: what);
      expect(chipRect.top, closeTo(title.bottom + 2, 0.01), reason: what);
      expect(chipRect.bottom, lessThanOrEqualTo(channel.bottom), reason: what);
      final sport = tester.getRect(card('One Sport'));
      expect(sport.width, closeTo(channel.width, 0.01), reason: what);
      expect(sport.height, closeTo(channel.height, 0.01), reason: what);
      expect(
        tester.getRect(find.text('One Sport')).top,
        closeTo(title.top, 0.01),
        reason: what,
      );
      expect(
        find.descendant(of: card('One Sport'), matching: chip),
        findsNothing,
        reason: what,
      );
      expect(tester.takeException(), isNull, reason: what);
      return (channel, title.top - channel.top);
    }

    // A movie takes a card of the same size, its name as far down it, and
    // its year right under the name, as on main, with no chip.
    void expectMovie((Rect, double) channel, String what) {
      final movie = tester.getRect(card('Movie One'));
      final title = tester.getRect(find.text('Movie One'));
      expect(movie.width, closeTo(channel.$1.width, 0.01), reason: what);
      expect(movie.height, closeTo(channel.$1.height, 0.01), reason: what);
      expect(title.top - movie.top, closeTo(channel.$2, 0.01), reason: what);
      expect(
        tester.getRect(find.text('2024')).top,
        closeTo(title.bottom, 0.01),
        reason: what,
      );
      expect(
        find.descendant(of: card('Movie One'), matching: chip),
        findsNothing,
        reason: what,
      );
      expect(tester.takeException(), isNull, reason: what);
    }

    // The All tab: each in its row.
    expectMovie(expectChannels('All tab'), 'All tab');

    // The Channels and Movies tabs: the same cards in grid cells.
    await tester.tap(find.text('Channels: 2'));
    await tester.pumpAndSettle();
    final inGrid = expectChannels('Channels tab');
    await tester.tap(find.text('Movies: 1'));
    await tester.pumpAndSettle();
    expectMovie(inGrid, 'Movies tab');

    // Lets the people search answer, so its timeout isn't left pending.
    await peopleAnswer(tester);
  });

  testWidgets('people arriving late keep the picked tab selected', (
    tester,
  ) async {
    await searchWithPeoplePending(tester);
    await tester.tap(find.text('Folders: 1'));
    await tester.pumpAndSettle();
    expect(find.text('Folder One'), findsOneWidget);

    await peopleAnswer(tester);

    expect(find.text('Folder One'), findsOneWidget);
    expect(find.text('Person One'), findsNothing);
  });

  testWidgets('people arriving late leave focus on the card that had it', (
    tester,
  ) async {
    await searchWithPeoplePending(tester);
    Focus.of(tester.element(find.text('Folder One').first)).requestFocus();
    await tester.pumpAndSettle();

    await peopleAnswer(tester);

    expect(find.text('Person One'), findsOneWidget);
    expect(
      FocusManager.instance.primaryFocus,
      Focus.of(tester.element(find.text('Folder One').first)),
    );
  });

  testWidgets('smart search rows sit above the results and take D-pad focus', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    GetIt.instance.registerSingletonAsync<SeerrRepository>(
      () async => _FakeSeerrRepository(),
    );
    pluginSync.smartAnswer = {
      'Ready': true,
      'Items': [
        {'Id': 's1', 'Name': 'Smart One', 'Type': 'Movie'},
      ],
      'Seerr': [
        {'id': 7, 'mediaType': 'movie', 'title': 'Seerr Smart'},
      ],
    };
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SearchScreen(initialQuery: 'one two'),
      ),
    );
    // The TV field's cursor keeps blinking, so this never settles.
    Future<void> settle() => tester.pump(const Duration(seconds: 1));
    for (var i = 0; i < 3; i++) {
      await settle();
    }

    double top(String text) => tester.getTopLeft(find.text(text)).dy;
    expect(top('Smart Search'), lessThan(top('Smart Search on Seerr')));
    expect(top('Smart Search on Seerr'), lessThan(top('Movies')));

    FocusNode cardNode(String title) =>
        Focus.of(tester.element(find.text(title).first));
    cardNode('Smart One').requestFocus();
    await settle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await settle();
    expect(FocusManager.instance.primaryFocus, cardNode('Seerr Smart'));

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await settle();
    expect(FocusManager.instance.primaryFocus, cardNode('Movie One'));

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await settle();
    expect(FocusManager.instance.primaryFocus, cardNode('Seerr Smart'));

    itemsApi.people!.complete({'Items': []});
    await settle();
  });

  // The mic is the trailing icon in the pill, so right reaches it and left
  // comes back.
  testWidgets('TV D-pad moves from the field to the mic and back', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SearchScreen(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    bool micFocused() =>
        Focus.of(tester.element(find.byIcon(Icons.mic_none))).hasFocus;
    expect(micFocused(), isFalse);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(micFocused(), isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();
    expect(micFocused(), isFalse);
  });

  /// TV search with the mic in focus, and the recognizer answering whether
  /// it exists through [initialize]. Windows asks for no microphone permission.
  Future<FocusNode> focusTvMic(
    WidgetTester tester,
    Future<bool> Function() initialize,
  ) async {
    const speech = MethodChannel('plugin.csdcorp.com/speech_to_text');
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      speech,
      (call) async => call.method == 'initialize' ? initialize() : null,
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        speech,
        null,
      ),
    );
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SearchScreen(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    // Held on to, since the button shows a spinner while it starts.
    final mic = Focus.of(tester.element(find.byIcon(Icons.mic_none)));
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(mic.hasPrimaryFocus, isTrue);
    return mic;
  }

  testWidgets('TV gives the mic its focus back when voice search cant start', (
    tester,
  ) async {
    final mic = await focusTvMic(tester, () async => false);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump(const Duration(milliseconds: 500));
    expect(mic.hasPrimaryFocus, isTrue);
    // Lets the error's snackbar run out.
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));

  testWidgets('a voice search failing under another screen leaves it alone', (
    tester,
  ) async {
    final answer = Completer<bool>();
    final mic = await focusTvMic(tester, () => answer.future);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    unawaited(
      tester
          .state<NavigatorState>(find.byType(Navigator))
          .push(MaterialPageRoute<void>(builder: (_) => const Scaffold())),
    );
    await tester.pump(const Duration(seconds: 1));
    final covering = FocusManager.instance.primaryFocus;

    answer.complete(false);
    await tester.pump(const Duration(milliseconds: 500));
    expect(mic.hasPrimaryFocus, isFalse);
    expect(FocusManager.instance.primaryFocus, covering);
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));
}
