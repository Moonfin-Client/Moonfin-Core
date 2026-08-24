import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/services/server_messages_service.dart';
import '../../preference/user_preferences.dart';

/// Wraps the messages button for a nav bar.
///
/// Renders nothing when the user turned the button off or the server has no
/// messages, so the menu never shows a button that does nothing. Hands the
/// builder the number of unread messages, which the button draws as a red
/// circle on its icon.
class ServerMessagesNavSlot extends StatelessWidget {
  final Widget Function(BuildContext context, int unread) builder;

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

        return builder(context, service.unreadCount);
      },
    );
  }
}
