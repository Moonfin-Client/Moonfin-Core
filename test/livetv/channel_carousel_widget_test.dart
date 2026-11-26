import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/live_tv_recording_state.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_carousel.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_carousel_card.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_carousel_overlay.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin/util/tv_ui_scale.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

class _CarouselClient extends Mock implements MediaServerClient {
  @override
  ServerType get serverType => ServerType.jellyfin;
}

class _CarouselGuide extends LiveTvGuideViewModel {
  final List<List<String>> requests = [];
  bool disposed = false;
  int schedules = 0;
  int refreshCalls = 0;
  int programLookups = 0;
  bool ready = false;
  bool failTopUp = false;
  final Set<String> failedChannels = {};
  bool get listening => hasListeners;
  String titleSuffix = '';


  void changeProgram() {
    titleSuffix = ' updated';
    notifyListeners();
  }

  _CarouselGuide(super.client, List<GuideChannel> lineup) {
    usePlaybackLineup(lineup);
  }

  @override
  GuideState get state => ready ? GuideState.ready : GuideState.loading;

  @override
  List<GuideProgram> unfilteredProgramsForChannel(String channelId) {
    programLookups++;
    final now = DateTime.now();
    return [
      GuideProgram(
        id: '$channelId-program',
        channelId: channelId,
        name: 'Show $channelId$titleSuffix',
        startDate: now.subtract(const Duration(minutes: 20)),
        endDate: now.add(const Duration(minutes: 40)),
        overview: 'Overview $channelId',
        rawData: const {'ParentIndexNumber': 6, 'IndexNumber': 19},
      ),
    ];
  }

  @override
  Future<void> load({
    Duration? window,
    List<String>? initialChannelIds,
    DateTime? windowStart,
    bool livePosition = true,
  }) async {
    _loadedRevision = liveTvRecordingRevision.value;
    duringLoad?.call();
    if (initialLoadGate != null) await initialLoadGate!.future;
    ready = true;
    requests.add(initialChannelIds!);
    notifyListeners();
  }

  @override
  GuideChannelLoadState loadStateFor(String channelId) =>
      failedChannels.contains(channelId)
          ? GuideChannelLoadState.failed
          : GuideChannelLoadState.loading;

  @override
  Future<void> ensureProgramsForChannels(List<String> channelIds) async {
    requests.add(channelIds);
    if (failTopUp) throw StateError('HTTP 403 during optional top-up');
  }

  @override
  Future<void> refreshCarouselPrograms() async {
    refreshCalls++;
    notifyListeners();
  }

  /// Runs inside [load] before the guide turns ready.
  void Function()? duringLoad;
  Completer<void>? initialLoadGate;
  int recordingCatchUps = 0;
  int _loadedRevision = 0;

  @override
  Future<void> reloadIfRecordingsChanged() async {
    if (liveTvRecordingRevision.value != _loadedRevision) recordingCatchUps++;
  }

  @override
  void scheduleBoundaryRefresh() {
    schedules++;
  }

  @override
  Future<void> refreshAtQuarterHour() async {}

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}

/// Five card pitches of strip, so the fitting/scrolling threshold lands at
/// five channels whatever the card geometry is. Derived rather than hard-coded
/// because the strip takes its pitch straight from the card.
const double _stripWidth = ChannelCarouselCard.cardPitch * 5;
const double _surfaceWidth = _stripWidth + 100;
const double _stripCentre = _surfaceWidth / 2;

List<GuideChannel> _guideChannels(int count, {bool numbered = false}) => [
  for (var i = 0; i < count; i++)
    GuideChannel(
      id: 'ch$i',
      name: 'Channel $i',
      number: numbered ? '${i + 1}' : null,
      rawData: const {},
    ),
];

List<ChannelCarouselEntry> _lineup(int count) => List.generate(
  count,
  (i) => ChannelCarouselEntry(
    channelId: 'ch$i',
    channelName: 'Channel $i',
    channelNumber: '${i + 1}',
    programTitle: 'Program $i',
    timeLabel: '8:00 PM - 9:00 PM',
    isLive: true,
    progress: 0.5,
  ),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  test('the overlay stays up for two minutes unless dismissed', () {
    // Owner requirement: the changer is for browsing, so it must not vanish
    // mid-look. The player relies on this default and passes no override.
    final overlay = ChannelCarouselOverlay(
      client: _CarouselClient(),
      channels: const [],
      currentChannelId: 'ch0',
      onChannelSelected: (_) {},
      onDismiss: () {},
      onShowControls: () {},
    );
    expect(overlay.inactivityDuration, const Duration(minutes: 2));
  });

  testWidgets('both visible cards show progress at the start of a program', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      home: Scaffold(body: Row(children: [
        for (final focused in [true, false])
          ChannelCarouselCard(
            channelName: focused ? 'Focused' : 'Unfocused', channelNumber: focused ? '1' : '2',
            programTitle: 'New program', timeLabel: '9:08 PM - 10:00 PM', genre: null,
            isFavorite: false, isLive: true, progress: 0, hasTimer: false, centered: focused,
          ),
      ])),
    ));
    final tracks = tester.widgetList<LinearProgressIndicator>(find.byType(LinearProgressIndicator));
    expect(tracks.map((track) => track.value), [0, 0]);
  });

  final selectedCard = find.byWidgetPredicate((widget) => widget is ChannelCarouselCard && widget.centered);
  String? selectedName(WidgetTester tester) => tester.widget<ChannelCarouselCard>(selectedCard).channelName;
  void expectCentered(WidgetTester tester, int channel) {
    expect(selectedName(tester), 'Channel $channel');
    expect(tester.getCenter(selectedCard).dx, closeTo(_stripCentre, 0.01));
  }

  tearDown(() => HardwareKeyboard.instance.clearState());

  Future<_CarouselGuide> pumpOverlay(
    WidgetTester tester, {
    VoidCallback? onDismiss,
    VoidCallback? onShowControls,
    Duration inactivity = const Duration(seconds: 5),
    ChannelCarouselPrewarm? prewarm,
  }) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    addTearDown(
      () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
    );
    await tester.binding.setSurfaceSize(const Size(1000, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final client = _CarouselClient();
    final channels = _guideChannels(20, numbered: true);
    final vm = prewarm?.viewModel as _CarouselGuide? ?? _CarouselGuide(client, channels);
    prewarm?.tuned(channels, 'ch10');
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        home: Scaffold(
          body: ChannelCarouselOverlay(
            client: client,
            channels: channels,
            currentChannelId: 'ch10',
            onChannelSelected: (_) {},
            onDismiss: onDismiss ?? () {},
            onShowControls: onShowControls ?? () {},
            inactivityDuration: inactivity,
            prewarm: prewarm,
            viewModelFactory: (_) => vm,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    return vm;
  }


  testWidgets('a cold-open carousel still shows favorite changes when listings fail', (tester) async {
    userDataSync.reset();
    addTearDown(userDataSync.reset);
    final client = _CarouselClient();
    final guide = _CarouselGuide(client, _guideChannels(20))..failTopUp = true;
    final prewarm = ChannelCarouselPrewarm(client, viewModelFactory: (_) => guide);
    try {
      await pumpOverlay(tester, prewarm: prewarm);
      await tester.pump(const Duration(milliseconds: 250));
      expect(guide.ready, isTrue);
      expect(guide.requests.length, greaterThan(1));
      final card = find.byWidgetPredicate(
        (widget) => widget is ChannelCarouselCard && widget.channelName == 'Channel 10',
      );
      expect(tester.widget<ChannelCarouselCard>(card).isFavorite, isFalse);
      userDataSync.publish('ch10', {'IsFavorite': true});
      await tester.pump();
      expect(tester.widget<ChannelCarouselCard>(card).isFavorite, isTrue);
      userDataSync.publish('ch10', {'IsFavorite': false});
      await tester.pump();
      expect(tester.widget<ChannelCarouselCard>(card).isFavorite, isFalse);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      prewarm.dispose();
    }
  });

  test('the television canvas shows three whole cards and two half ones', () {
    final layout = ChannelCarouselCard.layoutFor(kTvDesignWidth);

    // The strip is centre-locked, so an even number of pitches puts the
    // centred card between two whole neighbours with a half card bleeding
    // off each edge.
    expect(layout.count, 4);
    expect(
      layout.width,
      inInclusiveRange(
        ChannelCarouselCard.minCardWidth,
        ChannelCarouselCard.maxCardWidth,
      ),
    );
  });

  testWidgets('overlay header waits until 200 ms after scrolling ends', (
    tester,
  ) async {
    await pumpOverlay(tester);
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('Show ch10 (S6:E19)'), findsOneWidget);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    expect(find.text('Show ch10 (S6:E19)'), findsNothing);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Show ch11 (S6:E19)'), findsNothing);
    await tester.pump(const Duration(milliseconds: 199));
    expect(find.text('Show ch11 (S6:E19)'), findsNothing);
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('Show ch11 (S6:E19)'), findsOneWidget);
    expect(find.text('Overview ch11'), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('Overview ch11')).style?.fontSize,
      AppTypography.fontSizeLg,
      reason: 'the description carries the overview face, not a default',
    );
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('the strip follows the description without a band of scrim', (
    tester,
  ) async {
    await pumpOverlay(tester);
    await tester.pump(const Duration(milliseconds: 200));
    final description = tester.getRect(find.text('Overview ch10'));
    final stripTop = tester.getRect(find.byType(ChannelCarousel)).top;
    // The header reserves both overview lines so the strip holds still as the
    // selection moves. This fixture's overview is one line, so the second one
    // plus the deliberate gap is everything that may sit under it.
    expect(
      stripTop - description.bottom,
      lessThanOrEqualTo(description.height + 12),
    );
    expect(stripTop, greaterThan(description.bottom));
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('carousel takes focus from an already-focused host', (
    tester,
  ) async {
    final hostFocus = FocusNode(debugLabel: 'host');
    addTearDown(hostFocus.dispose);
    late StateSetter setHostState;
    var showCarousel = false;
    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            setHostState = setState;
            return Stack(
              children: [
                Focus(
                  focusNode: hostFocus,
                  autofocus: true,
                  child: const SizedBox.expand(),
                ),
                if (showCarousel) ChannelCarousel(channels: _lineup(20)),
              ],
            );
          },
        ),
      ),
    );
    await tester.pump();
    expect(hostFocus.hasFocus, isTrue);

    setHostState(() => showCarousel = true);
    await tester.pump();

    expect(FocusManager.instance.primaryFocus?.debugLabel, 'ChannelCarousel');
  });

  testWidgets('overlay owns and disposes its guide and forwards resume', (
    tester,
  ) async {
    final vm = await pumpOverlay(tester);
    expect(vm.listening, isTrue);
    expect(vm.requests.first, contains('ch10'));
    expect(vm.requests.first.length, lessThan(20));
    final before = vm.schedules;
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    expect(vm.schedules, greaterThan(before));
    await tester.pumpWidget(const SizedBox.shrink());
    expect(vm.disposed, isTrue);
    expect(vm.listening, isFalse);
  });

  testWidgets('carousel retries only failed visible cards, including after a top-up error', (tester) async {
    final client = _CarouselClient();
    final channels = _guideChannels(20);
    final vm = _CarouselGuide(client, channels)..failedChannels.addAll(['ch10', 'ch14']);
    final prewarm = ChannelCarouselPrewarm(client, viewModelFactory: (_) => vm);
    int retries(String id) => vm.requests.where((ids) => ids.length == 1 && ids.single == id).length;
    Future<void> advance(Duration delay) async {
      await tester.pump(delay);
      await tester.pump();
    }

    try {
      prewarm.tuned(channels, 'ch0');
      await advance(ChannelCarouselPrewarm.settleDelay);
      await prewarm.ensureVisibleChannels(['ch10']);
      await advance(const Duration(seconds: 2));
      vm.failTopUp = true;
      await expectLater(prewarm.ensureVisibleChannels(['ch14', 'ch15']), throwsStateError);
      vm.failTopUp = false;
      await advance(ChannelCarouselPrewarm.failedListingsRetryDelay);
      expect(retries('ch10'), 0);
      expect(vm.requests.last, ['ch14']);
      final first = retries('ch14');
      await advance(const Duration(seconds: 30));
      expect(retries('ch14'), greaterThan(first));
    } finally {
      prewarm.dispose();
    }
  });

  testWidgets('prewarm catches up on a recording changed during its first load', (
    tester,
  ) async {
    final client = _CarouselClient();
    final channels = _guideChannels(4, numbered: true);
    final vm = _CarouselGuide(client, channels)
      ..duringLoad = notifyLiveTvRecordingsChanged;
    final prewarm = ChannelCarouselPrewarm(
      client,
      viewModelFactory: (_) => vm,
      now: () => DateTime(2026, 9, 13, 18),
    );

    prewarm.tuned(channels, 'ch1');
    await tester.pump(ChannelCarouselPrewarm.settleDelay);
    await tester.pump();

    expect(vm.refreshCalls, 0);
    expect(vm.recordingCatchUps, 1);
    prewarm.dispose();
  });

  testWidgets('prewarm refreshes hourly and catches a missed resume', (
    tester,
  ) async {
    final client = _CarouselClient();
    final channels = _guideChannels(4, numbered: true);
    final vm = _CarouselGuide(client, channels);
    var now = DateTime(2026, 9, 13, 18);
    final prewarm = ChannelCarouselPrewarm(
      client,
      viewModelFactory: (_) => vm,
      hourlyRefreshInterval: const Duration(seconds: 1),
      now: () => now,
    );
    prewarm.tuned(channels, 'ch1');
    await tester.pump(ChannelCarouselPrewarm.settleDelay);
    await tester.pump(const Duration(seconds: 1));
    expect(vm.refreshCalls, 1);

    now = now.add(const Duration(hours: 2));
    await prewarm.onAppResumed();
    expect(vm.refreshCalls, 2);
    expect(prewarm.hourlyDueAt, now.add(const Duration(seconds: 1)));
    prewarm.dispose();
  });

  testWidgets(
    'normal tune only ensures missing programs when coverage is current',
    (tester) async {
      final client = _CarouselClient();
      final channels = _guideChannels(4, numbered: true);
      final vm = _CarouselGuide(client, channels);
      final prewarm = ChannelCarouselPrewarm(
        client,
        viewModelFactory: (_) => vm,
        now: () => DateTime(2026, 9, 13, 18),
      );

      prewarm.tuned(channels, 'ch1');
      await tester.pump(ChannelCarouselPrewarm.settleDelay);
      await tester.pump();
      prewarm.tuned(channels, 'ch2');
      await tester.pump(ChannelCarouselPrewarm.settleDelay);
      await tester.pump();

      expect(vm.requests, hasLength(2));
      expect(
        vm.requests.last,
        unorderedEquals(channels.map((channel) => channel.id)),
      );
      expect(vm.refreshCalls, 0);
      prewarm.dispose();
    },
  );

  testWidgets(
    'overlay debounces visible loads and follows data notifications',
    (tester) async {
      final vm = await pumpOverlay(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump(const Duration(milliseconds: 100));
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 149));
      expect(vm.requests, hasLength(1));
      await tester.pump(const Duration(milliseconds: 1));
      expect(vm.requests, hasLength(2));
      expect(vm.requests.last, contains('ch12'));
      vm.changeProgram();
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.text('Show ch12 updated (S6:E19)'), findsOneWidget);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('the idle overlay updates on a program change and restores remote browsing', (tester) async {
    final vm = await pumpOverlay(tester, inactivity: const Duration(minutes: 10));
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('Show ch10 (S6:E19)'), findsOneWidget);
    final reads = vm.programLookups;
    await tester.pump(const Duration(seconds: 21));
    expect(vm.programLookups, reads);

    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump();
    vm.changeProgram();
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump();
    final header = find.byKey(const ValueKey('carousel-program-header'));
    expect(find.descendant(of: header, matching: find.text('Show ch10 updated (S6:E19)')), findsOneWidget);
    expect(tester.widget<ChannelCarouselCard>(selectedCard).programTitle, 'Show ch10 updated');
    expect(FocusManager.instance.primaryFocus?.debugLabel, 'ChannelCarousel');
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    expect(selectedName(tester), 'Channel 11');
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(selectedName(tester), 'Channel 10');
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('overlay follows a restored current channel after tune failure', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final client = _CarouselClient();
    final channels = _guideChannels(20, numbered: true);
    final vm = _CarouselGuide(client, channels);
    late StateSetter setHostState;
    const currentChannelId = 'ch10';
    var selectionRevision = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        home: StatefulBuilder(
          builder: (context, setState) {
            setHostState = setState;
            return ChannelCarouselOverlay(
              client: client,
              channels: channels,
              currentChannelId: currentChannelId,
              selectionRevision: selectionRevision,
              onChannelSelected: (_) {},
              onDismiss: () {},
              onShowControls: () {},
              viewModelFactory: (_) => vm,
            );
          },
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    setHostState(() => selectionRevision++);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Show ch10 (S6:E19)'), findsOneWidget);
    final selected = find.byWidgetPredicate(
      (widget) => widget is ChannelCarouselCard && widget.centered,
    );
    expect(
      tester.widget<ChannelCarouselCard>(selected).channelName,
      'Channel 10',
    );
  });

  testWidgets('overlay inactivity resets on key down, repeat and key up', (
    tester,
  ) async {
    var dismissals = 0;
    await pumpOverlay(tester, onDismiss: () => dismissals++);
    await tester.pump(const Duration(seconds: 4));
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump(const Duration(seconds: 4));
    expect(dismissals, 0);
    await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump(const Duration(seconds: 4));
    expect(dismissals, 0);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump(const Duration(milliseconds: 4999));
    expect(dismissals, 0);
    await tester.pump(const Duration(milliseconds: 1));
    // The timeout starts the slide out. The host is told once it has run.
    expect(dismissals, 0);
    await tester.pump();
    await tester.pump(kCarouselExitDuration * 2);
    expect(dismissals, 1);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets(
    'DOWN requests controls without taking the restoration callback',
    (tester) async {
      var dismissals = 0;
      var controls = 0;
      await pumpOverlay(
        tester,
        onDismiss: () => dismissals++,
        onShowControls: () => controls++,
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      expect(controls, 1);
      expect(dismissals, 0);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('UP keeps focus on the strip instead of traversing away', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final above = FocusNode(debugLabel: 'above');
    addTearDown(above.dispose);
    final client = _CarouselClient();
    final channels = _guideChannels(20, numbered: true);
    final vm = _CarouselGuide(client, channels);
    var dismissals = 0;
    var controls = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        home: Scaffold(
          body: Stack(
            children: [
              // Something focusable above the strip, as the player always has.
              Align(
                alignment: Alignment.topCenter,
                child: Focus(
                  focusNode: above,
                  child: const SizedBox(width: 100, height: 40),
                ),
              ),
              ChannelCarouselOverlay(
                client: client,
                channels: channels,
                currentChannelId: 'ch10',
                onChannelSelected: (_) {},
                onDismiss: () => dismissals++,
                onShowControls: () => controls++,
                viewModelFactory: (_) => vm,
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(FocusManager.instance.primaryFocus?.debugLabel, 'ChannelCarousel');

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();

    expect(above.hasFocus, isFalse);
    expect(FocusManager.instance.primaryFocus?.debugLabel, 'ChannelCarousel');
    expect(dismissals, 0);
    expect(controls, 0);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  /// Pumps the strip and returns the list of centred channel indices, in the
  /// order the widget reported them.
  Future<List<int>> pumpCarousel(
    WidgetTester tester,
    int channelCount, {
    List<ChannelCarouselEntry>? channels,
    int initialIndex = 0,
    double width = _stripWidth,
    ValueChanged<ChannelCarouselEntry>? onSelected,
  }) async {
    await tester.binding.setSurfaceSize(const Size(_surfaceWidth, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final centred = <int>[];
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: width,
              child: ChannelCarousel(
                channels: channels ?? _lineup(channelCount),
                initialIndex: initialIndex,
                onChannelCentered: centred.add,
                onChannelSelected: onSelected,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    return centred;
  }

  testWidgets('OK stays on the browsed station when Favorites First moves it', (tester) async {
    String? tuned;
    Future<List<int>> show(List<ChannelCarouselEntry> channels) => pumpCarousel(
      tester, channels.length,
      channels: channels,
      initialIndex: 1,
      onSelected: (entry) => tuned = entry.channelId,
    );
    final channels = _lineup(4);
    await show(channels);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await show(_lineup(4));
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    expect(tuned, 'ch2');

    tuned = null;
    await show([channels[0], channels[2], channels[1], channels[3]]);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    expect(tuned, 'ch2');
    final centered = find.byWidgetPredicate((w) => w is ChannelCarouselCard && w.centered);
    expect(tester.widget<ChannelCarouselCard>(centered).channelName, 'Channel 2');
    expect(tester.getCenter(centered).dx, closeTo(_stripCentre, 0.01));
  });

  testWidgets('OK tunes the visibly centered station after the lineup grows', (tester) async {
    await pumpCarousel(tester, 20, initialIndex: 7);
    String? tuned;
    await pumpCarousel(tester, 22, initialIndex: 7, onSelected: (entry) => tuned = entry.channelId);
    final station = find.byWidgetPredicate(
      (widget) => widget is ChannelCarouselCard && widget.centered && widget.channelName == 'Channel 7',
    );
    expect(tester.getCenter(station).dx, closeTo(_stripCentre, 0.01));
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    expect(tuned, 'ch7');
  });

  testWidgets('changing the tuned station recentres the strip', (tester) async {
    await pumpCarousel(tester, 20, initialIndex: 7);
    expectCentered(tester, 7);
    await pumpCarousel(tester, 20, initialIndex: 3);
    expectCentered(tester, 3);
  });

  testWidgets('scrolling carousel has a finite range and wraps left at zero', (
    tester,
  ) async {
    final centered = await pumpCarousel(tester, 20);
    final list = tester.widget<ListView>(find.byType(ListView));
    final delegate = list.childrenDelegate as SliverChildBuilderDelegate;
    expect(delegate.childCount, isNotNull);
    expect(delegate.childCount, greaterThan(1000));
    expect(list.scrollCacheExtent, isNotNull);
    expect(
      list.scrollCacheExtent!.value,
      greaterThan(ChannelCarouselCard.cardPitch),
    );
    final scrollable = tester.state<ScrollableState>(find.byType(Scrollable));
    expect(scrollable.position.maxScrollExtent.isFinite, isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(centered, [19]);
    expectCentered(tester, 19);
  });

  for (var count = 1; count <= 5; count++) {
    testWidgets('$count fitting channels wrap at the centre of the strip', (tester) async {
      await pumpCarousel(tester, count, initialIndex: count - 1);
      expect(find.byType(ChannelCarouselCard), findsNWidgets(count));
      expectCentered(tester, count - 1);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(find.byType(ChannelCarouselCard), findsNWidgets(count));
      expectCentered(tester, 0);
    });
  }

  testWidgets(
    'a lineup past the visible run scrolls while a hold advances by one',
    (tester) async {
      // The derived card count is always odd, so an even exact fit can't
      // arise. One channel more than fits is the case that must scroll.
      final centered = await pumpCarousel(tester, 6, initialIndex: 5);
      expect(find.byType(ListView), findsOneWidget);
      final selected = find.byWidgetPredicate(
        (widget) => widget is ChannelCarouselCard && widget.centered,
      );
      expect(tester.getCenter(selected).dx, closeTo(_stripCentre, 0.01));
      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));
      expect(centered, [0, 1]);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(tester.getCenter(selected).dx, closeTo(_stripCentre, 0.01));
    },
  );

  for (final repeats in [false, true]) {
    testWidgets('holding Right stops after the last physical input (repeats: $repeats)', (tester) async {
      final moves = await pumpCarousel(tester, 20);
      const key = LogicalKeyboardKey.arrowRight;
      await tester.sendKeyDownEvent(key);
      await tester.pump();
      if (repeats) {
        var movesAt900ms = 0;
        for (var elapsed = 100; elapsed <= 1200; elapsed += 100) {
          await tester.pump(const Duration(milliseconds: 100));
          await tester.sendKeyRepeatEvent(key);
          if (elapsed == 900) movesAt900ms = moves.length;
        }
        expect(movesAt900ms, greaterThanOrEqualTo(6));
        expect(moves.length, greaterThan(movesAt900ms));
        final atLastRepeat = moves.length;
        await tester.pump(const Duration(milliseconds: 900));
        expect(moves.length, greaterThan(atLastRepeat));
      } else {
        await tester.pump(const Duration(milliseconds: 400));
        expect(moves, [1, 2]);
        await tester.pump(const Duration(milliseconds: 490));
      }
      final atWatchdog = moves.length;
      await tester.pump(const Duration(seconds: 2));
      expect(moves.length, atWatchdog);
      await tester.sendKeyUpEvent(key);
      await tester.pumpAndSettle();
    });
  }

  testWidgets('a short lineup walks one channel at a time and wraps', (
    tester,
  ) async {
    final centred = await pumpCarousel(tester, 3);

    // Key-down at 0 ms, first hold move at 350 ms, then one every 110 ms.
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump(const Duration(milliseconds: 110));

    expect(centred, [1, 2, 0]);

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
  });

  testWidgets('a fitted lineup recentres without an attached scroll position', (
    tester,
  ) async {
    await pumpCarousel(tester, 2);

    for (var i = 0; i < 400; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
    }

    expect(tester.takeException(), isNull);
    final selected = find.byWidgetPredicate(
      (widget) => widget is ChannelCarouselCard && widget.centered,
    );
    expect(
      tester.widget<ChannelCarouselCard>(selected).channelName,
      'Channel 0',
    );
  });
}
