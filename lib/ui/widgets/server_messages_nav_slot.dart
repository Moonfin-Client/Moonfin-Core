import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/services/server_messages_service.dart';
import '../../preference/user_preferences.dart';

/// Wraps the messages button for a nav bar.
///
/// Renders nothing when the user turned the button off or the server has no
/// messages, so the menu never shows a button that does nothing. Unread
/// messages get a faint plate behind the icon. The colour an admin picks for a
/// message is only used inside the messages window, not here, so the menu stays
/// calm no matter what was posted.
class ServerMessagesNavSlot extends StatelessWidget {
  final Widget Function(BuildContext context, Color? glow) builder;

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

        // The button paints this itself, so it lines up with the icon and keeps
        // up with the label opening and closing.
        return builder(
          context,
          service.hasUnread
              ? AppColorScheme.onSurface.withValues(alpha: 0.16)
              : null,
        );
      },
    );
  }
}
