import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/offline/connectivity_aware_media_server_client.dart';
import 'package:moonfin/data/offline/offline_errors.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/unified_server_picker.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/unified_catalog_fakes.dart';

class _Client extends Mock implements MediaServerClient {}

class _WrappedClient extends Mock
    implements ConnectivityAwareMediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _Factory extends Mock implements MediaServerClientFactory {}

class _Connectivity extends Mock implements ConnectivityService {}

class _Catalog extends Fake implements UnifiedCatalogService {
  final removed = <(String, String)>[];
  bool failRemovals = false;

  @override
  Future<void> removeCopy(String serverId, String itemId) async {
    if (failRemovals) throw StateError('the stored catalog is closed');
    removed.add((serverId, itemId));
  }
}

/// A movie with its media sources, as a server answers for one item: server
/// a holds a 4K copy and server b a 1080p one.
Map<String, dynamic> _movieWithMediaSources(String id, {bool played = false}) {
  final uhd = id.startsWith('a');
  return {
    'Id': id,
    'Type': 'Movie',
    'UserData': {'Played': played},
    'MediaSources': [
      {
        'Id': id,
        'Size': uhd ? 45 * 1024 * 1024 * 1024 : 8 * 1024 * 1024 * 1024,
        'MediaStreams': [
          {
            'Type': 'Video',
            'Codec': uhd ? 'hevc' : 'h264',
            'Width': uhd ? 3840 : 1920,
            'Height': uhd ? 2160 : 1080,
          },
          {'Type': 'Audio', 'Codec': 'ac3', 'Channels': 6, 'Language': 'fre'},
          {'Type': 'Audio', 'Codec': 'ac3', 'Channels': 6, 'Language': 'eng'},
          {'Type': 'Subtitle', 'Codec': 'srt', 'Language': 'ger'},
        ],
      },
    ],
  };
}

/// Altovar's copies on two servers, as the library last read them: watched
/// on b.
final _copies = [
  for (final id in ['a', 'b'])
    UnifiedCopy(
      serverId: id,
      itemId: '${id}1',
      serverName: 'Server $id',
      played: id == 'b',
      positionTicks: 0,
      playedPercentage: null,
      reachable: true,
    ),
];

void main() {
  late _Catalog catalog;
  late _Connectivity connectivity;
  late Map<String, _ItemsApi> serverApis;
  late Map<String, _ItemsApi> appApis;
  UnifiedCopy? picked;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    catalog = _Catalog();
    connectivity = _Connectivity();
    when(() => connectivity.canReachServer).thenReturn(true);
    picked = null;

    serverApis = {};
    appApis = {};
    final clients = <String, MediaServerClient>{};
    for (final id in ['a', 'b']) {
      final server = _Client();
      when(() => server.itemsApi).thenReturn(serverApis[id] = _ItemsApi());
      when(() => serverApis[id]!.getItem(any(), fields: any(named: 'fields')))
          .thenAnswer(
            (invocation) async => {
              'Id': invocation.positionalArguments.first,
              'Type': 'Series',
              'ChildCount': id == 'a' ? 3 : 2,
              'UserData': {'Played': false},
            },
          );
      final app = _WrappedClient();
      when(() => app.onlineClient).thenReturn(server);
      when(() => app.itemsApi).thenReturn(appApis[id] = _ItemsApi());
      // Nothing is downloaded, so the app's client finds no title when offline.
      when(() => appApis[id]!.getItem(any(), fields: any(named: 'fields')))
          .thenAnswer(
            (invocation) async => throw offlineNotFound(
              '/Items/${invocation.positionalArguments.first}',
            ),
          );
      clients[id] = app;
    }
    final factory = _Factory();
    when(
      () => factory.getClientIfExists(any()),
    ).thenAnswer((invocation) => clients[invocation.positionalArguments.first]);

    GetIt.instance
      ..registerSingleton<UserPreferences>(UserPreferences(store))
      ..registerSingleton<MediaServerClientFactory>(factory)
      ..registerSingleton<UnifiedCatalogService>(catalog)
      ..registerSingleton<ConnectivityService>(connectivity);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  /// [settle] is off for a test that holds a server's answer back.
  Future<void> open(
    WidgetTester tester, {
    List<UnifiedCopy>? copies,
    VoidCallback? onDismissed,
    bool settle = true,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => pickUnifiedServerThenOpen(
                context,
                title: 'Altovar',
                copies: copies ?? _copies,
                onPicked: (copy) => picked = copy,
                onDismissed: onDismissed,
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    if (settle) {
      await tester.pumpAndSettle();
    } else {
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
    }
  }

  void answerWithMovies() {
    for (final id in serverApis.keys) {
      when(() => serverApis[id]!.getItem(any(), fields: any(named: 'fields')))
          .thenAnswer(
            (invocation) async =>
                _movieWithMediaSources(
                  invocation.positionalArguments.first as String,
                ),
          );
    }
  }

  List<String> texts(WidgetTester tester) => tester
      .widgetList<Text>(find.byType(Text))
      .map((text) => text.data ?? '')
      .toList();

  void verifyNoServerAsked() {
    for (final api in [...serverApis.values, ...appApis.values]) {
      verifyNever(() => api.getItem(any(), fields: any(named: 'fields')));
    }
  }

  testWidgets('each copy is read from its server, not from the downloads', (
    tester,
  ) async {
    await open(tester);

    verify(() => serverApis['a']!.getItem('a1', fields: any(named: 'fields')))
        .called(1);
    verify(() => serverApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .called(1);
    for (final api in appApis.values) {
      verifyNever(() => api.getItem(any(), fields: any(named: 'fields')));
    }
    expect(find.text('3 seasons'), findsOneWidget);
    expect(find.text('2 seasons'), findsOneWidget);
    expect(find.text('Unavailable'), findsNothing);
    expect(catalog.removed, isEmpty);
  });

  testWidgets('offline, no server is asked and no copy is treated as gone', (
    tester,
  ) async {
    when(() => connectivity.canReachServer).thenReturn(false);

    await open(tester);

    verifyNoServerAsked();
    expect(find.text('Details unavailable'), findsNWidgets(2));
    expect(find.text('Loading details...'), findsNothing);
    expect(find.text('Unavailable'), findsNothing);
    expect(find.text('Watched'), findsOneWidget);
    expect(catalog.removed, isEmpty);

    await tester.tap(find.text('Server b'));
    await tester.pumpAndSettle();
    expect(picked?.key, unifiedCopyKey('b', 'b1'));
  });

  testWidgets('a copy its server says is gone is removed from the stored '
      'catalog', (tester) async {
    when(() => serverApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .thenAnswer((_) async => throw httpError(404));

    await open(tester);

    expect(find.text('Unavailable'), findsOneWidget);
    expect(catalog.removed, [('b', 'b1')]);
    await tester.tap(find.text('Server b'));
    await tester.pumpAndSettle();
    expect(picked, isNull);
    expect(find.text('Select Server'), findsOneWidget);
  });

  testWidgets('a copy on a server that cannot be reached is not treated as '
      'gone', (tester) async {
    // The connection dropped before the app noticed it was offline.
    when(() => serverApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .thenAnswer(
          (_) async => throw DioException(
            requestOptions: RequestOptions(path: '/Items/b1'),
            type: DioExceptionType.connectionError,
          ),
        );

    await open(tester);

    expect(find.text('Details unavailable'), findsOneWidget);
    expect(find.text('Unavailable'), findsNothing);
    expect(catalog.removed, isEmpty);
  });

  testWidgets('dismissing the server picker runs the dismissal and opens '
      'nothing', (tester) async {
    var dismissed = 0;
    await open(tester, onDismissed: () => dismissed++);

    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();

    expect(find.text('Select Server'), findsNothing);
    expect(picked, isNull);
    expect(dismissed, 1);
  });

  testWidgets('each server row describes its copy of a movie', (tester) async {
    answerWithMovies();

    await open(tester);

    // No line is cut short, so the size at its end survives a narrow phone.
    final lines = texts(tester);
    expect(lines.where((line) => line.contains('4K')).single, contains('HEVC'));
    expect(
      lines.where((line) => line.contains('1080p')).single,
      contains('H264'),
    );
    expect(lines, containsAll(['French, English', 'German']));
    expect(lines, containsAll(['45.00 GB', '8.00 GB']));
    // The icon says "subtitles" to the eye; a screen reader gets the word.
    final subtitleLines = tester.widgetList<Text>(find.text('German'));
    expect(subtitleLines, isNotEmpty);
    for (final line in subtitleLines) {
      expect(line.semanticsLabel, 'Subtitles: German');
    }
    for (final text in tester.widgetList<Text>(find.textContaining('GB'))) {
      expect(text.maxLines, isNull);
    }
    expect(find.text('Loading details...'), findsNothing);
  });

  testWidgets('the watched state shown comes from the server\'s answer, not '
      'from the copies passed in', (tester) async {
    // The library last heard that b's copy was watched and a's untouched.
    // Since then a's was watched and b's marked unwatched.
    answerWithMovies();
    when(() => serverApis['a']!.getItem('a1', fields: any(named: 'fields')))
        .thenAnswer(
          (_) async => _movieWithMediaSources('a1', played: true),
        );

    await open(tester);

    // A text of its own, where a long server name's ellipsis can't cut it off.
    expect(find.text('Watched'), findsOneWidget);
    expect(find.textContaining('Server a ·'), findsNothing);
    expect(
      find.descendant(
        of: find
            .ancestor(of: find.text('Server a'), matching: find.byType(Row))
            .first,
        matching: find.text('Watched'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('progress on a copy is shown as a localized percentage', (
    tester,
  ) async {
    when(() => serverApis['a']!.getItem('a1', fields: any(named: 'fields')))
        .thenAnswer(
          (_) async => {
            'Id': 'a1',
            'Type': 'Movie',
            'RunTimeTicks': 1000,
            'UserData': {'Played': false, 'PlaybackPositionTicks': 400},
          },
        );

    await open(tester);

    expect(find.text('40%'), findsOneWidget);
  });

  testWidgets('a slow server shows a loading line, then "Details '
      'unavailable"', (tester) async {
    final never = Completer<Map<String, dynamic>>();
    when(() => serverApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .thenAnswer((_) => never.future);

    await open(tester, settle: false);

    expect(find.text('Loading details...'), findsOneWidget);
    final waiting = tester.getSize(find.byType(Dialog));

    await tester.pump(const Duration(seconds: 8));
    await tester.pump();

    expect(find.text('Loading details...'), findsNothing);
    expect(find.text('Details unavailable'), findsOneWidget);
    // The row reserved the loading line's space, so the dialog kept its size.
    expect(tester.getSize(find.byType(Dialog)), waiting);
  });

  testWidgets('an answer that arrives after the server picker closed '
      'changes nothing', (tester) async {
    final late = Completer<Map<String, dynamic>>();
    when(() => serverApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .thenAnswer((_) => late.future);
    await open(tester, settle: false);
    expect(find.text('Loading details...'), findsOneWidget);

    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();
    expect(find.text('Select Server'), findsNothing);

    late.completeError(httpError(404));
    await tester.pumpAndSettle();

    expect(catalog.removed, isEmpty);
    expect(picked, isNull);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a stored catalog that fails to remove a copy breaks nothing', (
    tester,
  ) async {
    catalog.failRemovals = true;
    when(() => serverApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .thenAnswer((_) async => throw httpError(404));

    await open(tester);

    expect(find.text('Unavailable'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('two copies on one server are told apart by name', (
    tester,
  ) async {
    await open(
      tester,
      copies: [
        for (final (itemId, name) in [('a1', 'Altovar'), ('a3', 'Altovar 4K')])
          UnifiedCopy(
            serverId: 'a',
            itemId: itemId,
            serverName: 'Server a',
            name: name,
            played: false,
            positionTicks: 0,
            playedPercentage: null,
            reachable: true,
          ),
      ],
    );

    expect(find.text('Select Version'), findsOneWidget);
    expect(find.text('Select Server'), findsNothing);
    expect(find.text('Server a'), findsNWidgets(2));
    expect(find.text('Altovar 4K'), findsOneWidget);
    expect(find.text('Altovar'), findsNWidgets(2));

    await tester.tap(find.text('Altovar 4K'));
    await tester.pumpAndSettle();
    expect(picked?.key, unifiedCopyKey('a', 'a3'));
  });

  testWidgets('copies that two servers name alike show no title per row', (
    tester,
  ) async {
    await open(tester);

    expect(find.text('Select Server'), findsOneWidget);
    expect(find.text('Altovar'), findsOneWidget);
  });

  testWidgets('large text on a narrow screen overflows nothing', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(312, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    tester.platformDispatcher.textScaleFactorTestValue = 2.0;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    when(() => serverApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .thenAnswer((_) async => throw httpError(404));

    await open(
      tester,
      copies: [
        for (final copy in _copies)
          UnifiedCopy(
            serverId: copy.serverId,
            itemId: copy.itemId,
            serverName: 'The Living Room Media Server ${copy.serverId}',
            played: copy.played,
            positionTicks: 0,
            playedPercentage: null,
            reachable: true,
          ),
      ],
    );

    // The longest state there is, beside a long name, at twice the size.
    expect(find.text('Unavailable'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test('only the downloads catalog\'s own failures count as offline', () {
    expect(isFabricatedOfflineError(offlineNotFound('/Items/x')), isTrue);
    expect(isFabricatedOfflineError(offlineUnavailable('/Users/Me')), isTrue);
    expect(isFabricatedOfflineError(httpError(404)), isFalse);
    expect(isFabricatedOfflineError(StateError('x')), isFalse);
    // Callers that read the status still find the one they handle.
    expect(offlineNotFound('/Items/x').response?.statusCode, 404);
  });
}
