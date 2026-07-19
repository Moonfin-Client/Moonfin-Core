import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:playback_core/playback_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/audio_capability_profile.dart';
import '../../../playback/device_profile_builder.dart';
import '../../../playback/external_player_policy.dart';
import '../../../playback/external_player_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../navigation/destinations.dart';

class ExternalPlayerHostScreen extends StatefulWidget {
  const ExternalPlayerHostScreen({super.key});

  @override
  State<ExternalPlayerHostScreen> createState() =>
      _ExternalPlayerHostScreenState();
}

class _ExternalPlayerHostScreenState extends State<ExternalPlayerHostScreen> {
  final _manager = GetIt.instance<PlaybackManager>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _externalPlayer = GetIt.instance<ExternalPlayerService>();

  bool _running = false;
  bool _finishing = false;
  bool _handoffToInternalPlayer = false;
  String _status = 'Preparing external playback...';
  String _playerLabel = 'External player';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_runExternalQueue());
    });
  }

  Future<void> _runExternalQueue() async {
    if (_running) return;
    _running = true;

    Duration pendingStartPosition = _manager.consumeDeferredStartPosition();

    try {
      final forceChooser = _manager.consumeForceExternalChooserOnce();
      var component = forceChooser
          ? ''
          : _prefs.get(UserPreferences.externalPlayerComponentName).trim();

      final selectedPlayer = component.isEmpty
          ? null
          : await _externalPlayer.findByComponent(component);
      if (!mounted) return;

      if (component.isNotEmpty && selectedPlayer == null) {
        _showError(
          'Selected external player is unavailable. Showing app chooser instead.',
        );
        component = '';
        unawaited(_prefs.set(UserPreferences.externalPlayerComponentName, ''));
      }

      if (selectedPlayer != null && selectedPlayer.label.isNotEmpty) {
        setState(() {
          _playerLabel = selectedPlayer.label;
        });
      } else if (component.isEmpty) {
        setState(() {
          _playerLabel = 'Ask each time';
        });
      }

      while (mounted) {
        final currentItem = _manager.queueService.currentItem;
        if (currentItem is! AggregatedItem) {
          break;
        }
        if (!ExternalPlayerPolicy.isEligibleItem(currentItem)) {
          break;
        }

        final startPosition = pendingStartPosition;
        pendingStartPosition = Duration.zero;
        final useChooser = component.isEmpty;

        setState(() {
          _status = useChooser
              ? 'Choose an external player for ${currentItem.name}...'
              : 'Opening ${currentItem.name} in $_playerLabel...';
        });

        await _manager.configureResolverForItem(currentItem);
        if (!mounted) return;

        final resolver = GetIt.instance<MediaStreamResolver>();
        final playService = GetIt.instance<PlayerService>();

        final maxBitrateOption = int.tryParse(
          _prefs.get(UserPreferences.maxBitrate),
        );
        final maxResolution = _prefs.get(UserPreferences.maxVideoResolution);
        final profile = DeviceProfileBuilder.build(
          maxBitrateMbps: maxBitrateOption,
          audioCapabilityProfile: const AudioCapabilityProfile.optimistic(),
          audioOutputMode: AudioOutputMode.auto,
          audioFallbackCodec: AudioFallbackCodec.auto,
          // External players (VLC, mpv, Just Player, …) decode audio in
          // software; never restrict them by the detected output route.
          universalAudioDecode: true,
          maxResolution: maxResolution,
          pgsDirectPlay: true,
          assDirectPlay: true,
          supportsAvc: true,
          supportsAvcHigh10: true,
          avcMainLevel: 52,
          avcHigh10Level: 52,
          supportsHevc: true,
          supportsHevcMain10: true,
          hevcMainLevel: 186,
          supportsHevcDolbyVision: true,
          supportsHevcDolbyVisionEl: true,
          supportsHevcHdr10: true,
          supportsHevcHdr10Plus: true,
          supportsAv1: true,
          supportsAv1Main10: true,
          supportsAv1DolbyVision: true,
          supportsAv1Hdr10: true,
          supportsAv1Hdr10Plus: true,
          supportsVc1: true,
          maxResolutionAvcWidth: 4096,
          maxResolutionAvcHeight: 2160,
          maxResolutionHevcWidth: 4096,
          maxResolutionHevcHeight: 2160,
          maxResolutionAv1Width: 4096,
          maxResolutionAv1Height: 2160,
          maxResolutionVc1Width: 4096,
          maxResolutionVc1Height: 2160,
          supportsDvProfile5: true,
          supportsDvProfile7: true,
          supportsDvProfile8: true,
          allowDolbyVisionProfile7ElDirectPlay: true,
          // The external app decodes with its own pipeline, so this device's
          // decoder quirks (like the Fire TV DoVi HDR10+ exclusion) must not
          // force a transcode that the external handoff then rejects.
          applyKnownDeviceDefects: false,
        );
        final overrideMbps = _manager.maxBitrateOverrideMbps;
        if (overrideMbps != null) {
          profile['MaxStreamingBitrate'] = overrideMbps * 1000000;
        }

        final maxBitrate = profile['MaxStreamingBitrate'] as int?;
        final startTicks = startPosition > Duration.zero
            ? startPosition.inMicroseconds * 10
            : null;

        final resolution = await resolver.resolve(
          currentItem,
          deviceProfile: profile,
          maxStreamingBitrate: maxBitrate,
          audioStreamIndex: _manager.pendingAudioStreamIndex,
          subtitleStreamIndex: _manager.pendingSubtitleStreamIndex,
          startTimeTicks: startTicks,
          mediaSourceId: _manager.pendingMediaSourceId,
          enableDirectPlay: true,
          enableDirectStream: true,
        );

        if (resolution.playMethod == StreamPlayMethod.transcode) {
          _showError(
            'External playback requires a direct stream. Falling back to built-in player.',
          );
          await _fallbackToInternalPlayer(startPosition);
          return;
        }

        await playService.onPlaybackStart(
          currentItem,
          resolution,
          positionTicks: startTicks,
          audioStreamIndex: _manager.pendingAudioStreamIndex,
          subtitleStreamIndex: _manager.pendingSubtitleStreamIndex,
        );

        final request = ExternalPlayerLaunchRequest(
          url: resolution.streamUrl,
          mimeType: resolution.mediaType.toLowerCase() == 'audio'
              ? 'audio/*'
              : 'video/*',
          component: component,
          title: currentItem.name,
          filename: _filenameForResolution(
            currentItem,
            resolution.mediaSourceId,
          ),
          startPosition: startPosition,
          runtime: currentItem.runtime,
          subtitles: resolution.externalSubtitles
              .map(
                (subtitle) => ExternalPlayerSubtitle(
                  url: subtitle.deliveryUrl,
                  name: subtitle.title,
                  language: subtitle.language,
                  codec: subtitle.codec,
                ),
              )
              .toList(growable: false),
        );
        final launchResult = useChooser
            ? await _externalPlayer.chooseAndLaunch(request)
            : await _externalPlayer.launch(request);

        final runtime = currentItem.runtime;
        final endPosition = launchResult.endPosition;
        final completed =
            launchResult.completed ||
            (runtime != null &&
                endPosition != null &&
                endPosition.inMilliseconds >=
                    (runtime.inMilliseconds * 0.9).round());

        final reportPosition =
            (completed && endPosition == null && runtime != null)
            ? runtime
            : (endPosition ?? startPosition);

        await playService.onPlaybackStop(
          currentItem,
          resolution,
          reportPosition,
        );

        if (launchResult.hasError) {
          if (_shouldFallbackToInternalPlayer(launchResult.errorCode)) {
            _showError(
              launchResult.errorMessage ??
                  'External player is unavailable. Falling back to built-in player.',
            );
            await _fallbackToInternalPlayer(startPosition);
            return;
          }

          _showError(
            launchResult.errorMessage ??
                'External player returned an error for ${currentItem.name}.',
          );
          break;
        }

        if (!completed) {
          break;
        }

        final hasNext = _manager.queueService.next();
        if (!hasNext) {
          break;
        }
      }
    } catch (error) {
      _showError('External playback failed: $error');
    } finally {
      if (!_handoffToInternalPlayer) {
        await _finishAndExit();
      }
    }
  }

  bool _shouldFallbackToInternalPlayer(String? errorCode) {
    return switch (errorCode) {
      'PLAYER_NOT_FOUND' => true,
      'LAUNCH_FAILED' => true,
      'BAD_ARGS' => true,
      'ACTIVITY_DESTROYED' => true,
      _ => false,
    };
  }

  Future<void> _fallbackToInternalPlayer(Duration startPosition) async {
    try {
      _handoffToInternalPlayer = true;
      _manager.skipExternalRoutingOnce();
      await _manager.startQueuedPlayback(startPosition: startPosition);
      if (!mounted) return;
      context.go(Destinations.videoPlayer);
    } catch (error) {
      _handoffToInternalPlayer = false;
      _showError('Failed to fall back to built-in player: $error');
    }
  }

  Future<void> _finishAndExit() async {
    if (_finishing) return;
    _finishing = true;

    await _manager.stop(userInitiated: false);
    if (!mounted) return;

    context.popOrHome();
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  String? _filenameForResolution(AggregatedItem item, String mediaSourceId) {
    for (final source in item.mediaSources) {
      if ((source['Id']?.toString()) != mediaSourceId) continue;
      final path = (source['Path'] as String?)?.trim();
      if (path != null && path.isNotEmpty) {
        return _basename(path);
      }
      final name = (source['Name'] as String?)?.trim();
      if (name != null && name.isNotEmpty) {
        return name;
      }
    }
    return null;
  }

  String _basename(String path) {
    final normalized = path.replaceAll('\\', '/');
    final index = normalized.lastIndexOf('/');
    if (index < 0 || index >= normalized.length - 1) {
      return normalized;
    }
    return normalized.substring(index + 1);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Text(
                  l10n.openExternally,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  _status,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  _playerLabel,
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
