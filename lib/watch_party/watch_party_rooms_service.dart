import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:server_core/server_core.dart';

import '../preference/user_preferences.dart';
import '../syncplay/syncplay_manager.dart';
import 'moonbase_watch_party_api.dart';
import 'silo_watch_party_manager.dart';

/// The rooms the signed-in user can join: Moonbase's, and on Jellyfin
/// SyncPlay's groups next to them. Home asks every minute while it shows
/// and the app is in front, never in the background, and [alerts] carries
/// the rooms that newly started for Party alerts.
class WatchPartyRoomsService extends ChangeNotifier {
  WatchPartyRoomsService(this._party, this._prefs, [this._syncPlay]) {
    _party.addListener(_noteOwnRoom);
  }

  final SiloWatchPartyManager _party;
  final UserPreferences _prefs;
  final SyncPlayManager? _syncPlay;
  final Logger _logger = Logger();

  static const pollInterval = Duration(seconds: 60);

  List<MoonbaseRoomSummary> _rooms = const [];
  List<SyncPlayGroupInfo> _groups = const [];
  final _alerts = StreamController<MoonbaseRoomSummary>.broadcast();
  final Set<String> _announced = {};
  bool _seeded = false;
  String? _sessionKey;
  Timer? _timer;
  bool _homeVisible = false;
  bool _foreground = true;
  bool _refreshing = false;

  /// Newest first.
  List<MoonbaseRoomSummary> get rooms => _rooms;

  /// SyncPlay's groups, on Jellyfin with Moonbase.
  List<SyncPlayGroupInfo> get groups => _groups;

  bool get hasRooms => _rooms.isNotEmpty || _groups.isNotEmpty;

  /// Rooms that started since the last look, while Party alerts is on.
  Stream<MoonbaseRoomSummary> get alerts => _alerts.stream;

  /// Whether Home is the screen on top.
  void setHomeVisible(bool visible) {
    if (_homeVisible == visible) return;
    _homeVisible = visible;
    _schedule(refreshNow: visible);
  }

  /// Whether the app is in front. A return to it looks again at once.
  void setForeground(bool foreground) {
    if (_foreground == foreground) return;
    _foreground = foreground;
    _schedule(refreshNow: foreground);
  }

  void _schedule({required bool refreshNow}) {
    _timer?.cancel();
    _timer = null;
    if (!_homeVisible || !_foreground) return;
    if (refreshNow) unawaited(refresh());
    _timer = Timer.periodic(pollInterval, (_) => unawaited(refresh()));
  }

  Future<void> refresh() async {
    if (_refreshing) return;
    _refreshing = true;
    try {
      await _refresh();
    } finally {
      _refreshing = false;
    }
  }

  Future<void> _refresh() async {
    final getIt = GetIt.instance;
    final active = getIt.isRegistered<MediaServerClient>()
        ? getIt<MediaServerClient>()
        : null;
    final api = active == null ? null : _party.moonbaseFor(active);
    if (active == null ||
        api == null ||
        !_prefs.get(UserPreferences.syncPlayEnabled)) {
      _clear();
      return;
    }
    final key = '${active.baseUrl}|${active.userId}';
    if (key != _sessionKey) {
      _sessionKey = key;
      _announced.clear();
      _seeded = false;
    }
    if (!_party.moonbaseChecked) await _party.availability();
    if (!_party.moonbaseAvailable) {
      _clear();
      return;
    }
    List<MoonbaseRoomSummary> rooms;
    try {
      rooms = await api.rooms();
    } catch (e) {
      _logger.d('Watch Party: listing rooms failed', error: e);
      return;
    }
    var groups = const <SyncPlayGroupInfo>[];
    final syncPlay = _syncPlay;
    if (syncPlay != null && syncPlay.syncPlayEnabled) {
      await syncPlay.fetchGroups();
      groups = syncPlay.availableGroups;
    }
    if (_sessionKey != key) return;
    _announce(rooms);
    _rooms = rooms;
    _groups = groups;
    notifyListeners();
  }

  /// A room this member is in counts as seen, so leaving it doesn't announce
  /// it, even when no look happened while the member was there.
  void _noteOwnRoom() {
    final id = _party.room?.roomId;
    if (id != null) _announced.add(id);
  }

  /// A room counts as started once it has something picked, as Moonbase's
  /// own push does. The first look after sign-in only learns what's there.
  void _announce(List<MoonbaseRoomSummary> rooms) {
    final alertsOn =
        _prefs.get(UserPreferences.watchPartyAlerts) &&
        _party.moonbaseConfig?.alerts != false;
    var alerted = false;
    for (final room in rooms) {
      if (room.selectedContentId == null) continue;
      final isNew = _announced.add(room.roomId);
      if (!isNew || room.isMember) continue;
      // One banner per look, the newest room's, since banners stack.
      if (_seeded && alertsOn && !_party.inRoom && !alerted) {
        alerted = true;
        _alerts.add(room);
      }
    }
    _seeded = true;
  }

  void _clear() {
    if (_rooms.isEmpty && _groups.isEmpty) return;
    _rooms = const [];
    _groups = const [];
    notifyListeners();
  }

  /// After a sign-out or a switch to another server or user.
  void reset() {
    _sessionKey = null;
    _announced.clear();
    _seeded = false;
    _clear();
  }

  @override
  void dispose() {
    _party.removeListener(_noteOwnRoom);
    _timer?.cancel();
    unawaited(_alerts.close());
    super.dispose();
  }
}
