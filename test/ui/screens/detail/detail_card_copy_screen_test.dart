import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/services/blocked_content_gate.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/services/theme_music_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show DetailScreenStyle;
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../widgets/bottom_nav/bottom_nav_fakes.dart';

class _Client extends Mock implements MediaServerClient {}

class _UserLibraryApi extends Mock implements UserLibraryApi {}

class _OfflineRepository extends Mock implements OfflineRepository {}

class _PlaybackManager extends Mock implements PlaybackManager {}

class _ClientFactory extends Mock implements MediaServerClientFactory {}

class _PluginSync extends Mock implements PluginSyncService {}

class _ItemsApi extends Mock implements ItemsApi {
  final pending = <String, Completer<Map<String, dynamic>>>{};

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? fields,
    String? mediaSourceId,
  }) => (pending[itemId] = Completer<Map<String, dynamic>>()).future;
}

class _ImageApi extends Fake implements ImageApi {
  @override
  dynamic noSuchMethod(Invocation invocation) => 'http://test-server/image';
}

class _BackgroundService extends Fake implements BackgroundService {
  @override
  Stream<String?> get backgroundStream => const Stream.empty();

  @override
  List<String> backdropUrlsFor(AggregatedItem item) => const [];

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _ThemeMusic extends Fake implements ThemeMusicService {
  final played = <String>[];

  @override
  Future<void> playForItem(AggregatedItem item) async => played.add(item.id);

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  late _ItemsApi itemsApi;
  late _ThemeMusic themeMusic;
  late UserPreferences prefs;

  setUp(() async {
    prefs = (await setUpBottomNav()).prefs;
    final client = _Client();
    itemsApi = _ItemsApi();
    themeMusic = _ThemeMusic();
    final userLibrary = _UserLibraryApi();
    when(() => userLibrary.supportsNumericUserRatings).thenReturn(false);
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(userLibrary);
    when(() => client.imageApi).thenReturn(_ImageApi());
    when(() => client.baseUrl).thenReturn('http://test-server');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    final offline = _OfflineRepository();
    when(() => offline.getItem(any())).thenAnswer((_) async => null);
    when(() => offline.getSeriesEpisodes(any()))
        .thenAnswer((_) async => const []);
    final playback = _PlaybackManager();
    when(() => playback.state).thenReturn(PlayerState());
    when(() => playback.queueService).thenReturn(QueueService());
    final factory = _ClientFactory();
    when(() => factory.clientForServerOrActive(any())).thenReturn(client);
    final plugin = _PluginSync();
    when(() => plugin.seerrAvailable).thenReturn(false);
    when(() => plugin.pluginAvailable).thenReturn(false);
    when(() => plugin.calendarAvailable).thenReturn(false);
    final tmdb = TmdbRepository(client);
    GetIt.instance
      ..unregister<PlaybackManager>()
      ..registerSingleton<PlaybackManager>(playback)
      ..unregister<MediaServerClientFactory>()
      ..registerSingleton<MediaServerClientFactory>(factory)
      ..unregister<PluginSyncService>()
      ..registerSingleton<PluginSyncService>(plugin)
      ..registerSingleton<MediaServerClient>(client)
      ..registerSingleton<TmdbRepository>(tmdb)
      ..registerSingleton<MdbListRepository>(MdbListRepository(client, tmdb))
      ..registerSingleton<RowDataSource>(RowDataSource(client))
      ..registerSingleton<OfflineRepository>(offline)
      ..registerSingleton<BackgroundService>(_BackgroundService())
      ..registerSingleton<ThemeMusicService>(themeMusic)
      ..registerSingleton<BlockedContentGate>(
        BlockedContentGate(client, prefs),
      );
  });

  tearDown(tearDownBottomNav);

  Future<void> pumpScreen(
    WidgetTester tester,
    AggregatedItem card, {
    bool quickLook = false,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ItemDetailScreen(
          itemId: card.id,
          cardItem: card,
          quickLook: quickLook,
        ),
      ),
    );
  }

  // Premiere draws the name in capitals.
  Finder named(String name) =>
      find.textContaining(RegExp(name, caseSensitive: false));

  Future<void> unmount(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 1));
  }

  for (final layout in [InterfaceLayout.tv, InterfaceLayout.phone]) {
    for (final style in DetailScreenStyle.values) {
      for (final type in ['Movie', 'Series']) {
        testWidgets('${style.name} on ${layout.name} draws a $type card, '
            'then the full item', (tester) async {
          if (layout == InterfaceLayout.tv) {
            tester.view.devicePixelRatio = 1;
            tester.view.physicalSize = const Size(1920, 1080);
            addTearDown(tester.view.reset);
          } else {
            usePhoneView(tester);
          }
          PlatformDetection.setInterfaceLayout(layout);
          await prefs.set(UserPreferences.detailScreenStyle, style);
          final raw = {'Id': 'item-1', 'Name': 'From the card', 'Type': type};

          await pumpScreen(
            tester,
            AggregatedItem(id: 'item-1', serverId: 'srv1', rawData: raw),
            quickLook: style == DetailScreenStyle.quickLook,
          );
          expect(named('From the card'), findsWidgets);
          expect(themeMusic.played, isEmpty);

          itemsApi.pending['item-1']!.complete({
            ...raw,
            'Name': 'The full item',
            'Overview': 'An overview',
          });
          await tester.pump();
          expect(named('From the card'), findsNothing);
          expect(named('The full item'), findsWidgets);
          expect(
            themeMusic.played,
            style == DetailScreenStyle.quickLook ? isEmpty : ['item-1'],
          );

          await unmount(tester);
        });
      }
    }
  }

  testWidgets('theme music waits for the full item to pass the parental gate', (
    tester,
  ) async {
    await prefs.set(UserPreferences.blockedParentalRatings, 'TV-MA');
    const raw = {'Id': 'item-1', 'Name': 'From the card', 'Type': 'Movie'};

    await pumpScreen(
      tester,
      const AggregatedItem(
        id: 'item-1',
        serverId: 'srv1',
        rawData: {...raw, 'OfficialRating': 'PG'},
      ),
    );
    expect(named('From the card'), findsWidgets);

    itemsApi.pending['item-1']!.complete({...raw, 'OfficialRating': 'TV-MA'});
    await tester.pump();
    expect(named('From the card'), findsNothing);
    expect(themeMusic.played, isEmpty);

    await unmount(tester);
  });
}
