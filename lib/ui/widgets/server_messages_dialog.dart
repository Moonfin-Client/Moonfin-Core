import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/models/server_message.dart';
import '../../data/services/server_messages_service.dart';
import '../../l10n/app_localizations.dart';
import '../../util/focus/key_event_utils.dart';
import '../../util/overview_text.dart';
import '../navigation/app_router.dart';
import 'support_dialog.dart';
import 'track_selector_dialog.dart';

/// Colour used for a message and for the menu button when it is unread.
Color serverMessageColor(ServerMessageSeverity severity) => switch (severity) {
  ServerMessageSeverity.critical => AppColorScheme.statusError,
  ServerMessageSeverity.warning => AppColorScheme.statusPending,
  ServerMessageSeverity.info => AppColorScheme.statusAvailable,
};

IconData _severityIcon(ServerMessageSeverity severity) => switch (severity) {
  ServerMessageSeverity.critical => Icons.error_outline_rounded,
  ServerMessageSeverity.warning => Icons.warning_amber_rounded,
  ServerMessageSeverity.info => Icons.info_outline_rounded,
};

/// Route the server sends with a message push. Not a page: it tells the app to
/// open the messages window.
const serverMessagesPushRoute = 'messages';

/// Opens the messages window after a tap on a notification, where there is no
/// widget context to hand in.
void openServerMessagesFromNotification() {
  final context = appRouter.routerDelegate.navigatorKey.currentContext;
  if (context == null || !context.mounted) return;
  showServerMessagesDialog(context);
}

/// Opens the window listing the messages the server admin sent.
Future<void> showServerMessagesDialog(BuildContext context) {
  final service = GetIt.instance<ServerMessagesService>();

  return showStyledPlayerDialog<void>(
    context,
    title: AppLocalizations.of(context).serverMessages,
    builder: (dialogContext) => _ServerMessagesBody(service: service),
  );
}

class _ServerMessagesBody extends StatelessWidget {
  final ServerMessagesService service;

  const _ServerMessagesBody({required this.service});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        final messages = service.messages;

        if (messages.isEmpty) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
            child: Text(
              l10n.serverMessagesEmpty,
              style: TextStyle(
                fontSize: 14,
                color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final message in messages)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _MessageCard(
                          key: ValueKey(message.id),
                          message: message,
                          read: service.isRead(message.id),
                          onRead: () => service.markRead(message.id),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (service.unreadCount > 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: _DialogTextButton(
                  label: l10n.serverMessagesMarkAllRead,
                  onPressed: service.markAllRead,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _MessageCard extends StatefulWidget {
  final ServerMessage message;
  final bool read;
  final VoidCallback onRead;

  const _MessageCard({
    super.key,
    required this.message,
    required this.read,
    required this.onRead,
  });

  @override
  State<_MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<_MessageCard> {
  bool _expanded = false;
  bool _focused = false;

  void _toggle() {
    setState(() => _expanded = !_expanded);
    if (_expanded && !widget.read) {
      widget.onRead();
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;
    final color = serverMessageColor(message.severity);
    final body = cleanOverview(message.body);

    return Focus(
      onFocusChange: (focused) => setState(() => _focused = focused),
      onKeyEvent: (node, event) => handleOneShotSelect(event, _toggle),
      child: GestureDetector(
        onTap: _toggle,
        child: GlassSurface(
          cornerRadius: 16,
          reinforced: true,
          fallbackColor: AppColorScheme.surfaceVariant.withValues(alpha: 0.95),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(16),
              border: Border.fromBorderSide(
                _focused
                    ? BorderSide(color: color, width: 2)
                    : BorderSide(color: color.withValues(alpha: 0.35)),
              ),
            ),
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(_severityIcon(message.severity), size: 22, color: color),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              message.title.isNotEmpty
                                  ? message.title
                                  : AppLocalizations.of(
                                      context,
                                    ).serverMessages,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColorScheme.onSurface,
                              ),
                            ),
                          ),
                          if (!widget.read)
                            Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      if (message.createdUtc != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          DateFormat.yMMMd().add_jm().format(
                            message.createdUtc!.toLocal(),
                          ),
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.5,
                            ),
                          ),
                        ),
                      ],
                      if (body.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 150),
                          alignment: Alignment.topLeft,
                          child: Text(
                            body,
                            maxLines: _expanded ? null : 2,
                            overflow: _expanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.35,
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.75,
                              ),
                            ),
                          ),
                        ),
                      ],
                      if (_expanded && message.hasAction) ...[
                        const SizedBox(height: 10),
                        _DialogTextButton(
                          label: message.actionLabel!,
                          onPressed: () => showQrOrLaunch(
                            context,
                            url: message.actionUrl!,
                            title: message.actionLabel!,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Small button used inside the messages window. Focusable so a remote can
/// reach it.
class _DialogTextButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const _DialogTextButton({required this.label, required this.onPressed});

  @override
  State<_DialogTextButton> createState() => _DialogTextButtonState();
}

class _DialogTextButtonState extends State<_DialogTextButton> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) => setState(() => _focused = focused),
      onKeyEvent: (node, event) =>
          handleOneShotSelect(event, widget.onPressed),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _focused
                ? AppColorScheme.accent
                : AppColorScheme.accent.withValues(alpha: 0.16),
            borderRadius: AppRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _focused
                  ? AppColorScheme.onAccent
                  : AppColorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
