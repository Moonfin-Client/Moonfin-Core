import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/calendar_entry.dart';
import 'package:moonfin/data/models/upcoming_episode_info.dart';
import 'package:moonfin/data/repositories/calendar_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/playback/next_up_overlay.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Calendar extends Mock implements CalendarRepository {}

final _reminder = CalendarEntry(
  key: 'episode:371980:2:4',
  kind: CalendarEntryKind.episode,
  release: CalendarRelease.airing,
  date: DateTime(2026, 11, 12),
  hasTime: false,
  title: 'Severance',
  seasonNumber: 2,
  episodeNumber: 4,
  tvdbId: 371980,
);

void main() {
  late AppLocalizations l10n;
  late _Calendar calendar;

  setUpAll(() => registerFallbackValue(_reminder));

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    calendar = _Calendar();
    when(() => calendar.reminderKeys()).thenAnswer((_) async => <String>{});
    when(() => calendar.setReminder(any(), any())).thenAnswer(
      (invocation) async => invocation.positionalArguments[1] as bool,
    );
    GetIt.instance.registerSingleton<CalendarRepository>(calendar);
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
    l10n = lookupAppLocalizations(const Locale('en'));
  });

  tearDown(() => GetIt.instance.reset());

  Future<void> pump(
    WidgetTester tester, {
    CalendarEntry? reminder,
    VoidCallback? onDismiss,
    FocusNode? focusNode,
  }) async {
    final now = DateTime.now();
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Stack(
          children: [
            NextUpOverlay.airDate(
              airDate: UpcomingEpisodeInfo(
                seasonNumber: 2,
                episodeNumber: 4,
                airDate: DateTime(now.year, now.month, now.day + 3, 21),
              ),
              airDateTitle: 'Woe\'s Hollow',
              reminder: reminder,
              timeoutMs: 0,
              onDismiss: onDismiss ?? () {},
              focusNode: focusNode,
            ),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('says which episode airs and when', (tester) async {
    await pump(tester);
    expect(find.text('S2:E4'), findsOneWidget);
    expect(find.text('Woe\'s Hollow'), findsOneWidget);
    expect(find.textContaining('In 3 days'), findsOneWidget);
    expect(find.text(l10n.playNext), findsNothing);
  });

  testWidgets('without a reminder the close button is the one to focus', (
    tester,
  ) async {
    var dismissed = false;
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    await pump(tester, focusNode: focusNode, onDismiss: () => dismissed = true);
    expect(find.text(l10n.calendarRemindMe), findsNothing);

    focusNode.requestFocus();
    await tester.pump();
    expect(
      find.ancestor(
        of: find.byIcon(Icons.close_rounded),
        matching: find.byWidgetPredicate(
          (w) => w is Focus && w.focusNode == focusNode,
        ),
      ),
      findsOneWidget,
    );
    await tester.tap(find.byIcon(Icons.close_rounded));
    expect(dismissed, isTrue);
  });

  testWidgets('Remind me sets the reminder and then reads as set', (
    tester,
  ) async {
    await pump(tester, reminder: _reminder);
    await tester.tap(find.text(l10n.calendarRemindMe));
    await tester.pumpAndSettle();

    verify(() => calendar.setReminder(_reminder, true)).called(1);
    expect(find.text(l10n.calendarReminderSet), findsOneWidget);
  });

  testWidgets('a reminder already on the server reads as set', (tester) async {
    when(() => calendar.reminderKeys())
        .thenAnswer((_) async => {'episode:371980:2:4'});
    await pump(tester, reminder: _reminder);
    expect(find.text(l10n.calendarReminderSet), findsOneWidget);
  });
}
