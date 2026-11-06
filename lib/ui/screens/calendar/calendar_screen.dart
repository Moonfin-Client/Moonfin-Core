import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../navigation/destinations.dart';
import '../../widgets/navigation_layout.dart';
import 'calendar_agenda_view.dart';
import 'calendar_controller.dart';
import 'calendar_countdown_view.dart';

export 'calendar_month_screen.dart' show CalendarMonthScreen;

/// What the Calendar button opens: the user's calendar style. Both styles
/// have a Full calendar button that pushes the month grid.
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _controller = CalendarController();
  late CalendarStyle _style = _prefs.get(UserPreferences.calendarStyle);

  @override
  void initState() {
    super.initState();
    _prefs.addListener(_onPrefs);
    _controller.load();
  }

  void _onPrefs() {
    final style = _prefs.get(UserPreferences.calendarStyle);
    if (style != _style && mounted) setState(() => _style = style);
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPrefs);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        activeRoute: Destinations.calendar,
        // Countdown scrolls as one page, so its top bar slides away like
        // Home's. Agenda only scrolls inside its list.
        pinTopToolbar: _style == CalendarStyle.agenda,
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) => switch (_style) {
            CalendarStyle.agenda => CalendarAgendaView(controller: _controller),
            CalendarStyle.countdown => CalendarCountdownView(
              controller: _controller,
            ),
          },
        ),
      ),
    );
  }
}
