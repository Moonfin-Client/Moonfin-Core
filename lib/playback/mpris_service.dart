import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/media_server_client_factory.dart';
import 'car_artwork.dart';

const _busName = 'org.mpris.MediaPlayer2.moonfin';
const _objectPath = '/org/mpris/MediaPlayer2';
const _rootInterface = 'org.mpris.MediaPlayer2';
const _playerInterface = 'org.mpris.MediaPlayer2.Player';

/// Exposes the running player on the Linux session bus as an MPRIS media player
/// so the desktop shell, hardware media keys, and playerctl can show now-playing
/// info and drive playback. It forwards PlaybackManager state out to D-Bus and
/// D-Bus commands back, and is the Linux counterpart to MoonfinAudioHandler.
class MprisService {
  final PlaybackManager _manager;
  final MediaServerClientFactory _clientFactory;

  DBusClient? _client;
  _MprisPlayer? _object;
  final List<StreamSubscription> _subs = [];

  // Baseline for the linear position an MPRIS client interpolates from. We only
  // emit Seeked when the reported position diverges from that line, i.e. a real
  // seek or track change, not on every steady tick (mirrors the audio handler).
  Duration? _baselinePosition;
  DateTime? _baselineAt;

  MprisService(this._manager, this._clientFactory);

  Future<void> start() async {
    final client = DBusClient.session();
    final object = _MprisPlayer(_manager, _clientFactory);
    await client.registerObject(object);
    final reply = await client.requestName(_busName);
    if (reply != DBusRequestNameReply.primaryOwner) {
      debugPrint('MPRIS: another player owns $_busName (reply: $reply)');
    }
    _client = client;
    _object = object;
    _bindStreams();
  }

  void _bindStreams() {
    final s = _manager.state;
    final q = _manager.queueService;
    _subs.addAll([
      s.playingStream.listen((_) {
        _syncBaseline();
        _emit(['PlaybackStatus', 'CanPlay', 'CanPause']);
      }),
      s.positionStream.listen((_) => _onPosition()),
      s.durationStream.listen((_) => _emit(['Metadata'])),
      s.repeatModeStream.listen((_) => _emit(['LoopStatus', 'CanGoNext', 'CanGoPrevious'])),
      s.shuffleStream.listen((_) => _emit(['Shuffle'])),
      q.queueChangedStream.listen((_) {
        _syncBaseline();
        _emit([
          'Metadata',
          'PlaybackStatus',
          'CanGoNext',
          'CanGoPrevious',
          'CanPlay',
          'CanPause',
          'CanSeek',
        ]);
      }),
    ]);
  }

  void _emit(List<String> names) {
    final obj = _object;
    if (obj != null) unawaited(obj.emitChanged(names));
  }

  void _syncBaseline() {
    _baselinePosition = _manager.state.position;
    _baselineAt = DateTime.now();
  }

  bool _positionJumped() {
    final base = _baselinePosition;
    final at = _baselineAt;
    final s = _manager.state;
    if (base == null || at == null || !s.isPlaying) return true;
    final elapsedMs = DateTime.now().difference(at).inMilliseconds;
    final expectedMs =
        base.inMilliseconds + (elapsedMs * s.playbackSpeed).round();
    return (s.position.inMilliseconds - expectedMs).abs() > 3000;
  }

  void _onPosition() {
    if (!_positionJumped()) return;
    _syncBaseline();
    final obj = _object;
    if (obj != null) unawaited(obj.emitSeeked(_manager.state.position));
  }

  Future<void> dispose() async {
    for (final sub in _subs) {
      await sub.cancel();
    }
    _subs.clear();
    final client = _client;
    _client = null;
    _object = null;
    if (client != null) {
      try {
        await client.releaseName(_busName);
      } catch (_) {}
      try {
        await client.close();
      } catch (_) {}
    }
  }
}

class _MprisPlayer extends DBusObject {
  final PlaybackManager _manager;
  final MediaServerClientFactory _clientFactory;

  // MPRIS exposes a Volume slider, but PlaybackManager has no volume hook, so we
  // hold the last value a client set and echo it back rather than drop the
  // property (its absence keeps some shells from rendering the card).
  double _volume = 1.0;

  _MprisPlayer(this._manager, this._clientFactory)
      : super(DBusObjectPath(_objectPath));

  @override
  List<DBusIntrospectInterface> introspect() {
    return [
      DBusIntrospectInterface(_rootInterface, methods: [
        DBusIntrospectMethod('Raise'),
        DBusIntrospectMethod('Quit'),
      ], properties: [
        _roProp('CanQuit', 'b'),
        _roProp('CanRaise', 'b'),
        _roProp('HasTrackList', 'b'),
        _roProp('Identity', 's'),
        _roProp('DesktopEntry', 's'),
        _roProp('SupportedUriSchemes', 'as'),
        _roProp('SupportedMimeTypes', 'as'),
      ]),
      DBusIntrospectInterface(_playerInterface, methods: [
        DBusIntrospectMethod('Next'),
        DBusIntrospectMethod('Previous'),
        DBusIntrospectMethod('Pause'),
        DBusIntrospectMethod('PlayPause'),
        DBusIntrospectMethod('Stop'),
        DBusIntrospectMethod('Play'),
        DBusIntrospectMethod('Seek', args: [_arg('x', 'Offset')]),
        DBusIntrospectMethod('SetPosition',
            args: [_arg('o', 'TrackId'), _arg('x', 'Position')]),
        DBusIntrospectMethod('OpenUri', args: [_arg('s', 'Uri')]),
      ], signals: [
        DBusIntrospectSignal('Seeked',
            args: [_arg('x', 'Position', out: true)]),
      ], properties: [
        _roProp('PlaybackStatus', 's'),
        _rwProp('LoopStatus', 's'),
        _rwProp('Rate', 'd'),
        _rwProp('Shuffle', 'b'),
        _roProp('Metadata', 'a{sv}'),
        _rwProp('Volume', 'd'),
        _roProp('Position', 'x'),
        _roProp('MinimumRate', 'd'),
        _roProp('MaximumRate', 'd'),
        _roProp('CanGoNext', 'b'),
        _roProp('CanGoPrevious', 'b'),
        _roProp('CanPlay', 'b'),
        _roProp('CanPause', 'b'),
        _roProp('CanSeek', 'b'),
        _roProp('CanControl', 'b'),
      ]),
    ];
  }

  static DBusIntrospectProperty _roProp(String name, String type) =>
      DBusIntrospectProperty(name, DBusSignature(type),
          access: DBusPropertyAccess.read);

  static DBusIntrospectProperty _rwProp(String name, String type) =>
      DBusIntrospectProperty(name, DBusSignature(type),
          access: DBusPropertyAccess.readwrite);

  static DBusIntrospectArgument _arg(String type, String name,
          {bool out = false}) =>
      DBusIntrospectArgument(DBusSignature(type),
          out ? DBusArgumentDirection.out : DBusArgumentDirection.in_,
          name: name);

  @override
  Future<DBusMethodResponse> getProperty(String interface, String name) async {
    final DBusValue? value;
    if (interface == _rootInterface) {
      value = _rootProperty(name);
    } else if (interface == _playerInterface) {
      value = _playerProperty(name);
    } else {
      return DBusMethodErrorResponse.unknownInterface();
    }
    if (value == null) return DBusMethodErrorResponse.unknownProperty();
    return DBusGetPropertyResponse(value);
  }

  @override
  Future<DBusMethodResponse> getAllProperties(String interface) async {
    if (interface != _rootInterface && interface != _playerInterface) {
      return DBusGetAllPropertiesResponse(const {});
    }
    final props = <String, DBusValue>{};
    for (final iface in introspect()) {
      if (iface.name != interface) continue;
      for (final property in iface.properties) {
        final value = interface == _rootInterface
            ? _rootProperty(property.name)
            : _playerProperty(property.name);
        if (value != null) props[property.name] = value;
      }
    }
    return DBusGetAllPropertiesResponse(props);
  }

  @override
  Future<DBusMethodResponse> setProperty(
      String interface, String name, DBusValue value) async {
    if (interface == _rootInterface) {
      return DBusMethodErrorResponse.propertyReadOnly();
    }
    if (interface != _playerInterface) {
      return DBusMethodErrorResponse.unknownInterface();
    }
    switch (name) {
      case 'LoopStatus':
        _setLoopStatus(value.asString());
        return DBusMethodSuccessResponse();
      case 'Shuffle':
        final want = value.asBoolean();
        if (_manager.state.isShuffled != want) _manager.toggleShuffle();
        return DBusMethodSuccessResponse();
      case 'Rate':
        await _manager.setPlaybackSpeed(value.asDouble());
        return DBusMethodSuccessResponse();
      case 'Volume':
        _volume = value.asDouble().clamp(0.0, 1.0);
        unawaited(emitChanged(['Volume']));
        return DBusMethodSuccessResponse();
      default:
        if (_playerProperty(name) != null) {
          return DBusMethodErrorResponse.propertyReadOnly();
        }
        return DBusMethodErrorResponse.unknownProperty();
    }
  }

  @override
  Future<DBusMethodResponse> handleMethodCall(DBusMethodCall call) async {
    if (call.interface == _rootInterface) {
      switch (call.name) {
        case 'Raise':
        case 'Quit':
          return DBusMethodSuccessResponse();
        default:
          return DBusMethodErrorResponse.unknownMethod();
      }
    }
    if (call.interface == _playerInterface) {
      return _handlePlayerCall(call);
    }
    return DBusMethodErrorResponse.unknownInterface();
  }

  Future<DBusMethodResponse> _handlePlayerCall(DBusMethodCall call) async {
    switch (call.name) {
      case 'Next':
        await _manager.next();
        return DBusMethodSuccessResponse();
      case 'Previous':
        await _manager.previous();
        return DBusMethodSuccessResponse();
      case 'Pause':
        await _manager.pause();
        return DBusMethodSuccessResponse();
      case 'Play':
        await _manager.resume();
        return DBusMethodSuccessResponse();
      case 'PlayPause':
        if (_manager.state.isPlaying) {
          await _manager.pause();
        } else {
          await _manager.resume();
        }
        return DBusMethodSuccessResponse();
      case 'Stop':
        await _manager.stop(userInitiated: false);
        return DBusMethodSuccessResponse();
      case 'Seek':
        if (call.signature != DBusSignature('x')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        await _seekRelative(Duration(microseconds: call.values[0].asInt64()));
        return DBusMethodSuccessResponse();
      case 'SetPosition':
        if (call.signature != DBusSignature('ox')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        await _setPosition(call.values[0].asString(),
            Duration(microseconds: call.values[1].asInt64()));
        return DBusMethodSuccessResponse();
      case 'OpenUri':
        // Not supported, but acknowledge so clients do not error.
        return DBusMethodSuccessResponse();
      default:
        return DBusMethodErrorResponse.unknownMethod();
    }
  }

  Future<void> _seekRelative(Duration offset) async {
    final s = _manager.state;
    final target = s.position + offset;
    if (target < Duration.zero) {
      await _manager.seekTo(Duration.zero);
      return;
    }
    if (s.duration > Duration.zero && target > s.duration) {
      await _manager.next();
      return;
    }
    await _manager.seekTo(target);
  }

  Future<void> _setPosition(String trackId, Duration position) async {
    final raw = _manager.queueService.currentItem;
    if (raw is! AggregatedItem) return;
    // Stale seek: the track changed after the client read the id, so ignore.
    if (trackId != _trackPath(raw.id)) return;
    if (position < Duration.zero) return;
    final duration = _manager.state.duration;
    if (duration > Duration.zero && position > duration) return;
    await _manager.seekTo(position);
  }

  void _setLoopStatus(String status) {
    final target = switch (status) {
      'Track' => RepeatMode.repeatOne,
      'Playlist' => RepeatMode.repeatAll,
      _ => RepeatMode.none,
    };
    // toggleRepeat steps through none, all, then one, so a few toggles reach
    // any target mode.
    while (_manager.queueService.repeatMode != target) {
      _manager.toggleRepeat();
    }
  }

  DBusValue? _rootProperty(String name) {
    switch (name) {
      case 'CanQuit':
        return const DBusBoolean(false);
      case 'CanRaise':
        return const DBusBoolean(false);
      case 'HasTrackList':
        return const DBusBoolean(false);
      case 'Identity':
        return const DBusString('Moonfin');
      case 'DesktopEntry':
        return const DBusString('org.moonfin.linux');
      case 'SupportedUriSchemes':
        return DBusArray.string(const []);
      case 'SupportedMimeTypes':
        return DBusArray.string(const []);
      default:
        return null;
    }
  }

  DBusValue? _playerProperty(String name) {
    final s = _manager.state;
    final q = _manager.queueService;
    switch (name) {
      case 'PlaybackStatus':
        return DBusString(_playbackStatus());
      case 'LoopStatus':
        return DBusString(switch (q.repeatMode) {
          RepeatMode.repeatOne => 'Track',
          RepeatMode.repeatAll => 'Playlist',
          RepeatMode.none => 'None',
        });
      case 'Rate':
        return DBusDouble(s.playbackSpeed);
      case 'Shuffle':
        return DBusBoolean(s.isShuffled);
      case 'Metadata':
        return _buildMetadata();
      case 'Volume':
        return DBusDouble(_volume);
      case 'Position':
        return DBusInt64(s.position.inMicroseconds);
      case 'MinimumRate':
        return const DBusDouble(0.25);
      case 'MaximumRate':
        return const DBusDouble(4.0);
      case 'CanGoNext':
        return DBusBoolean(q.hasNext);
      case 'CanGoPrevious':
        // Previous restarts the current item when nothing precedes it, so it
        // is always available rather than following the queue.
        return DBusBoolean(q.currentItem != null);
      case 'CanPlay':
        return DBusBoolean(q.currentItem != null);
      case 'CanPause':
        return DBusBoolean(q.currentItem != null);
      case 'CanSeek':
        return DBusBoolean(q.currentItem != null);
      case 'CanControl':
        return const DBusBoolean(true);
      default:
        return null;
    }
  }

  String _playbackStatus() {
    if (_manager.queueService.currentItem == null) return 'Stopped';
    return _manager.state.isPlaying ? 'Playing' : 'Paused';
  }

  DBusValue _buildMetadata() {
    final raw = _manager.queueService.currentItem;
    if (raw is! AggregatedItem) {
      return DBusDict.stringVariant({
        'mpris:trackid':
            DBusObjectPath('/org/mpris/MediaPlayer2/TrackList/NoTrack'),
      });
    }
    final meta = <String, DBusValue>{
      'mpris:trackid': DBusObjectPath(_trackPath(raw.id)),
      'xesam:title': DBusString(raw.name),
    };
    final length = raw.runtime;
    if (length != null) {
      meta['mpris:length'] = DBusInt64(length.inMicroseconds);
    }
    final artists = _artists(raw);
    if (artists.isNotEmpty) {
      meta['xesam:artist'] = DBusArray.string(artists);
    }
    final album = raw.album;
    if (album != null && album.isNotEmpty) {
      meta['xesam:album'] = DBusString(album);
    }
    final art = _artUrl(raw);
    if (art != null && art.isNotEmpty) {
      meta['mpris:artUrl'] = DBusString(art);
    }
    return DBusDict.stringVariant(meta);
  }

  List<String> _artists(AggregatedItem item) {
    if (item.type == 'Episode') {
      final series = item.seriesName;
      return (series != null && series.isNotEmpty) ? [series] : const [];
    }
    if (item.type == 'Movie') {
      final directors = item.people
          .where((p) => p['Type'] == 'Director')
          .map((p) => p['Name'] as String?)
          .whereType<String>()
          .toList();
      if (directors.isNotEmpty) return directors;
      final studios = item.studios
          .map((s) => s['Name'] as String?)
          .whereType<String>()
          .toList();
      return studios.isNotEmpty ? [studios.first] : const [];
    }
    if (item.artists.isNotEmpty) return item.artists;
    final albumArtist = item.albumArtist;
    return (albumArtist != null && albumArtist.isNotEmpty)
        ? [albumArtist]
        : const [];
  }

  String? _artUrl(AggregatedItem item) {
    final client = _clientFor(item);
    String? url;
    try {
      final albumTag = item.albumPrimaryImageTag;
      final albumId = item.albumId;
      if (item.type == 'Audio' && albumTag != null && albumId != null) {
        url = client.imageApi
            .getPrimaryImageUrl(albumId, maxHeight: 300, tag: albumTag);
      } else if (item.primaryImageTag != null) {
        url = client.imageApi
            .getPrimaryImageUrl(item.id, maxHeight: 300, tag: item.primaryImageTag);
      }
    } catch (_) {}
    // Self-authenticating URL: the desktop shell fetches the art in its own
    // process with no access to the app's auth header.
    return carAuthedImageUrl(client, url);
  }

  MediaServerClient _clientFor(AggregatedItem item) =>
      _clientFactory.getClientIfExists(item.serverId) ??
      GetIt.instance<MediaServerClient>();

  // Object paths only allow [A-Za-z0-9_], so fold anything else in the item id.
  String _trackPath(String id) {
    final safe = id.replaceAll(RegExp(r'[^A-Za-z0-9_]'), '_');
    return '/org/moonfin/track/${safe.isEmpty ? 'unknown' : safe}';
  }

  Future<void> emitChanged(List<String> names) async {
    final changed = <String, DBusValue>{};
    for (final name in names) {
      final value = _playerProperty(name);
      if (value != null) changed[name] = value;
    }
    if (changed.isEmpty) return;
    try {
      await emitPropertiesChanged(_playerInterface, changedProperties: changed);
    } catch (_) {}
  }

  Future<void> emitSeeked(Duration position) async {
    try {
      await emitSignal(
          _playerInterface, 'Seeked', [DBusInt64(position.inMicroseconds)]);
    } catch (_) {}
  }
}

Future<void> initMprisService({
  required PlaybackManager manager,
  required MediaServerClientFactory clientFactory,
}) async {
  if (GetIt.instance.isRegistered<MprisService>()) return;
  final service = MprisService(manager, clientFactory);
  await service.start();
  GetIt.instance.registerSingleton<MprisService>(service);
}
