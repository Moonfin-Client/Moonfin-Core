import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_carousel.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_carousel_card.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_carousel_overlay.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

class _CarouselClient extends Mock implements MediaServerClient {}

class _CarouselGuide extends LiveTvGuideViewModel {
  final List<GuideChannel> lineup;
  final List<List<String>> requests = [];
  bool disposed = false;
  int schedules = 0;
  int refreshCalls = 0;
  int programLookups = 0;
  bool ready = false;
  bool get listening => hasListeners;
  String titleSuffix = '';

  void changeProgram() {
    titleSuffix = ' updated';
    notifyListeners();
  }

  _CarouselGuide(super.client, this.lineup);

  @override
  List<GuideChannel> get filteredChannels => lineup;

  @override
  GuideState get state => ready ? GuideState.ready : GuideState.loading;

  @override
  GuideChannel? channelForId(String channelId) =>
      lineup.where((channel) => channel.id == channelId).firstOrNull;

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
    ready = true;
    requests.add(initialChannelIds!);
    notifyListeners();
  }

  @override
  Future<void> ensureProgramsForChannels(List<String> channelIds) async {
    requests.add(channelIds);
  }

  @override
  Future<void> refreshCarouselPrograms() async {
    refreshCalls++;
    notifyListeners();
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

  testWidgets(
    'live progress tracks render at a program boundary for focused and unfocused cards',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.buildTheme(ThemeRegistry.active),
          home: const Scaffold(
            body: Row(
              children: [
                ChannelCarouselCard(
                  key: ValueKey('focused-boundary-card'),
                  channelNumber: '1',
                  channelName: 'Focused',
                  isFavorite: false,
                  programTitle: 'New program',
                  timeLabel: '9:08 PM - 10:00 PM',
                  genre: null,
                  isLive: true,
                  progress: 0,
                  hasTimer: false,
                  centered: true,
                ),
                ChannelCarouselCard(
                  key: ValueKey('unfocused-boundary-card'),
                  channelNumber: '2',
                  channelName: 'Unfocused',
                  isFavorite: false,
                  programTitle: 'New program',
                  timeLabel: '9:08 PM - 10:00 PM',
                  genre: null,
                  isLive: true,
                  progress: 0,
                  hasTimer: false,
                  centered: false,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsNWidgets(2));
      for (final indicator in tester.widgetList<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      )) {
        expect(indicator.value, 0);
      }
    },
  );

  tearDown(() => HardwareKeyboard.instance.clearState());

  Future<_CarouselGuide> pumpOverlay(
    WidgetTester tester, {
    VoidCallback? onDismiss,
    VoidCallback? onShowControls,
    Duration inactivity = const Duration(seconds: 5),
  }) async {
    await tester.binding.setSurfaceSize(const Size(1000, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final client = _CarouselClient();
    final channels = List.generate(
      20,
      (i) => GuideChannel(
        id: 'ch$i',
        name: 'Channel $i',
        number: '${i + 1}',
        rawData: const {},
      ),
    );
    final vm = _CarouselGuide(client, channels);
    await tester.pumpWidget(
      MaterialApp(
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
            viewModelFactory: (_) => vm,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    return vm;
  }

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
    expect(tester.widget<Text>(find.text('Overview ch11')).style?.fontSize, 16);
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

  testWidgets('prewarm loads every carousel channel and arms its boundary', (
    tester,
  ) async {
    final client = _CarouselClient();
    final channels = List.generate(
      12,
      (i) => GuideChannel(
        id: 'ch$i',
        name: 'Channel $i',
        number: '${i + 1}',
        rawData: const {},
      ),
    );
    final vm = _CarouselGuide(client, channels);
    final now = DateTime(2026, 9, 13, 18);
    final prewarm = ChannelCarouselPrewarm(
      client,
      viewModelFactory: (_) => vm,
      hourlyRefreshInterval: const Duration(seconds: 2),
      now: () => now,
    );
    prewarm.tuned(channels, 'ch6');
    await tester.pump(ChannelCarouselPrewarm.settleDelay);
    await tester.pump();

    expect(vm.requests, hasLength(1));
    expect(vm.requests.single, channels.map((channel) => channel.id));
    expect(vm.schedules, greaterThanOrEqualTo(1));
    expect(prewarm.hourlyDueAt, now.add(const Duration(seconds: 2)));
    prewarm.dispose();
  });

  testWidgets('prewarm refreshes hourly and catches a missed resume', (
    tester,
  ) async {
    final client = _CarouselClient();
    final channels = List.generate(
      4,
      (i) => GuideChannel(
        id: 'ch$i',
        name: 'Channel $i',
        number: '${i + 1}',
        rawData: const {},
      ),
    );
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
      final channels = List.generate(
        4,
        (i) => GuideChannel(
          id: 'ch$i',
          name: 'Channel $i',
          number: '${i + 1}',
          rawData: const {},
        ),
      );
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
      expect(vm.requests.last, channels.map((channel) => channel.id));
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

  testWidgets('overlay does not poll presentation on a 20-second timer', (
    tester,
  ) async {
    final vm = await pumpOverlay(
      tester,
      inactivity: const Duration(minutes: 10),
    );
    await tester.pump(const Duration(milliseconds: 200));
    final lookupsBeforeElapsedTime = vm.programLookups;

    await tester.pump(const Duration(seconds: 21));

    expect(vm.programLookups, lookupsBeforeElapsedTime);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets(
    'program boundary notification updates the focused card and header',
    (tester) async {
      final vm = await pumpOverlay(
        tester,
        inactivity: const Duration(minutes: 10),
      );
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.text('Show ch10 (S6:E19)'), findsOneWidget);

      vm.changeProgram();
      await tester.pump();

      final header = find.byKey(const ValueKey('carousel-program-header'));
      expect(
        find.descendant(
          of: header,
          matching: find.text('Show ch10 updated (S6:E19)'),
        ),
        findsOneWidget,
      );
      final selected = find.byWidgetPredicate(
        (widget) => widget is ChannelCarouselCard && widget.centered,
      );
      expect(
        tester.widget<ChannelCarouselCard>(selected).programTitle,
        'Show ch10 updated',
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(
        tester.widget<ChannelCarouselCard>(selected).channelName,
        'Channel 11',
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(
        tester.widget<ChannelCarouselCard>(selected).channelName,
        'Channel 10',
      );
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('overlay restores carousel focus after program refresh', (
    tester,
  ) async {
    final vm = await pumpOverlay(tester);
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump();
    vm.changeProgram();
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump();

    expect(FocusManager.instance.primaryFocus?.debugLabel, 'ChannelCarousel');
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    final selected = find.byWidgetPredicate(
      (widget) => widget is ChannelCarouselCard && widget.centered,
    );
    expect(
      tester.widget<ChannelCarouselCard>(selected).channelName,
      'Channel 11',
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(
      tester.widget<ChannelCarouselCard>(selected).channelName,
      'Channel 10',
    );
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('overlay follows a restored current channel after tune failure', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final client = _CarouselClient();
    final channels = List.generate(
      20,
      (i) => GuideChannel(
        id: 'ch$i',
        name: 'Channel $i',
        number: '${i + 1}',
        rawData: const {},
      ),
    );
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

  /// Pumps the strip and returns the list of centred channel indices, in the
  /// order the widget reported them.
  Future<List<int>> pumpCarousel(
    WidgetTester tester,
    int channelCount, {
    int initialIndex = 0,
    double width = _stripWidth,
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
                channels: _lineup(channelCount),
                initialIndex: initialIndex,
                onChannelCentered: centred.add,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    return centred;
  }

  testWidgets('changed initial index restores the centered channel', (
    tester,
  ) async {
    await pumpCarousel(tester, 20, initialIndex: 7);
    Finder selected() => find.byWidgetPredicate(
      (widget) => widget is ChannelCarouselCard && widget.centered,
    );
    expect(
      tester.widget<ChannelCarouselCard>(selected()).channelName,
      'Channel 7',
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: _stripWidth,
              child: ChannelCarousel(channels: _lineup(20), initialIndex: 3),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(
      tester.widget<ChannelCarouselCard>(selected()).channelName,
      'Channel 3',
    );
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
    final selected = find.byWidgetPredicate(
      (widget) => widget is ChannelCarouselCard && widget.centered,
    );
    expect(
      tester.widget<ChannelCarouselCard>(selected).channelName,
      'Channel 19',
    );
    expect(tester.getCenter(selected).dx, closeTo(_stripCentre, 0.01));
  });

  for (final channelCount in [1, 2, 3, 4, 5]) {
    testWidgets('$channelCount fitting channels pin a non-middle initial '
        'selection and wrap to the viewport center', (tester) async {
      await pumpCarousel(tester, channelCount, initialIndex: channelCount - 1);
      Finder selected() => find.byWidgetPredicate(
        (widget) => widget is ChannelCarouselCard && widget.centered,
      );
      expect(find.byType(ChannelCarouselCard), findsNWidgets(channelCount));
      expect(
        tester.widget<ChannelCarouselCard>(selected()).channelName,
        'Channel ${channelCount - 1}',
      );
      expect(tester.getCenter(selected()).dx, closeTo(_stripCentre, 0.01));
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(find.byType(ChannelCarouselCard), findsNWidgets(channelCount));
      expect(
        tester.widget<ChannelCarouselCard>(selected()).channelName,
        'Channel 0',
      );
      expect(tester.getCenter(selected()).dx, closeTo(_stripCentre, 0.01));
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

  testWidgets('a held key whose repeats keep arriving scrolls past 1000 ms', (
    tester,
  ) async {
    final centred = await pumpCarousel(tester, 20);

    // Key-down moves one card, then the 350 ms timer starts the hold cadence.
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    // Physical repeats every 100 ms out to 1200 ms, refreshing the watchdog.
    for (var elapsed = 100; elapsed <= 900; elapsed += 100) {
      await tester.pump(const Duration(milliseconds: 100));
      await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
    }
    // Key-down at 0 ms plus a move every 110 ms from 350 ms: a hold reads as
    // fast continuous motion, not one jump every half second.
    final movesBy900ms = centred.length;
    expect(movesBy900ms, greaterThanOrEqualTo(6));

    for (var elapsed = 1000; elapsed <= 1200; elapsed += 100) {
      await tester.pump(const Duration(milliseconds: 100));
      await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
    }

    // A watchdog measured from key-down would have cancelled the hold at
    // 900 ms. Incoming repeats keep it alive.
    expect(centred.length, greaterThan(movesBy900ms));

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
  });

  testWidgets('scrolling halts within ~900 ms of the last repeat when no '
      'key-up arrives', (tester) async {
    final centred = await pumpCarousel(tester, 20);

    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    // Repeats stop at 400 ms. No key-up ever arrives.
    for (var elapsed = 100; elapsed <= 400; elapsed += 100) {
      await tester.pump(const Duration(milliseconds: 100));
      await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
    }
    final movesAtLastRepeat = centred.length;

    // 400 ms + the 900 ms watchdog: the hold keeps running to 1300 ms and
    // then stops, because only a real repeat can postpone the watchdog.
    await tester.pump(const Duration(milliseconds: 900));
    final movesAtWatchdog = centred.length;
    expect(movesAtWatchdog, greaterThan(movesAtLastRepeat));

    await tester.pump(const Duration(seconds: 2));
    expect(centred.length, movesAtWatchdog);
  });

  testWidgets('timer-generated moves do not keep the watchdog alive', (
    tester,
  ) async {
    final centred = await pumpCarousel(tester, 20);

    // Key-down only: the hold's own timers are the sole source of movement.
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    expect(centred.length, 2, reason: 'key-down move plus the 350 ms move');

    // Timer-driven moves can't postpone the watchdog, so it fires 900 ms
    // after the key-down and every move after that is cancelled.
    await tester.pump(const Duration(milliseconds: 490));
    final movesAtWatchdog = centred.length;
    await tester.pump(const Duration(seconds: 2));
    expect(centred.length, movesAtWatchdog);

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
  });

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
