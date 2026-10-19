import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:moonfin/data/services/access_schedule_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/ui/widgets/times_up_gate.dart';
import 'package:server_core/server_core.dart';

// 2026-10-19 is a Monday.
DateTime _at(int day, int hour, [int minute = 0]) =>
    DateTime(2026, 10, day, hour, minute);

AccessSchedule _entry(String day, num start, num end) => AccessSchedule(
  dayOfWeek: day,
  startHour: start.toDouble(),
  endHour: end.toDouble(),
);

/// A service that finds the user outside their window on Monday evening, with
/// the window opening again on Tuesday morning.
AccessScheduleService _closedService(List<AccessSchedule> schedules) {
  final service = AccessScheduleService(
    now: () => _at(19, 21),
    loadSchedules: (_) async => schedules,
    onBlocked: () async {},
  );
  return service;
}

Widget _app(
  AccessScheduleService service, {
  Future<void> Function()? onSwitch,
  ValueNotifier<String>? path,
  Widget underneath = const Center(child: Text('the app')),
  DateTime Function()? clock,
}) {
  final route = path ?? ValueNotifier('/home');
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Stack(
      fit: StackFit.expand,
      children: [
        underneath,
        TimesUpGate(
          service: service,
          onSwitchUser: onSwitch,
          now: clock ?? () => _at(19, 21),
          currentPath: () => route.value,
          routeChanges: route,
        ),
      ],
    ),
  );
}

/// Takes the gate off screen and stops the service, whose timer would
/// otherwise still be pending when the test ends.
Future<void> _done(WidgetTester tester, AccessScheduleService service) async {
  await tester.pumpWidget(const SizedBox.shrink());
  service.dispose();
}

/// How the app writes a time, which Intl spaces with a narrow no-break space.
String _time(DateTime moment, {bool use24Hour = false}) =>
    (use24Hour ? DateFormat.Hm('en') : DateFormat.jm('en')).format(moment);

void main() {
  testWidgets('shows nothing while the user is allowed', (tester) async {
    final service = _closedService([_entry('Monday', 8, 22)]);
    service.setUser('child');
    await tester.pumpWidget(_app(service));
    await tester.pump();

    expect(find.text("Time's up"), findsNothing);
    expect(find.text('the app'), findsOneWidget);
    await _done(tester, service);
  });

  testWidgets('covers the app with the next opening when closed', (
    tester,
  ) async {
    final service = _closedService([
      _entry('Monday', 8, 20),
      _entry('Tuesday', 8, 20),
    ]);
    service.setUser('child');
    await tester.pumpWidget(_app(service));
    await tester.pump();

    expect(find.text("Time's up"), findsOneWidget);
    expect(
      find.text("This account isn't available right now."),
      findsOneWidget,
    );
    expect(
      find.text('You can use it again tomorrow at ${_time(_at(20, 8))}.'),
      findsOneWidget,
    );
    expect(find.text('Switch User'), findsOneWidget);
    await _done(tester, service);
  });

  testWidgets('goes away by itself when the user is no longer watched', (
    tester,
  ) async {
    final service = _closedService([_entry('Monday', 8, 20)]);
    service.setUser('child');
    await tester.pumpWidget(_app(service));
    await tester.pump();
    expect(find.text("Time's up"), findsOneWidget);

    service.setUser(null);
    await tester.pump();

    expect(find.text("Time's up"), findsNothing);
    await _done(tester, service);
  });

  testWidgets('puts the focus on Switch User and runs it when pressed', (
    tester,
  ) async {
    var switched = 0;
    final service = _closedService([_entry('Monday', 8, 20)]);
    service.setUser('child');
    await tester.pumpWidget(_app(service, onSwitch: () async => switched++));
    await tester.pump();

    final button = find.widgetWithText(FilledButton, 'Switch User');
    final focused = FocusManager.instance.primaryFocus?.context;
    expect(
      focused?.findAncestorWidgetOfExactType<FilledButton>(),
      isNotNull,
      reason: 'the D-pad has to start on the only button',
    );

    await tester.tap(button);
    await tester.pump();
    expect(switched, 1);
    await _done(tester, service);
  });

  testWidgets('does not let a tap through to the app underneath', (
    tester,
  ) async {
    var taps = 0;
    final service = _closedService([_entry('Monday', 8, 20)]);
    service.setUser('child');
    await tester.pumpWidget(
      _app(
        service,
        onSwitch: () async {},
        underneath: GestureDetector(onTap: () => taps++),
      ),
    );
    await tester.pump();

    await tester.tapAt(const Offset(10, 10));
    expect(taps, 0);
    await _done(tester, service);
  });

  testWidgets('takes the focus off a button on the screen underneath', (
    tester,
  ) async {
    final service = _closedService([_entry('Monday', 8, 20)]);
    await tester.pumpWidget(
      _app(
        service,
        underneath: Center(
          child: ElevatedButton(
            autofocus: true,
            onPressed: () {},
            child: const Text('underneath'),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(
      FocusManager.instance.primaryFocus?.context
          ?.findAncestorWidgetOfExactType<ElevatedButton>(),
      isNotNull,
      reason: 'the screen underneath has the focus to begin with',
    );

    service.setUser('child');
    await tester.pump();
    await tester.pump();

    final focused = FocusManager.instance.primaryFocus?.context;
    expect(focused?.findAncestorWidgetOfExactType<FilledButton>(), isNotNull);
    expect(focused?.findAncestorWidgetOfExactType<ElevatedButton>(), isNull);
    await _done(tester, service);
  });

  testWidgets('the screen underneath cannot take the focus back', (
    tester,
  ) async {
    final underneath = FocusNode();
    addTearDown(underneath.dispose);
    final route = ValueNotifier('/home');
    final service = _closedService([_entry('Monday', 8, 20)]);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Stack(
          fit: StackFit.expand,
          children: [
            TimesUpFocusGuard(
              service: service,
              currentPath: () => route.value,
              routeChanges: route,
              child: Center(
                child: ElevatedButton(
                  focusNode: underneath,
                  autofocus: true,
                  onPressed: () {},
                  child: const Text('underneath'),
                ),
              ),
            ),
            TimesUpGate(
              service: service,
              onSwitchUser: () async {},
              now: () => _at(19, 21),
              currentPath: () => route.value,
              routeChanges: route,
            ),
          ],
        ),
      ),
    );
    await tester.pump();
    expect(underneath.hasPrimaryFocus, isTrue);

    service.setUser('child');
    await tester.pump();
    await tester.pump();
    // The home screen asking for focus as it appears, after the gate has it.
    underneath.requestFocus();
    await tester.pump();

    expect(underneath.hasPrimaryFocus, isFalse);
    final focused = FocusManager.instance.primaryFocus?.context;
    expect(focused?.findAncestorWidgetOfExactType<FilledButton>(), isNotNull);

    // Out of the way for the user picker, which has to be able to take focus.
    route.value = '/server';
    await tester.pump();
    underneath.requestFocus();
    await tester.pump();
    expect(underneath.hasPrimaryFocus, isTrue);
    await _done(tester, service);
  });

  testWidgets('an arrow key cannot take the focus off the button', (
    tester,
  ) async {
    final service = _closedService([_entry('Monday', 8, 20)]);
    service.setUser('child');
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // Stands in for the app's own key handling, where Up drops the focus.
        home: Focus(
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.arrowUp) {
              FocusManager.instance.primaryFocus?.unfocus();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              TimesUpGate(
                service: service,
                onSwitchUser: () async {},
                now: () => _at(19, 21),
                currentPath: () => '/home',
                routeChanges: ValueNotifier('/home'),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    for (final key in [
      LogicalKeyboardKey.arrowUp,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowLeft,
      LogicalKeyboardKey.arrowRight,
    ]) {
      await tester.sendKeyEvent(key);
      await tester.pump();

      final focused = FocusManager.instance.primaryFocus?.context;
      expect(
        focused?.findAncestorWidgetOfExactType<FilledButton>(),
        isNotNull,
        reason: '$key took the focus off Switch User',
      );
    }
    await _done(tester, service);
  });

  testWidgets('turns tomorrow into today when midnight passes', (tester) async {
    var moment = _at(19, 21);
    final service = AccessScheduleService(
      now: () => moment,
      loadSchedules: (_) async => [
        _entry('Monday', 8, 20),
        _entry('Tuesday', 8, 20),
      ],
      onBlocked: () async {},
    );
    service.setUser('child');
    await tester.pumpWidget(_app(service, clock: () => moment));
    await tester.pump();
    final opening = _time(_at(20, 8));
    expect(
      find.text('You can use it again tomorrow at $opening.'),
      findsOneWidget,
    );

    // Nothing about the opening changes overnight, only what to call the day.
    moment = _at(20, 0, 30);
    await tester.pump(const Duration(hours: 3));

    expect(
      find.text('You can use it again today at $opening.'),
      findsOneWidget,
    );
    await _done(tester, service);
  });

  testWidgets('steps aside for the user picker and comes back after it', (
    tester,
  ) async {
    final route = ValueNotifier('/home');
    final service = _closedService([_entry('Monday', 8, 20)]);
    service.setUser('child');
    await tester.pumpWidget(_app(service, path: route));
    await tester.pump();
    expect(find.text("Time's up"), findsOneWidget);

    route.value = '/server';
    await tester.pump();
    expect(find.text("Time's up"), findsNothing);

    route.value = '/home';
    await tester.pump();
    expect(find.text("Time's up"), findsOneWidget);
    await _done(tester, service);
  });

  test('is only showing off the sign in pages', () async {
    final service = AccessScheduleService(
      now: () => _at(19, 21),
      loadSchedules: (_) async => [_entry('Monday', 8, 20)],
      onBlocked: () async {},
    );
    service.setUser('child');
    await Future<void>.delayed(Duration.zero);

    expect(
      TimesUpGate.isShowing(service: service, currentPath: () => '/home'),
      isTrue,
    );
    expect(
      TimesUpGate.isShowing(
        service: service,
        currentPath: () => '/player/video',
      ),
      isTrue,
    );
    expect(
      TimesUpGate.isShowing(service: service, currentPath: () => '/server'),
      isFalse,
    );
    expect(
      TimesUpGate.isShowing(service: service, currentPath: () => '/login'),
      isFalse,
    );
    service.setUser(null);
    expect(
      TimesUpGate.isShowing(service: service, currentPath: () => '/home'),
      isFalse,
    );
    service.dispose();
  });

  group('timesUpResumeMessage', () {
    final l10n = AppLocalizationsEn();

    String? message(DateTime? next, {bool use24Hour = false}) =>
        timesUpResumeMessage(
          l10n: l10n,
          nextAccess: next,
          now: _at(19, 12),
          use24Hour: use24Hour,
        );

    test('names nothing when there is no later opening', () {
      expect(message(null), isNull);
    });

    test('says today for a later time the same day', () {
      expect(
        message(_at(19, 16, 30)),
        'You can use it again today at ${_time(_at(19, 16, 30))}.',
      );
    });

    test('says tomorrow for the next day', () {
      expect(
        message(_at(20, 8)),
        'You can use it again tomorrow at ${_time(_at(20, 8))}.',
      );
    });

    test('names the day when it is further away', () {
      expect(
        message(_at(22, 9)),
        'You can use it again on Thursday at ${_time(_at(22, 9))}.',
      );
    });

    test('names the date once the weekday would be today\'s', () {
      // A week from Monday the 19th is Monday again.
      expect(
        message(_at(26, 9)),
        'You can use it again on Monday, October 26 at ${_time(_at(26, 9))}.',
      );
    });

    test('follows the 24 hour setting', () {
      expect(
        message(_at(19, 16, 30), use24Hour: true),
        'You can use it again today at ${_time(_at(19, 16, 30), use24Hour: true)}.',
      );
    });
  });
}
