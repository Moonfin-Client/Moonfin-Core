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
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_filter_rail.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_hero_preview.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_window.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_guide_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockPlaybackManager extends Mock implements PlaybackManager {}

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

List<Map<String, dynamic>> _programsFor(String channelId) {
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

    channelCount = _channelCount;
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
        'Items': [for (final id in ids) ..._programsFor(id)],
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
  }) async {
    // Wide enough for a multi-hour window and tall enough for a dozen rows.
    // The guide sizes its own time density to whatever surface it is given.
    tester.view.physicalSize = const Size(900, 700);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // Embedded mode drops the guide's own Scaffold because the host
        // supplies it. Stand in for that host here.
        home: _hosted(
          LiveTvGuideScreen(
            miniPlayerMode: miniPlayerMode,
            embedded: miniPlayerMode,
            onChannelSelected: miniPlayerMode ? (_) {} : null,
            onClose: miniPlayerMode ? () {} : null,
          ),
          embedded: miniPlayerMode,
        ),
      ),
    );
    await tester.pumpAndSettle();
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
      when(
        () => liveTvApi.getProgram(any(), userId: any(named: 'userId')),
      ).thenAnswer(
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
