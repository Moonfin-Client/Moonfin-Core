import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../auth/repositories/session_repository.dart';
import '../auth/services/silo_token_storage.dart';
import '../data/models/aggregated_item.dart';
import '../data/services/media_server_client_factory.dart';
import '../data/services/moonbase_endpoint.dart';
import '../data/services/plugin_sync_service.dart' show pluginRequestOptions;
import '../ui/navigation/app_router.dart';
import '../ui/navigation/destinations.dart';
import '../ui/widgets/video_mini_player.dart';
import '../util/platform_detection.dart';

/// Silo's Watch Party: rooms joined with a code, kept in step over the room
/// socket (`silo.room.v2`). Jellyfin servers use [SyncPlayManager] instead.
///
/// While the room plays, local play, pause and seek become requests to the
/// room, and the player only moves on the room's transport commands, run at
/// their server time. See Silo's docs/architecture/watch-party-
/// synchronization.md for the rules the numbers below come from.
class SiloWatchPartyManager extends ChangeNotifier {
  SiloWatchPartyManager(this._playbackManager);

  final PlaybackManager _playbackManager;
  final Logger _logger = Logger();

  static const _reconnectDelaysMs = [500, 1000, 2000, 5000];
  static const _reportInterval = Duration(milliseconds: 1500);
  static const _waitingReportInterval = Duration(milliseconds: 500);
  static const _bufferingGrace = Duration(seconds: 2);
  static const _maxDriftSeconds = 1.0;

  SiloMediaServerClient? _client;
  String? _serverId;
  SiloRoom? _room;
  String? _roomToken;
  String? _endedReason;
  String? _error;
  bool _busy = false;
  int _roomScreens = 0;
  // The host's subtitles for the room, kept by Moonbase: null leaves them
  // to each member, else {"index", "language"} or {"off": true}.
  Map<String, dynamic>? _groupSubtitle;
  bool _groupSubtitleKnown = false;
  bool _groupSubtitlesSupported = false;
  String? _groupSubtitleApplied;
  Timer? _partyPoll;
  Timer? _avatarTimer;
  Map<String, String> _avatars = const {};
  // The player's last position sample and when it came, to estimate where
  // it is between samples (some players report once a second).
  int? _sampleMs;
  int _sampleAt = 0;
  StreamSubscription<Duration>? _positionSub;
  int _driftStrikes = 0;
  int _nudgeStartedMs = 0;
  int _nudgeBlockedUntilMs = 0;
  final Dio _dio = Dio(pluginRequestOptions());
  List<SiloRoomSuggestion> _suggestions = const [];
  String? _itemId;
  Future<Map<String, dynamic>?>? _item;

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _channelSub;
  int _socketGeneration = 0;
  int _reconnectAttempt = 0;
  Timer? _reconnectTimer;
  bool _connected = false;

  // Clock: the offset of the fastest of the last eight round trips.
  final List<({int rttMs, int offsetMs})> _clockSamples = [];
  int _samplesThisSocket = 0;
  Timer? _pingTimer;

  int? _openedRevision;
  String? _attachSentFor;
  int _attachSentAtMs = 0;
  SiloRoomCommand? _lastCommand;
  Timer? _commandTimer;
  String? _appliedCommandId;
  // The last command run here and the local time it ran at: where the room
  // is now, for drift checks.
  ({double positionSeconds, int localMs, bool playing})? _reference;
  int _driftBackoffMs = 1000;
  Timer? _driftTimer;
  double? _nudgedRate;
  bool _hostStopping = false;
  int _lastDriftSeekMs = 0;
  bool _applying = false;
  bool _interceptorInstalled = false;
  Timer? _reportTimer;
  Duration? _reportEvery;
  StreamSubscription<bool>? _bufferingSub;
  Timer? _bufferingTimer;
  bool _bufferingReported = false;
  Timer? _aloneTimer;

  SiloRoom? get room => _room;
  bool get inRoom => _room != null;
  bool get connected => _connected;
  bool get busy => _busy;

  /// Why the last room ended, for the room screen to show once.
  String? get endedReason => _endedReason;
  String? get error => _error;

  /// Whether the player is following a room right now, so it should keep
  /// local-only shortcuts (speed holds, episode switching) out of the way.
  bool get controlsPlayback => _room?.isPlaying == true;

  /// The active client when it is a Silo server, else null.
  SiloMediaServerClient? get activeSiloClient {
    final client = _activeClient;
    return client == null ? null : siloClientOf(client);
  }

  /// The signed-in user's server. Not the factory's newest client, which
  /// can belong to another account signed in alongside.
  MediaServerClient? get _activeClient {
    final getIt = GetIt.instance;
    return getIt.isRegistered<MediaServerClient>()
        ? getIt<MediaServerClient>()
        : null;
  }

  Future<bool> serverSupportsRooms() async {
    final client = activeSiloClient;
    if (client == null) return false;
    try {
      return await client.watchPartyApi.available();
    } catch (_) {
      return false;
    }
  }

  Future<bool> create() => _enter((api) => api.create(const Uuid().v4()));

  Future<bool> join(String code) => _enter((api) => api.join(code));

  /// Host: stage [contentId], opening a room first when there is none.
  Future<bool> stage(String contentId) async {
    if (_room == null && !await create()) return false;
    return _hostAction((api, id) => api.stage(id, contentId));
  }

  /// Host, from a title's page: a movie goes up for the vote in a voting
  /// room; anything else is the host's pick, so voting is switched off for
  /// it. Opens a room first when there is none.
  Future<bool> pick(AggregatedItem item) async {
    final room = _room;
    if (room != null && room.isVoting) {
      if (item.type == 'Movie') {
        return suggestMovie(item.rawData);
      }
      if (!await setVoting(false)) return false;
      return _stageOrVoteAgain(item.id);
    }
    return stage(item.id);
  }

  /// Stages [contentId] after voting was switched off for it. If that fails
  /// the vote comes back, so the room isn't left with neither.
  Future<bool> _stageOrVoteAgain(String contentId) async {
    if (await stage(contentId)) return true;
    final error = _error;
    await setVoting(true);
    _error = error;
    notifyListeners();
    return false;
  }

  /// Host: when an episode finishes, stages the series' next one, so the
  /// host only has to start it.
  Future<void> _stageNextEpisode(String? contentId) async {
    final client = _client;
    if (contentId == null || client == null) return;
    try {
      final item = await selectedItem();
      final seriesId = item?['SeriesId'];
      if (item?['Type'] != 'Episode' || seriesId is! String) return;
      final episodes = [
        for (final e
            in (await client.itemsApi.getEpisodes(seriesId))['Items']
                    as List? ??
                const [])
          if (e is Map<String, dynamic> && e['Id'] is String) e,
      ];
      final next = nextEpisodeId(episodes, contentId);
      if (next == null) return;
      final room = _room;
      // Only while the lobby still holds the finished episode.
      if (room == null ||
          room.isPlaying ||
          room.selectedContentId != contentId) {
        return;
      }
      await stage(next);
    } catch (e) {
      _logger.w('Watch Party: staging the next episode failed', error: e);
    }
  }

  /// The episode after [currentId] in season and episode order, specials
  /// left out.
  @visibleForTesting
  static String? nextEpisodeId(
    List<Map<String, dynamic>> episodes,
    String currentId,
  ) {
    int number(Map<String, dynamic> e, String key) =>
        (e[key] as num?)?.toInt() ?? 0;
    final ordered =
        episodes.where((e) => number(e, 'ParentIndexNumber') > 0).toList()
          ..sort((a, b) {
            final season = number(
              a,
              'ParentIndexNumber',
            ).compareTo(number(b, 'ParentIndexNumber'));
            return season != 0
                ? season
                : number(a, 'IndexNumber').compareTo(number(b, 'IndexNumber'));
          });
    final at = ordered.indexWhere((e) => e['Id'] == currentId);
    if (at < 0 || at + 1 >= ordered.length) return null;
    return ordered[at + 1]['Id'] as String;
  }

  /// The vote room's titles, most votes first.
  List<SiloRoomSuggestion> get suggestions => _suggestions;

  /// Host, in the lobby: let members vote on movies, or go back to picking.
  Future<bool> setVoting(bool voting) async {
    final done = await _hostAction((api, id) => api.setVoting(id, voting));
    if (done) await _loadSuggestions();
    return done;
  }

  /// Movies in the library matching [query], for the host to put up.
  Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    final client = _client;
    if (client == null || query.trim().isEmpty) return const [];
    final response = await client.itemsApi.getItems(
      searchTerm: query.trim(),
      includeItemTypes: const ['Movie'],
      recursive: true,
      limit: 20,
      fields: 'ProductionYear',
    );
    return [
      for (final item in response['Items'] as List? ?? const [])
        if (item is Map<String, dynamic> && item['Id'] is String) item,
    ];
  }

  /// Host: puts a movie (a Moonfin item map) up for the vote.
  Future<bool> suggestMovie(Map<String, dynamic> movie) =>
      _roomCall((api, id, token) async {
        final year = movie['ProductionYear'];
        await api.suggest(
          id,
          token,
          suggestionId: const Uuid().v4(),
          contentId: movie['Id'] as String,
          title: movie['Name'] as String? ?? '',
          subtitle: year == null ? null : '$year',
        );
        await _loadSuggestions();
      });

  Future<bool> vote(SiloRoomSuggestion suggestion, bool voted) =>
      _roomCall((api, id, token) async {
        await api.vote(id, token, suggestion.id, voted);
        await _loadSuggestions();
      });

  /// Host.
  Future<bool> removeSuggestion(SiloRoomSuggestion suggestion) =>
      _roomCall((api, id, token) async {
        await api.removeSuggestion(id, token, suggestion.id);
        await _loadSuggestions();
      });

  /// Host: picks [suggestion] for everyone, whatever the tally, and stages
  /// it so the host starts it from the room like any other pick. Silo
  /// stages only in host-pick rooms, so this ends the vote; the movies up
  /// for it stay in the room if voting is turned back on.
  Future<bool> pickSuggestion(SiloRoomSuggestion suggestion) async {
    if (!await setVoting(false)) return false;
    return _stageOrVoteAgain(suggestion.contentId);
  }

  Future<void> _loadSuggestions() async {
    final room = _room;
    final token = _roomToken;
    final client = _client;
    if (room == null || token == null || client == null) return;
    if (!room.isVoting) {
      _suggestions = const [];
      notifyListeners();
      return;
    }
    try {
      _suggestions = await client.watchPartyApi.suggestions(room.roomId, token);
      notifyListeners();
    } catch (e) {
      _logger.w('Watch Party: loading suggestions failed', error: e);
    }
  }

  /// A socket broadcast of the list. It always says nobody voted, so this
  /// viewer's own votes carry over from what they had.
  void _onSuggestions(List<dynamic> rows) {
    final mine = {
      for (final s in _suggestions)
        if (s.votedByMe) s.id,
    };
    _suggestions = [
      for (final row in rows)
        if (row is Map<String, dynamic>)
          if (SiloRoomSuggestion.fromJson(row) case final s?)
            s.withVote(mine.contains(s.id)),
    ]..sort(SiloRoomSuggestion.compare);
    notifyListeners();
  }

  Future<bool> _roomCall(
    Future<void> Function(SiloWatchPartyApi api, String roomId, String token)
    request,
  ) async {
    final room = _room;
    final token = _roomToken;
    final client = _client;
    if (room == null || token == null || client == null) return false;
    _error = null;
    try {
      await request(client.watchPartyApi, room.roomId, token);
      return true;
    } catch (e) {
      _error = _describe(e);
      notifyListeners();
      return false;
    }
  }

  Future<bool> startPlayback() => _hostAction((api, id) => api.start(id));

  Future<bool> stopPlayback() async {
    // A stop of the host's own doesn't move on to the next episode.
    _hostStopping = true;
    final done = await _hostAction((api, id) => api.stop(id));
    if (!done) _hostStopping = false;
    return done;
  }

  /// The invite link for the room, for its host.
  Uri? get inviteUri {
    final path = _room?.invitePath;
    final client = _client;
    if (path == null || client == null) return null;
    return client.watchPartyApi.inviteUri(path);
  }

  /// After a user or server switch, or a sign-out: leaves a room that
  /// belongs to another session.
  void onSessionChanged({bool signedOut = false}) {
    if (_room == null) return;
    if (signedOut || !identical(activeSiloClient, _client)) leave();
  }

  Future<bool> setGuestsCanPause(bool allowed) =>
      _hostAction((api, id) => api.setGuestsCanPause(id, allowed));

  /// Host: ends the room for everyone.
  Future<void> end() async {
    final room = _room;
    final client = _client;
    if (room == null || client == null) return;
    try {
      await client.watchPartyApi.close(room.roomId);
    } catch (e) {
      _logger.w('Watch Party: closing the room failed', error: e);
    }
    _leaveRoom(null);
  }

  /// Leaves without ending the room. A host's room closes on its own two
  /// minutes later unless they come back.
  void leave() => _leaveRoom(null);

  /// How many room screens are open, so the player knows whether leaving it
  /// lands on one.
  int get roomScreensOpen => _roomScreens;
  void roomScreenOpened() => _roomScreens++;
  void roomScreenClosed() => _roomScreens--;

  /// The host's subtitles for everyone: null leaves them to each member,
  /// else `{"index", "language"}` for a track or `{"off": true}`. Members
  /// can still change their own in the player.
  Map<String, dynamic>? get groupSubtitle => _groupSubtitle;

  /// Whether Moonbase is there to keep the host's choice. Without it each
  /// member picks their own.
  bool get groupSubtitlesSupported => _groupSubtitlesSupported;

  /// Host: subtitles for everyone. [track] is a Moonfin subtitle stream, or
  /// null with [off] false to leave them to each member.
  Future<bool> setGroupSubtitle(
    Map<String, dynamic>? track, {
    bool off = false,
  }) async {
    final room = _room;
    final client = _client;
    if (room == null || client == null || !room.isHost) return false;
    final choice = off
        ? <String, dynamic>{'off': true}
        : track == null
        ? null
        : <String, dynamic>{
            'index': track['Index'],
            'language': ?track['Language'],
          };
    try {
      final ep = await moonbaseEndpoint(client, _dio);
      if (ep == null) return false;
      await _dio.put<dynamic>(
        '${ep.base}/Moonfin/WatchParty/${room.roomId}',
        data: {'subtitle': choice},
        options: Options(headers: ep.headers),
      );
    } catch (e) {
      _error = _describe(e);
      notifyListeners();
      return false;
    }
    _groupSubtitle = choice;
    notifyListeners();
    await _applyGroupSubtitle();
    return true;
  }

  Future<void> _loadGroupSubtitle() async {
    final room = _room;
    final client = _client;
    if (room == null || client == null) return;
    try {
      final ep = await moonbaseEndpoint(client, _dio);
      if (ep == null) return;
      final response = await _dio.get<dynamic>(
        '${ep.base}/Moonfin/WatchParty/${room.roomId}',
        options: Options(headers: ep.headers),
      );
      if (_room?.roomId != room.roomId) return;
      final data = response.data;
      _groupSubtitlesSupported = true;
      _groupSubtitleKnown = true;
      final avatars = data is Map ? data['avatars'] : null;
      _avatars = {
        if (avatars is Map)
          for (final e in avatars.entries)
            if (e.key is String && e.value is String)
              e.key as String: e.value as String,
      };
      final subtitle = data is Map ? data['subtitle'] : null;
      _groupSubtitle = subtitle is Map
          ? Map<String, dynamic>.from(subtitle)
          : null;
      notifyListeners();
      await _applyGroupSubtitle();
    } catch (_) {
      // An older Moonbase, or none: members pick their own.
      _groupSubtitleKnown = true;
    }
  }

  /// A member's avatar link as they posted it to Moonbase, made absolute,
  /// or null.
  String? avatarUrlFor(String profileId) {
    final link = _avatars[profileId];
    final client = _client;
    if (link == null || client == null) return null;
    return Uri.parse(client.baseUrl).resolve(link).toString();
  }

  /// Posts this profile's avatar link for the room, so members on other
  /// accounts can show it. An upload's link is signed for 15 minutes, so
  /// it goes again every ten.
  Future<void> _publishAvatar() async {
    final room = _room;
    final client = _client;
    if (room == null || client == null) return;
    try {
      final profiles = await client.profilesApi.list();
      final mine = profiles.where((p) => p.id == client.profileId).firstOrNull;
      final link = mine?.json['avatar_url'];
      if (link is! String || link.isEmpty) return;
      final ep = await moonbaseEndpoint(client, _dio);
      if (ep == null) return;
      await _dio.put<dynamic>(
        '${ep.base}/Moonfin/WatchParty/${room.roomId}/Avatar',
        data: {'url': link},
        options: Options(headers: ep.headers),
      );
    } catch (_) {
      // No Moonbase, or an older one: members see initials.
    }
  }

  /// The stream index the host's choice means in [source]: the same index
  /// when that stream has the same language, else the first in the
  /// language; -1 for off; null to leave it to the member.
  static int? subtitleIndexFor(
    Map<String, dynamic>? choice,
    Map<String, dynamic>? source,
  ) {
    if (choice == null) return null;
    if (choice['off'] == true) return -1;
    final tracks = streamsOf(source, 'Subtitle');
    final index = choice['index'];
    final language = choice['language'];
    final same = tracks.where((t) => t['Index'] == index).firstOrNull;
    if (same != null && (language == null || same['Language'] == language)) {
      return index as int;
    }
    if (language != null) {
      final byLanguage = tracks
          .where((t) => t['Language'] == language)
          .firstOrNull;
      if (byLanguage != null) return byLanguage['Index'] as int;
    }
    return null;
  }

  /// Puts the host's choice on the playing item, once per change of it:
  /// a member who then picks their own in the player keeps it.
  Future<void> _applyGroupSubtitle() async {
    final room = _room;
    final current = _playbackManager.queueService.currentItem;
    final key = jsonEncode(_groupSubtitle);
    if (room == null ||
        !room.isPlaying ||
        current is! AggregatedItem ||
        current.id != room.selectedContentId ||
        key == _groupSubtitleApplied) {
      return;
    }
    _groupSubtitleApplied = key;
    final raw = await selectedItem();
    final index = subtitleIndexFor(
      _groupSubtitle,
      raw == null ? null : partySource(raw, room.selectedFileId),
    );
    if (index == null) return;
    if (index < 0) {
      await _playbackManager.disableSubtitles();
    } else {
      await _playbackManager.changeSubtitleTrack(index);
    }
  }

  /// The room's item as Moonfin reads it, fetched once per selection.
  Future<Map<String, dynamic>?> selectedItem() {
    final id = _room?.selectedContentId;
    final client = _client;
    if (id == null || client == null) return Future.value(null);
    if (id != _itemId || _item == null) {
      _itemId = id;
      _item = client.itemsApi
          .getItem(id)
          .then<Map<String, dynamic>?>((raw) => raw, onError: (_) => null);
    }
    return _item!;
  }

  /// The media source the room plays: its pinned file, else the first.
  static Map<String, dynamic>? partySource(
    Map<String, dynamic> item,
    String? fileId,
  ) {
    final sources = [
      for (final s in item['MediaSources'] as List? ?? const [])
        if (s is Map<String, dynamic>) s,
    ];
    if (sources.isEmpty) return null;
    return sources.firstWhere(
      (s) => fileId != null && '${s['Id']}' == fileId,
      orElse: () => sources.first,
    );
  }

  static List<Map<String, dynamic>> streamsOf(
    Map<String, dynamic>? source,
    String type,
  ) => [
    for (final s in source?['MediaStreams'] as List? ?? const [])
      if (s is Map<String, dynamic> && s['Type'] == type && s['Index'] is int)
        s,
  ];

  /// The file's default audio track, so every member hears the same one
  /// whatever their own language preferences.
  static int? defaultAudioIndex(Map<String, dynamic>? source) {
    final audio = streamsOf(source, 'Audio');
    if (audio.isEmpty) return null;
    final chosen = audio.firstWhere(
      (s) => s['IsDefault'] == true,
      orElse: () => audio.first,
    );
    return chosen['Index'] as int;
  }

  /// Opens the playing item again for a viewer who left the player. The
  /// room syncs the new session to where everyone is once it attaches.
  Future<void> openPlayer() async {
    final room = _room;
    if (room == null || !room.isPlaying) return;
    await _openSelection(room);
  }

  void clearEndedReason() {
    _endedReason = null;
    notifyListeners();
  }

  Future<bool> _enter(
    Future<SiloRoomAccess> Function(SiloWatchPartyApi api) request,
  ) async {
    final active = _activeClient;
    final client = active == null ? null : siloClientOf(active);
    if (active == null || client == null) return false;
    _busy = true;
    _error = null;
    _endedReason = null;
    notifyListeners();
    try {
      final access = await request(client.watchPartyApi);
      if (_room != null) _leaveRoom(null);
      _client = client;
      _serverId = _serverIdOf(active);
      _room = access.room;
      _roomToken = access.token;
      _clockSamples.clear();
      _checkAlone();
      unawaited(_connect());
      unawaited(_loadSuggestions());
      unawaited(_loadGroupSubtitle());
      unawaited(_publishAvatar());
      _partyPoll?.cancel();
      // Avatars of members who join, and a host's subtitle change, arrive
      // within this.
      _partyPoll = Timer.periodic(
        const Duration(seconds: 15),
        (_) => unawaited(_loadGroupSubtitle()),
      );
      _avatarTimer?.cancel();
      _avatarTimer = Timer.periodic(
        const Duration(minutes: 10),
        (_) => unawaited(_publishAvatar()),
      );
      return true;
    } catch (e) {
      _error = _describe(e);
      return false;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  Future<bool> _hostAction(
    Future<SiloRoom> Function(SiloWatchPartyApi api, String roomId) request,
  ) async {
    final room = _room;
    final client = _client;
    if (room == null || client == null) return false;
    _busy = true;
    _error = null;
    notifyListeners();
    try {
      _onRoom(await request(client.watchPartyApi, room.roomId));
      return true;
    } catch (e) {
      _error = _describe(e);
      return false;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  String _describe(Object e) {
    if (e is DioException) {
      final data = e.response?.data;
      if (data is Map && data['detail'] is String) return data['detail'];
      if (data is Map && data['message'] is String) return data['message'];
      if (e.response?.statusCode == 404) return 'No room has that code.';
    }
    return e.toString();
  }

  /// The signed-in session's server id, else the factory's id for
  /// [client]'s server (the factory and the active registration wrap the
  /// same Silo client in different wrappers).
  String? _serverIdOf(MediaServerClient client) {
    final getIt = GetIt.instance;
    if (getIt.isRegistered<SessionRepository>()) {
      final id = getIt<SessionRepository>().activeServerId;
      if (id != null) return id;
    }
    final silo = siloClientOf(client);
    if (silo == null) return null;
    try {
      for (final entry in getIt<MediaServerClientFactory>().clients.entries) {
        if (identical(siloClientOf(entry.value), silo)) return entry.key;
      }
    } catch (_) {}
    return null;
  }

  // Socket

  Future<void> _connect() async {
    final room = _room;
    final token = _roomToken;
    final client = _client;
    if (room == null || token == null || client == null) return;
    final generation = ++_socketGeneration;
    final api = client.watchPartyApi;
    try {
      final ticket = await api.socketTicket(room.roomId, token);
      if (generation != _socketGeneration) return;
      final channel = WebSocketChannel.connect(
        api.socketUri(room.roomId),
        protocols: [SiloWatchPartyApi.socketProtocol, 'silo.ticket.$ticket'],
      );
      await channel.ready;
      if (generation != _socketGeneration) {
        unawaited(channel.sink.close());
        return;
      }
      _channel = channel;
      _connected = true;
      _reconnectAttempt = 0;
      _attachSentFor = null;
      _samplesThisSocket = 0;
      _channelSub = channel.stream.listen(
        (data) => _onFrame(data),
        onDone: () => _onSocketClosed(generation),
        onError: (_) => _onSocketClosed(generation),
      );
      _sendPing();
      // Broadcasts sent while the socket was down are gone.
      unawaited(_loadSuggestions());
      notifyListeners();
    } on DioException catch (e) {
      if (generation != _socketGeneration) return;
      final status = e.response?.statusCode;
      // Refused for good: the room is gone or this proof no longer admits us.
      if (status == 403 || status == 404 || status == 409) {
        _leaveRoom('closed');
        return;
      }
      _scheduleReconnect(generation);
    } catch (_) {
      if (generation != _socketGeneration) return;
      _scheduleReconnect(generation);
    }
  }

  void _onSocketClosed(int generation) {
    if (generation != _socketGeneration) return;
    _closeSocket();
    notifyListeners();
    // Silo closes every room socket after five minutes; a fresh ticket
    // reconnects it.
    _scheduleReconnect(generation);
  }

  void _scheduleReconnect(int generation) {
    if (_room == null || generation != _socketGeneration) return;
    final delay =
        _reconnectDelaysMs[math.min(
          _reconnectAttempt,
          _reconnectDelaysMs.length - 1,
        )];
    _reconnectAttempt++;
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(Duration(milliseconds: delay), () {
      if (generation == _socketGeneration) unawaited(_connect());
    });
  }

  void _closeSocket() {
    _connected = false;
    _pingTimer?.cancel();
    _pingTimer = null;
    _channelSub?.cancel();
    _channelSub = null;
    final channel = _channel;
    _channel = null;
    if (channel != null) unawaited(channel.sink.close());
  }

  bool _send(Map<String, Object?> message) {
    final channel = _channel;
    if (channel == null || !_connected) return false;
    channel.sink.add(jsonEncode(message));
    return true;
  }

  void _onFrame(dynamic data) {
    final Map<String, dynamic> message;
    try {
      final decoded = jsonDecode(data as String);
      if (decoded is! Map<String, dynamic>) return;
      message = decoded;
    } catch (_) {
      return;
    }
    switch (message['type']) {
      case 'snapshot':
        if (message['room'] case final Map<String, dynamic> json) {
          _onRoom(SiloRoom.fromJson(json));
        }
      case 'transport_command':
        if (message['command'] case final Map<String, dynamic> json) {
          final command = SiloRoomCommand.fromJson(json);
          if (command != null) _onCommand(command);
        }
      case 'pong':
        _onPong(message);
      case 'suggestions_update':
        if (message['suggestions'] case final List<dynamic> rows) {
          _onSuggestions(rows);
        }
      case 'room_closed':
        _leaveRoom('closed');
      case 'connection_replaced':
        _leaveRoom(
          message['reason'] as String? ??
              'This profile joined the Watch Party on another device.',
        );
      case 'error':
        final code = message['code'];
        if (code == 'not_found' || code == 'gone') {
          _leaveRoom('closed');
        } else {
          _logger.d('Watch Party: $code ${message['message'] ?? ''}');
        }
    }
  }

  // Clock

  void _sendPing() {
    _pingTimer?.cancel();
    _send({
      'type': 'ping',
      'client_sent_at': DateTime.now().toUtc().toIso8601String(),
    });
    // Every 2 s until four samples, then every 15 s.
    _pingTimer = Timer(
      Duration(seconds: _samplesThisSocket < 4 ? 2 : 15),
      _sendPing,
    );
  }

  void _onPong(Map<String, dynamic> message) {
    final t0 = DateTime.tryParse(message['client_sent_at'] as String? ?? '');
    final t1 = DateTime.tryParse(
      message['server_received_at'] as String? ?? '',
    );
    final t2 = DateTime.tryParse(message['server_sent_at'] as String? ?? '');
    if (t0 == null || t1 == null || t2 == null) return;
    final t3 = DateTime.now().millisecondsSinceEpoch;
    final sample = clockSample(
      t0.millisecondsSinceEpoch,
      t1.millisecondsSinceEpoch,
      t2.millisecondsSinceEpoch,
      t3,
    );
    _samplesThisSocket++;
    _clockSamples.add(sample);
    if (_clockSamples.length > 8) _clockSamples.removeAt(0);
  }

  /// One NTP-style sample: the round trip, and server time minus local time.
  @visibleForTesting
  static ({int rttMs, int offsetMs}) clockSample(
    int clientSentMs,
    int serverReceivedMs,
    int serverSentMs,
    int clientReceivedMs,
  ) => (
    rttMs:
        (clientReceivedMs - clientSentMs) - (serverSentMs - serverReceivedMs),
    offsetMs:
        ((serverReceivedMs - clientSentMs) +
            (serverSentMs - clientReceivedMs)) ~/
        2,
  );

  int get _serverOffsetMs {
    if (_clockSamples.isEmpty) return 0;
    return _clockSamples.reduce((a, b) => b.rttMs < a.rttMs ? b : a).offsetMs;
  }

  // Room state

  void _onRoom(SiloRoom next) {
    final previous = _room;
    if (previous == null) return;
    if (next.roomId != previous.roomId ||
        next.generation < previous.generation) {
      return;
    }
    _room = next;
    if (next.selectedContentId != previous.selectedContentId) {
      _groupSubtitleApplied = null;
    }
    if (next.isVoting != previous.isVoting) unawaited(_loadSuggestions());
    if (next.isPlaying && next.selectedContentId != null) {
      _startFollowing();
      if (_openedRevision != next.selectionRevision) {
        _openedRevision = next.selectionRevision;
        _appliedCommandId = null;
        _reference = null;
        unawaited(_openSelection(next));
      }
    } else if (previous.isPlaying) {
      // Back in the lobby: the host stopped, or the item finished.
      final finished = !_hostStopping;
      _hostStopping = false;
      if (finished &&
          next.isHost &&
          !next.isVoting &&
          next.selectedContentId == previous.selectedContentId) {
        unawaited(_stageNextEpisode(previous.selectedContentId));
      }
      _openedRevision = null;
      _stopFollowing();
      _applying = true;
      unawaited(
        _playbackManager
            .stop(userInitiated: false)
            .whenComplete(() => _applying = false),
      );
    }
    _checkAlone();
    _scheduleReports();
    notifyListeners();
  }

  /// A host left alone in their room's lobby for ten minutes ends it, so a
  /// party nobody joined doesn't stay open. Not while something plays: a
  /// guest whose phone locked shows as disconnected and comes back.
  void _checkAlone() {
    // Silo keeps a member who dropped without leaving, marked disconnected.
    bool alone() =>
        _room?.isHost == true &&
        !_room!.isPlaying &&
        _room!.members.where((m) => m.connected).length <= 1;
    if (!alone()) {
      _aloneTimer?.cancel();
      _aloneTimer = null;
      return;
    }
    _aloneTimer ??= Timer(const Duration(minutes: 10), () {
      _aloneTimer = null;
      if (alone()) unawaited(end());
    });
  }

  Future<void> _openSelection(SiloRoom room) async {
    final client = _client;
    final serverId = _serverId;
    final contentId = room.selectedContentId;
    if (client == null || serverId == null || contentId == null) return;
    final raw = await selectedItem();
    if (raw == null) {
      _logger.w('Watch Party: loading the room\'s item failed');
      return;
    }
    final item = AggregatedItem(
      id: contentId,
      serverId: serverId,
      rawData: raw,
    );
    final source = partySource(raw, room.selectedFileId);
    final audio = defaultAudioIndex(source);
    // The host's pick as the item starts; a member can change theirs after.
    if (!_groupSubtitleKnown || !room.isHost) await _loadGroupSubtitle();
    final subtitles = subtitleIndexFor(_groupSubtitle, source);
    _groupSubtitleApplied = jsonEncode(_groupSubtitle);
    if (_room?.selectionRevision != room.selectionRevision) return;
    _applying = true;
    try {
      // Loaded paused: only the room's commands start it.
      await _playbackManager.playItems(
        [item],
        startPosition: Duration(
          milliseconds: (room.anchorPositionSeconds * 1000).round(),
        ),
        mediaSourceId: room.selectedFileId,
        audioStreamIndex: audio,
        audioSelectionExplicit: audio != null,
        subtitleStreamIndex: subtitles,
        subtitleSelectionExplicit: subtitles != null,
        autoPlay: false,
      );
      if (_playbackManager.state.isPlaying) await _playbackManager.pause();
    } catch (e) {
      _logger.w('Watch Party: starting the room\'s item failed', error: e);
    } finally {
      _applying = false;
    }
    _ensurePlayerRoute();
    _tick();
  }

  void _ensurePlayerRoute() {
    final path = appRouter.routerDelegate.currentConfiguration.uri.path;
    if (path == Destinations.videoPlayer) return;
    // A viewer who minimized the video keeps watching in the mini player.
    if (VideoMiniPlayerController.isSupported &&
        VideoMiniPlayerController.instance.isMinimized) {
      return;
    }
    appRouter.push(Destinations.videoPlayer);
  }

  void _leaveRoom(String? reason) {
    if (_room == null && _channel == null) return;
    _socketGeneration++;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _closeSocket();
    _stopFollowing();
    _room = null;
    _roomToken = null;
    _client = null;
    _partyPoll?.cancel();
    _partyPoll = null;
    _avatarTimer?.cancel();
    _avatarTimer = null;
    _aloneTimer?.cancel();
    _aloneTimer = null;
    _avatars = const {};
    _groupSubtitle = null;
    _groupSubtitleKnown = false;
    _groupSubtitlesSupported = false;
    _groupSubtitleApplied = null;
    _suggestions = const [];
    _item = null;
    _itemId = null;
    _openedRevision = null;
    _endedReason = reason;
    notifyListeners();
  }

  // Playback

  void _startFollowing() {
    if (!_interceptorInstalled) {
      _playbackManager.setTransportInterceptor(_intercept);
      _interceptorInstalled = true;
    }
    _bufferingSub ??= _playbackManager.state.bufferingStream.listen(
      _onBuffering,
    );
    _driftTimer ??= Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => _correctDrift(),
    );
    _positionSub ??= _playbackManager.state.positionStream.listen((p) {
      _sampleMs = p.inMilliseconds;
      _sampleAt = DateTime.now().millisecondsSinceEpoch;
    });
  }

  void _stopFollowing() {
    if (_interceptorInstalled) {
      _playbackManager.setTransportInterceptor(null);
      _interceptorInstalled = false;
    }
    _bufferingSub?.cancel();
    _bufferingSub = null;
    _bufferingTimer?.cancel();
    _bufferingTimer = null;
    _bufferingReported = false;
    _commandTimer?.cancel();
    _commandTimer = null;
    _reportTimer?.cancel();
    _reportTimer = null;
    _reportEvery = null;
    _lastCommand = null;
    _appliedCommandId = null;
    _reference = null;
    _attachSentFor = null;
    _driftTimer?.cancel();
    _driftTimer = null;
    _positionSub?.cancel();
    _positionSub = null;
    _sampleMs = null;
    _driftStrikes = 0;
    _restoreRate();
  }

  String? get _sessionId => _playbackManager.currentResolution?.playSessionId;

  /// Where the player is now: its last position sample moved on by the time
  /// since, at its rate, while it plays. Players sample as seldom as once a
  /// second, and a raw sample read against the clock looks up to a second
  /// behind.
  double get _positionSeconds {
    final state = _playbackManager.state;
    final reported = state.position.inMilliseconds;
    final sample = _sampleMs;
    if (sample == null ||
        sample != reported ||
        !state.isPlaying ||
        state.isBuffering) {
      return reported / 1000;
    }
    final since = math.min(
      DateTime.now().millisecondsSinceEpoch - _sampleAt,
      1500,
    );
    return (reported + since * state.playbackSpeed) / 1000;
  }

  bool get _attached {
    final session = _sessionId;
    return session != null && _room?.attachedSessionId == session;
  }

  Future<bool> _intercept(TransportAction action, {Duration? position}) async {
    final room = _room;
    if (_applying || room == null || !room.isPlaying) return false;
    switch (action) {
      case TransportAction.resume:
        _requestTransport('play', _positionSeconds);
        return true;
      case TransportAction.pause:
        _requestTransport('pause', _positionSeconds);
        return true;
      case TransportAction.seek:
        final target = position ?? _playbackManager.state.position;
        _requestTransport('seek', target.inMilliseconds / 1000);
        return true;
      case TransportAction.next:
      case TransportAction.previous:
        // The room plays one item; the host picks the next.
        return true;
      case TransportAction.stop:
        // Leaving the player stays in the room.
        return false;
    }
  }

  void _requestTransport(String action, double positionSeconds) {
    if (!_attached || _room?.canControlTransport != true) return;
    _send({
      'type': 'transport_request',
      'action': action,
      'position_seconds': math.max(0.0, positionSeconds),
      'is_paused': !_playbackManager.state.isPlaying,
    });
  }

  void _onCommand(SiloRoomCommand command) {
    final session = _sessionId;
    if (command.sessionId != null && command.sessionId != session) return;
    _lastCommand = command;
    _commandTimer?.cancel();
    final localAtMs =
        command.executeAt.millisecondsSinceEpoch - _serverOffsetMs;
    final delayMs = localAtMs - DateTime.now().millisecondsSinceEpoch;
    _commandTimer = Timer(
      Duration(milliseconds: math.max(0, delayMs)),
      () => unawaited(_applyCommand(command, localAtMs)),
    );
  }

  Future<void> _applyCommand(SiloRoomCommand command, int localAtMs) async {
    if (_lastCommand?.commandId != command.commandId) return;
    final playing = command.playbackState == 'playing';
    // A command run late projects forward to where the room is by now.
    final lateSeconds =
        math.max(0, DateTime.now().millisecondsSinceEpoch - localAtMs) / 1000;
    final target = command.positionSeconds + (playing ? lateSeconds : 0);
    // Rate and play state change when a command runs.
    _restoreRate();
    _applying = true;
    try {
      // A correction that finds this player already playing is closed by
      // playback rate from the new reference rather than a seek: on a
      // slower connection each seek rebuffers and falls behind again.
      // Explicit seeks, a start from paused, and drift past 5 s still seek.
      final byRate =
          command.action != 'seek' &&
          playing &&
          _playbackManager.state.isPlaying &&
          _correctsByRate;
      final tolerance = command.action == 'seek'
          ? 0.25
          : byRate
          ? 5.0
          : _maxDriftSeconds;
      if ((_positionSeconds - target).abs() > tolerance) {
        await _playbackManager.seekTo(
          Duration(milliseconds: (target * 1000).round()),
        );
      }
      if (playing && !_playbackManager.state.isPlaying) {
        await _playbackManager.resume();
      } else if (!playing && _playbackManager.state.isPlaying) {
        await _playbackManager.pause();
      }
    } catch (e) {
      _logger.w('Watch Party: applying a room command failed', error: e);
    } finally {
      _applying = false;
    }
    _appliedCommandId = command.commandId;
    // The room's timeline runs from the command's own time, not from when
    // this player got through applying it: a slow seek or start would
    // otherwise shift where this player thinks the room is.
    _reference = playing
        ? (
            positionSeconds: command.positionSeconds,
            localMs: localAtMs,
            playing: true,
          )
        : (
            positionSeconds: target,
            localMs: DateTime.now().millisecondsSinceEpoch,
            playing: false,
          );
    _driftStrikes = 0;
    _driftBackoffMs = 1000;
    _bufferingReported = false;
    _scheduleReports();
    _tick();
  }

  void _onBuffering(bool buffering) {
    if (!buffering) {
      _bufferingTimer?.cancel();
      _bufferingTimer = null;
      return;
    }
    // Stalls under two seconds stay local.
    if (_bufferingTimer != null || _bufferingReported) return;
    _bufferingTimer = Timer(_bufferingGrace, () {
      _bufferingTimer = null;
      final room = _room;
      if (room == null ||
          room.playbackState != 'playing' ||
          !_attached ||
          !_playbackManager.state.isBuffering) {
        return;
      }
      _bufferingReported = _send({
        'type': 'buffering',
        'session_id': _sessionId,
        'position_seconds': _positionSeconds,
        'is_paused': !_playbackManager.state.isPlaying,
      });
    });
  }

  bool get _readyPending {
    final room = _room;
    final command = _lastCommand;
    return room != null &&
        room.playbackState == 'waiting' &&
        command != null &&
        command.playbackState == 'waiting';
  }

  void _scheduleReports() {
    final every = _room?.isPlaying == true
        ? (_readyPending ? _waitingReportInterval : _reportInterval)
        : null;
    if (every == _reportEvery) return;
    _reportTimer?.cancel();
    _reportEvery = every;
    _reportTimer = every == null ? null : Timer.periodic(every, (_) => _tick());
  }

  void _tick() {
    final room = _room;
    final session = _sessionId;
    if (!_connected || room == null || !room.isPlaying || session == null) {
      return;
    }
    if (room.attachedSessionId != session) {
      // Again after five seconds: an attach the server refused (sent just
      // before the room started, say) is not retried by anything else.
      final now = DateTime.now().millisecondsSinceEpoch;
      if (_attachSentFor != session || now - _attachSentAtMs > 5000) {
        _attachSentFor = session;
        _attachSentAtMs = now;
        _send({'type': 'attach_session', 'session_id': session});
      }
      return;
    }
    final command = _lastCommand;
    final buffering = _playbackManager.state.isBuffering;
    if (_readyPending && command != null) {
      final applied = _appliedCommandId == command.commandId;
      final near =
          command.action != 'seek' ||
          (_positionSeconds - command.positionSeconds).abs() <=
              (room.isHost ? 15 : 1);
      if (applied && near && !buffering) {
        // A waiting room takes readiness on a state report, so a lost
        // ready heals on the next tick.
        _send({
          'type': 'state_report',
          'session_id': session,
          'command_id': command.commandId,
          'position_seconds': _positionSeconds,
          'is_paused': !_playbackManager.state.isPlaying,
          'is_ready': true,
        });
        return;
      }
    }
    // A stalled player reports where it stopped, not a decision.
    if (buffering) return;
    _send({
      'type': 'state_report',
      'session_id': session,
      'command_id': ?_appliedCommandId,
      'position_seconds': _positionSeconds,
      'is_paused': !_playbackManager.state.isPlaying,
    });
  }

  /// Brings this player back to the room: by a small change of playback
  /// rate for drift up to 5 s, by a seek past that, or for any drift over a
  /// second on a player that doesn't correct by rate. Runs about twice a
  /// second while the room plays.
  void _correctDrift() {
    final reference = _reference;
    if (reference == null ||
        !reference.playing ||
        _room?.playbackState != 'playing' ||
        !_playbackManager.state.isPlaying ||
        _playbackManager.state.isBuffering) {
      _restoreRate();
      return;
    }
    final now = DateTime.now().millisecondsSinceEpoch;
    final expected =
        reference.positionSeconds + (now - reference.localMs) / 1000;
    final drift = _positionSeconds - expected;
    final size = drift.abs();
    if (_correctsByRate && size <= 5) {
      if (_nudgedRate != null) {
        // Close enough, or a nudge that has run a minute without closing
        // the gap: back to 1x, and the room's own correction takes over.
        if (size <= 0.15 || now - _nudgeStartedMs > 60000) {
          if (size > 0.15) _nudgeBlockedUntilMs = now + 30000;
          _restoreRate();
          _driftStrikes = 0;
        } else {
          _nudge(drift);
        }
        return;
      }
      // Two checks in a row past half a second, so one late sample or a
      // passing hiccup doesn't start a nudge.
      _driftStrikes = size > 0.5 ? _driftStrikes + 1 : 0;
      if (_driftStrikes >= 2 && now >= _nudgeBlockedUntilMs) {
        _nudgeStartedMs = now;
        _nudge(drift);
      }
      return;
    }
    _restoreRate();
    if (size <= _maxDriftSeconds) {
      _driftBackoffMs = 1000;
      return;
    }
    if (now - _lastDriftSeekMs < _driftBackoffMs) return;
    _lastDriftSeekMs = now;
    _driftBackoffMs = math.min(_driftBackoffMs * 2, 16000);
    _applying = true;
    unawaited(
      _playbackManager
          .seekTo(Duration(milliseconds: (expected * 1000).round()))
          .whenComplete(() => _applying = false),
    );
  }

  /// TVs don't correct by rate: with the display matched to the title's
  /// frame rate, a rate even 1 percent off drops or repeats frames, and
  /// Android TV's tunneled playback ignores it.
  bool get _correctsByRate => !PlatformDetection.isTV;

  /// The pitch-kept rate that closes [driftSeconds] (positive is ahead):
  /// `1 ± clamp(drift / 25, 0.01, 0.04)` in half-percent steps, as Silo's
  /// own clients do.
  @visibleForTesting
  static double rateFor(double driftSeconds) {
    final step = (driftSeconds.abs() / 25).clamp(0.01, 0.04);
    final rounded = (step / 0.005).round() * 0.005;
    return driftSeconds > 0 ? 1 - rounded : 1 + rounded;
  }

  /// Nudges toward the room, except that a player behind with little
  /// buffered isn't sped up: it would only drain its buffer and stall, the
  /// skip this is meant to avoid. The room's correction handles that one.
  void _nudge(double drift) {
    final state = _playbackManager.state;
    final ahead = state.buffer - state.position;
    if (drift < 0 &&
        state.buffer > Duration.zero &&
        ahead < const Duration(seconds: 8)) {
      _restoreRate();
      return;
    }
    _setRate(rateFor(drift));
  }

  void _setRate(double rate) {
    if (_nudgedRate == rate) return;
    _nudgedRate = rate;
    unawaited(_playbackManager.setPlaybackSpeed(rate));
  }

  /// Only undoes a nudge: a rate write is play intent on some players, so
  /// writing 1x when nothing was nudged could resume a paused one.
  void _restoreRate() {
    if (_nudgedRate == null) return;
    _nudgedRate = null;
    unawaited(_playbackManager.setPlaybackSpeed(1.0));
  }

  @override
  void dispose() {
    _leaveRoom(null);
    super.dispose();
  }
}
