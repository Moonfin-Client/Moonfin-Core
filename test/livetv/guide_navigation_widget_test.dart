import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playback_core/playback_core.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_window.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_guide_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockPlaybackManager extends Mock implements PlaybackManager {}

/// Deliberately asymmetric row shapes: differing programme durations give the
/// rows differing cell counts and boundaries, which is what makes a drifting
/// vertical move visible as a different cell index.
const _durations = <int>[20, 30, 45, 60, 180];

const _channelCount = 48;

/// One batch is 50 channels, so a lineup past that leaves the tail rows
/// genuinely unloaded — the only honest way to observe a loading row.
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
  // tiled edge to edge and every row's cells are whole programmes.
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

/// `pumpAndSettle` cannot be used once any row is loading — that row's cell
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

/// `(row, cellIndex)` of the focused programme cell, or null when focus is
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
    // Wide enough for a multi-hour window and tall enough for a dozen rows;
    // the guide sizes its own time density to whatever surface it is given.
    tester.view.physicalSize = const Size(900, 700);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // Embedded mode drops the guide's own Scaffold because the host
        // supplies it; stand in for that host here.
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
  /// about an hour; forty-five collapsed onto the row's first cell.
  Future<void> expectNoDrift(WidgetTester tester, int presses) async {
    await pumpGuide(tester);
    final anchorMinutes = await establishAnchor(tester);
    final before = _horizontalOffsets(tester);
    expect(before, isNotEmpty);

    await pressDown(tester, presses);

    expect(_horizontalOffsets(tester), before);

    // Without this the offset check alone would pass on a guide that never
    // moved at all, which is not what the regression was about.
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
    // right edge; row 4 is a single cell wider than the viewport.
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

    // Select on the focused programme opens the details dialog.
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

  testWidgets('RIGHT enters the programme row and LEFT returns to its channel', (
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
}
