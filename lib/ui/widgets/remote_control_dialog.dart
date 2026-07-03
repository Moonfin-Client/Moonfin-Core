import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../data/services/socket_handler.dart';
import '../../l10n/app_localizations.dart';
import 'bounded_network_image.dart';
import 'overlay_sheet.dart';

void showRemoteControlDialog(BuildContext context) {
  showFocusRestoringModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _RemoteControlSheet(),
  );
}

class _RemoteControlSheet extends StatefulWidget {
  const _RemoteControlSheet();

  @override
  State<_RemoteControlSheet> createState() => _RemoteControlSheetState();
}

class _RemoteControlSheetState extends State<_RemoteControlSheet> {
  late final SessionApi _sessionApi;
  List<Map<String, dynamic>> _sessions = [];
  bool _loading = true;
  bool _fetching = false;
  String? _error;
  Map<String, dynamic>? _selectedSession;
  bool _busy = false;
  double? _seekPosition;
  double? _volume;
  Timer? _refreshTimer;
  StreamSubscription<ServerWebSocketMessage>? _socketSub;

  @override
  void initState() {
    super.initState();
    _sessionApi = GetIt.instance<MediaServerClient>().sessionApi;
    _load();
    _refreshTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _refresh(),
    );
    _socketSub = GetIt.instance<SocketHandler>().events.listen((event) {
      switch (event) {
        case SessionEndedMessage():
        case PlayMessage():
        case PlaystateMessage():
        case GeneralCommandMessage():
          _refresh();
        case ServerEventMessage(:final type)
            when type == 'SessionsStart' || type == 'SessionsStop':
          _refresh();
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    _socketSub?.cancel();
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    if (_fetching) return;
    _fetching = true;
    try {
      final client = GetIt.instance<MediaServerClient>();
      List<Map<String, dynamic>> strictSessions = const [];
      try {
        strictSessions = await _sessionApi.getSessions(
          controllableByUserId: client.userId,
        );
      } catch (_) {}

      List<Map<String, dynamic>> fallbackSessions = const [];
      if (strictSessions.isEmpty) {
        try {
          fallbackSessions = await _sessionApi.getSessions();
        } catch (_) {}
      }

      final sessions = _mergeUniqueSessions([
        ...strictSessions,
        ...fallbackSessions,
      ]);
      if (!mounted) return;
      final selfDeviceId = client.deviceInfo.id;
      final controllable = sessions.where((s) {
        final deviceId = s['DeviceId']?.toString();
        if (deviceId != null && deviceId == selfDeviceId) {
          return false;
        }

        return _isPotentiallyControllable(s);
      }).toList();
      setState(() {
        _sessions = controllable;
        _loading = false;
        _error = null;
        if (_selectedSession != null) {
          final id = _selectedSession!['Id'];
          _selectedSession = controllable
              .cast<Map<String, dynamic>?>()
              .firstWhere((s) => s?['Id'] == id, orElse: () => null);
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    } finally {
      _fetching = false;
    }
  }

  List<Map<String, dynamic>> _mergeUniqueSessions(
    List<Map<String, dynamic>> sessions,
  ) {
    final byId = <String, Map<String, dynamic>>{};
    for (final session in sessions) {
      final id = session['Id']?.toString();
      if (id == null || id.isEmpty) {
        continue;
      }

      byId.putIfAbsent(id, () => session);
    }

    return byId.values.toList();
  }

  bool _isPotentiallyControllable(Map<String, dynamic> session) {
    final supportsRemote = session['SupportsRemoteControl'];
    if (supportsRemote is bool && supportsRemote) {
      return true;
    }

    final supportsMedia = session['SupportsMediaControl'];
    if (supportsMedia is bool && supportsMedia) {
      return true;
    }

    final commands = session['SupportedCommands'];
    if (commands is List) {
      return commands.whereType<String>().isNotEmpty;
    }

    return false;
  }

  Future<void> _refresh() async {
    if (_fetching) return;
    await _load();
  }

  Future<void> _run(Future<void> Function() action) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await action();
      await Future.delayed(const Duration(milliseconds: 300));
      await _refresh();
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.remoteCommandFailed(e.toString())),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _sendPlayState(String command, {int? seekTicks}) {
    final id = _selectedSession?['Id']?.toString();
    if (id == null) return Future.value();
    return _run(
      () => _sessionApi.sendPlayStateCommand(
        id,
        command,
        seekPositionTicks: seekTicks,
      ),
    );
  }

  Future<void> _sendGeneral(String commandName, {Map<String, String>? args}) {
    final id = _selectedSession?['Id']?.toString();
    if (id == null) return Future.value();
    return _run(
      () => _sessionApi.sendGeneralCommand(id, commandName, arguments: args),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.65,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: AppRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  Icon(
                    Icons.settings_remote_rounded,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    l10n.remoteControlTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  if (_busy)
                    const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _error != null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.remoteFailedToLoadSessions,
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 8),
                          TextButton(onPressed: _load, child: Text(l10n.retry)),
                        ],
                      ),
                    )
                  : _sessions.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.devices_other,
                            size: 48,
                            color: theme.colorScheme.outline,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.remoteNoSessions,
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            l10n.remoteStartPlayback,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      children: [
                        ..._sessions.map(_buildSessionTile),
                        if (_selectedSession != null) ...[
                          const SizedBox(height: 16),
                          ..._buildControls(theme),
                        ],
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionTile(Map<String, dynamic> session) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final sessionId = session['Id']?.toString();
    final isSelected = _selectedSession?['Id'] == sessionId;
    final userName = session['UserName'] as String? ?? l10n.unknownUser;
    final client = session['Client'] as String? ?? '';
    final device = session['DeviceName'] as String? ?? '';
    final nowPlaying = session['NowPlayingItem'] as Map<String, dynamic>?;
    final playState = session['PlayState'] as Map<String, dynamic>?;
    final isPaused = playState?['IsPaused'] as bool? ?? false;
    final runTimeTicks = (nowPlaying?['RunTimeTicks'] as num?)?.toDouble() ?? 0;
    final positionTicks =
        (playState?['PositionTicks'] as num?)?.toDouble() ?? 0;
    final progress = (nowPlaying != null && runTimeTicks > 0)
        ? (positionTicks / runTimeTicks).clamp(0.0, 1.0)
        : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: isSelected
            ? theme.colorScheme.primaryContainer.withValues(alpha: 0.35)
            : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: AppRadius.circular(14),
        child: InkWell(
          borderRadius: AppRadius.circular(14),
          onTap: () =>
              setState(() => _selectedSession = isSelected ? null : session),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(14),
              border: Border.all(
                color: isSelected
                    ? theme.colorScheme.primary.withValues(alpha: 0.6)
                    : theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
                width: isSelected ? 1.5 : 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Text(
                        userName.isNotEmpty ? userName[0].toUpperCase() : '?',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  userName,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 6),
                              _platformIcon(client, theme),
                            ],
                          ),
                          Text(
                            nowPlaying != null
                                ? (nowPlaying['Name'] as String? ??
                                      l10n.unknownItem)
                                : '$client · $device',
                            style: theme.textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    if (nowPlaying != null)
                      Icon(
                        isPaused
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        size: 20,
                        color: isPaused
                            ? theme.colorScheme.outline
                            : theme.colorScheme.primary,
                      ),
                    if (isSelected)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.check_circle,
                          size: 18,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                  ],
                ),
                if (progress != null) ...[
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 42),
                    child: ClipRRect(
                      borderRadius: AppRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 3,
                        backgroundColor:
                            theme.colorScheme.surfaceContainerHighest,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildControls(ThemeData theme) {
    final l10n = AppLocalizations.of(context);
    final session = _selectedSession!;
    final nowPlaying = session['NowPlayingItem'] as Map<String, dynamic>?;
    final playState = session['PlayState'] as Map<String, dynamic>?;
    final isPaused = playState?['IsPaused'] as bool? ?? false;
    final isMuted = playState?['IsMuted'] as bool? ?? false;
    final positionTicks = (playState?['PositionTicks'] as num?)?.toInt();
    final runtimeTicks = (nowPlaying?['RunTimeTicks'] as num?)?.toInt();
    final volumeLevel = (playState?['VolumeLevel'] as num?)?.toDouble();
    final supportsSetVolume = _supportsCommand(session, 'SetVolume');

    if (nowPlaying == null) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.tv_off, size: 40, color: theme.colorScheme.outline),
                const SizedBox(height: 8),
                Text(
                  l10n.remoteNothingPlaying,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ];
    }

    return [
      _buildNowPlayingCard(theme, nowPlaying, positionTicks, runtimeTicks),
      const SizedBox(height: 18),
      _buildTransportRow(theme, isPaused),
      const SizedBox(height: 18),
      _buildVolumeRow(theme, l10n, isMuted, volumeLevel, supportsSetVolume),
      const SizedBox(height: 14),
      _buildStopButton(theme, l10n),
    ];
  }

  Widget _buildNowPlayingCard(
    ThemeData theme,
    Map<String, dynamic> nowPlaying,
    int? positionTicks,
    int? runtimeTicks,
  ) {
    final title = nowPlaying['Name'] as String? ?? '';
    final series = nowPlaying['SeriesName'] as String?;
    final year = (nowPlaying['ProductionYear'] as num?)?.toInt();
    final subtitle = series ?? (year != null ? '$year' : null);
    final posterUrl = _posterUrlFor(nowPlaying);
    final hasSeek =
        positionTicks != null && runtimeTicks != null && runtimeTicks > 0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: AppRadius.circular(16),
        border: Border.fromBorderSide(ThemeRegistry.active.borders.chipBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: AppRadius.circular(8),
            child: SizedBox(
              width: 56,
              height: 84,
              child: posterUrl == null
                  ? _posterPlaceholder(theme)
                  : BoundedNetworkImage(
                      imageUrl: posterUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => _posterPlaceholder(theme),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 10),
                if (hasSeek) _buildSeekBar(theme, positionTicks, runtimeTicks),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _posterPlaceholder(ThemeData theme) {
    return Container(
      color: theme.colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: Icon(
        Icons.movie_outlined,
        color: theme.colorScheme.outline,
        size: 24,
      ),
    );
  }

  Widget _buildSeekBar(ThemeData theme, int positionTicks, int runtimeTicks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
            padding: EdgeInsets.zero,
          ),
          child: Slider(
            value: (_seekPosition ?? positionTicks / runtimeTicks)
                .clamp(0.0, 1.0),
            onChanged: (v) => setState(() => _seekPosition = v),
            onChangeEnd: (v) {
              final target = (v * runtimeTicks).round();
              _seekPosition = null;
              _sendPlayState('Seek', seekTicks: target);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _ticksToTime(positionTicks),
              style: theme.textTheme.labelSmall,
            ),
            Text(
              _ticksToTime(runtimeTicks),
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTransportRow(ThemeData theme, bool isPaused) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TransportButton(
          icon: Icons.skip_previous_rounded,
          onTap: () => _sendPlayState('PreviousTrack'),
        ),
        const SizedBox(width: 18),
        _TransportButton(
          icon: Icons.replay_10_rounded,
          onTap: () => _sendPlayState('Rewind'),
        ),
        const SizedBox(width: 18),
        _PrimaryTransportButton(
          icon: isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
          onTap: () => _sendPlayState('PlayPause'),
        ),
        const SizedBox(width: 18),
        _TransportButton(
          icon: Icons.forward_10_rounded,
          onTap: () => _sendPlayState('FastForward'),
        ),
        const SizedBox(width: 18),
        _TransportButton(
          icon: Icons.skip_next_rounded,
          onTap: () => _sendPlayState('NextTrack'),
        ),
      ],
    );
  }

  Widget _buildVolumeRow(
    ThemeData theme,
    AppLocalizations l10n,
    bool isMuted,
    double? volumeLevel,
    bool supportsSetVolume,
  ) {
    if (!supportsSetVolume) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ControlButton(
            icon: isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
            label: isMuted ? l10n.unmute : l10n.mute,
            onTap: () => _sendGeneral(isMuted ? 'Unmute' : 'Mute'),
          ),
          const SizedBox(width: 8),
          _ControlButton(
            icon: Icons.volume_down_rounded,
            label: l10n.sessionVolumeDown,
            onTap: () => _sendGeneral('VolumeDown'),
          ),
          const SizedBox(width: 8),
          _ControlButton(
            icon: Icons.volume_up_rounded,
            label: l10n.sessionVolumeUp,
            onTap: () => _sendGeneral('VolumeUp'),
          ),
        ],
      );
    }

    final value = (_volume ?? volumeLevel ?? 100).clamp(0.0, 100.0);
    final IconData volumeIcon;
    if (isMuted || value == 0) {
      volumeIcon = Icons.volume_off_rounded;
    } else if (value < 50) {
      volumeIcon = Icons.volume_down_rounded;
    } else {
      volumeIcon = Icons.volume_up_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: AppRadius.circular(14),
        border: Border.fromBorderSide(ThemeRegistry.active.borders.chipBorder),
      ),
      child: Row(
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: Icon(volumeIcon),
            color: theme.colorScheme.onSurfaceVariant,
            tooltip: isMuted ? l10n.unmute : l10n.mute,
            onPressed: () => _sendGeneral(isMuted ? 'Unmute' : 'Mute'),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 3,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
              ),
              child: Slider(
                min: 0,
                max: 100,
                value: value,
                onChanged: (v) => setState(() => _volume = v),
                onChangeEnd: (v) {
                  _volume = null;
                  _sendGeneral(
                    'SetVolume',
                    args: {'Volume': v.round().toString()},
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              '${value.round()}%',
              textAlign: TextAlign.end,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStopButton(ThemeData theme, AppLocalizations l10n) {
    return Center(
      child: TextButton.icon(
        onPressed: () => _sendPlayState('Stop'),
        icon: const Icon(Icons.stop_rounded, size: 18),
        label: Text(l10n.stop),
        style: TextButton.styleFrom(
          foregroundColor: theme.colorScheme.error,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.circular(12),
            side: BorderSide(
              color: theme.colorScheme.error.withValues(alpha: 0.4),
            ),
          ),
        ),
      ),
    );
  }

  String _ticksToTime(int ticks) {
    final duration = Duration(microseconds: ticks ~/ 10);
    final h = duration.inHours;
    final m = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '$m:$s';
  }

  bool _supportsCommand(Map<String, dynamic> session, String command) {
    final commands = session['SupportedCommands'];
    return commands is List && commands.whereType<String>().contains(command);
  }

  String? _posterUrlFor(Map<String, dynamic> nowPlaying) {
    final id = nowPlaying['Id']?.toString();
    if (id == null || id.isEmpty) return null;
    return GetIt.instance<MediaServerClient>().imageApi.getPrimaryImageUrl(
      id,
      maxHeight: 300,
    );
  }

  Widget _platformIcon(String client, ThemeData theme) {
    final lc = client.toLowerCase();
    final IconData icon;
    if (lc.contains('android tv') ||
        lc.contains('fire tv') ||
        lc.contains('apple tv') ||
        lc.contains('roku')) {
      icon = Icons.tv;
    } else if (lc.contains('android')) {
      icon = Icons.android;
    } else if (lc.contains('ios') ||
        lc.contains('iphone') ||
        lc.contains('ipad') ||
        lc.contains('apple')) {
      icon = Icons.phone_iphone;
    } else if (lc.contains('web') || lc.contains('browser')) {
      icon = Icons.language;
    } else {
      icon = Icons.devices_other;
    }
    return Icon(icon, size: 13, color: theme.colorScheme.onSurfaceVariant);
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = theme.colorScheme.onSurface;
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: fg),
            const SizedBox(height: 2),
            Text(label, style: theme.textTheme.labelSmall?.copyWith(color: fg)),
          ],
        ),
      ),
    );
  }
}

class _TransportButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _TransportButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkResponse(
      onTap: onTap,
      radius: 28,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, size: 28, color: theme.colorScheme.onSurface),
      ),
    );
  }
}

class _PrimaryTransportButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryTransportButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.primary,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, size: 32, color: theme.colorScheme.onPrimary),
        ),
      ),
    );
  }
}
