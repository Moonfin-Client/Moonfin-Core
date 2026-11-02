import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import 'plugin_sync_service.dart';

/// What happened to the complete showing of an incomplete recording's episode.
enum CompleteShowingStatus { scheduled, recorded, notFound, none }

CompleteShowingStatus _statusFrom(Object? value) => switch (value) {
  'scheduled' => CompleteShowingStatus.scheduled,
  'recorded' => CompleteShowingStatus.recorded,
  'notFound' => CompleteShowingStatus.notFound,
  _ => CompleteShowingStatus.none,
};

// A malformed value reads as zero rather than failing the whole set.
int _minutes(Object? value) => switch (value) {
  num n => n.round(),
  String s => num.tryParse(s)?.round() ?? 0,
  _ => 0,
};

DateTime? _date(Object? value) => parseServerDate(value)?.toLocal();

/// A recording the Moonfin plugin judged incomplete.
@immutable
class IncompleteRecording {
  final String itemId;
  final int recordedMinutes;
  final int expectedMinutes;
  final CompleteShowingStatus status;
  final DateTime? scheduledStart;
  final String? channelName;
  final DateTime? recordedAt;

  const IncompleteRecording({
    required this.itemId,
    required this.recordedMinutes,
    required this.expectedMinutes,
    this.status = CompleteShowingStatus.none,
    this.scheduledStart,
    this.channelName,
    this.recordedAt,
  });

  static IncompleteRecording? fromJson(Map<String, dynamic> json) {
    final id = json['itemId']?.toString();
    if (id == null || id.isEmpty) return null;
    return IncompleteRecording(
      itemId: id,
      recordedMinutes: _minutes(json['recordedMinutes']),
      expectedMinutes: _minutes(json['expectedMinutes']),
      status: _statusFrom(json['state']),
      scheduledStart: _date(json['scheduledStart']),
      channelName: json['channelName']?.toString(),
      recordedAt: _date(json['recordedAt']),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is IncompleteRecording &&
      other.itemId == itemId &&
      other.recordedMinutes == recordedMinutes &&
      other.expectedMinutes == expectedMinutes &&
      other.status == status &&
      other.scheduledStart == scheduledStart &&
      other.channelName == channelName &&
      other.recordedAt == recordedAt;

  @override
  int get hashCode => Object.hash(
    itemId,
    recordedMinutes,
    expectedMinutes,
    status,
    scheduledStart,
    channelName,
    recordedAt,
  );
}

/// A specific airing offered for confirmation, tied to the current server session.
class SuggestedShowing {
  final Map<String, dynamic> payload;
  final int generation;
  final DateTime start;

  SuggestedShowing(this.payload, this.generation, this.start);

  String get name => payload['name'] as String;
  String get description => payload['description'] as String;
  String? get channelName => payload['channelName'] as String?;
  String? get channelNumber => payload['channelNumber'] as String?;

  /// A recording is already scheduled for this showing, by anyone. Confirming
  /// it adopts that timer rather than making another.
  bool get alreadyScheduled => payload['alreadyScheduled'] == true;
}

class CompleteShowingOptions {
  final bool canSearch;
  final SuggestedShowing? showing;

  /// The server replied, so [canSearch] is its answer rather than a default
  /// left by a timeout or an older plugin.
  final bool answered;

  const CompleteShowingOptions({
    this.canSearch = false,
    this.showing,
    this.answered = false,
  });
}

/// The incomplete Live TV recordings the Moonfin plugin tracks, for the badge,
/// the detail line and the Record prompt.
///
/// The whole set is fetched in one call and kept, since it stays small, so a
/// card only checks membership. It is read again every few minutes while
/// something is asking for it.
class IncompleteRecordingsService extends ChangeNotifier {
  static const _maxAge = Duration(minutes: 5);

  final Dio _dio;
  final MediaServerClient? Function() _client;

  Map<String, IncompleteRecording> _byItem = const {};
  bool _supported = false;
  bool _extendedSupported = false;
  DateTime? _loadedAt;
  Future<void>? _inFlight;
  // Bumped when support changes or an item is dismissed, so a read started
  // before either can't fill the set once it lands.
  int _generation = 0;
  int _sessionGeneration = 0;

  IncompleteRecordingsService({
    required MediaServerClient? Function() client,
    @visibleForTesting Dio? dio,
  }) : _client = client,
       _dio = dio ?? Dio(pluginRequestOptions()) {
    if (dio == null) {
      configureServerDio(_dio);
      _dio.interceptors.add(redirectInterceptor(_dio));
    }
  }

  /// True when the server's plugin has the incomplete recordings endpoints.
  /// Everything in the UI is hidden otherwise, which covers Emby and older
  /// plugins.
  bool get supported => _supported;

  bool get extendedSupported => _supported && _extendedSupported;

  void setSupported(bool value, {bool extended = false}) {
    if (_supported == value && _extendedSupported == (value && extended)) {
      return;
    }
    _supported = value;
    _extendedSupported = value && extended;
    _generation++;
    _sessionGeneration++;
    _inFlight = null;
    _byItem = const {};
    _loadedAt = null;
    notifyListeners();
    if (value) unawaited(refresh());
  }

  /// The item's incomplete state, or null when it is complete or unknown.
  /// Asking also reads the set again once it has gone stale.
  IncompleteRecording? stateFor(String? itemId) {
    if (!_supported || itemId == null || itemId.isEmpty) return null;
    _refreshIfStale();
    return _byItem[_normalize(itemId)];
  }

  void _refreshIfStale() {
    final loadedAt = _loadedAt;
    if (loadedAt == null || DateTime.now().difference(loadedAt) > _maxAge) {
      unawaited(refresh());
    }
  }

  /// Reads the whole set again. Concurrent callers share one request.
  Future<void> refresh() {
    if (!_supported) return Future.value();
    final existing = _inFlight;
    if (existing != null) return existing;
    late final Future<void> load;
    load = _load().whenComplete(() {
      if (identical(_inFlight, load)) _inFlight = null;
    });
    return _inFlight = load;
  }

  // An older plugin is told apart by the ping's capability flag, before this
  // runs. Here a refusal means this user may not see Live TV, so nothing is
  // badged; an outage or a server error keeps what was last known.
  Future<void> _load() async {
    final generation = _generation;
    _loadedAt = DateTime.now();
    final response = await _raw(
      'GET',
      '/Moonfin/LiveTv/Recordings/Incomplete',
      null,
    );
    if (generation != _generation) return;
    final status = response?.statusCode ?? 0;
    if (status == 401 || status == 403) {
      if (_byItem.isNotEmpty) {
        _byItem = const {};
        notifyListeners();
      }
      return;
    }
    final data = response?.data;
    if (data is! List) return;
    final next = <String, IncompleteRecording>{};
    for (final entry in data) {
      if (entry is! Map) continue;
      final parsed = IncompleteRecording.fromJson(
        Map<String, dynamic>.from(entry),
      );
      if (parsed != null) next[_normalize(parsed.itemId)] = parsed;
    }
    if (mapEquals(next, _byItem)) return;
    _byItem = next;
    notifyListeners();
  }

  /// Keep as Complete. Dismisses the record for everyone on the server.
  Future<bool> dismiss(String itemId) async {
    final ok = await _send(
      'POST',
      '/Moonfin/LiveTv/Recordings/${_normalize(itemId)}/Dismiss',
    );
    if (ok) {
      // A read already under way may still list the item, so it is dropped
      // and the set read again.
      _generation++;
      _inFlight = null;
      _byItem = Map.of(_byItem)..remove(_normalize(itemId));
      notifyListeners();
      unawaited(refresh());
    }
    return ok;
  }

  /// Asks the plugin to record a complete showing of the program's episode
  /// later. Returns false when it couldn't.
  Future<bool> requestCompleteShowing(String programId) => _send(
    'POST',
    '/Moonfin/LiveTv/CompleteShowing',
    {'programId': programId},
  );

  Future<CompleteShowingOptions> completeShowingOptions(
    String programId,
  ) async {
    if (!extendedSupported) return const CompleteShowingOptions();
    final generation = _sessionGeneration;
    final response = await _raw(
      'GET',
      '/Moonfin/LiveTv/CompleteShowing/Options?programId=${Uri.encodeQueryComponent(programId)}',
      null,
    );
    if (generation != _sessionGeneration || response?.statusCode != 200) {
      return const CompleteShowingOptions();
    }
    final data = response?.data;
    if (data is! Map) return const CompleteShowingOptions();
    final showing = data['showing'];
    SuggestedShowing? parsed;
    if (showing is Map &&
        showing['programId'] is String &&
        (showing['programId'] as String).isNotEmpty &&
        showing['name'] is String &&
        (showing['name'] as String).trim().isNotEmpty &&
        showing['description'] is String &&
        (data['canSearch'] == true ||
            (showing['description'] as String).trim().isNotEmpty) &&
        (showing['channelName'] == null || showing['channelName'] is String) &&
        (showing['channelNumber'] == null ||
            showing['channelNumber'] is String)) {
      final start = _date(showing['startDate']);
      if (start != null && start.isAfter(DateTime.now())) {
        parsed = SuggestedShowing(
          Map<String, dynamic>.from(showing),
          generation,
          start,
        );
      }
    }
    return CompleteShowingOptions(
      canSearch: data['canSearch'] == true,
      showing: parsed,
      answered: true,
    );
  }

  Future<bool> scheduleSuggestedShowing(
    String programId,
    SuggestedShowing showing,
  ) {
    if (!extendedSupported || showing.generation != _sessionGeneration) {
      return Future.value(false);
    }
    return _send('POST', '/Moonfin/LiveTv/CompleteShowing/Suggestion', {
      'programId': programId,
      'showing': showing.payload,
    });
  }

  // Ids are compared without dashes or case, so either GUID spelling matches.
  static String _normalize(String id) => id.replaceAll('-', '').toLowerCase();

  Future<bool> _send(String method, String path, [Object? body]) async {
    final response = await _raw(method, path, body);
    final status = response?.statusCode ?? 0;
    return status >= 200 && status < 300;
  }

  Future<Response<Object?>?> _raw(
    String method,
    String path,
    Object? body,
  ) async {
    final client = _client();
    final token = client?.accessToken;
    if (client == null || token == null || token.isEmpty) return null;
    try {
      return await _dio.request<Object?>(
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
    } on DioException catch (e) {
      // A refusal still has a status worth reading; anything else is an outage.
      return e.response;
    } catch (_) {
      return null;
    }
  }
}
