import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../watch_party/silo_watch_party_manager.dart';
import '../../screens/watch_party/silo_watch_party_screen.dart'
    show memberAvatarUrl;
import '../overlay_sheet.dart';
import '../user_avatar_image.dart';

/// The Watch Party's in-player control, in SyncPlay's place on Silo: a sheet
/// with the room's code and status, who is watching, and the host's way
/// back to the lobby or a member's way out. Empty outside a playing room.
class WatchPartyPlayerButton extends StatelessWidget {
  const WatchPartyPlayerButton({super.key, this.size = 24, this.extent = 48});

  final double size;
  final double extent;

  SiloWatchPartyManager get _manager => GetIt.instance<SiloWatchPartyManager>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _manager,
      builder: (context, _) {
        final l10n = AppLocalizations.of(context);
        if (!_manager.controlsPlayback) return const SizedBox.shrink();
        return SizedBox(
          width: extent,
          height: extent,
          child: IconButton(
            tooltip: l10n.watchParty,
            onPressed: () => _showSheet(context),
            icon: Icon(
              Icons.groups_rounded,
              color: AppColorScheme.onSurface,
              size: size,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        );
      },
    );
  }

  Future<void> _showSheet(BuildContext context) {
    return showFocusRestoringModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorScheme.surface,
      builder: (ctx) => ListenableBuilder(
        listenable: _manager,
        builder: (ctx, _) {
          final l10n = AppLocalizations.of(ctx);
          final room = _manager.room;
          if (room == null) return const SizedBox.shrink();
          final onSurface = AppColorScheme.onSurface;
          final muted = onSurface.withValues(alpha: 0.7);
          final connected = room.members.where((m) => m.connected).toList();
          final status = !_manager.connected
              ? l10n.watchPartyReconnecting
              : switch (room.playbackState) {
                  'waiting' => l10n.syncPlayStateWaiting,
                  'paused' => l10n.syncPlayStatePaused,
                  _ => l10n.syncPlayStatePlaying,
                };
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: Icon(Icons.groups_rounded, color: onSurface),
                    title: Text(
                      '${l10n.watchParty} · ${room.code}',
                      style: TextStyle(color: onSurface),
                    ),
                    subtitle: Text(
                      '$status · '
                      '${l10n.syncPlayParticipantCount(connected.length)}',
                      style: TextStyle(color: muted),
                    ),
                  ),
                  if (connected.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final m in connected)
                            Chip(
                              avatar: ClipOval(
                                child: UserAvatarImage(
                                  url: memberAvatarUrl(m),
                                  size: 24,
                                  fallback: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: AppColorScheme.accent,
                                    foregroundColor: AppColorScheme.onAccent,
                                    child: Text(
                                      m.displayName.isEmpty
                                          ? '?'
                                          : m.displayName.characters.first
                                                .toUpperCase(),
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              label: Text(
                                m.isHost ? '${m.displayName} ★' : m.displayName,
                                style: TextStyle(color: onSurface),
                              ),
                              backgroundColor:
                                  ThemeRegistry.active.borders.chipBackground,
                              side: ThemeRegistry.active.borders.chipBorder,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    ThemeRegistry.active.borders.chipRadius,
                              ),
                            ),
                        ],
                      ),
                    ),
                  Divider(
                    color: ThemeRegistry.active.borders.chipBorder.color,
                    height: 1,
                  ),
                  if (room.isHost)
                    ListTile(
                      leading: Icon(Icons.stop_rounded, color: onSurface),
                      title: Text(
                        l10n.watchPartyBackToLobby,
                        style: TextStyle(color: onSurface),
                      ),
                      onTap: () async {
                        Navigator.of(ctx).pop();
                        await _manager.stopPlayback();
                      },
                    ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Colors.redAccent,
                    ),
                    title: Text(
                      room.isHost
                          ? l10n.watchPartyEnd
                          : l10n.syncPlayLeaveGroup,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                    onTap: () async {
                      Navigator.of(ctx).pop();
                      room.isHost ? await _manager.end() : _manager.leave();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
