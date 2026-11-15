import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../auth/repositories/user_repository.dart';
import '../models/live_tv_recording_state.dart';
import 'plugin_sync_service.dart';

/// A user who owns (asked for) a recording.
@immutable
class RecordingOwner {
  final String userId;
  final String name;
  final String? imageTag;

  const RecordingOwner({
    required this.userId,
    required this.name,
    this.imageTag,
  });

  /// [imageTag] may be null or absent (Emby leaves it out).
  static RecordingOwner? fromJson(Object? json) {
    if (json is! Map) return null;
    final id = json['userId']?.toString();
    if (id == null || id.isEmpty) return null;
    final tag = json['imageTag']?.toString();
    return RecordingOwner(
      userId: id,
      name: json['name']?.toString() ?? '',
      imageTag: tag == null || tag.isEmpty ? null : tag,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RecordingOwner &&
      other.userId == userId &&
      other.name == name &&
      other.imageTag == imageTag;

  @override
  int get hashCode => Object.hash(userId, name, imageTag);
}

enum OwnedKind { timer, series, item }

/// The plugin's answer to scheduling a recording.
@immutable
class OwnershipOutcome {
  final String id;
  final List<RecordingOwner> owners;
  final bool joined;

  const OwnershipOutcome({
    required this.id,
    required this.owners,
    required this.joined,
  });
}

/// The ids the current user owns, normalized (no dashes, lowercase).
@immutable
class MineIds {
  final Set<String> timerIds;
  final Set<String> seriesTimerIds;
  final Set<String> itemIds;

  const MineIds({
    this.timerIds = const {},
    this.seriesTimerIds = const {},
    this.itemIds = const {},
  });
}

List<RecordingOwner> _owners(Object? value) => value is List
    ? List.unmodifiable(value.map(RecordingOwner.fromJson).nonNulls)
    : const [];

/// Who owns the Live TV recordings, kept by the Moonfin plugin.
///
/// Owners are cached per id and dropped whenever a recording changes.
class RecordingOwnersService extends ChangeNotifier {
  final Dio _dio;
  final MediaServerClient? Function() _getClient;

  bool _supported = false;
  final Map<OwnedKind, Map<String, List<RecordingOwner>>> _cache = {
    for (final kind in OwnedKind.values) kind: {},
  };
  // Whether each looked-up item is a Live TV recording, when the plugin says.
  final Map<String, bool> _recordingItems = {};
  // Bumped when the cache is dropped, so a lookup started before can't fill it.
  int _generation = 0;
  // Set while a re-ping after the endpoints went away is running.
  bool _pingInFlight = false;

  RecordingOwnersService({
    required MediaServerClient? Function() client,
    @visibleForTesting Dio? dio,
  }) : _getClient = client,
       _dio = dio ?? Dio(pluginRequestOptions()) {
    if (dio == null) {
      configureServerDio(_dio);
      _dio.interceptors.add(redirectInterceptor(_dio));
    }
    liveTvRecordingRevision.addListener(_onRecordingsChanged);
  }

  @override
  void dispose() {
    liveTvRecordingRevision.removeListener(_onRecordingsChanged);
    super.dispose();
  }

  /// True when the server's plugin has the owner endpoints. Older plugins and
  /// Emby ports without them keep today's scheduling.
  bool get supported => _supported;

  void setSupported(bool value) {
    if (_supported == value) return;
    _supported = value;
    _clear();
    notifyListeners();
  }

  void _onRecordingsChanged() {
    if (!_supported) return;
    _clear();
    notifyListeners();
  }

  void _clear() {
    _generation++;
    for (final map in _cache.values) {
      map.clear();
    }
    _recordingItems.clear();
  }

  // Ids are compared without dashes or case, so either GUID spelling matches.
  static String _normalize(String id) => id.replaceAll('-', '').toLowerCase();

  static String _kindName(OwnedKind kind) => switch (kind) {
    OwnedKind.timer => 'timer',
    OwnedKind.series => 'series',
    OwnedKind.item => 'item',
  };

  // Timer and series ids are the server's own; only item ids are normalized.
  static String _key(OwnedKind kind, String id) =>
      kind == OwnedKind.item ? _normalize(id) : id;

  /// Schedules a single airing, or joins the owners of the timer already
  /// there. Throws a [DioException] on a refusal, like the plain call.
  Future<OwnershipOutcome> recordProgram(String programId) async {
    final data = await _request('POST', '/Moonfin/LiveTv/Owners/Record', {
      'programId': programId,
    });
    return _outcome(OwnedKind.timer, data);
  }

  Future<OwnershipOutcome> recordSeries(
    String programId, {
    Map<String, dynamic>? settings,
  }) async {
    final data = await _request('POST', '/Moonfin/LiveTv/Owners/RecordSeries', {
      'programId': programId,
      'settings': ?settings,
    });
    return _outcome(OwnedKind.series, data);
  }

  OwnershipOutcome _outcome(OwnedKind kind, Object? data) {
    final map = data is Map ? data : const {};
    final id = map['id']?.toString() ?? '';
    final owners = _owners(map['owners']);
    if (id.isNotEmpty) _cache[kind]![_key(kind, id)] = owners;
    return OwnershipOutcome(
      id: id,
      owners: owners,
      joined: map['joined'] == true,
    );
  }

  /// Adds the current user as an owner of something that already exists.
  Future<List<RecordingOwner>> claim(OwnedKind kind, String id) async {
    final data = await _request('POST', '/Moonfin/LiveTv/Owners/Claim', {
      'kind': _kindName(kind),
      'id': kind == OwnedKind.item ? _normalize(id) : id,
    });
    final owners = _owners(data is Map ? data['owners'] : null);
    _cache[kind]![_key(kind, id)] = owners;
    notifyListeners();
    return owners;
  }

  /// The cached owners, or an empty list when they aren't known (yet).
  List<RecordingOwner> ownersOf(OwnedKind kind, String id) =>
      _cache[kind]![_key(kind, id)] ?? const [];

  /// The owners other than the current user.
  List<RecordingOwner> othersOf(OwnedKind kind, String id) {
    final me = _currentUserId();
    final owners = ownersOf(kind, id);
    if (me == null) return owners;
    final mine = _normalize(me);
    return owners.where((o) => _normalize(o.userId) != mine).toList();
  }

  /// Whether the current user is one of the owners, or null while the owners
  /// aren't known. Known and unowned reads as false.
  bool? isMine(OwnedKind kind, String id) {
    final owners = _cache[kind]![_key(kind, id)];
    final me = _currentUserId();
    if (owners == null || me == null) return null;
    final mine = _normalize(me);
    return owners.any((o) => _normalize(o.userId) == mine);
  }

  /// Whether the plugin says this item is a Live TV recording, or null when
  /// it hasn't said (not looked up yet, or an older plugin).
  bool? isRecording(String itemId) => _recordingItems[_normalize(itemId)];

  static String? _currentUserId() {
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<UserRepository>()) return null;
    return getIt<UserRepository>().currentUser?.id;
  }

  /// Reads the owners of these ids into the cache. A failure leaves the cache
  /// as it was.
  Future<void> lookup({
    Iterable<String> timerIds = const [],
    Iterable<String> seriesTimerIds = const [],
    Iterable<String> itemIds = const [],
  }) async {
    if (!_supported) return;
    final timers = timerIds.toSet().toList();
    final series = seriesTimerIds.toSet().toList();
    final items = itemIds.map(_normalize).toSet().toList();
    if (timers.isEmpty && series.isEmpty && items.isEmpty) return;
    final generation = _generation;
    final Object? data;
    try {
      data = await _request('POST', '/Moonfin/LiveTv/Owners/Lookup', {
        'timerIds': timers,
        'seriesTimerIds': series,
        'itemIds': items,
      });
    } catch (_) {
      return;
    }
    if (generation != _generation || data is! Map) return;
    void fill(OwnedKind kind, List<String> asked, Object? answer) {
      final map = answer is Map ? answer : const {};
      final cache = _cache[kind]!;
      for (final id in asked) {
        cache[_key(kind, id)] = const [];
      }
      for (final entry in map.entries) {
        cache[_key(kind, entry.key.toString())] = _owners(entry.value);
      }
    }

    fill(OwnedKind.timer, timers, data['timers']);
    fill(OwnedKind.series, series, data['seriesTimers']);
    fill(OwnedKind.item, items, data['items']);
    // Older plugins leave this out, so the asked items stay unknown.
    final recordings = data['recordingItemIds'];
    if (recordings is List) {
      final ids = {
        for (final id in recordings)
          if (id != null) _normalize('$id'),
      };
      for (final id in items) {
        _recordingItems[id] = ids.contains(id);
      }
    }
    notifyListeners();
  }

  /// The ids the current user owns. Timer ids may include stale ones.
  Future<MineIds> mine() async {
    final data = await _request('GET', '/Moonfin/LiveTv/Owners/Mine', null);
    if (data is! Map) return const MineIds();
    Set<String> ids(Object? value, {bool normalize = false}) => value is List
        ? {
            for (final id in value)
              if (id != null) normalize ? _normalize('$id') : '$id',
          }
        : const {};
    return MineIds(
      timerIds: ids(data['timerIds']),
      seriesTimerIds: ids(data['seriesTimerIds']),
      itemIds: ids(data['itemIds'], normalize: true),
    );
  }

  // Throws a DioException on any non-2xx so callers keep their error mapping.
  Future<Object?> _request(String method, String path, Object? body) async {
    final client = _getClient();
    final token = client?.accessToken;
    if (client == null || token == null || token.isEmpty) {
      throw StateError('Not signed in to a server');
    }
    final response = await _dio.request<Object?>(
      '${client.baseUrl}$path',
      data: body,
      options: Options(
        method: method,
        headers: {
          'Authorization': buildServerAuthorizationHeader(
            scheme: 'MediaBrowser',
            deviceInfo: client.deviceInfo,
            accessToken: token,
          ),
          'Accept': 'application/json',
        },
      ),
    );
    final status = response.statusCode ?? 0;
    if (status < 200 || status >= 300) {
      throw DioException.badResponse(
        statusCode: status,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    return response.data;
  }
}

RecordingOwnersService? _supportedOwners() {
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<RecordingOwnersService>()) return null;
  final service = getIt<RecordingOwnersService>();
  return service.supported ? service : null;
}

// The plugin's 404 body when the feature is switched off.
const _ownersNotAvailable = 'Recording owners are not available';

// The `error` text of a JSON error body, or null when there is none.
String? _errorText(Object? data) {
  var body = data;
  if (body is String && body.isNotEmpty) {
    try {
      body = jsonDecode(body);
    } catch (_) {
      return null;
    }
  }
  if (body is! Map) return null;
  final text = body['error']?.toString();
  return text == null || text.isEmpty ? null : text;
}

// The owner endpoints answer these when the feature is switched off, the plugin
// is downgraded or removed, or (Emby) it is still starting. A 404 that names
// another reason (no such program, nothing to claim) is "not found" instead.
bool _ownersEndpointGone(Object error) {
  if (error is! DioException) return false;
  final status = error.response?.statusCode;
  if (const {405, 501, 503}.contains(status)) return true;
  if (status != 404) return false;
  final text = _errorText(error.response?.data);
  return text == null || text == _ownersNotAvailable;
}

// A 404 from a plugin that is there but has no such program or recording.
bool _ownersNotFound(Object error) =>
    error is DioException &&
    error.response?.statusCode == 404 &&
    !_ownersEndpointGone(error);

// Treats owners as unsupported until a fresh Ping says otherwise. Failures that
// arrive together start only one Ping.
void _ownersWentAway(RecordingOwnersService owners) {
  owners.setSupported(false);
  if (owners._pingInFlight) return;
  final getIt = GetIt.instance;
  final client = owners._getClient();
  if (client == null || !getIt.isRegistered<PluginSyncService>()) return;
  owners._pingInFlight = true;
  unawaited(
    getIt<PluginSyncService>()
        .refreshAvailability(client)
        .then((_) {}, onError: (_) {})
        .whenComplete(() => owners._pingInFlight = false),
  );
}

/// The owners service when the server's plugin keeps owners, else null.
RecordingOwnersService? supportedRecordingOwners() => _supportedOwners();

/// Adds the current user to the owners of a timer or series rule as it
/// stands (joining a series never asks which episodes, so it can't change the
/// rule under its owners), and tells the Live TV surfaces. Throws when the
/// plugin doesn't keep owners or refuses.
Future<void> joinRecording(OwnedKind kind, String id) async {
  final owners = _supportedOwners();
  if (owners == null) throw StateError('Recording owners are not supported');
  try {
    await owners.claim(kind, id);
  } catch (e) {
    // There is no plain call to join with, so the caller shows its failure. A
    // "not found" 404 leaves owners on.
    if (_ownersEndpointGone(e)) _ownersWentAway(owners);
    rethrow;
  }
  notifyLiveTvRecordingsChanged();
}

/// The owners of [id] other than the current user, read fresh from the plugin
/// first. Empty when the plugin doesn't keep owners; a failed or slow read
/// falls back to what was cached.
Future<List<RecordingOwner>> freshOtherOwners(OwnedKind kind, String id) async {
  final owners = _supportedOwners();
  if (owners == null || id.isEmpty) return const [];
  try {
    await owners
        .lookup(
          timerIds: kind == OwnedKind.timer ? [id] : const [],
          seriesTimerIds: kind == OwnedKind.series ? [id] : const [],
          itemIds: kind == OwnedKind.item ? [id] : const [],
        )
        .timeout(const Duration(seconds: 5));
  } catch (_) {
    // Keep what was cached.
  }
  return owners.othersOf(kind, id);
}

/// Schedules one airing through the plugin's owner endpoints when it has them,
/// else with the plain Live TV call.
Future<void> createTimerWithOwner(LiveTvApi api, String programId) async {
  final owners = _supportedOwners();
  if (owners == null) return api.createTimer(programId);
  try {
    await owners.recordProgram(programId);
  } on DioException catch (e) {
    if (_ownersEndpointGone(e)) {
      _ownersWentAway(owners);
    } else if (!_ownersNotFound(e)) {
      rethrow;
    }
    await api.createTimer(programId);
  }
}

Future<void> createSeriesTimerWithOwner(
  LiveTvApi api,
  String programId, {
  Map<String, dynamic>? settings,
}) async {
  final owners = _supportedOwners();
  if (owners == null) {
    return api.createSeriesTimer(programId, settings: settings);
  }
  try {
    await owners.recordSeries(programId, settings: settings);
  } on DioException catch (e) {
    if (_ownersEndpointGone(e)) {
      _ownersWentAway(owners);
    } else if (!_ownersNotFound(e)) {
      rethrow;
    }
    await api.createSeriesTimer(programId, settings: settings);
  }
}
