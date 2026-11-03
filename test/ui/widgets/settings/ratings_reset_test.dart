import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/ratings_config_screen.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockSessionRepository extends Mock implements SessionRepository {}

class _RecordingAdapter implements HttpClientAdapter {
  final List<String> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    requests.add('${options.method} $path');

    if (path.endsWith('/Moonfin/Ping')) {
      return ResponseBody.fromString(
        jsonEncode({'installed': true, 'settingsSyncEnabled': true}),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }
    return ResponseBody.fromString(
      '{}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingAdapter adapter;
  late UserPreferences prefs;

  int postCount() => adapter.requests
      .where((r) => r.startsWith('POST') && r.contains('/Settings/Profile/'))
      .length;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({'pref_last_server_id': 'srv1'});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    final session = _MockSessionRepository();
    when(() => session.activeUserId).thenReturn('user1');
    GetIt.instance.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, session),
    );

    final client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://plugin.test');
    when(() => client.accessToken).thenReturn('token');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'dev1',
        name: 'test',
        appName: 'moonfin',
        appVersion: '0.0.0',
      ),
    );
    GetIt.instance.registerSingleton<MediaServerClient>(client);

    adapter = _RecordingAdapter();
    final dio = Dio();
    dio.httpClientAdapter = adapter;
    final sync = PluginSyncService(prefs, store, dio: dio);
    await prefs.set(UserPreferences.pluginSyncEnabled, true);
    expect(await sync.refreshAvailability(client), isTrue);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
    adapter.requests.clear();
  });

  tearDown(() => GetIt.instance.reset());

  Future<void> pumpScreen(
    WidgetTester tester, {
    RatingSettings? settings,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: RatingsConfigScreen(settings: settings),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapReset(WidgetTester tester, {required bool confirm}) async {
    await tester.tap(find.byIcon(Icons.restore));
    await tester.pumpAndSettle();

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await tester.tap(find.text(confirm ? l10n.reset : l10n.cancel));
    await tester.pumpAndSettle();
  }

  /// Lets the 1000ms push debounce that every preference write arms run out,
  /// so no timer is left pending when the tree is torn down.
  Future<void> drainDebounce(WidgetTester tester) async {
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
  }

  testWidgets('the reset puts every ratings setting back to its default', (
    tester,
  ) async {
    await prefs.set(UserPreferences.enabledRatings, 'trakt,letterboxd');
    await prefs.set(UserPreferences.enableAdditionalRatings, false);
    await prefs.set(UserPreferences.enableEpisodeRatings, false);
    await prefs.set(UserPreferences.showRatingLabels, false);
    await prefs.set(UserPreferences.showRatingBadges, false);

    await pumpScreen(tester);
    await tapReset(tester, confirm: true);

    expect(
      prefs.get(UserPreferences.enabledRatings),
      UserPreferences.enabledRatings.defaultValue,
    );
    expect(
      prefs.get(UserPreferences.enableAdditionalRatings),
      UserPreferences.enableAdditionalRatings.defaultValue,
    );
    expect(
      prefs.get(UserPreferences.enableEpisodeRatings),
      UserPreferences.enableEpisodeRatings.defaultValue,
    );
    expect(
      prefs.get(UserPreferences.showRatingLabels),
      UserPreferences.showRatingLabels.defaultValue,
    );
    expect(
      prefs.get(UserPreferences.showRatingBadges),
      UserPreferences.showRatingBadges.defaultValue,
    );

    await drainDebounce(tester);
  });

  testWidgets('a surface reset leaves the other surfaces alone', (
    tester,
  ) async {
    await prefs.set(UserPreferences.enabledRatings, 'trakt');
    await prefs.set(UserPreferences.showRatingLabels, false);
    await prefs.set(UserPreferences.homeRowsEnabledRatings, 'letterboxd');
    await prefs.set(UserPreferences.homeRowsShowRatingLabels, true);
    await prefs.set(UserPreferences.homeRowsEnableEpisodeRatings, false);
    await prefs.set(UserPreferences.mediaBarEnabledRatings, 'imdb');

    await pumpScreen(tester, settings: UserPreferences.homeRowsRatings);
    await tapReset(tester, confirm: true);

    for (final pref in UserPreferences.homeRowsRatings.all) {
      expect(prefs.get(pref), pref.defaultValue, reason: pref.key);
    }
    expect(prefs.get(UserPreferences.enabledRatings), 'trakt');
    expect(prefs.get(UserPreferences.showRatingLabels), isFalse);
    expect(prefs.get(UserPreferences.mediaBarEnabledRatings), 'imdb');

    await drainDebounce(tester);
  });

  testWidgets('a surface screen edits only its own source list', (
    tester,
  ) async {
    await prefs.set(UserPreferences.mediaBarEnabledRatings, 'imdb');

    await pumpScreen(tester, settings: UserPreferences.mediaBarRatings);
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await tester.tap(find.text(l10n.tmdb));
    await tester.pumpAndSettle();

    expect(prefs.get(UserPreferences.mediaBarEnabledRatings), 'imdb,tmdb');
    expect(
      prefs.get(UserPreferences.enabledRatings),
      UserPreferences.enabledRatings.defaultValue,
    );

    await drainDebounce(tester);
  });

  testWidgets('cancelling the dialog changes nothing', (tester) async {
    await prefs.set(UserPreferences.enabledRatings, 'trakt,letterboxd');

    await pumpScreen(tester);
    await tapReset(tester, confirm: false);

    expect(prefs.get(UserPreferences.enabledRatings), 'trakt,letterboxd');

    await drainDebounce(tester);
  });

  testWidgets('the dialog opens with cancel focused', (tester) async {
    await pumpScreen(tester);
    await tester.tap(find.byIcon(Icons.restore));
    await tester.pumpAndSettle();

    // Without an autofocused action the modal scope holds focus itself, and a
    // remote spends its first press waking focus up rather than choosing.
    final context = FocusManager.instance.primaryFocus?.context;
    expect(context, isNotNull);
    String? focusedAction;
    context!.visitAncestorElements((element) {
      final widget = element.widget;
      if (widget is TextButton) {
        focusedAction = (widget.child as Text?)?.data;
        return false;
      }
      return true;
    });

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    expect(focusedAction, l10n.cancel);

    await tester.tap(find.text(l10n.cancel));
    await tester.pumpAndSettle();
    await drainDebounce(tester);
  });

  testWidgets('the reset reaches the server even when already default', (
    tester,
  ) async {
    await pumpScreen(tester);
    await tapReset(tester, confirm: true);

    // The forced push, and then the debounce it armed finding the payload
    // already recorded and staying quiet.
    expect(postCount(), 1);
    await drainDebounce(tester);
    expect(postCount(), 1);
  });
}
