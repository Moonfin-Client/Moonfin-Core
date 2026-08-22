// Mirrors the synthetic key dispatch path used by tvOS/gamepad navigation.
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/sliding_pill_tabs.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  testWidgets(
    'vertical repeat stays on the pill but a new press enters results',
    (tester) async {
      final searchFocus = FocusNode(debugLabel: 'search');
      final tabsFocus = FocusNode(debugLabel: 'search_tabs');
      final resultsFocus = FocusNode(debugLabel: 'first_result');
      addTearDown(searchFocus.dispose);
      addTearDown(tabsFocus.dispose);
      addTearDown(resultsFocus.dispose);

      var verticalNavigationCalls = 0;
      var escapedDownEvents = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.buildTheme(ThemeRegistry.active),
          home: Scaffold(
            body: Focus(
              onKeyEvent: (_, event) {
                if ((event is KeyDownEvent || event is KeyRepeatEvent) &&
                    event.logicalKey == LogicalKeyboardKey.arrowDown) {
                  escapedDownEvents++;
                  resultsFocus.requestFocus();
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: Column(
                children: [
                  Focus(
                    focusNode: searchFocus,
                    onKeyEvent: (_, event) {
                      if ((event is KeyDownEvent || event is KeyRepeatEvent) &&
                          event.logicalKey == LogicalKeyboardKey.arrowDown) {
                        tabsFocus.requestFocus();
                        return KeyEventResult.handled;
                      }
                      return KeyEventResult.ignored;
                    },
                    child: const Text('Search'),
                  ),
                  SlidingPillTabs(
                    labels: const ['All', 'Series'],
                    selectedIndex: 0,
                    onChanged: (_) {},
                    focusNode: tabsFocus,
                    onVerticalNavigation: (isUp) {
                      verticalNavigationCalls++;
                      if (!isUp) resultsFocus.requestFocus();
                      return !isUp;
                    },
                  ),
                  Focus(
                    focusNode: resultsFocus,
                    child: const Text('First result'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      void dispatch(KeyEvent event) {
        ServicesBinding.instance.keyEventManager.keyMessageHandler?.call(
          KeyMessage([event], null),
        );
      }

      KeyEvent downEvent(Type type) {
        if (type == KeyRepeatEvent) {
          return KeyRepeatEvent(
            physicalKey: PhysicalKeyboardKey.arrowDown,
            logicalKey: LogicalKeyboardKey.arrowDown,
            timeStamp: Duration.zero,
          );
        }
        return KeyDownEvent(
          physicalKey: PhysicalKeyboardKey.arrowDown,
          logicalKey: LogicalKeyboardKey.arrowDown,
          timeStamp: Duration.zero,
        );
      }

      searchFocus.requestFocus();
      await tester.pump();

      dispatch(downEvent(KeyDownEvent));
      await tester.pump();
      expect(tabsFocus.hasFocus, isTrue);
      expect(verticalNavigationCalls, 0);

      dispatch(downEvent(KeyRepeatEvent));
      await tester.pump();
      expect(tabsFocus.hasFocus, isTrue);
      expect(verticalNavigationCalls, 0);
      expect(escapedDownEvents, 0);

      dispatch(
        KeyUpEvent(
          physicalKey: PhysicalKeyboardKey.arrowDown,
          logicalKey: LogicalKeyboardKey.arrowDown,
          timeStamp: Duration.zero,
        ),
      );
      dispatch(downEvent(KeyDownEvent));
      await tester.pump();
      expect(resultsFocus.hasFocus, isTrue);
      expect(verticalNavigationCalls, 1);
      expect(escapedDownEvents, 0);
    },
  );
}
