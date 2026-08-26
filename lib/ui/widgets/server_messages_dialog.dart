import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/models/server_message.dart';
import '../../data/services/server_messages_service.dart';
import '../../l10n/app_localizations.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/focus/key_event_utils.dart';
import '../../util/overview_text.dart';
import '../navigation/app_router.dart';
import 'support_dialog.dart';
import 'track_selector_dialog.dart';

/// The colour the admin picked, as drawn in the app. Fixed values rather than
/// theme tokens, so a message marked blue looks blue on every theme.
Color serverMessageColor(ServerMessageColor color) => switch (color) {
  ServerMessageColor.green => const Color(0xFF4CAF6D),
  ServerMessageColor.red => const Color(0xFFE05260),
  ServerMessageColor.yellow => const Color(0xFFE0B040),
  ServerMessageColor.blue => const Color(0xFF4A9EE0),
  ServerMessageColor.white => const Color(0xFFE8EAED),
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

bool _dialogOpen = false;

/// Opens the window listing the messages the server admin sent.
///
/// Only one at a time. The window follows the service, so a message that
/// arrives while it is open shows up in place, and opening another over it
/// would just stack two copies of the same list.
Future<void> showServerMessagesDialog(BuildContext context) {
  if (_dialogOpen) return Future<void>.value();
  final service = GetIt.instance<ServerMessagesService>();

  // The shared default of 440 leaves a long message in a narrow column, which
  // reads badly on a TV. Never go under the 340 the dialog asks for, or the
  // constraints stop being valid on a small phone.
  final width = MediaQuery.sizeOf(context).width;

  _dialogOpen = true;
  return showStyledPlayerDialog<void>(
    context,
    title: AppLocalizations.of(context).serverMessages,
    maxWidth: math.max(340.0, math.min(width - 80, 720.0)),
    builder: (dialogContext) => _ServerMessagesBody(service: service),
  ).whenComplete(() => _dialogOpen = false);
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
  final _cardFocus = FocusNode(debugLabel: 'ServerMessageCard');
  final _actionFocus = FocusNode(debugLabel: 'ServerMessageAction');
  bool _expanded = false;
  bool _focused = false;

  @override
  void dispose() {
    _cardFocus.dispose();
    _actionFocus.dispose();
    super.dispose();
  }

  void _toggle() {
    // Collapsing takes the button away, so pull focus back to the card first
    // or it lands nowhere.
    if (_expanded && _actionFocus.hasFocus) {
      _cardFocus.requestFocus();
    }
    setState(() => _expanded = !_expanded);
    if (_expanded && !widget.read) {
      widget.onRead();
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;
    final color = serverMessageColor(message.color);
    final body = cleanOverview(message.body);

    final canEnterAction = _expanded && message.hasAction;

    return Focus(
      focusNode: _cardFocus,
      onFocusChange: (focused) => setState(() => _focused = focused),
      onKeyEvent: (node, event) {
        // The card wraps its button, so the button sits inside the card's own
        // rectangle and never counts as being below it. Without this, pressing
        // down skips to the next message and the button cannot be reached with
        // a remote.
        //
        // Only when the card itself holds focus. Key events travel up from the
        // button to here, so without that check pressing down on the button
        // would send focus straight back to it and trap the remote.
        if (canEnterAction &&
            _cardFocus.hasPrimaryFocus &&
            event.isActionable &&
            event.logicalKey.isDownKey) {
          _actionFocus.requestFocus();
          return KeyEventResult.handled;
        }
        return handleOneShotSelect(event, _toggle);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _toggle,
          child: GlassSurface(
            cornerRadius: 16,
            reinforced: true,
            fallbackColor: AppColorScheme.surfaceVariant.withValues(
              alpha: 0.95,
            ),
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
                  Icon(Icons.info_outline_rounded, size: 22, color: color),
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
                            child: _expanded
                                ? _MessageBody(markdown: body)
                                : Text(
                                    stripMarkdown(body),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: _bodyTextStyle,
                                  ),
                          ),
                        ],
                        if (_expanded && message.hasAction) ...[
                          const SizedBox(height: 10),
                          _DialogTextButton(
                            focusNode: _actionFocus,
                            onFocusUp: _cardFocus.requestFocus,
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
      ),
    );
  }
}

/// Small button used inside the messages window. Focusable so a remote can
/// reach it.
class _DialogTextButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final FocusNode? focusNode;

  /// Called when the remote presses up, so the card that owns this button can
  /// take focus back instead of the list jumping past it.
  final VoidCallback? onFocusUp;

  const _DialogTextButton({
    required this.label,
    required this.onPressed,
    this.focusNode,
    this.onFocusUp,
  });

  @override
  State<_DialogTextButton> createState() => _DialogTextButtonState();
}

class _DialogTextButtonState extends State<_DialogTextButton> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (focused) => setState(() => _focused = focused),
      onKeyEvent: (node, event) {
        final goUp = widget.onFocusUp;
        if (goUp != null && event.isActionable && event.logicalKey.isUpKey) {
          goUp();
          return KeyEventResult.handled;
        }
        return handleOneShotSelect(event, widget.onPressed);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
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
      ),
    );
  }
}

final _bodyTextStyle = TextStyle(
  fontSize: 13,
  height: 1.35,
  color: AppColorScheme.onSurface.withValues(alpha: 0.75),
);

/// Markdown syntax to drop from the one-line preview on a collapsed card, so it
/// reads as a sentence instead of showing asterisks and hashes.
final _markdownNoise = RegExp(
  r'^\s{0,3}#{1,6}\s+|^\s{0,3}>\s?|^\s{0,3}[-*+]\s+',
  multiLine: true,
);
final _markdownEmphasis = RegExp(r'(\*{1,3}|_{1,3}|`)');
final _markdownLink = RegExp(r'\[([^\]]*)\]\([^)]*\)');

/// Flattens markdown to plain text for the collapsed preview.
String stripMarkdown(String source) => source
    .replaceAll(_markdownNoise, '')
    .replaceAllMapped(_markdownLink, (m) => m[1] ?? '')
    .replaceAll(_markdownEmphasis, '')
    .replaceAll(RegExp(r'\n{2,}'), '\n')
    .trim();

/// The formatted body of an opened message.
///
/// Images are dropped on purpose: the body is admin free text, and loading a
/// remote image from it would reach out to whatever host it names.
class _MessageBody extends StatelessWidget {
  final String markdown;

  const _MessageBody({required this.markdown});

  @override
  Widget build(BuildContext context) {
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.75);

    return MarkdownBody(
      data: markdown,
      shrinkWrap: true,
      // The package defaults to GitHub flavour, which adds tables and task lists.
      // Those do not fit a narrow card, so this keeps to plain CommonMark:
      // headings, bold, italic, lists, quotes, code and links.
      extensionSet: md.ExtensionSet.commonMark,
      selectable: false,
      imageBuilder: (_, _, _) => const SizedBox.shrink(),
      onTapLink: (text, href, title) {
        final url = ServerMessage.webLink(href);
        if (url == null) return;
        showQrOrLaunch(context, url: url, title: text.isEmpty ? url : text);
      },
      // Based on the app theme so every element the parser can produce gets a
      // readable colour, not just the handful spelled out below.
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        p: _bodyTextStyle,
        h1: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: AppColorScheme.onSurface,
        ),
        h2: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: AppColorScheme.onSurface,
        ),
        h3: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColorScheme.onSurface,
        ),
        strong: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColorScheme.onSurface,
        ),
        em: const TextStyle(fontStyle: FontStyle.italic),
        a: TextStyle(color: AppColorScheme.accent),
        listBullet: _bodyTextStyle,
        blockquote: _bodyTextStyle,
        code: TextStyle(fontFamily: 'monospace', fontSize: 12, color: muted),
        del: _bodyTextStyle.copyWith(decoration: TextDecoration.lineThrough),
        codeblockDecoration: BoxDecoration(
          color: AppColorScheme.onSurface.withValues(alpha: 0.07),
          borderRadius: AppRadius.circular(6),
        ),
        blockquoteDecoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppColorScheme.onSurface.withValues(alpha: 0.25),
              width: 3,
            ),
          ),
        ),
        blockquotePadding: const EdgeInsets.only(left: 10),
        blockSpacing: 6,
      ),
    );
  }
}
