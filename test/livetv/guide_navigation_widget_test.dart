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
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_filter_picker.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_filter_rail.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_channel_cell.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_now_next_card.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_hero_preview.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_window.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_layout_profile.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_guide_screen.dart';
import 'package:moonfin/ui/widgets/local_search_field.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart' show DialogBackSuppressor;
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// MaterialApp hosts the guide in these tests. Forward Android's system Back
// through the same dismissal check that MoonfinApp uses before its navigator.
class _DialogBackObserver extends WidgetsBindingObserver {
  int suppressed = 0;

  @override
  Future<bool> didPopRoute() async {
    if (!DialogBackSuppressor.consume()) return false;
    suppressed++;
    return true;
  }
}

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

/// Send one remote key and let the guide settle its deferred focus frames.
Future<void> _sendKeyAndPump(WidgetTester tester, LogicalKeyboardKey key) async {
  await tester.sendKeyEvent(key);
  await _pumpFrames(tester);
}

/// Drive a real held Select (rather than a tap) through the TV focus path.
Future<void> _holdSelect(WidgetTester tester) async {
  await tester.sendKeyDownEvent(LogicalKeyboardKey.select);
  await tester.pump(const Duration(milliseconds: 550));
  await _pumpFrames(tester);
  await tester.sendKeyRepeatEvent(LogicalKeyboardKey.select);
  await tester.sendKeyUpEvent(LogicalKeyboardKey.select);
  await _pumpFrames(tester);
}

/// Every focus node in the guide carries a debug label, which is the only
/// handle a test has on the rows' private nodes.
FocusNode _nodeLabelled(WidgetTester tester, String label) => tester
    .widgetList<Focus>(find.byType(Focus))
    .map((focus) => focus.focusNode)
    .whereType<FocusNode>()
    .firstWhere((node) => node.debugLabel == label);

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

Future<Map<String, dynamic>> _channelsRequest(LiveTvApi api) => api.getChannels(
  startIndex: any(named: 'startIndex'),
  limit: any(named: 'limit'),
  sortBy: any(named: 'sortBy'),
  sortOrder: any(named: 'sortOrder'),
  fields: any(named: 'fields'),
  enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
  userId: any(named: 'userId'),
);

Future<Map<String, dynamic>> _guideRequest(LiveTvApi api) => api.getGuide(
  startDate: any(named: 'startDate'),
  endDate: any(named: 'endDate'),
  channelIds: any(named: 'channelIds'),
  isSports: any(named: 'isSports'),
  fields: any(named: 'fields'),
  enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
  enableImages: any(named: 'enableImages'),
  enableUserData: any(named: 'enableUserData'),
  userId: any(named: 'userId'),
);

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

    when(() => _channelsRequest(liveTvApi)).thenAnswer(
      (_) async => <String, dynamic>{
        'Items': [for (var i = 0; i < channelCount; i++) _channelRaw(i)],
      },
    );

    when(() => _guideRequest(liveTvApi)).thenAnswer((invocation) async {
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
    // Production always registers the sync service, even without Moonbase.
    GetIt.instance.registerLazySingleton<PluginSyncService>(
      () => PluginSyncService(
        GetIt.instance<UserPreferences>(),
        GetIt.instance<PreferenceStore>(),
      ),
      dispose: (service) => service.dispose(),
    );
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  Future<void> pumpGuide(
    WidgetTester tester, {
    bool miniPlayerMode = false,
    Size surface = const Size(900, 700),
    List<NavigatorObserver> observers = const [],
    LiveTvGuideBackController? backController,
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
            backController: backController,
          ),
          embedded: miniPlayerMode,
        ),
      ),
    );
    // TV labels may keep scrolling, so don't wait for every animation to stop.
    await _pumpFrames(tester);
  }

  void stubGroups(ChannelGroupLineup lineup) =>
      when(() => liveTvApi.getChannelGroups(userId: 'user')).thenAnswer((_) async => lineup);

  void stubFavoriteChannel(int index) {
    final favorite = _channelRaw(index)
      ..['UserData'] = <String, dynamic>{'IsFavorite': true};
    when(() => _channelsRequest(liveTvApi)).thenAnswer(
      (_) async => <String, dynamic>{
        'Items': [
          for (var i = 0; i < channelCount; i++)
            if (i == index) favorite else _channelRaw(i),
        ],
      },
    );
  }

  void useTvLayout() {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
  }

  /// Open the guide through a host route so Back and focus restoration are real.
  Future<void> openGuideRoute(WidgetTester tester) async {
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
  }

  final picker = find.byType(GuideFilterPicker);
  const phone = Size(390, 844);
  Future<void> tapAndPump(WidgetTester tester, Finder target) async {
    await tester.tap(target);
    await _pumpFrames(tester);
  }
  Finder pickerOption(String name) => find.descendant(of: picker, matching: find.text(name));

  LiveTvGuideViewModel guideModel(WidgetTester tester) =>
      (tester.state(find.byType(LiveTvGuideScreen)) as dynamic).debugGuideViewModel as LiveTvGuideViewModel;

  Future<void> focusGuideNode(WidgetTester tester, String label) async {
    _nodeLabelled(tester, label).requestFocus();
    await _pumpFrames(tester);
  }

  Future<void> expectFocusAfter(WidgetTester tester, LogicalKeyboardKey key, String label) async {
    await _sendKeyAndPump(tester, key);
    expect(_focusedLabel(), label);
  }

  testWidgets('TV guide error Retry is reachable from the window bar', (
    tester,
  ) async {
    useTvLayout();
    guideFailure = Exception('Guide unavailable');
    await pumpGuide(tester);
    expect(find.text('Retry'), findsOneWidget);
    await focusGuideNode(tester, 'GuideWindowBar:0');
    await expectFocusAfter(tester, LogicalKeyboardKey.arrowDown, 'GuideErrorRetry');
    await expectFocusAfter(tester, LogicalKeyboardKey.arrowUp, 'GuideWindowBar:0');
  });

  // A wider guide needs more time slots than the 900-point fixture.
  Duration resizedGuideWindow(Size size) {
    final area = guideAvailableArea(
      maxWidth: size.width,
      maxHeight: size.height,
      landscape: true,
      miniPlayerMode: false,
    );
    return GuideLayoutProfile.fromAvailableArea(
      availableWidth: area.width,
      availableHeight: area.height,
    ).guideWindow;
  }

  for (final hour in [12, 23]) {
    testWidgets('Right retries a failed page from $hour:45 without moving remote focus', (tester) async {
      useTvLayout();
      await pumpGuide(tester);
      final today = DateTime.now();
      _fixtureWindowStart = DateTime(today.year, today.month, today.day + 1, hour, 45);
      await guideModel(tester).setWindowStart(_fixtureWindowStart);
      await _pumpFrames(tester);

      // Row 4 has one program spanning the visible window.
      final cell = _nodeLabelled(tester, 'GuideProgramRow4:0');
      cell.requestFocus();
      await _pumpFrames(tester);
      final range = _windowRangeText(tester);
      final notice = find.textContaining('Couldn’t load');

      guideFailure = Exception('offline');
      await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowRight);
      expect(_windowRangeText(tester), range);
      expect(FocusManager.instance.primaryFocus, same(cell));
      final message = tester.widget<Text>(notice).data!;
      expect(message, matches(hour == 12 ? r'Couldn’t load \d{1,2}:\d{2}' : r'Couldn’t load [A-Z][a-z]{2},'));

      guideFailure = null;
      await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowRight);
      expect(_windowRangeText(tester), isNot(range));
      expect(notice, findsNothing);
    });
  }

  for (final timing in ['before', 'after']) {
    testWidgets('paging uses the original width when restored $timing a resize failure', (tester) async {
      await pumpGuide(tester);
      final vm = guideModel(tester);
      final size = tester.view.physicalSize;
      final window = vm.guideWindow;
      final start = vm.windowStart;
      final resize = Completer<Map<String, dynamic>>();
      when(() => _guideRequest(liveTvApi)).thenAnswer((_) => resize.future);
      tester.view.physicalSize = const Size(1700, 700);
      await _pumpFrames(tester);
      if (timing == 'before') {
        tester.view.physicalSize = size;
        await _pumpFrames(tester);
      }
      resize.completeError(Exception('resize failed'));
      await _pumpFrames(tester);
      tester.view.physicalSize = size;
      await _pumpFrames(tester);
      expect(vm.guideWindow, window);

      when(() => _guideRequest(liveTvApi)).thenAnswer((_) async => {'Items': []});
      await tester.tap(find.byIcon(Icons.chevron_right).first);
      await _pumpFrames(tester);
      expect(vm.windowStart, isNot(start));
      expect(vm.guideWindow, window);
    });
  }

  for (final reloadDuringRequest in [false, true]) {
    testWidgets('a guide reload during resize finishes at the visible width (request pending=$reloadDuringRequest)', (tester) async {
      await pumpGuide(tester);
      final vm = guideModel(tester);
      final original = vm.guideWindow;
      const wider = Size(1700, 700);
      final expected = resizedGuideWindow(wider);
      expect(expected, isNot(original));
      if (reloadDuringRequest) {
        final held = Completer<Map<String, dynamic>>();
        var waiting = false;
        when(() => _guideRequest(liveTvApi)).thenAnswer((inv) async {
          final from = inv.namedArguments[#startDate] as DateTime;
          final to = inv.namedArguments[#endDate] as DateTime;
          if (!waiting && to.difference(from) == expected) {
            waiting = true;
            return held.future;
          }
          final ids = (inv.namedArguments[#channelIds] as List).cast<String>();
          return {'Items': [for (final id in ids) ..._programsFor(id)]};
        });
        tester.view.physicalSize = wider;
        await _pumpFrames(tester);
        expect(waiting, isTrue);
        await vm.load(window: original, windowStart: vm.windowStart);
        expect(vm.guideWindow, original);
        held.complete({'Items': []});
      } else {
        final channels = Completer<Map<String, dynamic>>();
        when(() => _channelsRequest(liveTvApi)).thenAnswer((_) => channels.future);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          unawaited(vm.load(window: original, windowStart: vm.windowStart));
        });
        tester.view.physicalSize = wider;
        await tester.pump();
        expect(vm.state, GuideState.loading);
        channels.complete({'Items': [for (var i = 0; i < channelCount; i++) _channelRaw(i)]});
      }
      await _pumpFrames(tester);
      expect(vm.state, GuideState.ready);
      expect(vm.guideWindow, expected);
    });
  }

  for (final layout in [InterfaceLayout.tv, InterfaceLayout.phone]) {
    testWidgets('empty and partly loaded categories can retry on ${layout.name}', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(layout);
      addTearDown(
        () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
      );
      channelCount = 2;
      final failed = {'ch0', 'ch1'};
      stubGroups(const ChannelGroupLineup(
          {},
          programmeCategories: {'sports'},
        ));
      when(() => _guideRequest(liveTvApi)).thenAnswer((inv) async {
        final ids =
            (inv.namedArguments[#channelIds] as List?)?.cast<String>() ??
            const <String>[];
        if (inv.namedArguments[#isSports] != true) {
          return {'Items': [for (final id in ids) ..._programsFor(id)]};
        }
        return {
          'Items': [for (final id in ids.where((id) => !failed.contains(id)))
            ..._programsFor(id, sports: true)],
          'FailedChannelIds': ids.where(failed.contains).toList(),
        };
      });

      await pumpGuide(
        tester,
        surface: layout == InterfaceLayout.phone
            ? const Size(390, 844)
            : const Size(900, 700),
      );
      final vm = guideModel(tester);
      vm.setFilter(GuideFilter.sports);
      await _pumpFrames(tester);
      expect(vm.hasFailedCategoryListings, isTrue);
      expect(find.text('Failed to load'), findsOneWidget);
      expect(find.text('No channels found'), findsNothing);
      if (layout == InterfaceLayout.tv) {
        await focusGuideNode(tester, 'GuideWindowBar:0');
        await expectFocusAfter(tester, LogicalKeyboardKey.arrowDown, 'GuideCategoryRetry');
        await expectFocusAfter(tester, LogicalKeyboardKey.arrowUp, 'GuideWindowBar:0');
      }

      failed.remove('ch1');
      await tester.tap(find.text('Retry'));
      await _pumpFrames(tester);
      expect(vm.filteredChannels.map((c) => c.id), ['ch1']);
      final partialRetry = find.text('Some listings failed to load. Retry');
      expect(partialRetry, findsOneWidget);
      if (layout == InterfaceLayout.tv) {
        _nodeLabelled(tester, 'GuideWindowBar:0').requestFocus();
        await expectFocusAfter(tester, LogicalKeyboardKey.arrowDown, 'GuideCategoryRetry');
        await expectFocusAfter(tester, LogicalKeyboardKey.arrowDown, 'GuideChannel:0');
        await expectFocusAfter(tester, LogicalKeyboardKey.arrowUp, 'GuideCategoryRetry');
      }
      failed.clear();
      await tester.tap(partialRetry);
      await _pumpFrames(tester);
      expect(vm.hasFailedCategoryListings, isFalse);
      expect(vm.filteredChannels.map((c) => c.id), ['ch0', 'ch1']);
      expect(partialRetry, findsNothing);
      expect(find.text('Failed to load'), findsNothing);
    });
  }

  testWidgets('playback uses the guide filter until a mini-guide selection', (
    tester,
  ) async {
    useTvLayout();
    tester.view.physicalSize = const Size(900, 700);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.both,
    );
    stubGroups(const ChannelGroupLineup({
        'ch1': {'Local'},
        'ch46': {'Local'},
        'ch47': {'Local'},
      }));
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
    await tapAndPump(tester, find.byTooltip('Filters'));
    await tapAndPump(tester, pickerOption('Local'));
    // The TV field's internal TextField is read-only outside its keyboard.
    // The TV keyboard commits text through the LocalSearchField controller.
    tester.widget<LocalSearchField>(
      find.byType(LocalSearchField),
    ).controller.text = 'Channel 4';
    await _pumpFrames(tester);
    expect(
      tester.widgetList<EpgChannelCell>(find.byType(EpgChannelCell))
          .map((channel) => channel.name),
      ['Channel 46', 'Channel 47'],
    );
    await focusGuideNode(tester, 'GuideChannel:0');
    await _sendKeyAndPump(tester, LogicalKeyboardKey.enter);
    expect(lineup.map((channel) => channel.id), ['ch46', 'ch47']);
    final outsideLineup = find.byWidgetPredicate((w) =>
        w is EpgChannelCell && w.name != 'Channel 46' && w.name != 'Channel 47');
    await tapAndPump(tester, outsideLineup.hitTestable().first);
    expect(picked, isNotNull);
    expect(lineup.map((channel) => channel.id), isNot(contains(picked)));
  });
  testWidgets('Select on a guide card Retry requests the failed listings', (tester) async {
    channelCount = 2;
    final prefs = GetIt.instance<UserPreferences>();
    await prefs.set(UserPreferences.epgMobileView, EpgMobileView.list);
    final requests = <List<String>>[];
    when(() => _guideRequest(liveTvApi)).thenAnswer((inv) async {
      final ids = (inv.namedArguments[#channelIds] as List).cast<String>();
      requests.add(ids);
      if (ids.length == 1) return {'Items': _programsFor(ids.single)};
      return {'Items': _programsFor('ch1'), 'FailedChannelIds': ['ch0']};
    });
    await pumpGuide(tester, surface: phone);
    final retry = find.descendant(of: find.byType(EpgNowNextCard), matching: find.text('Retry'));
    final node = Focus.of(tester.element(retry));
    node.requestFocus();
    await _pumpFrames(tester);
    expect(node.hasPrimaryFocus, isTrue);
    requests.clear();
    await _sendKeyAndPump(tester, LogicalKeyboardKey.select);
    expect(requests, [['ch0']]);
    expect(retry, findsNothing);
  });

  testWidgets('mobile filter picker changes the visible channel group', (
    tester,
  ) async {
    final prefs = GetIt.instance<UserPreferences>();
    await prefs.set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.both,
    );
    await prefs.set(UserPreferences.epgMobileView, EpgMobileView.list);
    stubGroups(const ChannelGroupLineup({
        'ch1': {'Sports'},
        'ch47': {'US | PRIME'},
      }));
    await pumpGuide(tester, surface: phone);
    await tester.enterText(find.byType(TextField), 'Channel 4');
    await tester.pump(const Duration(milliseconds: 220));
    await _pumpFrames(tester);
    expect(find.byType(EpgNowNextCard), findsWidgets);

    await tapAndPump(tester, find.byTooltip('Filters'));
    expect(picker, findsOneWidget);
    expect(tester.getSize(picker).width, 390);
    await tapAndPump(tester, pickerOption('US | PRIME'));
    expect(picker, findsNothing);
    expect(find.text('Channel 47'), findsOneWidget);
  });

  testWidgets('TV picker selects with OK and closes with Right or Android Back', (
    tester,
  ) async {
    useTvLayout();
    channelCount = 3;
    final observer = _DialogBackObserver();
    tester.binding.addObserver(observer);
    addTearDown(() => tester.binding.removeObserver(observer));
    addTearDown(DialogBackSuppressor.newBackPress);
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.groups,
    );
    stubGroups(const ChannelGroupLineup({'ch1': {'Sports'}, 'ch2': {'Sports'}}));
    await openGuideRoute(tester);
    await focusGuideNode(tester, 'GuideChannel:0');
    await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowLeft);
    expect(picker, findsOneWidget);
    tester.widget<ListTile>(
      find.widgetWithText(ListTile, 'Sports'),
    ).focusNode!.requestFocus();
    await _pumpFrames(tester);
    await _sendKeyAndPump(tester, LogicalKeyboardKey.select);
    expect(picker, findsNothing);
    expect(
      tester.widget<EpgChannelCell>(find.byType(EpgChannelCell).first).name,
      'Channel 1',
    );
    await focusGuideNode(tester, 'GuideChannel:0');
    await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowLeft);
    await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowRight);
    expect(picker, findsNothing);

    for (final sendsPopRoute in [false, true]) {
      await focusGuideNode(tester, 'GuideBrowse');
      await _sendKeyAndPump(tester, LogicalKeyboardKey.enter);
      expect(picker, findsOneWidget);

      DialogBackSuppressor.newBackPress();
      await tester.sendKeyEvent(
        LogicalKeyboardKey.goBack,
        physicalKey: PhysicalKeyboardKey.escape,
      );
      await _pumpFrames(tester);
      expect(picker, findsNothing);
      if (sendsPopRoute) {
        await tester.binding.handlePopRoute();
        await _pumpFrames(tester);
      }
      expect(observer.suppressed, sendsPopRoute ? 1 : 0);
      expect(find.byType(LiveTvGuideScreen), findsOneWidget);
    }
  });

  testWidgets('holding Select pins a group and reports storage errors', (tester) async {
    useTvLayout();
    final prefs = _PickerPreferences(GetIt.instance<PreferenceStore>());
    await GetIt.instance.unregister<UserPreferences>();
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    await prefs.set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.both,
    );
    stubGroups(const ChannelGroupLineup({
        'ch1': {'CA| SPORTS'},
      }, programmeCategories: {'sports'}));
    await pumpGuide(tester);
    await focusGuideNode(tester, 'GuideChannel:0');
    await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowLeft);
    Finder rows() => find.descendant(
      of: picker,
      matching: find.widgetWithText(ListTile, 'CA| SPORTS'),
    );
    tester.widget<ListTile>(rows().first).focusNode!.requestFocus();
    await _pumpFrames(tester);
    await _holdSelect(tester);
    expect(rows(), findsNWidgets(2));
    final previous = prefs.get(UserPreferences.liveTvSavedFilters);
    tester.widget<ListTile>(rows().first).focusNode!.requestFocus();
    await _pumpFrames(tester);
    prefs.save = Completer<void>();
    await _holdSelect(tester);
    prefs.save!.completeError(StateError('storage unavailable'));
    await _pumpFrames(tester);
    expect(find.text("Couldn't save filter. Try again."), findsOneWidget);
    expect(prefs.get(UserPreferences.liveTvSavedFilters), previous);
    expect(picker, findsOneWidget);
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

  testWidgets('holding Select updates Favorites and rolls back failures', (tester) async {
    useTvLayout();
    userDataSync.reset();
    addTearDown(userDataSync.reset);
    final api = _MockUserLibrary();
    when(() => client.userLibraryApi).thenReturn(api);
    when(() => api.markFavorite('ch0')).thenAnswer((_) async {});
    when(() => api.unmarkFavorite('ch0')).thenThrow(Exception('offline'));
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvCategoryDisplay,
      LiveTvCategoryDisplay.groups,
    );
    stubGroups(const ChannelGroupLineup({'ch1': {'Local'}}));
    await pumpGuide(tester);
    await focusGuideNode(tester, 'GuideChannel:0');
    bool isFavorite() => tester.widget<EpgChannelCell>(
      find.byType(EpgChannelCell).first,
    ).isFavorite;
    await _holdSelect(tester);
    verify(() => api.markFavorite('ch0')).called(1);
    expect(isFavorite(), isTrue);
    await _holdSelect(tester);
    expect(isFavorite(), isTrue);
    when(() => api.unmarkFavorite('ch0')).thenAnswer((_) async {});
    await tapAndPump(tester, find.byTooltip('Filters'));
    await tapAndPump(tester, pickerOption('Favorites'));
    expect(isFavorite(), isTrue);
    await focusGuideNode(tester, 'GuideChannel:0');
    await _holdSelect(tester);
    expect(find.byType(EpgChannelCell), findsNothing);
  });

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
      await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowDown);
    }
  }

  testWidgets('browsing down the guide and back up keeps the same time in view', (tester) async {
    await pumpGuide(tester);
    final anchor = await establishAnchor(tester);
    final offset = _horizontalOffsets(tester);
    expect(offset, isNotEmpty);
    Future<void> move(LogicalKeyboardKey key, int row) async {
      await _sendKeyAndPump(tester, key);
      expect(_horizontalOffsets(tester), offset, reason: 'horizontal scroll changed on row $row');
      expect(_focusedCell(), (row: row, index: _cellIndexForRow(row, anchor)));
    }

    // Includes clipped and oversized programs and the long scroll that used to drift.
    for (var row = 1; row <= 45; row++) {
      await move(LogicalKeyboardKey.arrowDown, row);
    }
    for (var row = 44; row >= 25; row--) {
      await move(LogicalKeyboardKey.arrowUp, row);
    }
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

  for (final action in ['wait', 'move up', 'open details']) {
    testWidgets('a loading row respects the viewer’s next action: $action', (tester) async {
      final anchor = await reachLoadedEdge(tester);
      void expectRow(int row) =>
          expect(_focusedCell(), (row: row, index: _cellIndexForRow(row, anchor)));
      await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowDown);
      expectRow(49);
      switch (action) {
        case 'move up':
          await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowUp);
          expectRow(48);
        case 'open details':
          await _sendKeyAndPump(tester, LogicalKeyboardKey.enter);
          expect(_alertDialog, findsOneWidget);
      }
      await releaseGuideData(tester);
      if (action == 'open details') {
        expect(_focusedCell(), isNull);
        Navigator.of(tester.element(_alertDialog)).pop();
        await _pumpFrames(tester);
        expectRow(49);
      } else {
        expectRow(action == 'wait' ? 50 : 48);
      }
    });
  }

  testWidgets('browse from listings through the header, channel column and page controls', (tester) async {
    await pumpGuide(tester);
    Future<void> move(LogicalKeyboardKey key, String label) => expectFocusAfter(tester, key, label);
    await focusGuideNode(tester, 'GuideProgramRow0:0');
    await move(LogicalKeyboardKey.arrowUp, 'GuideWindowBar:0');
    await move(LogicalKeyboardKey.arrowUp, 'GuideFilter:0');
    await move(LogicalKeyboardKey.arrowDown, 'GuideWindowBar:0');
    for (final index in [1, 2, 3, 4, 5, 5]) {
      await move(LogicalKeyboardKey.arrowRight, 'GuideWindowBar:$index');
    }
    for (var index = 4; index >= 0; index--) {
      await move(LogicalKeyboardKey.arrowLeft, 'GuideWindowBar:$index');
    }
    await move(LogicalKeyboardKey.arrowDown, 'GuideChannel:0');
    await move(LogicalKeyboardKey.arrowDown, 'GuideChannel:1');
    await _sendKeyAndPump(tester, LogicalKeyboardKey.arrowRight);
    expect(_focusedLabel(), startsWith('GuideProgramRow1:'));
    await move(LogicalKeyboardKey.arrowLeft, 'GuideChannel:1');
    await move(LogicalKeyboardKey.arrowUp, 'GuideChannel:0');
    await move(LogicalKeyboardKey.arrowLeft, 'GuideFilter:0');
    await focusGuideNode(tester, 'GuideChannel:0');
    await _sendKeyAndPump(tester, LogicalKeyboardKey.mediaFastForward);
    expect(_focusedLabel(), startsWith('GuideChannel:'));
    final pagedRow = int.parse(_focusedLabel()!.split(':').last);
    expect(pagedRow, greaterThan(0));
    await move(LogicalKeyboardKey.mediaRewind, 'GuideChannel:0');

    final anchorMinutes = await establishAnchor(tester);
    final offsets = _horizontalOffsets(tester);
    await _sendKeyAndPump(tester, LogicalKeyboardKey.mediaFastForward);
    expect(_focusedCell()!.row, pagedRow);
    expect(_focusedCell()!.index, _cellIndexForRow(pagedRow, anchorMinutes));
    expect(_horizontalOffsets(tester), offsets);

    await _sendKeyAndPump(tester, LogicalKeyboardKey.mediaRewind);
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

  testWidgets('moving into the mini player skips hero artwork', (tester) async {
    await pumpGuide(tester, miniPlayerMode: true);
    await focusGuideNode(tester, 'GuideProgramRow0:0');
    await expectFocusAfter(tester, LogicalKeyboardKey.arrowUp, 'GuideMiniPlayer');
    await tester.pump(const Duration(seconds: 1));
    verifyNever(() => liveTvApi.getProgram(any(), userId: any(named: 'userId')));
  });

  Future<void> back(WidgetTester tester) async {
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
  }

  testWidgets('TV back returns to the tuned channel, then header, then exits', (
    tester,
  ) async {
    useTvLayout();
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.liveTvLastChannelId,
      'ch3',
    );
    await openGuideRoute(tester);
    _nodeLabelled(tester, 'GuideChannel:4').requestFocus();
    await tester.pumpAndSettle();
    clearInteractions(liveTvApi);
    await back(tester);
    expect(_focusedLabel(), 'GuideChannel:3');
    // Already live, so returning to the channel reloads nothing.
    verifyNever(() => _channelsRequest(liveTvApi));
    await back(tester);
    expect(_focusedLabel(), 'GuideFilter:0');
    await expectFocusAfter(tester, LogicalKeyboardKey.arrowDown, 'GuideWindowBar:0');
    await expectFocusAfter(tester, LogicalKeyboardKey.arrowDown, 'GuideChannel:3');

    // Re-entering the rows starts the same sequence again.
    _nodeLabelled(tester, 'GuideChannel:4').requestFocus();
    await tester.pumpAndSettle();
    await back(tester);
    expect(_focusedLabel(), 'GuideChannel:3');
    await back(tester);
    expect(_focusedLabel(), 'GuideFilter:0');
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(LiveTvGuideScreen), findsNothing);
  });

  testWidgets('filtering out the entry channel updates the hero and lets Back exit', (tester) async {
    stubFavoriteChannel(5);
    await openGuideRoute(tester);
    await focusGuideNode(tester, 'GuideChannel:0');
    String? hero() => tester.widget<EpgHeroPreview>(find.byType(EpgHeroPreview)).title;
    expect(hero(), 'Channel 0');
    final rail = tester.widget<EpgFilterRail>(find.byType(EpgFilterRail));
    rail.onSelect(GuideFilter.values.indexOf(GuideFilter.favorites));
    await tester.pumpAndSettle();
    expect(_focusedLabel(), 'GuideChannel:0');
    expect(hero(), 'Channel 5');
    await back(tester);
    expect(find.byType(LiveTvGuideScreen), findsNothing);
  });

  testWidgets('a lineup change behind the player leaves focus on the player', (tester) async {
    stubFavoriteChannel(5);
    await openGuideRoute(tester);
    await establishAnchor(tester);
    final rail = tester.widget<EpgFilterRail>(find.byType(EpgFilterRail));
    final player = FocusNode(debugLabel: 'Player');
    addTearDown(player.dispose);
    Navigator.of(tester.element(find.byType(LiveTvGuideScreen))).push(
      MaterialPageRoute<void>(builder: (_) => Focus(focusNode: player, autofocus: true, child: const SizedBox())),
    );
    await tester.pumpAndSettle();
    expect(player.hasPrimaryFocus, isTrue);
    rail.onSelect(GuideFilter.values.indexOf(GuideFilter.favorites));
    await tester.pumpAndSettle();
    expect(player.hasPrimaryFocus, isTrue);
  });

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

  for (final lastChannel in [null, 'ch2']) {
    testWidgets('Back from a past guide window restores the tuned channel ($lastChannel)', (tester) async {
      await openGuideRoute(tester);
      if (lastChannel != null) {
        await GetIt.instance<UserPreferences>().set(UserPreferences.liveTvLastChannelId, lastChannel);
      } else {
        await focusGuideNode(tester, 'GuideChannel:3');
      }
      final live = _windowRangeText(tester);
      await focusGuideNode(tester, 'GuideWindowBar:0');
      await _sendKeyAndPump(tester, LogicalKeyboardKey.enter);
      expect(_windowRangeText(tester), isNot(live));
      await back(tester);
      expect(find.byType(LiveTvGuideScreen), findsOneWidget);
      expect(_focusedLabel(), lastChannel == null ? 'GuideChannel:0' : 'GuideChannel:2');
    });
  }
}
