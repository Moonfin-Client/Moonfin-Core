import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/services.dart';
import 'package:playback_core/playback_core.dart';

import '../../playback/media_browse_service.dart';
import '../models/aggregated_item.dart';

/// Dart side of the com.moonfin/carplay channel: serves browse trees and
/// playback commands to the native CPTemplate UI and pushes state changes
/// (sign-in, audiobook mode) back to it. Node ids are the MediaBrowseService
/// scheme shared with Android Auto.
class CarPlayService {
  static const _channel = MethodChannel('com.moonfin/carplay');
  static const _speedSteps = [1.0, 1.25, 1.5, 1.75, 2.0, 0.75];

  final MediaBrowseService _browse;
  final PlaybackManager _manager;

  StreamSubscription<void>? _queueSub;
  StreamSubscription<bool>? _playingSub;
  bool? _lastPushedAudiobookMode;
  Map<String, Object>? _lastPushedModes;

  CarPlayService({
    required MediaBrowseService browse,
    required PlaybackManager manager,
  })  : _browse = browse,
        _manager = manager;

  void start() {
    _channel.setMethodCallHandler(_handleCall);
    _queueSub = _manager.queueService.queueChangedStream.listen((_) {
      _pushNowPlayingContextIfChanged();
      _pushPlaybackModesIfChanged();
    });
    // A pause is when play history and book positions have moved, so the
    // car's Listen Now and Audiobooks tabs reload then, as on Android Auto.
    _playingSub = _manager.state.playingStream.listen((playing) {
      if (playing || _browse.dropRecents().isEmpty) return;
      unawaited(_channel.invokeMethod('invalidate').catchError((_) {}));
    });
  }

  void dispose() {
    _queueSub?.cancel();
    _queueSub = null;
    _playingSub?.cancel();
    _playingSub = null;
    _channel.setMethodCallHandler(null);
  }

  /// Called from the session repository when sign-in state changes so the car
  /// UI rebuilds without replugging.
  void notifySignInChanged({required bool signedIn}) {
    unawaited(
      _channel
          .invokeMethod('signInStateChanged', {'signedIn': signedIn})
          .catchError((_) {}),
    );
  }

  Future<dynamic> _handleCall(MethodCall call) async {
    switch (call.method) {
      case 'getChildren':
        final nodeId =
            (call.arguments as Map?)?['nodeId'] as String? ?? 'root';
        // No page options: this returns the complete node listing; the Swift
        // bridge truncates at CPListTemplate.maximumItemCount. Never throw,
        // or the CarPlay template is left waiting.
        try {
          final items = await _browse.getChildren(nodeId);
          return {'items': items.map(_toBrowseJson).toList()};
        } catch (_) {
          return {'items': const []};
        }
      case 'playItem':
        final mediaId = (call.arguments as Map?)?['mediaId'] as String?;
        if (mediaId == null || MediaBrowseService.isMessageId(mediaId)) {
          return {'ok': false};
        }
        final request = await _browse.resolvePlayRequest(mediaId);
        if (request == null) {
          throw PlatformException(code: 'NOT_FOUND');
        }
        await _manager.playItems(
          request.items,
          startIndex: request.startIndex,
          startPosition: request.startPosition,
        );
        _pushNowPlayingContextIfChanged(force: true);
        return {'ok': true};
      case 'getQueue':
        final items = _manager.queueService.items
            .whereType<AggregatedItem>()
            .toList(growable: false);
        final current = _manager.queueService.currentItem;
        final currentIndex = current is AggregatedItem
            ? items.indexWhere((i) => i.id == current.id)
            : -1;
        return {
          'items': [
            for (final item in items)
              {
                'id': item.id,
                'title': item.name,
                'subtitle': item.artists.isNotEmpty
                    ? item.artists.join(', ')
                    : item.albumArtist,
                'browsable': false,
                'playable': true,
              },
          ],
          'currentIndex': currentIndex,
        };
      case 'skipToQueueItem':
        final index = (call.arguments as Map?)?['index'] as int?;
        if (index != null) {
          await _manager.playFromQueue(index);
        }
        return {'ok': true};
      case 'toggleShuffle':
        _manager.toggleShuffle();
        return _playbackModes();
      case 'cycleRepeat':
        _manager.toggleRepeat();
        return _playbackModes();
      case 'cyclePlaybackSpeed':
        final current = _manager.state.playbackSpeed;
        final index = _speedSteps.indexWhere(
          (s) => (s - current).abs() < 0.01,
        );
        final next = _speedSteps[(index + 1) % _speedSteps.length];
        await _manager.setPlaybackSpeed(next);
        return {'speed': next};
      case 'search':
        final query = (call.arguments as Map?)?['query'] as String? ?? '';
        final items = await _browse.search(query);
        return {'items': items.map(_toBrowseJson).toList()};
      default:
        throw MissingPluginException();
    }
  }

  Map<String, dynamic> _toBrowseJson(MediaItem item) {
    final playable = item.playable ?? true;
    final layout = MediaBrowseService.carLayout(item);
    return {
      'id': item.id,
      'title': item.displayTitle ?? item.title,
      'subtitle': item.displaySubtitle ?? item.artist,
      'artUri': item.artUri?.toString(),
      'browsable': !playable,
      'playable': playable,
      'iconName': ?_symbolFor(item.id),
      'shelf': ?layout.shelf,
      'cover': layout.cover,
      'tile': layout.tile,
      'progress': ?layout.progress,
    };
  }

  // Android Auto draws these rows from the app's own drawables, which have no
  // iOS copy, so CarPlay gets the matching SF Symbol.
  static String? _symbolFor(String id) {
    final parts = id.split('|');
    final az = parts.indexOf('az');
    if (az >= 0) {
      final letter = parts.elementAtOrNull(az + 1);
      if (letter == '#') return 'number.circle';
      return letter?.length == 1 ? '${letter!.toLowerCase()}.circle' : null;
    }
    return switch (parts.first) {
      'shuffle' || 'dlshuffle' => 'shuffle',
      'mix' => 'wand.and.stars',
      'sec' => switch (parts.elementAtOrNull(1)) {
          'albums' => 'square.stack',
          'artists' => 'music.mic',
          'musicplaylists' => 'music.note.list',
          'genres' => 'guitars',
          'favorites' => 'heart',
          'recent' => 'clock.arrow.circlepath',
          'booklib' => 'books.vertical',
          _ => null,
        },
      _ => null,
    };
  }

  Map<String, Object> _playbackModes() => {
        'shuffle': _manager.queueService.isShuffled,
        'repeat': switch (_manager.queueService.repeatMode) {
          RepeatMode.none => 'none',
          RepeatMode.repeatAll => 'all',
          RepeatMode.repeatOne => 'one',
        },
      };

  // Keeps the car's shuffle and repeat buttons showing the modes when they
  // change from the phone, the lock screen or the car itself.
  void _pushPlaybackModesIfChanged() {
    final modes = _playbackModes();
    final last = _lastPushedModes;
    if (last != null &&
        last['shuffle'] == modes['shuffle'] &&
        last['repeat'] == modes['repeat']) {
      return;
    }
    _lastPushedModes = modes;
    unawaited(
      _channel
          .invokeMethod('playbackModesChanged', modes)
          .catchError((_) {}),
    );
  }

  void _pushNowPlayingContextIfChanged({bool force = false}) {
    final current = _manager.queueService.currentItem;
    if (current is! AggregatedItem || !current.isAudioLike) return;
    final isAudiobook = current.isAudiobook;
    if (!force && isAudiobook == _lastPushedAudiobookMode) return;
    _lastPushedAudiobookMode = isAudiobook;
    unawaited(
      _channel.invokeMethod('nowPlayingContextChanged', {
        'mode': isAudiobook ? 'audiobook' : 'music',
      }).catchError((_) {}),
    );
  }
}
