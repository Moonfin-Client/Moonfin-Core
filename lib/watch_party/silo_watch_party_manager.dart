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
import 'moonbase_watch_party_api.dart';
import 'silo_watch_party_backend.dart';
import 'watch_party_backend.dart';
import 'watch_party_events.dart';

export 'watch_party_events.dart';

/// What the active server offers for watch parties.
enum WatchPartyService {
  /// Silo's own Watch Party.
  silo,

  /// Moonbase's rooms.
  moonbase,

  /// Moonbase is there, but its admin turned watch parties off.
  moonbaseDisabled,

  /// No Moonbase that can host parties.
  noMoonbase,
}

/// Watch party rooms joined with a code, on Silo over its room socket
/// (`silo.room.v2`) and on Moonbase over its long-poll, through
/// [WatchPartyBackend]. Moonbase rooms add chat, reactions, statuses, PINs
/// and host controls. Jellyfin's SyncPlay is [SyncPlayManager].
///
/// While the room plays, local play, pause and seek become requests to the
/// room, and the player only moves on the room's transport commands, run at
/// their server time. See Silo's docs/architecture/watch-party-
/// synchronization.md for the rules the numbers below come from.
class SiloWatchPartyManager extends ChangeNotifier {
  SiloWatchPartyManager(this._playbackManager, {Dio? dio})
    : _dio = dio ?? Dio(pluginRequestOptions());

  final PlaybackManager _playbackManager;
  final Logger _logger = Logger();

  static const _reconnectDelaysMs = [500, 1000, 2000, 5000];
  static const _reportInterval = Duration(milliseconds: 1500);
  static const _moonbaseReportInterval = Duration(seconds: 2);
  static const _waitingReportInterval = Duration(milliseconds: 500);
  static const _bufferingGrace = Duration(seconds: 2);
  static const _maxDriftSeconds = 1.0;
  static const _maxStartLeadMs = 2000;

  /// The room's server: the Silo client itself on Silo, else the active
  /// client.
  MediaServerClient? _client;
  WatchPartyBackend? _backend;
  MediaServerClient? _moonbaseClient;
  MoonbaseWatchPartyApi? _moonbase;
  MoonbaseWatchPartyConfig? _config;
  String? _configFor;
  String? _serverId;
  SiloRoom? _room;
  String? _roomToken;
  String? _endedReason;
  String? _error;
  String? _errorCode;
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
  final Dio _dio;
  List<SiloRoomSuggestion> _suggestions = const [];
  String? _itemId;
  Future<Map<String, dynamic>?>? _item;

  WatchPartyChannel? _channel;
  StreamSubscription<Map<String, dynamic>>? _channelSub;
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

  /// A start the host asked to pick up part way. Silo starts every room at
  /// the beginning, so the host seeks the room there once its player is in,
  /// while the room still holds everyone paused waiting for them to load.
  ({int seconds, String contentId})? _pendingResume;
  int _lastDriftSeekMs = 0;
  // On Moonbase, until when a seek of this player's is still landing, the
  // one time it reports its own catching_up.
  int _seekLandsByMs = 0;
  // The lobby status a snapshot last showed for this member.
  String? _lobbySeenStatus;
  // A count, so a drift seek finishing mid-command doesn't let the
  // command's own resume through to the room as a request.
  int _applyingCount = 0;
  bool get _applying => _applyingCount > 0;
  // On Moonbase, the command this player was last lined up to, and whether
  // the party is still opening it.
  String? _linedUpCommand;
  bool _opening = false;
  // On Moonbase, how far ahead a seek on a playing timeline aims, learned
  // per file from where the last ones landed, and when to look next.
  int? _seekLeadMs;
  int? _seekCheckAtMs;
  // How long this player takes to start moving after resume(), learned per
  // file. A start from paused begins this much early so a heavy file's slow
  // decoder start doesn't show up as drift.
  int? _startLeadMs;
  ({int calledAtMs, int fromMs})? _startTiming;
  bool _interceptorInstalled = false;
  Timer? _reportTimer;
  Duration? _reportEvery;
  StreamSubscription<bool>? _bufferingSub;
  Timer? _bufferingTimer;
  bool _bufferingReported = false;
  Timer? _aloneTimer;

  // Moonbase's extensions.
  final List<WatchPartyChatEntry> _chat = [];
  final _toasts = StreamController<WatchPartyToast>.broadcast();
  final _reactions = StreamController<WatchPartyReaction>.broadcast();
  DateTime? _waitingSince;
  DateTime? _countdownTo;
  Timer? _countdownTimer;
  bool _wasConnected = false;
  String? _sentStatus;

  SiloRoom? get room => _room;
  bool get inRoom => _room != null;
  bool get connected => _connected;
  bool get busy => _busy;

  /// Why the last room ended, for the room screen to show once.
  String? get endedReason => _endedReason;
  String? get error => _error;

  /// Moonbase's code for the last error, like `wrong_pin` or `full`, for a
  /// message in the member's language.
  String? get errorCode => _errorCode;

  /// Whether the room runs on Moonbase, with its chat, reactions and host
  /// controls.
  bool get isMoonbase => _backend?.isMoonbase == true;

  /// The room's server, else the signed-in one.
  MediaServerClient? get roomClient => _client ?? _activeClient;

  /// The room's chat, oldest first, with who joined and left mixed in.
  List<WatchPartyChatEntry> get chat => List.unmodifiable(_chat);

  /// One-shot notices naming who did what, for toasts.
  Stream<WatchPartyToast> get toasts => _toasts.stream;

  /// Reactions as they come in, the member's own included.
  Stream<WatchPartyReaction> get reactions => _reactions.stream;

  /// When the room started waiting for every player to load, while it
  /// waits. It starts anyway ten seconds after.
  DateTime? get waitingSince =>
      _room?.isPlaying == true && _room?.playbackState == 'waiting'
      ? _waitingSince
      : null;

  /// The local time a counted-down start lands at, while it counts.
  DateTime? get countdownTo => _countdownTo;

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

  /// What the signed-in server offers. Moonbase's answer is kept for the
  /// session, see [moonbaseConfig].
  Future<WatchPartyService> availability() async {
    final active = _activeClient;
    if (active == null) return WatchPartyService.noMoonbase;
    final silo = siloClientOf(active);
    if (silo != null) {
      try {
        return await silo.watchPartyApi.available()
            ? WatchPartyService.silo
            : WatchPartyService.noMoonbase;
      } catch (_) {
        return WatchPartyService.noMoonbase;
      }
    }
    final api = moonbaseFor(active);
    if (api == null) return WatchPartyService.noMoonbase;
    try {
      _config = await api.config();
      _configFor = _sessionKey(active);
    } catch (_) {
      // Unreachable isn't the same as no Moonbase: ask again next time.
      _config = null;
      _configFor = null;
    }
    notifyListeners();
    final config = _config;
    if (config == null) return WatchPartyService.noMoonbase;
    return config.enabled
        ? WatchPartyService.moonbase
        : WatchPartyService.moonbaseDisabled;
  }

  /// The signed-in server's Moonbase watch party settings, once
  /// [availability] has asked, else null.
  MoonbaseWatchPartyConfig? get moonbaseConfig {
    final active = _activeClient;
    if (active == null || _configFor != _sessionKey(active)) return null;
    return _config;
  }

  /// Whether the signed-in server is known to host Moonbase parties.
  bool get moonbaseAvailable => moonbaseConfig?.enabled == true;

  /// Whether [availability] has asked the signed-in server's Moonbase.
  bool get moonbaseChecked {
    final active = _activeClient;
    return active != null && _configFor == _sessionKey(active);
  }

  /// The Moonbase rooms API for [client], kept while it stays signed in.
  /// Null on Silo and servers Moonbase doesn't run on.
  MoonbaseWatchPartyApi? moonbaseFor(MediaServerClient client) {
    if (siloClientOf(client) != null) return null;
    if (!client.features.supportsMoonfinPlugin) return null;
    if (!identical(_moonbaseClient, client) || _moonbase == null) {
      _moonbaseClient = client;
      _moonbase = MoonbaseWatchPartyApi.forClient(client, _dio);
    }
    return _moonbase;
  }

  WatchPartyBackend? _backendFor(MediaServerClient client) {
    final silo = siloClientOf(client);
    if (silo != null) return SiloWatchPartyBackend(silo.watchPartyApi);
    return moonbaseFor(client);
  }

  static String _sessionKey(MediaServerClient client) =>
      '${client.baseUrl}|${client.userId}';

  /// [pin] locks a Moonbase room behind a PIN.
  Future<bool> create({String? pin}) =>
      _enter((api) => api.create(const Uuid().v4(), pin: pin));

  /// [code] is what the member typed or pasted. A room from Moonbase's list
  /// joins by [roomId] instead.
  Future<bool> join(String code, {String? roomId, String? pin}) =>
      _enter((api) => api.join(code, roomId: roomId, pin: pin));

  /// Host: stage [contentId], opening a room first when there is none.
  Future<bool> stage(String contentId) async {
    if (_room == null && !await create()) return false;
    return _hostAction((api, id, token) => api.stage(id, token, contentId));
  }

  /// Host, from a title's page: a movie goes up for the vote in a voting
  /// room. Anything else is the host's pick, so voting is switched off for
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
    final done = await _hostAction(
      (api, id, token) => api.setVoting(id, token, voting),
    );
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
  /// stages only in host-pick rooms, so this ends the vote. The movies up
  /// for it stay in the room if voting is turned back on.
  Future<bool> pickSuggestion(SiloRoomSuggestion suggestion) async {
    if (!await setVoting(false)) return false;
    return _stageOrVoteAgain(suggestion.contentId);
  }

  Future<void> _loadSuggestions() async {
    final room = _room;
    final token = _roomToken;
    final backend = _backend;
    if (room == null || token == null || backend == null) return;
    if (!room.isVoting) {
      _suggestions = const [];
      notifyListeners();
      return;
    }
    try {
      _suggestions = await backend.suggestions(room.roomId, token);
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
    Future<void> Function(WatchPartyBackend api, String roomId, String token)
    request,
  ) async {
    final room = _room;
    final token = _roomToken;
    final backend = _backend;
    if (room == null || token == null || backend == null) return false;
    _error = null;
    _errorCode = null;
    try {
      await request(backend, room.roomId, token);
      return true;
    } catch (e) {
      _setError(e);
      notifyListeners();
      return false;
    }
  }

  /// [atSeconds] picks the title up part way for everyone, where
  /// [resumePoint] says the room got to.
  Future<bool> startPlayback({int atSeconds = 0}) async {
    final contentId = _room?.selectedContentId;
    // Moonbase starts the room there itself.
    _pendingResume = !isMoonbase && atSeconds > 0 && contentId != null
        ? (seconds: atSeconds, contentId: contentId)
        : null;
    final started = await _hostAction(
      (api, id, token) => api.start(id, token, atSeconds: atSeconds),
    );
    if (!started) _pendingResume = null;
    return started;
  }

  /// Where the room could resume the title the host has staged, or null.
  Future<SiloRoomResumePoint?> resumePoint() async {
    final room = _room;
    final token = _roomToken;
    final backend = _backend;
    final contentId = room?.selectedContentId;
    if (room == null || token == null || backend == null || contentId == null) {
      return null;
    }
    if (backend.isMoonbase) {
      // Moonbase keeps nobody's progress, so the host is offered their own,
      // read fresh since a run that just ended moved it.
      try {
        final item = await _client?.itemsApi.getItem(contentId);
        final ticks = item?['UserData']?['PlaybackPositionTicks'];
        final seconds = ticks is num ? ticks ~/ 10000000 : 0;
        return seconds < SiloRoomResumePoint.minimumSeconds
            ? null
            : SiloRoomResumePoint(
                seconds: seconds,
                profileId: room.selfMemberId,
              );
      } catch (e) {
        _logger.w('Watch Party: reading your progress failed', error: e);
        return null;
      }
    }
    try {
      return await backend.resumePoint(room.roomId, token, contentId);
    } catch (e) {
      _logger.w('Watch Party: reading where members are failed', error: e);
      return null;
    }
  }

  Future<bool> stopPlayback() async {
    _pendingResume = null;
    // A stop of the host's own doesn't move on to the next episode.
    _hostStopping = true;
    final done = await _hostAction((api, id, token) => api.stop(id, token));
    if (!done) _hostStopping = false;
    return done;
  }

  /// The invite link for the room, for its host.
  Uri? get inviteUri {
    final room = _room;
    final backend = _backend;
    if (room == null || backend == null) return null;
    return backend.inviteUri(room);
  }

  /// After a user or server switch, or a sign-out: leaves a room that
  /// belongs to another session.
  void onSessionChanged({bool signedOut = false}) {
    _config = null;
    _configFor = null;
    if (_room == null) return;
    if (signedOut || !_sameSession()) leave();
  }

  bool _sameSession() {
    final client = _client;
    if (client is SiloMediaServerClient) {
      return identical(activeSiloClient, client);
    }
    final active = _activeClient;
    return client != null &&
        active != null &&
        _sessionKey(client) == _sessionKey(active);
  }

  Future<bool> setGuestsCanPause(bool allowed) => _hostAction(
    (api, id, token) =>
        api.setPolicy(id, token, allowed ? 'guest_play_pause' : 'host_only'),
  );

  /// Moonbase host: lets every member play, pause and skip.
  Future<bool> setEveryoneControls(bool allowed) => _hostAction(
    (api, id, token) =>
        api.setPolicy(id, token, allowed ? 'everyone' : 'host_only'),
  );

  /// Moonbase host: 4 to 8 digits, or null to drop the PIN.
  Future<bool> setPin(String? pin) => _hostAction((api, id, token) {
    if (api is! MoonbaseWatchPartyApi) {
      throw UnsupportedError('Only Moonbase rooms have PINs');
    }
    return api.setPin(id, token, pin);
  });

  /// Moonbase host: hands the room to [memberId].
  Future<bool> makeHost(String memberId) => _hostAction((api, id, token) {
    if (api is! MoonbaseWatchPartyApi) {
      throw UnsupportedError('Only Moonbase rooms hand over');
    }
    return api.promote(id, token, memberId);
  });

  /// Moonbase host: takes [memberId] out of the room.
  Future<bool> removeMember(String memberId) =>
      _roomCall((api, id, token) async {
        if (api is MoonbaseWatchPartyApi) {
          await api.remove(id, token, memberId);
        }
      });

  /// Host: ends the room for everyone.
  Future<void> end() async {
    final room = _room;
    final token = _roomToken;
    final backend = _backend;
    if (room == null || backend == null) return;
    try {
      await backend.close(room.roomId, token ?? '');
      _dropStoredRoom();
    } catch (e) {
      _logger.w('Watch Party: closing the room failed', error: e);
    }
    _leaveRoom(null);
  }

  /// Silo: drops what Moonbase keeps for the room (subtitles, avatars) once
  /// it ends, so it stops counting toward the account's rooms for the day.
  /// Moonbase lets only the host, or the account that stored it when nobody
  /// set subtitles, do that; anyone else is refused, which is fine.
  void _dropStoredRoom() {
    final room = _room;
    final client = _client;
    if (room == null || client == null || isMoonbase) return;
    unawaited(() async {
      try {
        final ep = await moonbaseEndpoint(client, _dio);
        if (ep == null) return;
        await _dio.delete<dynamic>(
          '${ep.base}/Moonfin/WatchParty/${room.roomId}',
          options: Options(headers: ep.headers),
        );
      } catch (e) {
        // Not ours to end, or an older Moonbase: it expires in a day.
        _logger.d('Watch Party: ending the stored room failed', error: e);
      }
    }());
  }

  /// Leaves without ending the room. On Silo a host's room closes on its
  /// own two minutes later unless they come back. On Moonbase the earliest
  /// member to join takes over.
  void leave() {
    final room = _room;
    final token = _roomToken;
    final backend = _backend;
    if (room != null && token != null && backend != null) {
      unawaited(
        backend.leave(room.roomId, token).catchError((Object e) {
          _logger.d('Watch Party: leaving the room failed', error: e);
        }),
      );
    }
    _leaveRoom(null);
  }

  /// Moonbase: posts [text] to the room's chat.
  bool sendChat(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty || !isMoonbase) return false;
    return _send({'type': 'chat', 'text': trimmed});
  }

  /// Moonbase: one of [WatchPartyReaction.kinds].
  bool sendReaction(String reaction) {
    if (!isMoonbase || !WatchPartyReaction.kinds.contains(reaction)) {
      return false;
    }
    return _send({'type': 'reaction', 'reaction': reaction});
  }

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
    if (room == null || client == null || !room.isHost || isMoonbase) {
      return false;
    }
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
    // Moonbase's own rooms don't keep a group choice.
    if (isMoonbase) {
      _groupSubtitleKnown = true;
      return;
    }
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
    final client = _client;
    if (client == null) return null;
    final member = isMoonbase
        ? _room?.members.where((m) => m.profileId == profileId).firstOrNull
        : null;
    final link = member?.avatarUrl ?? _avatars[profileId];
    if (link == null) return null;
    return Uri.parse(client.baseUrl).resolve(link).toString();
  }

  /// Posts this profile's avatar link for the room, so members on other
  /// accounts can show it. An upload's link is signed for 15 minutes, so
  /// it goes again every ten.
  Future<void> _publishAvatar() async {
    final room = _room;
    final client = _client == null ? null : siloClientOf(_client!);
    if (room == null || client == null) return;
    try {
      final profiles = await client.profilesApi.list();
      final mine = profiles.where((p) => p.id == client.profileId).firstOrNull;
      final link = mine?.json['avatar_url'];
      if (link is! String || link.isEmpty) return;
      final ep = await moonbaseEndpoint(client, _dio);
      // A room that ended meanwhile would be stored again.
      if (ep == null || _room?.roomId != room.roomId) return;
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
  /// language, -1 for off, or null to leave it to the member.
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

  void clearError() {
    _error = null;
    _errorCode = null;
    notifyListeners();
  }

  Future<bool> _enter(
    Future<SiloRoomAccess> Function(WatchPartyBackend api) request,
  ) async {
    final active = _activeClient;
    final backend = active == null ? null : _backendFor(active);
    if (active == null || backend == null) return false;
    _busy = true;
    _error = null;
    _errorCode = null;
    _endedReason = null;
    notifyListeners();
    try {
      final access = await request(backend);
      if (_room != null) {
        // Silo keeps a room a host walked away from, Moonbase hands it on.
        backend.isMoonbase ? leave() : _leaveRoom(null);
      }
      _client = siloClientOf(active) ?? active;
      _backend = backend;
      _serverId = _serverIdOf(active);
      _room = access.room;
      _roomToken = access.token;
      _clockSamples.clear();
      _checkAlone();
      unawaited(_connect());
      unawaited(_loadSuggestions());
      if (backend.isMoonbase) return true;
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
      _setError(e);
      return false;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  Future<bool> _hostAction(
    Future<SiloRoom> Function(
      WatchPartyBackend api,
      String roomId,
      String token,
    )
    request,
  ) async {
    final room = _room;
    final backend = _backend;
    if (room == null || backend == null) return false;
    _busy = true;
    _error = null;
    _errorCode = null;
    notifyListeners();
    try {
      _onRoom(await request(backend, room.roomId, _roomToken ?? ''));
      return true;
    } catch (e) {
      _setError(e);
      return false;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  void _setError(Object e) {
    _errorCode = MoonbaseWatchPartyApi.errorCode(e);
    _error = _describe(e);
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
    final backend = _backend;
    if (room == null || token == null || backend == null) return;
    final generation = ++_socketGeneration;
    try {
      final channel = await backend.connect(room.roomId, token);
      if (generation != _socketGeneration) {
        unawaited(channel.close());
        return;
      }
      _channel = channel;
      _connected = true;
      _reconnectAttempt = 0;
      _attachSentFor = null;
      _sentStatus = null;
      _lobbySeenStatus = null;
      _samplesThisSocket = 0;
      _channelSub = channel.messages.listen(
        _onMessage,
        onDone: () => _onSocketClosed(generation),
        onError: (_) => _onSocketClosed(generation),
      );
      _sendPing();
      // Broadcasts sent while the socket was down are gone.
      unawaited(_loadSuggestions());
      if (_wasConnected) _toast(WatchPartyToastKind.reconnected);
      _wasConnected = true;
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
    _toast(WatchPartyToastKind.reconnecting);
    notifyListeners();
    // Silo closes every room socket after five minutes, and a fresh ticket
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
    if (channel != null) unawaited(channel.close());
  }

  bool _send(Map<String, Object?> message) {
    final channel = _channel;
    if (channel == null || !_connected) return false;
    return channel.send(message);
  }

  void _onMessage(Map<String, dynamic> message) {
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
        _onRoomClosed();
      case 'removed':
        _leaveRoom('removed');
      case 'chat':
        if (asJsonMap(message['message']) case final json?) {
          _addChat(WatchPartyChatEntry.fromJson(json));
          notifyListeners();
        }
      case 'chat_history':
        _chat.removeWhere((e) => e.notice == null);
        for (final raw in message['messages'] as List? ?? const []) {
          if (asJsonMap(raw) case final json?) {
            _addChat(WatchPartyChatEntry.fromJson(json));
          }
        }
        _chat.sort((a, b) => a.sentAt.compareTo(b.sentAt));
        notifyListeners();
      case 'reaction':
        final reaction = WatchPartyReaction.fromJson(message);
        if (reaction != null) _reactions.add(reaction);
      case 'notice':
        _onNotice(message);
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

  void _addChat(WatchPartyChatEntry entry) {
    if (entry.notice == null &&
        entry.id.isNotEmpty &&
        _chat.any((e) => e.id == entry.id)) {
      return;
    }
    _chat.add(entry);
    // The server keeps the last 50 messages, and so does this.
    while (_chat.length > 80) {
      _chat.removeAt(0);
    }
  }

  void _toast(WatchPartyToastKind kind, {String? name, String? detail}) {
    if (!isMoonbase) return;
    _toasts.add(WatchPartyToast(kind, name: name, detail: detail));
  }

  /// A notice becomes a toast, and the ones about people also a line in the
  /// chat.
  void _onNotice(Map<String, dynamic> message) {
    final room = _room;
    if (room == null) return;
    final name = message['display_name'] as String?;
    final memberId = message['member_id'] as String?;
    final self = memberId != null && memberId == room.selfMemberId;
    final toast = switch (message['kind']) {
      'joined' when !self => WatchPartyToast(
        WatchPartyToastKind.joined,
        name: name,
      ),
      'left' when !self => WatchPartyToast(
        WatchPartyToastKind.left,
        name: name,
      ),
      'host_changed' => WatchPartyToast(
        self ? WatchPartyToastKind.youAreHost : WatchPartyToastKind.newHost,
        name: name,
      ),
      'policy_changed' => const WatchPartyToast(
        WatchPartyToastKind.policyChanged,
      ),
      'switched' => WatchPartyToast(
        WatchPartyToastKind.switched,
        name: name,
        detail: message['content_title'] as String?,
      ),
      'no_access' => const WatchPartyToast(WatchPartyToastKind.noAccess),
      _ => null,
    };
    if (toast == null) return;
    _toasts.add(toast);
    if (toast.kind == WatchPartyToastKind.joined ||
        toast.kind == WatchPartyToastKind.left ||
        toast.kind == WatchPartyToastKind.switched) {
      _addChat(
        WatchPartyChatEntry(
          id: '',
          name: name ?? '',
          text: '',
          sentAt: DateTime.now(),
          notice: toast,
        ),
      );
      notifyListeners();
    }
  }

  void _onRoomClosed() {
    final room = _room;
    if (room != null && isMoonbase && !room.isHost) {
      final host = room.members.where((m) => m.isHost).firstOrNull;
      _toast(WatchPartyToastKind.ended, name: host?.displayName);
    }
    _leaveRoom('closed');
  }

  /// A Moonbase command names who asked for it, for a toast on everyone
  /// else's screen.
  void _toastCommand(SiloRoomCommand command) {
    final room = _room;
    final name = command.byDisplayName;
    if (room == null || name == null || command.countdown) return;
    if (command.byMemberId != null && command.byMemberId == room.selfMemberId) {
      return;
    }
    switch (command.action) {
      case 'pause':
        _toast(WatchPartyToastKind.paused, name: name);
      case 'play':
        _toast(WatchPartyToastKind.resumed, name: name);
      case 'seek' when command.playbackState != 'waiting':
        _toast(
          WatchPartyToastKind.skipped,
          name: name,
          detail: formatSeconds(command.positionSeconds),
        );
    }
  }

  /// `1:14:02`, or `4:05` under an hour.
  static String formatSeconds(double seconds) {
    final total = seconds.floor();
    final h = total ~/ 3600;
    final m = (total % 3600) ~/ 60;
    final s = (total % 60).toString().padLeft(2, '0');
    return h > 0 ? '$h:${m.toString().padLeft(2, '0')}:$s' : '$m:$s';
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
    final waiting = next.isPlaying && next.playbackState == 'waiting';
    if (!waiting) {
      _waitingSince = null;
    } else if (previous.playbackState != 'waiting' || _waitingSince == null) {
      _waitingSince = DateTime.now();
    }
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
        _startLeadMs = null;
        _seekLeadMs = null;
        _startTiming = null;
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
      _applyingCount++;
      unawaited(
        _playbackManager
            .stop(userInitiated: false)
            .whenComplete(() => _applyingCount--),
      );
    }
    _checkAlone();
    _scheduleReports();
    _reportLobbyStatus();
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
    // The host's pick as the item starts. A member can change theirs after.
    if (!_groupSubtitleKnown || !room.isHost) await _loadGroupSubtitle();
    final subtitles = subtitleIndexFor(_groupSubtitle, source);
    _groupSubtitleApplied = jsonEncode(_groupSubtitle);
    if (_room?.selectionRevision != room.selectionRevision) return;
    if (isMoonbase) {
      // A new player has applied nothing yet, and lines itself up once ready.
      _linedUpCommand = null;
      _appliedCommandId = null;
    }
    _applyingCount++;
    _opening = true;
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
      _applyingCount--;
      _opening = false;
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
    if (reason == 'closed') _dropStoredRoom();
    _socketGeneration++;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _closeSocket();
    _stopFollowing();
    _room = null;
    _roomToken = null;
    _client = null;
    _backend = null;
    _chat.clear();
    _waitingSince = null;
    _countdownTo = null;
    _countdownTimer?.cancel();
    _countdownTimer = null;
    _wasConnected = false;
    _sentStatus = null;
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
    _pendingResume = null;
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
      _timeStart(p.inMilliseconds, _sampleAt);
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
    _linedUpCommand = null;
    _reference = null;
    _attachSentFor = null;
    _driftTimer?.cancel();
    _driftTimer = null;
    _positionSub?.cancel();
    _positionSub = null;
    _sampleMs = null;
    _startTiming = null;
    _seekCheckAtMs = null;
    _driftStrikes = 0;
    _restoreRate();
  }

  /// Ends the timing of a start once its position has moved.
  void _timeStart(int positionMs, int atMs) {
    final timing = _startTiming;
    if (timing == null) return;
    final delay = startDelayMs(
      calledAtMs: timing.calledAtMs,
      fromMs: timing.fromMs,
      positionMs: positionMs,
      atMs: atMs,
    );
    if (delay == null) {
      // Not moving after five seconds: a stall, not a start to learn from.
      if (atMs - timing.calledAtMs > 5000) _startTiming = null;
      return;
    }
    _startTiming = null;
    _startLeadMs = nextStartLeadMs(_startLeadMs, delay);
  }

  /// How long a start took to move, from a position sample past where it
  /// began: the sample's time less the media it has played since. Null until
  /// it has moved, for a sample that jumped (a seek), or for one more than
  /// five seconds after resume() (a stall, even if it moved).
  @visibleForTesting
  static int? startDelayMs({
    required int calledAtMs,
    required int fromMs,
    required int positionMs,
    required int atMs,
  }) {
    if (atMs - calledAtMs > 5000) return null;
    final played = positionMs - fromMs;
    // A sample a hair past the start can be the pipeline settling.
    if (played < 100 || played > 5000) return null;
    return math.max(0, atMs - played - calledAtMs);
  }

  /// The start lead after a measured start: the first measurement as it is,
  /// then an even average with what came before, so one slow start doesn't
  /// throw the next one far early.
  @visibleForTesting
  static int nextStartLeadMs(int? leadMs, int measuredMs) {
    final measured = math.min(measuredMs, _maxStartLeadMs);
    if (leadMs == null) return measured;
    return ((leadMs + measured) / 2).round();
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
        // A paused Moonbase room resumes from its paused spot, not from
        // wherever this player stopped.
        _requestTransport(
          'play',
          isMoonbase && room.isPaused
              ? room.anchorPositionSeconds
              : _positionSeconds,
        );
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
        // The room plays one item, and the host picks the next.
        return true;
      case TransportAction.stop:
        // Leaving the player stays in the room.
        return false;
    }
  }

  void _requestTransport(String action, double positionSeconds) {
    if (_room?.canControlTransport != true) {
      // The interceptor already kept the player as it was.
      _toast(WatchPartyToastKind.hostOnly);
      return;
    }
    // A player that can't play has no position worth moving the room to.
    if (!_attached || (isMoonbase && !_playerReady)) return;
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
    final startsFromPaused =
        command.playbackState == 'playing' && _playbackManager.state.isPaused;
    final delayMs =
        localAtMs -
        (startsFromPaused ? _startLeadMs ?? 0 : 0) -
        DateTime.now().millisecondsSinceEpoch;
    _commandTimer = Timer(
      Duration(milliseconds: math.max(0, delayMs)),
      () => unawaited(_applyCommand(command, localAtMs)),
    );
    if (!isMoonbase) return;
    // A held command is lined up by the tick, so it runs at the ready
    // wait's pace from here.
    _scheduleReports();
    _toastCommand(command);
    if (command.playbackState == 'waiting') _waitingSince ??= DateTime.now();
    _countdownTimer?.cancel();
    _countdownTo = null;
    if (command.countdown) {
      _countdownTo = DateTime.fromMillisecondsSinceEpoch(localAtMs);
      _countdownTimer = Timer(
        Duration(
          milliseconds: math.max(
            0,
            localAtMs - DateTime.now().millisecondsSinceEpoch,
          ),
        ),
        () {
          _countdownTo = null;
          notifyListeners();
        },
      );
    }
    notifyListeners();
  }

  Future<void> _applyCommand(SiloRoomCommand command, int localAtMs) async {
    if (_lastCommand?.commandId != command.commandId) return;
    if (isMoonbase) {
      // A player still loading drops what it's sent. This one waits, and the
      // tick lines it up once the player can start.
      if (_sessionId == null || !_playerReady) return;
      _linedUpCommand = command.commandId;
      _appliedCommandId = null;
    }
    final playing = command.playbackState == 'playing';
    // A command run late projects forward to where the room is by now.
    final lateSeconds =
        math.max(0, DateTime.now().millisecondsSinceEpoch - localAtMs) / 1000;
    final target = command.positionSeconds + (playing ? lateSeconds : 0);
    // Rate and play state change when a command runs.
    _restoreRate();
    _applyingCount++;
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
      // On Moonbase a pause stops first, then puts the player on the paused
      // spot, so everyone resumes from the same frame.
      final pauseFirst = isMoonbase && !playing;
      // Read while it still moves: a paused player's position can lag a
      // sample behind where it stopped.
      final at = _positionSeconds;
      if (pauseFirst && _playbackManager.state.isPlaying) {
        await _playbackManager.pause();
      }
      final tolerance = command.action == 'seek'
          ? 0.25
          : pauseFirst
          ? 0.3
          : byRate
          ? 5.0
          : _maxDriftSeconds;
      var sought = false;
      if ((at - target).abs() > tolerance) {
        sought = true;
        _seekLandsByMs = DateTime.now().millisecondsSinceEpoch + 3000;
        // The jump would read as a start, so a seek ends any start being timed.
        _startTiming = null;
        // The lead covers seeks that have to load, a moving player's or a
        // fresh one catching up. A paused, loaded player put back a little
        // before a play lands where it's sent.
        final loads =
            playing &&
            (_playbackManager.state.isPlaying ||
                command.commandId == _catchUpCommandId);
        await _playbackManager.seekTo(
          Duration(
            milliseconds: ((target + (loads ? _seekLead : 0)) * 1000).round(),
          ),
        );
        if (loads) _checkSeekLanding();
      }
      if (playing && !_playbackManager.state.isPlaying) {
        // A start straight after a seek waits on the seek's load, and a player
        // that stalled mid-play waits on its buffer. Neither says anything
        // about the next start, so only a plain start from paused is timed.
        if (!sought && _playbackManager.state.isPaused) {
          _startTiming = (
            calledAtMs: DateTime.now().millisecondsSinceEpoch,
            fromMs: _playbackManager.state.position.inMilliseconds,
          );
        }
        await _playbackManager.resume();
      } else if (!playing && _playbackManager.state.isPlaying) {
        await _playbackManager.pause();
      }
    } catch (e) {
      _logger.w('Watch Party: applying a room command failed', error: e);
    } finally {
      _applyingCount--;
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
      // The server now holds buffering, so the next status goes out even if
      // it's the one sent before the stall.
      if (_bufferingReported && isMoonbase) _sentStatus = 'buffering';
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
        ? (_readyPending
              ? _waitingReportInterval
              : isMoonbase
              ? _moonbaseReportInterval
              : _reportInterval)
        : null;
    if (every == _reportEvery) return;
    _reportTimer?.cancel();
    _reportEvery = every;
    _reportTimer = every == null ? null : Timer.periodic(every, (_) => _tick());
  }

  void _tick() {
    final room = _room;
    final session = _sessionId;
    if (!_connected || room == null || !room.isPlaying) return;
    // A player that failed to open is gone too, even with its session kept.
    final failed =
        isMoonbase &&
        _playbackManager.bringupState.phase == PlaybackBringupPhase.failed;
    if (session == null || failed) {
      // No player open: joining while the room waits, else not watching.
      _reportStatus(
        room.playbackState == 'waiting' ? 'joining' : 'not_watching',
      );
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
    final resume = _pendingResume;
    if (resume != null && room.isHost) {
      if (room.selectedContentId != resume.contentId) {
        _pendingResume = null;
      } else {
        // Ahead of the ready report, so the room can't set off from the
        // beginning before the seek lands.
        if (_send({
          'type': 'transport_request',
          'action': 'seek',
          'position_seconds': resume.seconds.toDouble(),
          'is_paused': false,
        })) {
          _pendingResume = null;
        }
        return;
      }
    }
    if (isMoonbase) {
      // Not ready, and no position worth reporting, until the player can start.
      if (!_playerReady) {
        _reportStatus('joining');
        return;
      }
      _lineUp(room);
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
          if (isMoonbase) 'status': _sentStatus = 'ready',
        });
        return;
      }
    }
    // A stalled player reports where it stopped, not a decision.
    if (buffering) return;
    final status = isMoonbase ? _ownStatus : null;
    if (isMoonbase) _sentStatus = status;
    _send({
      'type': 'state_report',
      'session_id': session,
      'command_id': ?(_appliedCommandId == _catchUpCommandId
          ? null
          : _appliedCommandId),
      'position_seconds': _positionSeconds,
      'is_paused': !_playbackManager.state.isPlaying,
      'status': ?status,
    });
  }

  /// On Moonbase, whether the player has the item loaded and can start.
  bool get _playerReady =>
      !_opening &&
      _playbackManager.bringupState.phase == PlaybackBringupPhase.ready &&
      _playbackManager.state.duration > Duration.zero;

  /// Moonbase sends a player no command of its own when it opens or attaches
  /// late, so it lines itself up once per command: the waiting command again
  /// during the ready wait, otherwise the room's anchor.
  void _lineUp(SiloRoom room) {
    final command = _lastCommand;
    if (command == null) return _catchUp(room);
    if (_linedUpCommand == command.commandId ||
        _commandTimer?.isActive == true) {
      return;
    }
    if (_readyPending) {
      unawaited(
        _applyCommand(
          command,
          command.executeAt.millisecondsSinceEpoch - _serverOffsetMs,
        ),
      );
    } else {
      _catchUp(room);
    }
  }

  /// A member who joins a room that's already going has no command to
  /// follow until someone acts, so it starts from the snapshot: where the
  /// room was at `anchor_at`, run on to now when it plays.
  void _catchUp(SiloRoom room) {
    final at = room.anchorAt;
    if (at == null || room.playbackState == 'waiting') return;
    _onCommand(
      SiloRoomCommand(
        commandId: _catchUpCommandId,
        sessionId: null,
        selectionRevision: room.selectionRevision,
        action: 'seek',
        positionSeconds: room.anchorPositionSeconds,
        executeAt: at,
        playbackState: room.isPaused ? 'paused' : 'playing',
      ),
    );
  }

  /// Never sent to the server as a command this member applied.
  static const _catchUpCommandId = 'catch-up';

  /// A Moonbase report of this member's status alone, sent once per change.
  /// With no session it moves nothing and counts toward no ready wait.
  void _reportStatus(String status, {bool again = false}) {
    if (!isMoonbase || (_sentStatus == status && !again)) return;
    if (_send({
      'type': 'state_report',
      'session_id': null,
      'position_seconds': 0,
      'is_paused': true,
      'status': status,
    })) {
      _sentStatus = status;
    }
  }

  /// In the lobby a member is ready once its long-poll runs, and says so
  /// again only when a snapshot shows its status changed to something else.
  void _reportLobbyStatus() {
    final room = _room;
    if (!isMoonbase || !_connected || room == null || room.isPlaying) return;
    final seen = room.members.where((m) => m.isSelf).firstOrNull?.status;
    final changed = seen != _lobbySeenStatus;
    _lobbySeenStatus = seen;
    if (seen == 'ready') {
      _sentStatus = 'ready';
      return;
    }
    if (changed || _sentStatus != 'ready') {
      _reportStatus('ready', again: changed);
    }
  }

  /// What this member says it's doing with a player open. Past the ready
  /// wait it says nothing, so the server judges in sync or catching up from
  /// the position, except while a seek of its own is landing.
  String? get _ownStatus {
    if (_readyPending) return 'joining';
    return DateTime.now().millisecondsSinceEpoch < _seekLandsByMs
        ? 'catching_up'
        : null;
  }

  /// Brings this player back to the room: by a small change of playback
  /// rate for drift up to 5 s, by a seek past that, or for any drift over a
  /// second on a player that doesn't correct by rate. Runs about twice a
  /// second while the room plays.
  void _correctDrift() {
    final reference = _reference;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (reference == null ||
        !reference.playing ||
        // A start begun early by its lead isn't drift before the command's time.
        now < reference.localMs ||
        _room?.playbackState != 'playing' ||
        !_playbackManager.state.isPlaying ||
        _playbackManager.state.isBuffering) {
      _restoreRate();
      return;
    }
    final expected =
        reference.positionSeconds + (now - reference.localMs) / 1000;
    final drift = _positionSeconds - expected;
    final size = drift.abs();
    final check = _seekCheckAtMs;
    if (check != null && now >= check) {
      _seekCheckAtMs = null;
      // A nudge moves the drift on its own, and a late look sees a stall.
      if (_nudgedRate == null && now - check < 3000) {
        _seekLeadMs = nextSeekLeadMs(_seekLeadMs, drift);
      }
    }
    if (_correctsByRate && size <= 5) {
      if (_nudgedRate != null) {
        // Close enough, or a nudge that has run a minute without closing
        // the gap: back to 1x.
        if (size <= 0.15 || now - _nudgeStartedMs > 60000) {
          if (size > 0.15) _nudgeBlockedUntilMs = now + 30000;
          _restoreRate();
          _driftStrikes = 0;
          return;
        }
        if (_nudge(drift)) return;
      } else {
        // Two checks in a row past half a second, so one late sample or a
        // passing hiccup doesn't start a nudge.
        _driftStrikes = size > 0.5 ? _driftStrikes + 1 : 0;
        if (_driftStrikes < 2) return;
        if (now >= _nudgeBlockedUntilMs) {
          _nudgeStartedMs = now;
          if (_nudge(drift)) return;
        }
      }
      // Silo's server corrects what a nudge can't. Moonbase's doesn't, so
      // there the player seeks instead.
      if (!isMoonbase) return;
    }
    _restoreRate();
    if (size <= _maxDriftSeconds) {
      _driftBackoffMs = 1000;
      return;
    }
    if (now - _lastDriftSeekMs < _driftBackoffMs) return;
    _lastDriftSeekMs = now;
    _seekLandsByMs = now + 3000;
    _driftBackoffMs = math.min(_driftBackoffMs * 2, 16000);
    _startTiming = null;
    _applyingCount++;
    unawaited(
      _playbackManager
          .seekTo(
            Duration(milliseconds: ((expected + _seekLead) * 1000).round()),
          )
          .whenComplete(() {
            _applyingCount--;
            _checkSeekLanding();
          }),
    );
  }

  double get _seekLead => isMoonbase ? (_seekLeadMs ?? 0) / 1000 : 0;

  /// Looks at where a seek landed once the player has had time to settle.
  void _checkSeekLanding() {
    if (isMoonbase) {
      _seekCheckAtMs = DateTime.now().millisecondsSinceEpoch + 1500;
    }
  }

  /// The seek lead after a seek on a playing timeline landed [driftSeconds]
  /// from the room (negative is behind): what that seek needed, evened out
  /// with what came before as start leads are, and at most a second. Over a
  /// second off is a stall or a correction in between, not something to
  /// learn from.
  @visibleForTesting
  static int? nextSeekLeadMs(int? leadMs, double driftSeconds) {
    if (driftSeconds.abs() > 1) return leadMs;
    final needed = (leadMs ?? 0) - (driftSeconds * 1000).round();
    return nextStartLeadMs(leadMs, needed.clamp(0, 1000));
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

  /// Nudges toward the room and says whether it did. A player behind with
  /// little buffered isn't sped up: it would only drain its buffer and
  /// stall, the skip this is meant to avoid.
  bool _nudge(double drift) {
    final state = _playbackManager.state;
    final ahead = state.buffer - state.position;
    if (drift < 0 &&
        state.buffer > Duration.zero &&
        ahead < const Duration(seconds: 8)) {
      _restoreRate();
      return false;
    }
    _setRate(rateFor(drift));
    return true;
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
    unawaited(_toasts.close());
    unawaited(_reactions.close());
    super.dispose();
  }
}
