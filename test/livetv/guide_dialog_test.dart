import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playback_core/playback_core.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_window.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_guide_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockPlaybackManager extends Mock implements PlaybackManager {}

/// The window's left edge, computed exactly as the screen computes it: the
/// previous quarter hour less the fifteen-minute back-slice. Captured once per
/// test so the fixture and the screen share one origin.
late DateTime _windowStart;

/// `AlertDialog.adaptive` builds a private subclass, which `find.byType` will
/// not match, so match the supertype instead.
final Finder _alertDialog = find.byWidgetPredicate((w) => w is AlertDialog);

Map<String, dynamic> _channelRaw(String id, String name) => <String, dynamic>{
  'Id': id,
  'Name': name,
  'ChannelNumber': '1',
  'ImageTags': <String, dynamic>{},
  'UserData': <String, dynamic>{'IsFavorite': false},
};

/// A program clipped to the same window every case shares, so cell 0 is
/// always this program regardless of how short its real span is.
Map<String, dynamic> _programRaw({
  required String channelId,
  required DateTime start,
  required DateTime end,
  bool isSeries = false,
  bool hasTimer = false,
}) => <String, dynamic>{
  'Id': '$channelId-p',
  'ChannelId': channelId,
  'Name': '$channelId show',
  'StartDate': start.toIso8601String(),
  'EndDate': end.toIso8601String(),
  'IsSeries': isSeries,
  if (hasTimer) 'TimerId': '$channelId-t',
};

/// Every focus node in the guide carries a debug label, the only handle a
/// test has on the rows' private nodes. Shared with guide_navigation_widget_test.dart.
FocusNode _nodeLabelled(WidgetTester tester, String label) => tester
    .widgetList<Focus>(find.byType(Focus))
    .map((focus) => focus.focusNode)
    .whereType<FocusNode>()
    .firstWhere((node) => node.debugLabel == label);

/// Whether the widget subtree rooted at the current primary focus contains a
/// [Text] with the given data. Used instead of comparing [FocusNode] identity
/// directly, since Material buttons own their focus nodes internally.
bool _primaryFocusHasText(String text) {
  final context = FocusManager.instance.primaryFocus?.context;
  if (context == null) return false;
  var found = false;
  void visit(Element element) {
    if (found) return;
    final widget = element.widget;
    if (widget is Text && widget.data == text) {
      found = true;
      return;
    }
    element.visitChildren(visit);
  }

  visit(context as Element);
  return found;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMediaServerClient client;
  late _MockLiveTvApi liveTvApi;
  late List<Map<String, dynamic>> channels;
  late List<Map<String, dynamic>> programs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    channels = <Map<String, dynamic>>[];
    programs = <Map<String, dynamic>>[];
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
    ).thenAnswer((_) async => <String, dynamic>{'Items': programs});

    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  Future<void> pumpGuide(
    WidgetTester tester, {
    bool miniPlayerMode = false,
    ValueChanged<String>? onChannelSelected,
  }) async {
    tester.view.physicalSize = const Size(900, 700);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final guide = LiveTvGuideScreen(
      miniPlayerMode: miniPlayerMode,
      embedded: miniPlayerMode,
      onChannelSelected: miniPlayerMode ? (onChannelSelected ?? (_) {}) : null,
      onClose: miniPlayerMode ? () {} : null,
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // Embedded mode drops the guide's own Scaffold because the host
        // supplies it; stand in for that host here.
        home: miniPlayerMode
            ? Material(color: Colors.black, child: guide)
            : guide,
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> openDialogOnRow0(WidgetTester tester) async {
    _nodeLabelled(tester, 'GuideProgramRow0:0').requestFocus();
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
  }

  testWidgets(
    'opening the dialog leaves Watch holding primary focus, not Record',
    (tester) async {
      channels = [_channelRaw('cA', 'Channel A')];
      // Spans the whole window, whatever width the surface derives, so the
      // programme is neither ended nor future and cell 0 is always it.
      programs = [
        _programRaw(
          channelId: 'cA',
          start: _windowStart.subtract(const Duration(minutes: 30)),
          end: _windowStart.add(const Duration(hours: 13)),
        ),
      ];

      await pumpGuide(tester);
      await openDialogOnRow0(tester);

      expect(_alertDialog, findsOneWidget);
      final l10n = AppLocalizations.of(tester.element(_alertDialog));
      expect(_primaryFocusHasText(l10n.watch), isTrue);
      expect(_primaryFocusHasText(l10n.record), isFalse);
    },
  );

  testWidgets('an ended series programme offers no single-episode record '
      'action but offers series recording', (tester) async {
    channels = [_channelRaw('cB', 'Channel B')];
    programs = [
      _programRaw(
        channelId: 'cB',
        start: _windowStart.subtract(const Duration(hours: 1)),
        // The back-slice is fifteen to thirty minutes wide, so a cell ending
        // five minutes into the window has certainly ended by now.
        end: _windowStart.add(const Duration(minutes: 5)),
        isSeries: true,
      ),
    ];

    await pumpGuide(tester);
    await openDialogOnRow0(tester);

    expect(_alertDialog, findsOneWidget);
    final l10n = AppLocalizations.of(tester.element(_alertDialog));
    expect(find.text(l10n.record), findsNothing);
    expect(find.text(l10n.cancelRecordingAction), findsNothing);
    expect(find.text(l10n.recordSeries), findsOneWidget);
  });

  testWidgets('an ended non-series programme offers no record action and no '
      'series action either', (tester) async {
    channels = [_channelRaw('cC', 'Channel C')];
    programs = [
      _programRaw(
        channelId: 'cC',
        start: _windowStart.subtract(const Duration(hours: 1)),
        end: _windowStart.add(const Duration(minutes: 5)),
        isSeries: false,
      ),
    ];

    await pumpGuide(tester);
    await openDialogOnRow0(tester);

    expect(_alertDialog, findsOneWidget);
    final l10n = AppLocalizations.of(tester.element(_alertDialog));
    expect(find.text(l10n.record), findsNothing);
    expect(find.text(l10n.cancelRecordingAction), findsNothing);
    expect(find.text(l10n.recordSeries), findsNothing);
    expect(find.text(l10n.cancelSeriesRecording), findsNothing);
  });

  testWidgets('a programme recording right now focuses cancelling it, not '
      'Watch', (tester) async {
    channels = [_channelRaw('cE', 'Channel E')];
    programs = [
      _programRaw(
        channelId: 'cE',
        start: _windowStart.subtract(const Duration(minutes: 30)),
        end: _windowStart.add(const Duration(hours: 13)),
        hasTimer: true,
      ),
    ];

    await pumpGuide(tester);
    await openDialogOnRow0(tester);

    expect(_alertDialog, findsOneWidget);
    final l10n = AppLocalizations.of(tester.element(_alertDialog));
    expect(_primaryFocusHasText(l10n.cancelRecordingAction), isTrue);
    expect(_primaryFocusHasText(l10n.watch), isFalse);
  });

  testWidgets('arrow keys move between sort options instead of committing one '
      'and closing', (tester) async {
    channels = [_channelRaw('cF', 'Channel F')];
    programs = [
      _programRaw(
        channelId: 'cF',
        start: _windowStart.subtract(const Duration(minutes: 30)),
        end: _windowStart.add(const Duration(hours: 13)),
      ),
    ];

    await pumpGuide(tester);
    await tester.tap(find.byIcon(Icons.sort));
    await tester.pumpAndSettle();
    expect(_alertDialog, findsOneWidget);

    final first = ChannelSortBy.values.first;
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();

    expect(_alertDialog, findsOneWidget, reason: 'the dialog must stay open');
    expect(
      _primaryFocusHasText(ChannelSortBy.values[1].displayName),
      isTrue,
      reason: 'DOWN moves focus to the next option',
    );
    expect(
      GetIt.instance<UserPreferences>().get(
        UserPreferences.liveTvChannelSortBy,
      ),
      first,
      reason: 'moving must not commit a sort',
    );
  });

  testWidgets('in miniPlayerMode centre-press tunes and no dialog appears', (
    tester,
  ) async {
    channels = [_channelRaw('cD', 'Channel D')];
    programs = [
      _programRaw(
        channelId: 'cD',
        start: _windowStart.subtract(const Duration(minutes: 30)),
        end: _windowStart.add(const Duration(hours: 13)),
      ),
    ];
    String? tunedChannelId;

    await pumpGuide(
      tester,
      miniPlayerMode: true,
      onChannelSelected: (id) => tunedChannelId = id,
    );
    await openDialogOnRow0(tester);

    expect(_alertDialog, findsNothing);
    expect(tunedChannelId, 'cD');
  });
}
