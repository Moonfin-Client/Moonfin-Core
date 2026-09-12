import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playback_core/playback_core.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_window.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_guide_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockPlaybackManager extends Mock implements PlaybackManager {}

/// One batch is 50 channels; a lineup past that leaves the tail genuinely
/// unloaded, which is the only honest way to observe a loading cell.
const _deferredChannelCount = 60;
const _firstDeferredChannelId = 'ch50';

/// The window's left edge, computed exactly as the screen computes it: the
/// previous quarter hour less the fifteen-minute back-slice.
late DateTime _windowStart;

/// `AlertDialog.adaptive` builds a private subclass, which `find.byType` will
/// not match, so match the supertype instead.
final Finder _alertDialog = find.byWidgetPredicate((w) => w is AlertDialog);

/// `pumpAndSettle` cannot be used once any row is loading — that row's cell
/// draws an indefinite progress indicator, so frames never stop. Pump a fixed
/// span instead, comfortably past the guide's 200 ms row-scroll animation.
Future<void> _pumpFrames(WidgetTester tester) async {
  for (var i = 0; i < 24; i++) {
    await tester.pump(const Duration(milliseconds: 16));
  }
}

/// The lineup is ordered by channel number, so a lineup that must straddle a
/// batch boundary has to number its channels in the order it expects.
Map<String, dynamic> _channelRaw(String id, String name, {int number = 1}) =>
    <String, dynamic>{
      'Id': id,
      'Name': name,
      'ChannelNumber': '$number',
      'ImageTags': <String, dynamic>{},
      'UserData': <String, dynamic>{'IsFavorite': false},
    };

Map<String, dynamic> _programRaw({
  required String id,
  required String channelId,
  required DateTime start,
  required DateTime end,
  bool isMovie = false,
}) => <String, dynamic>{
  'Id': id,
  'ChannelId': channelId,
  'Name': '$channelId show $id',
  'StartDate': start.toIso8601String(),
  'EndDate': end.toIso8601String(),
  'IsMovie': isMovie,
};

/// Every focus node in the guide carries a debug label, the only handle a
/// test has on the rows' private nodes. Shared convention with the other
/// guide widget tests.
FocusNode _nodeLabelled(WidgetTester tester, String label) => tester
    .widgetList<Focus>(find.byType(Focus))
    .map((focus) => focus.focusNode)
    .whereType<FocusNode>()
    .firstWhere((node) => node.debugLabel == label);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMediaServerClient client;
  late _MockLiveTvApi liveTvApi;
  late List<Map<String, dynamic>> channels;
  late Map<String, List<Map<String, dynamic>>> programsByChannel;

  /// When set, any guide request covering this channel is held open until the
  /// test releases it, so its row can be observed mid-load.
  String? deferredChannelId;
  late List<VoidCallback> releaseDeferredGuide;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    channels = <Map<String, dynamic>>[];
    programsByChannel = <String, List<Map<String, dynamic>>>{};
    deferredChannelId = null;
    releaseDeferredGuide = <VoidCallback>[];
    _windowStart = guideLeftEdge(DateTime.now());

    final playback = _MockPlaybackManager();
    when(() => playback.backend).thenReturn(null);
    when(() => playback.backendChangedStream)
        .thenAnswer((_) => const Stream<PlayerBackend>.empty());
    GetIt.instance.registerSingleton<PlaybackManager>(playback);

    client = _MockMediaServerClient();
    liveTvApi = _MockLiveTvApi();
    when(() => client.liveTvApi).thenReturn(liveTvApi);
    when(() => client.userId).thenReturn('user');

    when(
      () => liveTvApi.getChannels(
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer((_) async => <String, dynamic>{'Items': channels});

    when(
      () => liveTvApi.getGuide(
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channelIds: any(named: 'channelIds'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        enableImages: any(named: 'enableImages'),
        enableUserData: any(named: 'enableUserData'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer((invocation) async {
      final ids =
          (invocation.namedArguments[#channelIds] as List?)?.cast<String>() ??
          const <String>[];
      final payload = <String, dynamic>{
        'Items': [for (final id in ids) ...(programsByChannel[id] ?? const [])],
      };
      final gate = deferredChannelId;
      if (gate == null || !ids.contains(gate)) return payload;

      final completer = Completer<Map<String, dynamic>>();
      releaseDeferredGuide.add(() => completer.complete(payload));
      return completer.future;
    });

    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  void sizeSurface(WidgetTester tester) {
    tester.view.physicalSize = const Size(900, 700);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }

  /// The mini-player surface, where a press reports the channel to the host
  /// instead of routing anywhere.
  Future<void> pumpMiniGuide(
    WidgetTester tester, {
    required ValueChanged<String> onChannelSelected,
  }) async {
    sizeSurface(tester);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // Embedded mode drops the guide's own Scaffold because the host
        // supplies it; stand in for that host here.
        home: Material(
          color: Colors.black,
          child: LiveTvGuideScreen(
            miniPlayerMode: true,
            embedded: true,
            onChannelSelected: onChannelSelected,
            onClose: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// The standalone surface, which is the only one carrying the genre filter
  /// rail. Tuning there pushes the live-TV player route, so the guide is
  /// hosted in a real router and the pushed route records the channel.
  Future<void> pumpStandaloneGuide(
    WidgetTester tester, {
    required ValueChanged<String> onChannelTuned,
  }) async {
    sizeSurface(tester);

    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => const LiveTvGuideScreen()),
        GoRoute(
          path: Destinations.liveTvPlayer,
          builder: (_, state) {
            final extra = state.extra! as Map<String, dynamic>;
            final channels = extra['channels']! as List<GuideChannel>;
            onChannelTuned(channels[extra['startIndex']! as int].id);
            return const Scaffold(body: SizedBox.shrink());
          },
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets(
    'a gap cell shows "No program data" and tunes the channel on press',
    (tester) async {
      channels = [_channelRaw('cGap', 'Channel Gap')];
      // Covers only the first hour; the rest of the window is a genuine
      // schedule gap, not a filtered-out show.
      programsByChannel['cGap'] = [
        _programRaw(
          id: 'cGap-p1',
          channelId: 'cGap',
          start: _windowStart,
          end: _windowStart.add(const Duration(minutes: 60)),
        ),
      ];
      String? tunedChannelId;

      await pumpMiniGuide(
        tester,
        onChannelSelected: (id) => tunedChannelId = id,
      );

      final l10n = AppLocalizations.of(
        tester.element(find.byType(LiveTvGuideScreen)),
      );
      expect(find.text(l10n.noProgramData), findsOneWidget);

      _nodeLabelled(tester, 'GuideProgramRow0:1').requestFocus();
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      expect(tunedChannelId, 'cGap');
    },
  );

  testWidgets(
    'a filtered cell shows no "No program data" label and still tunes on '
    'press',
    (tester) async {
      channels = [_channelRaw('cFiltered', 'Channel Filtered')];
      // A movie for the first hour, then a non-movie filling the rest of the
      // widest window the surface can derive; under the Movies filter that
      // second programme's slot is a filtered hole, not a gap.
      programsByChannel['cFiltered'] = [
        _programRaw(
          id: 'p1',
          channelId: 'cFiltered',
          start: _windowStart,
          end: _windowStart.add(const Duration(minutes: 60)),
          isMovie: true,
        ),
        _programRaw(
          id: 'p2',
          channelId: 'cFiltered',
          start: _windowStart.add(const Duration(minutes: 60)),
          end: _windowStart.add(const Duration(hours: 13)),
        ),
      ];
      String? tunedChannelId;

      await pumpStandaloneGuide(
        tester,
        onChannelTuned: (id) => tunedChannelId = id,
      );

      final l10n = AppLocalizations.of(
        tester.element(find.byType(LiveTvGuideScreen)),
      );
      // Engages the Movies genre filter, which removes p2 and leaves a
      // filtered hole where it used to be.
      _nodeLabelled(tester, 'GuideFilter:1').requestFocus();
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      expect(find.text(l10n.noProgramData), findsNothing);

      _nodeLabelled(tester, 'GuideProgramRow0:1').requestFocus();
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      expect(tunedChannelId, 'cFiltered');
    },
  );

  testWidgets('a loading cell ignores a press', (tester) async {
    channels = [
      for (var i = 0; i < _deferredChannelCount; i++)
        _channelRaw('ch$i', 'Channel $i', number: i + 1),
    ];
    for (var i = 0; i < _deferredChannelCount; i++) {
      programsByChannel['ch$i'] = [
        _programRaw(
          id: 'ch$i-p1',
          channelId: 'ch$i',
          start: _windowStart,
          end: _windowStart.add(const Duration(hours: 13)),
        ),
      ];
    }
    deferredChannelId = _firstDeferredChannelId;
    String? tunedChannelId;

    // The unresolved tail rows are far below the viewport, so nothing is
    // drawing a progress indicator yet and the first frame still settles.
    await pumpMiniGuide(tester, onChannelSelected: (id) => tunedChannelId = id);

    // Walk focus down to the first row of the second (unresolved) batch so
    // it is mounted, without waiting on its still-open request.
    _nodeLabelled(tester, 'GuideProgramRow0:0').requestFocus();
    await _pumpFrames(tester);
    for (var i = 0; i < 49; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await _pumpFrames(tester);
    }
    expect(
      releaseDeferredGuide,
      isNotEmpty,
      reason: 'the second batch was never requested, so no row is loading',
    );

    final loadingNode = _nodeLabelled(tester, 'GuideProgramRow50:0');
    loadingNode.requestFocus();
    await _pumpFrames(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _pumpFrames(tester);

    expect(tunedChannelId, isNull);
    expect(_alertDialog, findsNothing);
  });
}
