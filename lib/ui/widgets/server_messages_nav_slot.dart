import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/services/server_messages_service.dart';
import '../../preference/user_preferences.dart';
import 'server_messages_dialog.dart';

/// Wraps the messages button for a nav bar.
///
/// Renders nothing when the user turned the button off or the server has no
/// messages, so the menu never shows a button that does nothing. Unread
/// messages put a soft glow behind the icon in the colour of the most important
/// one. The icon itself keeps the normal menu colour.
class ServerMessagesNavSlot extends StatelessWidget {
  final WidgetBuilder builder;

  const ServerMessagesNavSlot({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    if (!GetIt.instance<UserPreferences>().get(
      UserPreferences.showServerMessagesButton,
    )) {
      return const SizedBox.shrink();
    }

    final service = GetIt.instance<ServerMessagesService>();

    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        if (service.messages.isEmpty) {
          return const SizedBox.shrink();
        }

        final button = builder(context);
        final severity = service.highestUnreadSeverity;
        if (severity == null) {
          return button;
        }

        // Sits behind the button and follows its size, so it keeps up with the
        // label opening and closing. The inset keeps the glow smaller than the
        // button so it reads as a hint rather than a filled disc.
        final glow = serverMessageColor(severity);
        return Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.circular(999),
                    color: glow.withValues(alpha: 0.07),
                    boxShadow: [
                      BoxShadow(
                        color: glow.withValues(alpha: 0.20),
                        blurRadius: 7,
                        spreadRadius: -2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            button,
          ],
        );
      },
    );
  }
}
