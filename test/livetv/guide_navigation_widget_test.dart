import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin_design/moonfin_design.dart' show AppColorScheme;
import 'package:playback_core/playback_core.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/navigation/focus_route_observer.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_filter_picker.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_filter_rail.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_channel_cell.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_now_next_card.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_hero_preview.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_window.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_guide_screen.dart';
import 'package:moonfin/ui/widgets/local_search_field.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi, ChannelGroupApi {}

class _MockUserLibrary extends Mock implements UserLibraryApi {}

class _MockPlaybackManager extends Mock implements PlaybackManager {}

class _PickerPreferences extends UserPreferences {
  _PickerPreferences(super.store);
  Completer<void>? save;

  @override
  Future<void> set<T>(Preference<T> pref, T value) async {
    if (pref.key == UserPreferences.liveTvSavedFilters.key && save != null) {
      await save!.future;
    }
    await super.set(pref, value);
  }
}

/// Deliberately asymmetric row shapes: differing program durations give the
/// rows differing cell counts and boundaries, which is what makes a drifting
/// vertical move visible as a different cell index.
const _durations = <int>[20, 30, 45, 60, 180];

const _channelCount = 48;

/// One batch is 50 channels, so a lineup past that leaves the tail rows
/// genuinely unloaded, the only honest way to observe a loading row.
const _deferredChannelCount = 60;
const _firstDeferredChannelId = 'ch50';

/// The window's left edge, computed exactly as the screen computes it: the
/// previous quarter hour less the fifteen-minute back-slice. Captured once per
/// test so the fixture and the assertions share one origin.
late DateTime _fixtureWindowStart;

int _durationForRow(int row) => _durations[row % _durations.length];

/// The cell boundaries the screen derives for a row, in minutes from the
/// window start. Mirrors `buildRowCells` over a gapless fixture lineup.
int _cellIndexForRow(int row, int minutesFromWindowStart) =>
    minutesFromWindowStart ~/ _durationForRow(row);

int _minutesIntoRowCell(int row, int cellIndex) =>
    cellIndex * _durationForRow(row);

Map<String, dynamic> _channelRaw(int index) => <String, dynamic>{
  'Id': 'ch$index',
  'Name': 'Channel $index',
  'ChannelNumber': '${index + 1}',
  'ImageTags': <String, dynamic>{},
  'UserData': <String, dynamic>{'IsFavorite': false},
};

List<Map<String, dynamic>> _programsFor(String channelId, {bool sports = false}) {
  final row = int.parse(channelId.substring(2));
  final duration = _durationForRow(row);
  final start = _fixtureWindowStart;
  final programs = <Map<String, dynamic>>[];
  // Twelve hours of listings, so whatever window width the surface derives is
  // tiled edge to edge and every row's cells are whole programs.
  for (var minute = 0; minute < 720; minute += duration) {
    programs.add(<String, dynamic>{
      'Id': '$channelId-p$minute',
      'ChannelId': channelId,
      'Name': '$channelId show $minute',
      'IsSports': sports,
      'StartDate': start.add(Duration(minutes: minute)).toIso8601String(),
      'EndDate': start
          .add(Duration(minutes: minute + duration))
          .toIso8601String(),
    });
  }
  return programs;
}

Widget _hosted(Widget guide, {required bool embedded}) =>
    embedded ? Material(color: Colors.black, child: guide) : guide;

/// `AlertDialog.adaptive` builds a private subclass, which `find.byType` will
/// not match, so match the supertype instead.
final Finder _alertDialog = find.byWidgetPredicate((w) => w is AlertDialog);

/// `pumpAndSettle` can't be used once any row is loading. That row's cell
/// draws an indefinite progress indicator, so frames never stop. Pump a fixed
/// span instead, comfortably past the guide's 200 ms row-scroll animation.
Future<void> _pumpFrames(WidgetTester tester) async {
  for (var i = 0; i < 24; i++) {
    await tester.pump(const Duration(milliseconds: 16));
  }
}

/// Every focus node in the guide carries a debug label, which is the only
/// handle a test has on the rows' private nodes.
FocusNode _nodeLabelled(WidgetTester tester, String label) => tester
    .widgetList<Focus>(find.byType(Focus))
    .map((focus) => focus.focusNode)
    .whereType<FocusNode>()
    .firstWhere((node) => node.debugLabel == label);

Future<void> _activateGuideControl(WidgetTester tester, String label) async {
  _nodeLabelled(tester, label).requestFocus();
  await _pumpFrames(tester);
  await tester.sendKeyEvent(LogicalKeyboardKey.enter);
  await _pumpFrames(tester);
}

String? _focusedLabel() => FocusManager.instance.primaryFocus?.debugLabel;

String _windowRangeText(WidgetTester tester) => tester
    .widgetList<Text>(find.byType(Text))
    .map((text) => text.data)
    .whereType<String>()
    .firstWhere((text) => text.contains(' – '));

/// `(row, cellIndex)` of the focused program cell, or null when focus is
/// somewhere else in the guide.
({int row, int index})? _focusedCell() {
  final label = _focusedLabel();
  if (label == null || !label.startsWith('GuideProgramRow')) return null;
  final parts = label.substring('GuideProgramRow'.length).split(':');
  return (row: int.parse(parts[0]), index: int.parse(parts[1]));
}

/// The horizontal scroll offsets of every horizontal scrollable in the guide
/// (the grid and the time header, which are kept in sync).
List<double> _horizontalOffsets(WidgetTester tester) => tester
    .stateList<ScrollableState>(find.byType(Scrollable))
    .where(
      (state) =>
          state.position.axis == Axis.horizontal &&
          state.widget.physics is! NeverScrollableScrollPhysics,
    )
    .map((state) => state.position.pixels)
    .toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMediaServerClient client;
  late _MockLiveTvApi liveTvApi;

  /// Overridable per test so a lineup can outgrow a single program batch.
  late int channelCount;
  Exception? guideFailure;

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

    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.programmes,
    );
    channelCount = _channelCount;
    guideFailure = null;
    _fixtureWindowStart = guideLeftEdge(DateTime.now());
    deferredChannelId = null;
    releaseDeferredGuide = <VoidCallback>[];

    final playback = _MockPlaybackManager();
    when(() => playback.backend).thenReturn(null);
    when(() => playback.backendChangedStream)
        .thenAnswer((_) => const Stream<PlayerBackend>.empty());
    GetIt.instance.registerSingleton<PlaybackManager>(playback);

    client = _MockMediaServerClient();
    liveTvApi = _MockLiveTvApi();
    when(() => client.liveTvApi).thenReturn(liveTvApi);
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.baseUrl).thenReturn('fixture');
    when(() => liveTvApi.getChannelGroups(userId: 'user'))
        .thenAnswer((_) async => const ChannelGroupLineup({}));
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
    ).thenAnswer(
      (_) async => <String, dynamic>{
        'Items': [for (var i = 0; i < channelCount; i++) _channelRaw(i)],
      },
    );

    when(
      () => liveTvApi.getGuide(
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channelIds: any(named: 'channelIds'),
        isSports: any(named: 'isSports'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        enableImages: any(named: 'enableImages'),
        enableUserData: any(named: 'enableUserData'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer((invocation) async {
      if (guideFailure case final failure?) throw failure;
      final ids =
          (invocation.namedArguments[#channelIds] as List?)?.cast<String>() ??
          const <String>[];
      final sportsChannel = invocation.namedArguments[#startDate] == _fixtureWindowStart ? 'ch0' : 'ch1';
      final payload = <String, dynamic>{
        'Items': [for (final id in ids) ..._programsFor(id, sports: id == sportsChannel)],
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

  Future<void> pumpGuide(
    WidgetTester tester, {
    bool miniPlayerMode = false,
    Size surface = const Size(900, 700),
    List<NavigatorObserver> observers = const [],
  }) async {
    // Wide enough for a multi-hour window and tall enough for a dozen rows.
    // The guide sizes its own time density to whatever surface it is given.
    tester.view.physicalSize = surface;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: observers,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // Embedded mode drops the guide's own Scaffold because the host
        // supplies it. Stand in for that host here.
        home: _hosted(
          LiveTvGuideScreen(
            miniPlayerMode: miniPlayerMode,
            embedded: miniPlayerMode,
            onChannelSelected: miniPlayerMode ? (_, _) {} : null,
            onClose: miniPlayerMode ? () {} : null,
          ),
          embedded: miniPlayerMode,
        ),
      ),
    );
    // TV labels may keep scrolling, so don't wait for every animation to stop.
    await _pumpFrames(tester);
  }

  testWidgets('playback uses the guide filter until a mini-guide selection', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(900, 700);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.both,
    );
    when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
      (_) async => const ChannelGroupLineup({
        'ch1': {'Local'},
        'ch46': {'Local'},
        'ch47': {'Local'},
      }),
    );
    late List<GuideChannel> lineup;
    String? picked;
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => const LiveTvGuideScreen()),
        GoRoute(
          path: Destinations.liveTvPlayer,
          builder: (_, s) {
            lineup = (s.extra as Map)['channels'] as List<GuideChannel>;
            return Material(
              child: LiveTvGuideScreen(
                miniPlayerMode: true,
                embedded: true,
                currentChannel: lineup[(s.extra as Map)['startIndex'] as int],
                onChannelSelected: (id, currentLineup) {
                  expect(currentLineup.map((c) => c.id), contains(id));
                  picked = id;
                },
                onClose: () {},
              ),
            );
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
    await _pumpFrames(tester);
    await tester.tap(find.byTooltip('Filters'));
    await _pumpFrames(tester);
    await tester.tap(
      find.descendant(
        of: find.byType(GuideFilterPicker),
        matching: find.text('Local'),
      ),
    );
    await _pumpFrames(tester);
    await tester.enterText(find.byType(TextField), 'Channel 4');
    await _pumpFrames(tester);
    _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
    await _pumpFrames(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _pumpFrames(tester);
    expect(lineup.map((channel) => channel.id), ['ch46', 'ch47']);
    final visible = tester
        .widgetList<EpgChannelCell>(find.byType(EpgChannelCell).hitTestable())
        .map((w) => w.name)
        .toList();
    final other = visible.firstWhere(
      (name) => name != 'Channel 46' && name != 'Channel 47',
    );
    final node = find
        .byWidgetPredicate((w) => w is EpgChannelCell && w.name == other)
        .hitTestable()
        .first;
    await tester.tap(node);
    await _pumpFrames(tester);
    expect(picked, isNotNull);
    expect(lineup.map((channel) => channel.id), isNot(contains(picked)));
  });
  testWidgets(
    'mobile picker filters groups and keeps channel search in the guide',
    (tester) async {
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.set(
        UserPreferences.liveTvCategoryDisplay,
        LiveTvCategoryDisplay.both,
      );
      await prefs.set(UserPreferences.epgMobileView, EpgMobileView.list);
      when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
        (_) async => const ChannelGroupLineup(
          {
            'ch1': {'Sports'},
            'ch2': {'Sports'},
            'ch47': {'US | PRIME'},
          },
          programmeCategories: {'sports', 'movies'},
        ),
      );
      await pumpGuide(tester, surface: const Size(390, 844));
      final list = tester
          .widget<ListView>(find.byType(ListView).last)
          .controller!;
      list.jumpTo(400);
      await tester.pump();
      expect(list.offset, greaterThan(0));
      await tester.enterText(find.byType(TextField), 'Channel 4');
      await tester.pump(const Duration(milliseconds: 200));
      await _pumpFrames(tester);
      final firstMatch = find.byType(EpgNowNextCard).first;
      expect(
        tester.widget<EpgNowNextCard>(firstMatch).channelName,
        'Channel 4',
      );
      expect(firstMatch.hitTestable(), findsOneWidget);
      await tester.enterText(find.byType(TextField), '');
      await tester.pump(const Duration(milliseconds: 200));
      final filters = find.byTooltip('Filters');
      expect(
        find.descendant(of: filters, matching: find.byIcon(Icons.filter_list)),
        findsOneWidget,
      );
      expect(
        find.descendant(of: filters, matching: find.text('All channels')),
        findsOneWidget,
      );
      await tester.tap(filters);
      await _pumpFrames(tester);
      expect(tester.getSize(find.byType(GuideFilterPicker)).width, 390);
      final picker = find.byType(GuideFilterPicker);
      Finder inside(Finder match) =>
          find.descendant(of: picker, matching: match);
      expect(inside(find.text('All channels')), findsOneWidget);
      expect(inside(find.text('Sports')), findsNWidgets(2));
      expect(inside(find.text('2')), findsOneWidget);
      expect(inside(find.text('News')), findsNothing);
      await tester.enterText(inside(find.byType(TextField)), 'prime');
      await _pumpFrames(tester);
      expect(inside(find.text('Sports')), findsNothing);
      await tester.longPress(inside(find.text('US | PRIME')));
      await _pumpFrames(tester);
      expect(inside(find.text('US | PRIME')), findsOneWidget);
      expect(inside(find.byIcon(Icons.favorite)), findsOneWidget);
      expect(
        tester
            .widget<TextField>(inside(find.byType(TextField)))
            .controller!
            .text,
        'prime',
      );
      await tester.tap(inside(find.text('US | PRIME')));
      await _pumpFrames(tester);
      expect(
        find.descendant(of: filters, matching: find.text('US | PRIME')),
        findsOneWidget,
      );
      expect(find.text('Channel 47'), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsNothing);
      final library = _MockUserLibrary();
      when(() => client.userLibraryApi).thenReturn(library);
      when(() => library.markFavorite('ch47')).thenAnswer((_) async {});
      addTearDown(userDataSync.reset);
      await tester.longPress(find.byType(EpgNowNextCard));
      await _pumpFrames(tester);
      expect(
        tester.widget<EpgNowNextCard>(find.byType(EpgNowNextCard)).isFavorite,
        isTrue,
      );
      verify(() => library.markFavorite('ch47')).called(1);
      await tester.enterText(find.byType(TextField), 'Channel 1');
      await _pumpFrames(tester);
      expect(find.text('No channels found'), findsOneWidget);
      await tester.tap(find.byTooltip('Clear'));
      await _pumpFrames(tester);
      expect(find.text('Channel 47'), findsOneWidget);
      await prefs.set(
        UserPreferences.liveTvCategoryDisplay,
        LiveTvCategoryDisplay.programmes,
      );
      await _pumpFrames(tester);
      final rail = tester.widget<EpgFilterRail>(find.byType(EpgFilterRail));
      expect(rail.labels, ['All', 'Movies', 'Sports', 'Favorites']);
      expect(rail.selectedIndex, 0);
    },
  );
  testWidgets('Sports clears active and pending channel searches', (tester) async {
    await pumpGuide(tester);
    final search = tester
        .widget<LocalSearchField>(find.byType(LocalSearchField))
        .controller;
    search.text = 'unknown channel';
    await _pumpFrames(tester);
    expect(find.text('No channels found'), findsOneWidget);

    search.text = 'another unknown channel';
    await tester.tap(find.text('Sports'));
    await _pumpFrames(tester);
    expect(search.text, isEmpty);
    expect(find.byType(EpgChannelCell), findsWidgets);

    search.text = 'Channel 2';
    await _pumpFrames(tester);
    clearInteractions(liveTvApi);
    await _activateGuideControl(tester, 'GuideFilter:${GuideFilter.favorites.index}');
    expect(search.text, isEmpty);
    verifyNever(() => liveTvApi.getGuide(
      startDate: any(named: 'startDate'), endDate: any(named: 'endDate'),
      channelIds: any(named: 'channelIds'), isSports: true,
      fields: any(named: 'fields'), enableImages: any(named: 'enableImages'),
      enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
      enableUserData: any(named: 'enableUserData'), userId: any(named: 'userId'),
    ));
  });

  testWidgets('empty group mode keeps categories', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.groups,
    );
    await pumpGuide(tester);
    expect(find.byType(EpgFilterRail), findsOneWidget);
    _nodeLabelled(tester, 'GuideWindowBar:0').requestFocus();
    await _pumpFrames(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await _pumpFrames(tester);
    expect(_focusedLabel(), 'GuideWindowBar:0');
    expect(find.byType(GuideFilterPicker), findsNothing);
  });

  testWidgets('TV picker OK selects and Right or Back cancels', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.groups,
    );
    const extraGroups = 16; // Place Sports beyond the first screen of rows.
    when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
      (_) async => ChannelGroupLineup({
        'ch1': {'Sports'},
        'ch2': {'Sports'},
        'ch3': {'News', for (var i = 0; i < extraGroups; i++) 'Group $i'},
      }),
    );
    await pumpGuide(tester, observers: [FocusRouteObserver()]);
    Future<void> key(LogicalKeyboardKey key) async {
      await tester.sendKeyEvent(key);
      await _pumpFrames(tester);
    }

    _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
    await _pumpFrames(tester);
    await key(LogicalKeyboardKey.arrowLeft);
    final picker = find.byType(GuideFilterPicker);
    Finder label(String name) =>
        find.descendant(of: picker, matching: find.text(name));
    bool focused(String name) =>
        Focus.of(tester.element(label(name))).hasPrimaryFocus;
    expect(focused('All channels'), isTrue);
    await key(LogicalKeyboardKey.arrowUp);
    final pickerSearch = find.descendant(
      of: picker,
      matching: find.byType(LocalSearchField),
    );
    expect(
      tester.widget<LocalSearchField>(pickerSearch).focusNode.hasFocus,
      isTrue,
    );
    await key(LogicalKeyboardKey.arrowDown);
    expect(tester.getSize(picker).width, lessThan(450));
    expect(
      find.descendant(of: picker, matching: find.text('Movies')),
      findsNothing,
    );
    for (var i = 0; i < extraGroups + 3; i++) {
      await key(LogicalKeyboardKey.arrowDown);
    }
    await key(LogicalKeyboardKey.select);
    expect(picker, findsNothing);
    expect(find.text('Sports'), findsOneWidget);
    expect(
      tester.widget<EpgChannelCell>(find.byType(EpgChannelCell).first).name,
      'Channel 1',
    );
    expect(_focusedLabel(), 'GuideChannel:0');

    // Search leaves Channel 2 at row 0; clearing it moves Channel 2 to row 1.
    final search = tester
        .widget<LocalSearchField>(find.byType(LocalSearchField))
        .controller;
    search.text = 'Channel 2';
    await tester.pump(const Duration(milliseconds: 220));
    await _pumpFrames(tester);
    expect(
      tester.widget<EpgChannelCell>(find.byType(EpgChannelCell)).name,
      'Channel 2',
    );
    _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
    await _pumpFrames(tester);
    await key(LogicalKeyboardKey.arrowLeft);
    expect(search.text, isEmpty);
    expect(picker, findsOneWidget);
    expect(label('Sports').hitTestable(), findsOneWidget);
    expect(focused('Sports'), isTrue);
    await key(LogicalKeyboardKey.arrowUp);
    expect(focused('News'), isTrue);
    expect(
      tester.widget<ListTile>(find.widgetWithText(ListTile, 'Sports')).selected,
      isTrue,
    );
    await key(LogicalKeyboardKey.arrowRight);
    expect(picker, findsNothing);
    expect(_focusedLabel(), 'GuideChannel:1');
    expect(
      tester.widget<EpgChannelCell>(find.byType(EpgChannelCell).at(1)).name,
      'Channel 2',
    );
    expect(find.text('Sports'), findsOneWidget);

    _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
    await _pumpFrames(tester);
    await key(LogicalKeyboardKey.arrowLeft);
    await key(LogicalKeyboardKey.arrowUp);
    await key(LogicalKeyboardKey.escape);
    expect(picker, findsNothing);
    expect(find.text('Sports'), findsOneWidget);
    expect(_focusedLabel(), 'GuideChannel:0');

    final range = _windowRangeText(tester);
    Color? filterFill() => tester
        .widget<Material>(
          find.descendant(
            of: find.byTooltip('Filters'),
            matching: find.byType(Material),
          ),
        )
        .color;
    final idleFill = Colors.white.withValues(alpha: 0.10);
    expect(filterFill(), idleFill);
    for (final control in ['GuideWindowBar:0', 'GuideBrowse']) {
      await key(LogicalKeyboardKey.arrowUp);
      expect(_focusedLabel(), control);
      expect(
        filterFill(),
        control == 'GuideBrowse' ? AppColorScheme.accent : idleFill,
      );
      await key(LogicalKeyboardKey.arrowLeft);
      expect(picker, findsOneWidget);
      expect(focused('Sports'), isTrue);
      await key(LogicalKeyboardKey.arrowRight);
      expect(picker, findsNothing);
      expect(_focusedLabel(), control);
      expect(_windowRangeText(tester), range);
    }
    await key(LogicalKeyboardKey.arrowDown);
    expect(filterFill(), idleFill);
    await key(LogicalKeyboardKey.select);
    expect(_windowRangeText(tester), isNot(range));
  });

  testWidgets(
    'saving and removing picker rows preserves focus and the active filter',
    (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      addTearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );
      final prefs = _PickerPreferences(GetIt.instance<PreferenceStore>());
      await GetIt.instance.unregister<UserPreferences>();
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
      await prefs.set(
        UserPreferences.liveTvCategoryDisplay,
        LiveTvCategoryDisplay.both,
      );
      when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
        (_) async => const ChannelGroupLineup(
          {
            'ch1': {'CA| SPORTS', 'US| SPORTS'},
          },
          programmeCategories: {'sports'},
        ),
      );
      await pumpGuide(tester);
      final picker = find.byType(GuideFilterPicker);
      Finder rows(String name) => find.descendant(
        of: picker,
        matching: find.widgetWithText(ListTile, name),
      );
      FocusNode node(String name, {bool last = false}) => tester
          .widget<ListTile>(last ? rows(name).last : rows(name).first)
          .focusNode!;
      Future<void> hold(LogicalKeyboardKey key, {FocusNode? firstStep}) async {
        await tester.sendKeyDownEvent(key);
        await tester.pump();
        if (firstStep != null) expect(firstStep.hasFocus, isTrue);
        await tester.pump(const Duration(milliseconds: 550));
        await _pumpFrames(tester);
        await tester.sendKeyRepeatEvent(key);
        await tester.sendKeyUpEvent(key);
        await _pumpFrames(tester);
      }

      Future<void> open() async {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
        await _pumpFrames(tester);
      }

      _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
      await _pumpFrames(tester);
      await open();
      for (final label in ['CA| SPORTS', 'US| SPORTS', 'Sports']) {
        node(label).requestFocus();
        await _pumpFrames(tester);
        await hold(LogicalKeyboardKey.select);
        expect(rows(label), findsNWidgets(2));
        expect(node(label, last: true).hasFocus, isTrue);
      }
      node('US| SPORTS').requestFocus();
      await _pumpFrames(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await _pumpFrames(tester);
      await open();
      expect(node('US| SPORTS').hasFocus, isTrue);
      await hold(LogicalKeyboardKey.select);
      expect(node('Sports').hasFocus, isTrue);
      await hold(LogicalKeyboardKey.select);
      expect(node('CA| SPORTS').hasFocus, isTrue);
      await hold(LogicalKeyboardKey.select);
      expect(find.text('Favorite groups and categories'), findsNothing);
      expect(node('CA| SPORTS').hasFocus, isTrue);
      expect(tester.widget<ListTile>(rows('US| SPORTS')).selected, isTrue);
      prefs.save = Completer<void>();
      await hold(LogicalKeyboardKey.select);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await _pumpFrames(tester);
      expect(node('US| SPORTS').hasFocus, isTrue);
      prefs.save!.complete();
      await _pumpFrames(tester);
      expect(rows('CA| SPORTS'), findsNWidgets(2));
      expect(node('US| SPORTS').hasFocus, isTrue);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      expect(node('CA| SPORTS', last: true).hasFocus, isTrue);
      await tester.pump(const Duration(milliseconds: 550));
      await _pumpFrames(tester);
      expect(node('CA| SPORTS', last: true).hasFocus, isTrue);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowUp);
      await _pumpFrames(tester);
    },
  );

  testWidgets('TV shortcuts preserve search width and arrow navigation', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
    final prefs = GetIt.instance<UserPreferences>();
    await prefs.set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.both,
    );
    final groups = [for (var i = 0; i < 10; i++) 'Group $i', 'Sports'];
    when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
      (_) async => ChannelGroupLineup(
        {'ch0': groups.toSet()},
        programmeCategories: {'sports'},
      ),
    );
    await pumpGuide(tester);
    final search = find.byType(LocalSearchField);
    final width = tester.getSize(search).width;
    final keys = [
      for (final group in groups) 'group:$group',
      'category:sports',
    ];
    await prefs.set(UserPreferences.liveTvSavedFilters, keys);
    // Reopen the guide to read the persisted list.
    await tester.pumpWidget(const SizedBox());
    await pumpGuide(tester);
    expect(tester.getSize(search).width, width);
    expect(find.text('Sports (group)'), findsOneWidget);
    expect(find.text('Sports (category)'), findsOneWidget);
    _nodeLabelled(tester, 'GuideBrowse').requestFocus();
    await _pumpFrames(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await _pumpFrames(tester);
    expect(_focusedLabel(), 'GuideShortcut:category:favorites');
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(_focusedLabel(), 'GuideShortcut:group:Group 0');
    await tester.pump(const Duration(milliseconds: 550));
    await _pumpFrames(tester);
    expect(_focusedLabel(), 'GuideShortcut:group:Group 0');
    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await _pumpFrames(tester);
    for (var i = 0; i < keys.length; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await _pumpFrames(tester);
    }
    expect(_focusedLabel(), 'GuideSearch');
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await _pumpFrames(tester);
    expect(find.text('Sports (category)').hitTestable(), findsOneWidget);
    expect(_focusedLabel(), 'GuideShortcut:category:sports');
  });

  test(
    'saved filter order and exact group names survive reopening within an account',
    () async {
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.set(UserPreferences.lastServerId, 'one');
      await prefs.set(UserPreferences.lastUserId, 'viewer');
      final vm = LiveTvGuideViewModel(client);
      addTearDown(vm.dispose);
      const group = (GuideFilter.all, 'CA| SPORTS');
      const category = (GuideFilter.sports, null);
      await vm.toggleSavedFilter(group);
      await vm.toggleSavedFilter(category);
      await vm.toggleSavedFilter(group);
      await vm.toggleSavedFilter(group);
      final reopened = UserPreferences(GetIt.instance<PreferenceStore>());
      addTearDown(reopened.dispose);
      List<String> saved() => reopened.get(UserPreferences.liveTvSavedFilters);
      expect(saved(), ['category:sports', 'group:CA| SPORTS']);
      await prefs.set(UserPreferences.lastUserId, 'other');
      expect(saved(), isEmpty);
      await prefs.set(UserPreferences.lastUserId, 'viewer');
      await prefs.set(UserPreferences.lastServerId, 'two');
      expect(saved(), isEmpty);
      await prefs.set(UserPreferences.lastServerId, 'one');
      expect(saved(), ['category:sports', 'group:CA| SPORTS']);
    },
  );

  testWidgets(
    'channel holds update the heart once, restore failures and leave empty Favorites',
    (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      addTearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );
      userDataSync.reset();
      addTearDown(userDataSync.reset);
      final api = _MockUserLibrary();
      when(() => client.userLibraryApi).thenReturn(api);
      when(() => api.markFavorite('ch0')).thenAnswer((_) async {});
      when(() => api.unmarkFavorite('ch0')).thenThrow(Exception('offline'));
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.set(
        UserPreferences.liveTvCategoryDisplay,
        LiveTvCategoryDisplay.groups,
      );
      when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
        (_) async => const ChannelGroupLineup({
          'ch1': {'Local'},
        }),
      );
      await pumpGuide(tester);
      _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
      await _pumpFrames(tester);
      Future<void> toggle() async {
        await tester.sendKeyDownEvent(LogicalKeyboardKey.select);
        await tester.pump(const Duration(milliseconds: 550));
        await _pumpFrames(tester);
        await tester.sendKeyRepeatEvent(LogicalKeyboardKey.select);
        await tester.sendKeyUpEvent(LogicalKeyboardKey.select);
        await _pumpFrames(tester);
      }

      await toggle();
      verify(() => api.markFavorite('ch0')).called(1);
      expect(
        tester
            .widget<EpgChannelCell>(find.byType(EpgChannelCell).first)
            .isFavorite,
        isTrue,
      );
      await toggle();
      expect(
        tester
            .widget<EpgChannelCell>(find.byType(EpgChannelCell).first)
            .isFavorite,
        isTrue,
      );
      when(() => api.unmarkFavorite('ch0')).thenAnswer((_) async {});
      await tester.tap(find.byTooltip('Filters'));
      await _pumpFrames(tester);
      await tester.tap(find.text('Local'));
      await _pumpFrames(tester);
      expect(
        tester.widget<EpgChannelCell>(find.byType(EpgChannelCell)).name,
        'Channel 1',
      );
      await tester.tap(find.text('Favorites'));
      await _pumpFrames(tester);
      expect(
        tester.widget<EpgChannelCell>(find.byType(EpgChannelCell)).name,
        'Channel 0',
      );
      await toggle();
      expect(find.byType(EpgChannelCell), findsNothing);
      expect(_focusedLabel(), 'GuideBrowse');
      expect(find.byType(GuideFilterPicker), findsNothing);
    },
  );

  testWidgets(
    'releasing Enter after removing the bottom mobile favorite stays in the guide',
    (tester) async {
      userDataSync.reset();
      addTearDown(userDataSync.reset);
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.set(
        UserPreferences.liveTvCategoryDisplay,
        LiveTvCategoryDisplay.groups,
      );
      await prefs.set(UserPreferences.epgMobileView, EpgMobileView.list);
      final api = _MockUserLibrary();
      when(() => client.userLibraryApi).thenReturn(api);
      when(() => api.unmarkFavorite('ch1')).thenAnswer((_) async {});
      when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
        (_) async => ChannelGroupLineup(
          {
            'ch0': {'Local'},
          },
          channels: [
            for (var i = 0; i < 2; i++)
              {
                ..._channelRaw(i),
                'UserData': {'IsFavorite': true},
              },
          ],
        ),
      );
      await pumpGuide(tester, surface: const Size(390, 844));
      await tester.tap(find.byTooltip('Filters'));
      await _pumpFrames(tester);
      await tester.tap(find.text('Favorites'));
      await _pumpFrames(tester);
      _nodeLabelled(tester, 'GuideChannel:1').requestFocus();
      await _pumpFrames(tester);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
      await tester.pump(const Duration(milliseconds: 550));
      await _pumpFrames(tester);
      expect(_focusedLabel(), 'GuideChannel:0');
      await tester.sendKeyUpEvent(LogicalKeyboardKey.enter);
      await _pumpFrames(tester);
      verify(() => api.unmarkFavorite('ch1')).called(1);
      expect(
        tester.widget<EpgNowNextCard>(find.byType(EpgNowNextCard)).channelName,
        'Channel 0',
      );
      expect(prefs.get(UserPreferences.liveTvLastChannelId), isEmpty);
    },
  );

  testWidgets('mobile Favorites first follows the channel in both directions', (
    tester,
  ) async {
    userDataSync.reset();
    addTearDown(userDataSync.reset);
    final prefs = GetIt.instance<UserPreferences>();
    await prefs.set(
      UserPreferences.liveTvChannelSortBy,
      ChannelSortBy.favoritesFirst,
    );
    await prefs.set(UserPreferences.epgMobileView, EpgMobileView.list);
    final api = _MockUserLibrary();
    when(() => client.userLibraryApi).thenReturn(api);
    when(() => api.markFavorite('ch44')).thenAnswer((_) async {});
    when(() => api.unmarkFavorite('ch44')).thenAnswer((_) async {});
    await pumpGuide(tester, surface: const Size(390, 844));
    final list = tester.widget<ListView>(find.byType(ListView).last).controller!;
    list.jumpTo(list.position.maxScrollExtent);
    await _pumpFrames(tester);
    final card = find.byWidgetPredicate(
      (w) => w is EpgNowNextCard && w.channelName == 'Channel 44',
    );
    tester.widget<EpgNowNextCard>(card).focusNode!.requestFocus();
    await _pumpFrames(tester);
    for (final favorite in [true, false]) {
      await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
      await tester.pump(const Duration(milliseconds: 550));
      await tester.sendKeyUpEvent(LogicalKeyboardKey.enter);
      await _pumpFrames(tester);
      final focused = tester.widget<EpgNowNextCard>(card.hitTestable());
      expect(focused.focusNode!.hasFocus, isTrue);
      expect(focused.isFavorite, favorite);
    }
    verify(() => api.markFavorite('ch44')).called(1);
    verify(() => api.unmarkFavorite('ch44')).called(1);
  });

  // Opening the picker clears the channel search. A program category then
  // refetches guide data, so cancellation must retain the channel ID until
  // those rows exist again instead of restoring whichever row appears first.
  for (final scenario in [
    (
      label: 'Right',
      closeKey: LogicalKeyboardKey.arrowRight,
      omitChannel: false,
      navigateAway: false,
    ),
    (
      label: 'Back',
      closeKey: LogicalKeyboardKey.escape,
      omitChannel: false,
      navigateAway: false,
    ),
    (
      label: 'missing channel',
      closeKey: LogicalKeyboardKey.arrowRight,
      omitChannel: true,
      navigateAway: false,
    ),
    (
      label: 'navigate away',
      closeKey: LogicalKeyboardKey.arrowRight,
      omitChannel: false,
      navigateAway: true,
    ),
  ]) {
    testWidgets('TV picker ${scenario.label} waits for Sports category rows', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      addTearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.liveTvCategoryDisplay,
        LiveTvCategoryDisplay.both,
      );
      channelCount = 5;
      when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
        (_) async => const ChannelGroupLineup(
          {
            'ch1': {'League'},
          },
          programmeCategories: {'sports'},
        ),
      );
      Completer<void>? sportsReload;
      when(
        () => liveTvApi.getGuide(
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          channelIds: any(named: 'channelIds'),
          isSports: any(named: 'isSports'),
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
        final sports = invocation.namedArguments[#isSports] == true;
        if (sports && sportsReload != null) await sportsReload.future;
        return <String, dynamic>{
          'Items': [
            for (final id in ids)
              if (!(sports &&
                  sportsReload != null &&
                  scenario.omitChannel &&
                  id == 'ch2'))
                for (final program in _programsFor(id))
                  <String, dynamic>{...program, if (sports) 'IsSports': true},
          ],
        };
      });

      await pumpGuide(tester);
      _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
      await _pumpFrames(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await _pumpFrames(tester);
      final picker = find.byType(GuideFilterPicker);
      expect(picker, findsOneWidget);
      await tester.tap(
        find.descendant(of: picker, matching: find.text('Sports')),
      );
      await _pumpFrames(tester);

      final search = tester
          .widget<LocalSearchField>(find.byType(LocalSearchField))
          .controller;
      search.text = 'Channel 2';
      await tester.pump(const Duration(milliseconds: 220));
      await _pumpFrames(tester);
      expect(
        tester.widget<EpgChannelCell>(find.byType(EpgChannelCell).first).name,
        'Channel 2',
      );
      _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
      await _pumpFrames(tester);

      sportsReload = Completer<void>();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await _pumpFrames(tester);
      expect(search.text, isEmpty);
      expect(picker, findsOneWidget);
      await tester.sendKeyEvent(scenario.closeKey);
      await _pumpFrames(tester);
      expect(picker, findsNothing);
      expect(_focusedLabel(), 'GuideBrowse');

      if (scenario.navigateAway) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await _pumpFrames(tester);
        expect(_focusedLabel(), startsWith('GuideShortcut:'));
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await _pumpFrames(tester);
        expect(_focusedLabel(), 'GuideSearch');
      }
      sportsReload.complete();
      await _pumpFrames(tester);

      if (scenario.navigateAway) {
        expect(_focusedLabel(), 'GuideSearch');
      } else {
        final focused = _focusedLabel();
        expect(focused, startsWith('GuideChannel:'));
        final focusedRow = find.byWidgetPredicate(
          (widget) =>
              widget is Focus && widget.focusNode?.debugLabel == focused,
        );
        final focusedCell = find.descendant(
          of: focusedRow,
          matching: find.byType(EpgChannelCell),
        );
        expect(focusedCell, findsOneWidget);
        expect(
          tester.widget<EpgChannelCell>(focusedCell).name,
          scenario.omitChannel ? 'Channel 0' : 'Channel 2',
        );
      }
    });
  }

  /// Focuses a row-0 cell two hours into the window and then steps right once,
  /// which is the only move permitted to rewrite the anchor. Returns the
  /// anchor's offset in minutes from the window start.
  Future<int> establishAnchor(WidgetTester tester) async {
    final seedIndex = _cellIndexForRow(0, 120);
    _nodeLabelled(tester, 'GuideProgramRow0:$seedIndex').requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();

    final focused = _focusedCell();
    expect(focused, isNotNull);
    expect(focused!.row, 0);
    return _minutesIntoRowCell(0, focused.index);
  }

  Future<void> pressDown(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await _pumpFrames(tester);
    }
  }

  /// Asserts the measured on-device regression: after [presses] DOWN presses
  /// the horizontal viewport is byte-for-byte where it started and the
  /// selection is still on the cell holding the anchor. Six presses drifted by
  /// about an hour. Forty-five collapsed onto the row's first cell.
  Future<void> expectNoDrift(WidgetTester tester, int presses) async {
    await pumpGuide(tester);
    final anchorMinutes = await establishAnchor(tester);
    final before = _horizontalOffsets(tester);
    expect(before, isNotEmpty);

    await pressDown(tester, presses);

    expect(_horizontalOffsets(tester), before);

    // Without this the offset check alone would pass on a guide that never
    // moved at all, which isn't what the regression was about.
    final focused = _focusedCell();
    expect(focused, isNotNull, reason: 'focus left the grid');
    expect(focused!.row, presses);
    expect(
      focused.index,
      _cellIndexForRow(presses, anchorMinutes),
      reason: 'the selection drifted away from the anchor in time',
    );
  }

  testWidgets('six DOWN presses leave the horizontal offset untouched', (
    tester,
  ) async {
    await expectNoDrift(tester, 6);
  });

  testWidgets('forty-five DOWN presses leave the horizontal offset untouched', (
    tester,
  ) async {
    await expectNoDrift(tester, 45);
  });

  testWidgets('every row visited selects the cell holding the anchor', (
    tester,
  ) async {
    await pumpGuide(tester);
    final anchorMinutes = await establishAnchor(tester);

    for (var step = 1; step <= 12; step++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();

      final focused = _focusedCell();
      expect(focused, isNotNull, reason: 'focus left the grid at step $step');
      expect(focused!.row, step);
      expect(
        focused.index,
        _cellIndexForRow(step, anchorMinutes),
        reason: 'row $step drifted away from the anchor',
      );
    }
  });

  testWidgets('focus is never null across a long vertical sequence', (
    tester,
  ) async {
    await pumpGuide(tester);
    await establishAnchor(tester);

    for (var i = 0; i < 20; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(_focusedCell(), isNotNull);
    }
    for (var i = 0; i < 20; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pumpAndSettle();
      expect(FocusManager.instance.primaryFocus, isNotNull);
    }
  });

  testWidgets('landing on a clipped cell and on an oversized cell does not '
      'scroll', (tester) async {
    await pumpGuide(tester);
    final anchorMinutes = await establishAnchor(tester);
    final before = _horizontalOffsets(tester);

    // Row 3's hour-long cell around the anchor extends past the viewport's
    // right edge. Row 4 is a single cell wider than the viewport.
    for (var step = 1; step <= 4; step++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(_horizontalOffsets(tester), before, reason: 'row $step scrolled');
    }

    final focused = _focusedCell();
    expect(focused, isNotNull);
    expect(focused!.row, 4);
    expect(focused.index, _cellIndexForRow(4, anchorMinutes));
  });

  /// Pumps a lineup one batch longer than the loader fetches, walks focus to
  /// the last loaded row (49), and leaves row 50's request outstanding.
  /// Returns the anchor's offset in minutes from the window start.
  Future<int> reachLoadedEdge(WidgetTester tester) async {
    channelCount = _deferredChannelCount;
    deferredChannelId = _firstDeferredChannelId;

    await pumpGuide(tester);
    final anchorMinutes = await establishAnchor(tester);
    await pressDown(tester, 49);

    final focused = _focusedCell();
    expect(focused, isNotNull);
    expect(focused!.row, 49, reason: 'did not reach the last loaded row');
    expect(
      releaseDeferredGuide,
      isNotEmpty,
      reason: 'the next batch was never requested, so no row is loading',
    );
    return anchorMinutes;
  }

  Future<void> releaseGuideData(WidgetTester tester) async {
    for (final release in releaseDeferredGuide) {
      release();
    }
    releaseDeferredGuide.clear();
    await _pumpFrames(tester);
  }

  testWidgets('DOWN onto a loading row holds focus and consumes the key', (
    tester,
  ) async {
    final anchorMinutes = await reachLoadedEdge(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await _pumpFrames(tester);

    final focused = _focusedCell();
    expect(focused, isNotNull, reason: 'focus left the grid');
    expect(focused!.row, 49);
    expect(focused.index, _cellIndexForRow(49, anchorMinutes));
  });

  testWidgets('a later UP supersedes the deferred DOWN', (tester) async {
    final anchorMinutes = await reachLoadedEdge(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await _pumpFrames(tester);
    expect(_focusedCell()!.row, 49);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await _pumpFrames(tester);
    expect(_focusedCell()!.row, 48);

    await releaseGuideData(tester);

    final focused = _focusedCell();
    expect(focused, isNotNull);
    expect(focused!.row, 48, reason: 'the deferred DOWN fired anyway');
    expect(focused.index, _cellIndexForRow(48, anchorMinutes));
  });

  testWidgets('opening a dialog cancels the deferred DOWN', (tester) async {
    final anchorMinutes = await reachLoadedEdge(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await _pumpFrames(tester);
    expect(_focusedCell()!.row, 49);

    // Select on the focused program opens the details dialog.
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await _pumpFrames(tester);
    expect(_alertDialog, findsOneWidget);

    await releaseGuideData(tester);
    expect(
      _focusedCell(),
      isNull,
      reason: 'the deferred DOWN pulled focus back into the grid',
    );

    Navigator.of(tester.element(_alertDialog)).pop();
    await _pumpFrames(tester);

    final focused = _focusedCell();
    expect(focused, isNotNull);
    expect(
      focused!.row,
      49,
      reason: 'the deferred DOWN fired after the dialog',
    );
    expect(focused.index, _cellIndexForRow(49, anchorMinutes));
  });

  testWidgets('the deferred DOWN applies when the row data arrives', (
    tester,
  ) async {
    final anchorMinutes = await reachLoadedEdge(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await _pumpFrames(tester);
    expect(_focusedCell()!.row, 49);

    await releaseGuideData(tester);

    final focused = _focusedCell();
    expect(focused, isNotNull, reason: 'the deferred DOWN never fired');
    expect(focused!.row, 50);
    expect(focused.index, _cellIndexForRow(50, anchorMinutes));
  });

  testWidgets('UP from row zero climbs the controls row then the genre rail', (
    tester,
  ) async {
    await pumpGuide(tester);

    _nodeLabelled(tester, 'GuideProgramRow0:0').requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideWindowBar:0');

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideFilter:0');
  });

  testWidgets('LEFT from the channel column jumps to the genre rail', (
    tester,
  ) async {
    await pumpGuide(tester);

    _nodeLabelled(tester, 'GuideChannel:5').requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideFilter:0');
  });

  testWidgets('the controls row is one horizontal run and descends to the '
      'channel column', (tester) async {
    await pumpGuide(tester);

    _nodeLabelled(tester, 'GuideWindowBar:0').requestFocus();
    await tester.pumpAndSettle();

    // Every button from the window chevrons through to Recordings.
    for (var index = 1; index <= 5; index++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'GuideWindowBar:$index');
    }
    // The right-hand end refuses rather than escaping the row.
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideWindowBar:5');

    for (var index = 4; index >= 0; index--) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'GuideWindowBar:$index');
    }

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideChannel:0');

    await tester.sendKeyEvent(LogicalKeyboardKey.mediaFastForward);
    await _pumpFrames(tester);
    expect(_focusedLabel(), startsWith('GuideChannel:'));
    final pagedRow = int.parse(_focusedLabel()!.split(':').last);
    expect(pagedRow, greaterThan(0));

    await tester.sendKeyEvent(LogicalKeyboardKey.mediaRewind);
    await _pumpFrames(tester);
    expect(_focusedLabel(), 'GuideChannel:0');

    final anchorMinutes = await establishAnchor(tester);
    final offsets = _horizontalOffsets(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.mediaFastForward);
    await _pumpFrames(tester);
    expect(_focusedCell()!.row, pagedRow);
    expect(_focusedCell()!.index, _cellIndexForRow(pagedRow, anchorMinutes));
    expect(_horizontalOffsets(tester), offsets);

    await tester.sendKeyEvent(LogicalKeyboardKey.mediaRewind);
    await _pumpFrames(tester);
    expect(_focusedCell()!.row, 0);
    expect(_focusedCell()!.index, _cellIndexForRow(0, anchorMinutes));
    expect(_horizontalOffsets(tester), offsets);
  });

  testWidgets(
    'a paged-ahead guide does not re-anchor at a half-hour boundary',
    (tester) async {
      await pumpGuide(tester);

      final next = _nodeLabelled(tester, 'GuideWindowBar:2');
      next.requestFocus();
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      final futureRange = _windowRangeText(tester);
      expect(_focusedLabel(), 'GuideWindowBar:2');

      // The fake timer advances far enough for the scheduled half-hour callback
      // to run. DateTime.now remains fixed in Flutter's test clock, so the
      // assertion exercises the non-live guard rather than simulating a wall
      // clock change.
      await tester.pump(const Duration(minutes: 31));

      expect(_windowRangeText(tester), futureRange);
      expect(_focusedLabel(), 'GuideWindowBar:2');
    },
  );

  for (final first in [0, 2]) {
    testWidgets('opposite chevrons cancel the pending move from button $first', (
      tester,
    ) async {
      channelCount = 2;
      await pumpGuide(tester);
      final start = _windowRangeText(tester);
      deferredChannelId = 'ch0';
      await _activateGuideControl(tester, 'GuideWindowBar:$first');
      await _activateGuideControl(tester, 'GuideWindowBar:${2 - first}');
      expect(releaseDeferredGuide, hasLength(1));
      releaseDeferredGuide.single();
      await _pumpFrames(tester);
      expect(_windowRangeText(tester), start);
    });
  }

  testWidgets('Next pages Sports while its initial listings are pending', (
    tester,
  ) async {
    channelCount = 2;
    await pumpGuide(tester);
    final start = _windowRangeText(tester);
    deferredChannelId = 'ch0';
    await _activateGuideControl(
      tester,
      'GuideFilter:${GuideFilter.sports.index}',
    );
    await _activateGuideControl(tester, 'GuideWindowBar:2');
    expect(releaseDeferredGuide, hasLength(2));
    expect(_windowRangeText(tester), start);
    releaseDeferredGuide.last();
    await _pumpFrames(tester);
    final next = _windowRangeText(tester);
    expect(next, isNot(start));
    releaseDeferredGuide.first();
    await _pumpFrames(tester);
    expect(_windowRangeText(tester), next);
    expect(tester.widget<EpgChannelCell>(find.byType(EpgChannelCell)).name, 'Channel 1');
  });

  testWidgets('Next can page Favorites while the All request is pending', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
    when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
      (_) async => ChannelGroupLineup({}, channels: [
        _channelRaw(0),
        {..._channelRaw(1), 'UserData': {'IsFavorite': true}},
      ]),
    );
    await pumpGuide(tester);
    final start = _windowRangeText(tester);
    deferredChannelId = 'ch1';
    const next = 'GuideWindowBar:2';
    await _activateGuideControl(tester, next);
    await _activateGuideControl(tester, next);
    expect(releaseDeferredGuide, hasLength(1));
    await _activateGuideControl(tester, 'GuideFilter:${GuideFilter.favorites.index}');
    final channel = find.byType(EpgChannelCell);
    expect(tester.widget<EpgChannelCell>(channel).name, 'Channel 1');
    await _activateGuideControl(tester, next);
    expect(releaseDeferredGuide, hasLength(2));
    expect(_windowRangeText(tester), start);

    releaseDeferredGuide.last();
    await _pumpFrames(tester);
    final favoritesRange = _windowRangeText(tester);
    expect(favoritesRange, isNot(start));
    releaseDeferredGuide.first();
    await _pumpFrames(tester);
    expect(_windowRangeText(tester), favoritesRange);
    expect(tester.widget<EpgChannelCell>(channel).name, 'Channel 1');
  });

  for (final action in ['opening listings', 'Now', 'channel search']) {
    testWidgets('Next works with an older request pending after $action', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      addTearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );
      when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer(
        (_) async => ChannelGroupLineup(
          {
            'ch1': {'News'},
          },
          channels: [_channelRaw(0), _channelRaw(1)],
        ),
      );
      if (action == 'opening listings') deferredChannelId = 'ch1';
      await pumpGuide(tester);
      final initial = _windowRangeText(tester);
      const next = 'GuideWindowBar:2';
      if (action != 'opening listings') {
        deferredChannelId = 'ch1';
        await _activateGuideControl(tester, next);
      }
      expect(releaseDeferredGuide, hasLength(1));
      deferredChannelId = null;
      if (action == 'Now') {
        await _activateGuideControl(tester, 'GuideWindowBar:1');
      } else if (action == 'channel search') {
        final search = tester.widget<LocalSearchField>(
          find.byType(LocalSearchField),
        );
        search.controller.text = 'Channel 1';
        await _pumpFrames(tester);
        final channel = tester.widget<EpgChannelCell>(
          find.byType(EpgChannelCell),
        );
        expect(channel.name, 'Channel 1');
      }
      await _activateGuideControl(tester, next);
      final nextRange = _windowRangeText(tester);
      expect(nextRange, isNot(initial));
      releaseDeferredGuide.single();
      await _pumpFrames(tester);
      expect(_windowRangeText(tester), nextRange);
    });
  }

  Future<void> checkPendingRightCancellation(
    WidgetTester tester, {
    required Future<void> Function() navigate,
    required String expectedFocus,
  }) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvLastChannelId,
      'ch4',
    );
    await pumpGuide(tester);
    _nodeLabelled(tester, 'GuideProgramRow4:0').requestFocus();
    await _pumpFrames(tester);
    final live = _windowRangeText(tester);
    deferredChannelId = 'ch4';
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await _pumpFrames(tester);
    expect(releaseDeferredGuide, isNotEmpty);
    await navigate();
    await _pumpFrames(tester);
    expect(_focusedLabel(), expectedFocus);
    deferredChannelId = null;
    for (final release in releaseDeferredGuide) {
      release();
    }
    await _pumpFrames(tester);
    expect(_windowRangeText(tester), live);
    expect(_focusedLabel(), expectedFocus);
  }

  testWidgets(
    'Back keeps the live time and header focus after a pending Right',
    (tester) => checkPendingRightCancellation(
      tester,
      navigate: tester.binding.handlePopRoute,
      expectedFocus: 'GuideFilter:0',
    ),
  );

  testWidgets(
    'Left keeps the live time and channel focus after a pending Right',
    (tester) => checkPendingRightCancellation(
      tester,
      navigate: () => tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft),
      expectedFocus: 'GuideChannel:4',
    ),
  );

  testWidgets('Right retries a failed page without moving remote focus', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic));
    await pumpGuide(tester);
    // Row 4 has one long program spanning the fixture's current window.
    final cell = _nodeLabelled(tester, 'GuideProgramRow4:0');
    cell.requestFocus();
    await _pumpFrames(tester);
    final range = _windowRangeText(tester);
    final notice = find.textContaining('Couldn’t load');

    guideFailure = Exception('offline');
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await _pumpFrames(tester);
    expect(_windowRangeText(tester), range);
    expect(FocusManager.instance.primaryFocus, same(cell));
    expect(notice, findsOneWidget);

    guideFailure = null;
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await _pumpFrames(tester);
    expect(_windowRangeText(tester), isNot(range));
    expect(notice, findsNothing);
  });

  for (final startAtLive in [true, false]) {
    testWidgets(
      'Back returns to the tuned channel after denied paging from '
      '${startAtLive ? 'live' : 'a future window'}',
      (tester) async {
        PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
        addTearDown(
          () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
        );
        await GetIt.instance<UserPreferences>().set(
          UserPreferences.liveTvLastChannelId,
          'ch3',
        );
        await pumpGuide(tester);
        final liveRange = _windowRangeText(tester);
        _nodeLabelled(tester, 'GuideProgramRow4:0').requestFocus();
        await _pumpFrames(tester);
        if (!startAtLive) {
          await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
          await _pumpFrames(tester);
          expect(_windowRangeText(tester), isNot(liveRange));
        }

        final beforeFailure = _windowRangeText(tester);
        final request = RequestOptions(path: '/LiveTv/Programs');
        guideFailure = DioException.badResponse(
          statusCode: 403,
          requestOptions: request,
          response: Response(requestOptions: request, statusCode: 403),
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await _pumpFrames(tester);
        expect(_windowRangeText(tester), beforeFailure);
        expect(find.byType(EpgChannelCell), findsWidgets);
        expect(find.byType(Chip), findsNothing);

        clearInteractions(liveTvApi);
        await tester.binding.handlePopRoute();
        await _pumpFrames(tester);
        expect(_windowRangeText(tester), liveRange);
        expect(_focusedLabel(), 'GuideChannel:3');
        if (startAtLive) {
          verifyNever(() => liveTvApi.getChannelGroups(userId: 'user'));
        } else {
          verify(() => liveTvApi.getChannelGroups(userId: 'user')).called(1);
        }
        await tester.binding.handlePopRoute();
        await _pumpFrames(tester);
        expect(_focusedLabel(), 'GuideFilter:0');
      },
    );
  }

  testWidgets('the channel column handles ordinary vertical arrows', (
    tester,
  ) async {
    await pumpGuide(tester);

    final first = _nodeLabelled(tester, 'GuideChannel:0');
    first.requestFocus();
    await tester.pumpAndSettle();

    final downResult = first.onKeyEvent!(
      first,
      const KeyDownEvent(
        physicalKey: PhysicalKeyboardKey.arrowDown,
        logicalKey: LogicalKeyboardKey.arrowDown,
        timeStamp: Duration.zero,
      ),
    );
    await tester.pumpAndSettle();

    expect(downResult, KeyEventResult.handled);
    expect(_focusedLabel(), 'GuideChannel:1');

    final second = _nodeLabelled(tester, 'GuideChannel:1');
    final upResult = second.onKeyEvent!(
      second,
      const KeyDownEvent(
        physicalKey: PhysicalKeyboardKey.arrowUp,
        logicalKey: LogicalKeyboardKey.arrowUp,
        timeStamp: Duration.zero,
      ),
    );
    await tester.pumpAndSettle();

    expect(upResult, KeyEventResult.handled);
    expect(_focusedLabel(), 'GuideChannel:0');
  });

  testWidgets('RIGHT enters the program row and LEFT returns to its channel', (
    tester,
  ) async {
    await pumpGuide(tester);

    final channel = _nodeLabelled(tester, 'GuideChannel:1');
    channel.requestFocus();
    await tester.pumpAndSettle();

    final rightResult = channel.onKeyEvent!(
      channel,
      const KeyDownEvent(
        physicalKey: PhysicalKeyboardKey.arrowRight,
        logicalKey: LogicalKeyboardKey.arrowRight,
        timeStamp: Duration.zero,
      ),
    );
    await tester.pumpAndSettle();

    expect(rightResult, KeyEventResult.handled);
    expect(_focusedLabel(), startsWith('GuideProgramRow1:'));

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideChannel:1');
  });

  testWidgets(
    'the mini-player guide fetches no program artwork, having no hero band',
    (tester) async {
      when(() => liveTvApi.getProgram(any(), userId: any(named: 'userId')))
          .thenAnswer(
            (inv) async => <String, dynamic>{
              'Id': inv.positionalArguments[0],
              'ChannelId': 'ch0',
              'Name': 'anything',
              'StartDate': DateTime.now().toUtc().toIso8601String(),
              'EndDate': DateTime.now()
                  .toUtc()
                  .add(const Duration(minutes: 30))
                  .toIso8601String(),
              'ImageTags': <String, dynamic>{'Primary': 'tag'},
            },
          );

      await pumpGuide(tester, miniPlayerMode: true);
      // Past both the scroll debounce and the on-focus artwork debounce.
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      verifyNever(
        () => liveTvApi.getProgram(any(), userId: any(named: 'userId')),
      );
    },
  );

  testWidgets('UP from row zero reaches the mini player in miniPlayerMode', (
    tester,
  ) async {
    await pumpGuide(tester, miniPlayerMode: true);

    _nodeLabelled(tester, 'GuideProgramRow0:0').requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pumpAndSettle();

    expect(_focusedLabel(), 'GuideMiniPlayer');
  });

  testWidgets('TV back returns to the tuned channel, then header, then exits', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
    tester.view.physicalSize = const Size(900, 700);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvLastChannelId,
      'ch3',
    );
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const LiveTvGuideScreen(),
              ),
            ),
            child: const Text('open guide'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open guide'));
    await tester.pumpAndSettle();
    _nodeLabelled(tester, 'GuideChannel:4').requestFocus();
    await tester.pumpAndSettle();
    clearInteractions(liveTvApi);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideChannel:3');
    // Already live, so returning to the channel reloads nothing.
    verifyNever(
      () => liveTvApi.getChannels(
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        userId: any(named: 'userId'),
      ),
    );
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideFilter:0');

    // Down from the filters goes through the header, then returns to the
    // channel row where Back left the grid, not the first channel.
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideWindowBar:0');
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideChannel:3');

    // Re-entering the rows starts the same sequence again.
    _nodeLabelled(tester, 'GuideChannel:4').requestFocus();
    await tester.pumpAndSettle();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideChannel:3');
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideFilter:0');
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(LiveTvGuideScreen), findsNothing);
  });

  testWidgets(
    'a back press is not consumed when the entry channel is filtered out',
    (tester) async {
      // ch5 is the only favorite; the entry channel (ch0, the default when no
      // last-channel preference is set) is not, so switching to the
      // favorites filter drops the entry channel from filteredChannels.
      final favoriteChannel = _channelRaw(5)
        ..['UserData'] = <String, dynamic>{'IsFavorite': true};
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
      ).thenAnswer(
        (_) async => <String, dynamic>{
          'Items': [
            for (var i = 0; i < channelCount; i++)
              if (i == 5) favoriteChannel else _channelRaw(i),
          ],
        },
      );

      tester.view.physicalSize = const Size(900, 700);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LiveTvGuideScreen(),
                ),
              ),
              child: const Text('open guide'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open guide'));
      await tester.pumpAndSettle();
      expect(find.byType(LiveTvGuideScreen), findsOneWidget);

      // Switch to the favorites filter, which excludes the entry channel.
      final filterRail = tester.widget<EpgFilterRail>(
        find.byType(EpgFilterRail),
      );
      filterRail.onSelect(GuideFilter.values.indexOf(GuideFilter.favorites));
      await tester.pumpAndSettle();

      // Move real focus onto the one remaining (favorited) channel row, so
      // the guide's tracked focused channel differs from the entry channel.
      _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
      await tester.pumpAndSettle();

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      // Back was NOT consumed by the guide's reset-to-entry handling, so the
      // route popped back to the host screen instead of getting stuck.
      expect(find.byType(LiveTvGuideScreen), findsNothing);
    },
  );

  testWidgets(
    'a lineup change while covered by another route does not steal focus',
    (tester) async {
      // ch5 is the only favorite, so switching to the favorites filter later
      // drops every other channel (including the one holding the current
      // selection) from filteredChannels.
      final favoriteChannel = _channelRaw(5)
        ..['UserData'] = <String, dynamic>{'IsFavorite': true};
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
      ).thenAnswer(
        (_) async => <String, dynamic>{
          'Items': [
            for (var i = 0; i < channelCount; i++)
              if (i == 5) favoriteChannel else _channelRaw(i),
          ],
        },
      );

      tester.view.physicalSize = const Size(900, 700);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LiveTvGuideScreen(),
                ),
              ),
              child: const Text('open guide'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open guide'));
      await tester.pumpAndSettle();
      expect(find.byType(LiveTvGuideScreen), findsOneWidget);

      // Establish a selection in the grid before the guide is covered.
      await establishAnchor(tester);

      // A fully opaque covering route wraps the guide in an Offstage, which
      // finders skip by default, so grab the filter callback while the guide
      // is still on top.
      final onSelectFavorites = tester
          .widget<EpgFilterRail>(find.byType(EpgFilterRail))
          .onSelect;

      // Simulate tuning a channel: push a route on top of the guide (the
      // guide stays mounted underneath, exactly like the player) and move
      // focus into it, as the real player does on entry.
      final playerFocusNode = FocusNode(debugLabel: 'FakePlayer');
      addTearDown(playerFocusNode.dispose);
      final guideContext = tester.element(find.byType(LiveTvGuideScreen));
      Navigator.of(guideContext).push(
        MaterialPageRoute<void>(
          builder: (_) => Focus(
            focusNode: playerFocusNode,
            autofocus: true,
            child: const SizedBox(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(_focusedLabel(), 'FakePlayer');

      // Switch to the favorites filter, which changes filteredChannels while
      // the guide is covered by the pushed route.
      onSelectFavorites(GuideFilter.values.indexOf(GuideFilter.favorites));
      await tester.pumpAndSettle();

      // Focus must still belong to the pushed route, not to a guide cell it
      // cannot see.
      expect(
        _focusedLabel(),
        'FakePlayer',
        reason:
            'the covered guide stole focus after a lineup change instead '
            'of leaving it with the route on top',
      );
    },
  );

  testWidgets(
    'returning from the player focuses the preference channel, not the '
    'one launched',
    (tester) async {
      tester.view.physicalSize = const Size(900, 700);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final router = GoRouter(
        routes: [
          GoRoute(path: '/', builder: (_, _) => const LiveTvGuideScreen()),
          GoRoute(
            path: Destinations.liveTvPlayer,
            builder: (_, _) => const Scaffold(body: SizedBox.shrink()),
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

      // Launch ch0 from the guide.
      _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      // The player route is up. Simulate it having switched to ch3 while the
      // guide waited underneath, exactly as the carousel does.
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.liveTvLastChannelId,
        'ch3',
      );

      router.pop();
      await tester.pumpAndSettle();

      expect(_focusedLabel(), 'GuideChannel:3');
    },
  );

  testWidgets(
    'a back press re-homes to the channel the user has since tuned, not '
    'the one playing when the guide opened',
    (tester) async {
      tester.view.physicalSize = const Size(900, 700);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LiveTvGuideScreen(),
                ),
              ),
              child: const Text('open guide'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open guide'));
      await tester.pumpAndSettle();
      expect(find.byType(LiveTvGuideScreen), findsOneWidget);

      // Simulate the player having tuned ch2 while the guide sat underneath;
      // the guide itself never touches the preference here.
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.liveTvLastChannelId,
        'ch2',
      );

      // Page the window off live so back has somewhere to reset from.
      final before = _windowRangeText(tester);
      _nodeLabelled(tester, 'GuideWindowBar:0').requestFocus();
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      final after = _windowRangeText(tester);
      expect(after, isNot(before), reason: 'window did not page');

      await tester.binding.handlePopRoute();
      // The reset now schedules its own frames for both deferred
      // postFrameCallbacks, so ordinary pumping settles it without waiting
      // on the guide's periodic display-clock timer.
      await tester.pumpAndSettle();

      // Back re-homed to the last-tuned channel (ch2), not the channel
      // playing when the guide opened (ch0) -- and did not exit the guide.
      expect(find.byType(LiveTvGuideScreen), findsOneWidget);
      expect(_focusedLabel(), 'GuideChannel:2');
    },
  );

  testWidgets(
    'a back press re-homes to row 0 when no channel has ever been tuned',
    (tester) async {
      tester.view.physicalSize = const Size(900, 700);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LiveTvGuideScreen(),
                ),
              ),
              child: const Text('open guide'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open guide'));
      await tester.pumpAndSettle();
      expect(find.byType(LiveTvGuideScreen), findsOneWidget);

      // liveTvLastChannelId is empty (never tuned), so the guide entered on
      // row 0 by falling back to it in _scheduleInitialChannelFocus. Move
      // focus onto another channel and page the window off live.
      _nodeLabelled(tester, 'GuideChannel:3').requestFocus();
      await tester.pumpAndSettle();

      final before = _windowRangeText(tester);
      _nodeLabelled(tester, 'GuideWindowBar:0').requestFocus();
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      final after = _windowRangeText(tester);
      expect(after, isNot(before), reason: 'window did not page');

      await tester.binding.handlePopRoute();
      // The reset now schedules its own frames for both deferred
      // postFrameCallbacks, so ordinary pumping settles it without waiting
      // on the guide's periodic display-clock timer.
      await tester.pumpAndSettle();

      // Back re-homed to row 0, not exited the guide -- even though no
      // channel has ever actually been tuned.
      expect(find.byType(LiveTvGuideScreen), findsOneWidget);
      expect(_focusedLabel(), 'GuideChannel:0');
    },
  );

  testWidgets(
    'a genre filter that swaps a focused row\'s channel updates the hero '
    'band',
    (tester) async {
      // ch5 is the only favorite; switching to favorites collapses the
      // lineup to that one channel, so row 0 -- still focused from entry --
      // now holds ch5 instead of the entry channel ch0.
      final favoriteChannel = _channelRaw(5)
        ..['UserData'] = <String, dynamic>{'IsFavorite': true};
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
      ).thenAnswer(
        (_) async => <String, dynamic>{
          'Items': [
            for (var i = 0; i < channelCount; i++)
              if (i == 5) favoriteChannel else _channelRaw(i),
          ],
        },
      );

      await pumpGuide(tester);

      // Put real focus on row 0 (the entry channel, ch0) and confirm the
      // hero band describes it before the filter changes anything.
      _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
      await tester.pumpAndSettle();
      expect(
        tester.widget<EpgHeroPreview>(find.byType(EpgHeroPreview)).title,
        'Channel 0',
      );

      final filterRail = tester.widget<EpgFilterRail>(
        find.byType(EpgFilterRail),
      );
      filterRail.onSelect(GuideFilter.values.indexOf(GuideFilter.favorites));
      await tester.pumpAndSettle();

      // Row 0's FocusNode is still the one focused (true -> true fires no
      // onFocusChange), but it now holds ch5. The hero band must describe
      // the channel actually in that row, not the pre-filter one.
      expect(_focusedLabel(), 'GuideChannel:0');
      expect(
        tester.widget<EpgHeroPreview>(find.byType(EpgHeroPreview)).title,
        'Channel 5',
      );
    },
  );
}
