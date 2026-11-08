import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/moonbase_endpoint.dart';
import 'after_hours_game.dart';

class ArcadeScore {
  const ArcadeScore(this.userName, this.score, this.at);

  final String userName;
  final int score;
  final DateTime at;

  static ArcadeScore? fromJson(Object? json) {
    if (json is! Map) return null;
    final name = json['userName'], score = json['score'];
    if (name is! String || score is! num) return null;
    final at = DateTime.tryParse(json['at']?.toString() ?? '');
    return ArcadeScore(name, score.toInt(), at ?? DateTime(2000));
  }

  Map<String, Object> toJson() => {
    'userName': userName,
    'score': score,
    'at': at.toUtc().toIso8601String(),
  };
}

/// [entry] placed on [board] the way the server keeps its boards: one row per
/// person holding their best, best first, ties to the earlier run, three rows.
/// The rank is null when the run didn't make the board or didn't beat the
/// person's own row.
({List<ArcadeScore> board, int? rank}) placeOnBoard(
  List<ArcadeScore> board,
  ArcadeScore entry,
) {
  bool same(ArcadeScore s) =>
      s.userName.toLowerCase() == entry.userName.toLowerCase();
  final own = board.where(same).firstOrNull;
  if (own != null && own.score >= entry.score) {
    return (board: board, rank: null);
  }
  final next = [...board.where((s) => !same(s)), entry]
    ..sort((a, b) {
      final byScore = b.score.compareTo(a.score);
      return byScore != 0 ? byScore : a.at.compareTo(b.at);
    });
  final top = next.take(3).toList();
  final i = top.indexOf(entry);
  return (board: top, rank: i < 0 ? null : i + 1);
}

/// The top 3 for every game, from the server's Moonbase plugin when it has
/// the scores route, otherwise the ones kept on this device. The device boards
/// are kept up to date either way.
class AfterHoursScores extends ChangeNotifier {
  AfterHoursScores(
    this._store,
    this._client, {
    required this.viewerName,
    this.serverName,
    Dio? dio,
  }) : _dio =
           dio ??
           Dio(
             BaseOptions(
               connectTimeout: const Duration(seconds: 6),
               receiveTimeout: const Duration(seconds: 8),
             ),
           ) {
    _device = _readDevice();
    boards = {..._device};
  }

  static const _boardsPref = Preference<String>(
    key: 'after_hours_device_boards',
    defaultValue: '',
  );

  /// The server checks the same cap.
  static const maxScore = 9999999;

  final PreferenceStore _store;
  final MediaServerClient? _client;
  final Dio _dio;
  final String viewerName;
  final String? serverName;

  late Map<ArcadeGameId, List<ArcadeScore>> _device;
  late Map<ArcadeGameId, List<ArcadeScore>> boards;
  bool fromServer = false;
  bool _disposed = false;

  bool isViewer(String name) => name.toLowerCase() == viewerName.toLowerCase();

  Map<ArcadeGameId, List<ArcadeScore>> _readDevice() {
    final out = {for (final g in ArcadeGameId.values) g: <ArcadeScore>[]};
    try {
      final raw = _store.get(_boardsPref);
      if (raw.isEmpty) return out;
      final json = jsonDecode(raw);
      if (json is! Map) return out;
      for (final g in ArcadeGameId.values) {
        final rows = json[g.id];
        if (rows is! List) continue;
        out[g] = rows.map(ArcadeScore.fromJson).nonNulls.take(3).toList();
      }
    } catch (_) {
      // A damaged store starts the boards over rather than hiding the arcade.
    }
    return out;
  }

  Future<void> _writeDevice() => _store.set(
    _boardsPref,
    jsonEncode({
      for (final e in _device.entries)
        e.key.id: [for (final s in e.value) s.toJson()],
    }),
  );

  Future<MoonbaseEndpoint?> _endpoint() async {
    final client = _client;
    if (client == null) return null;
    try {
      return await moonbaseEndpoint(client, _dio);
    } catch (_) {
      return null;
    }
  }

  String _url(MoonbaseEndpoint ep, ArcadeGameId g) =>
      '${ep.base}/Moonfin/MiniGames/${g.id}/Scores';

  Future<List<ArcadeScore>> _fetch(MoonbaseEndpoint ep, ArcadeGameId g) async {
    final response = await _dio.get<Object>(
      _url(ep, g),
      options: Options(headers: ep.headers),
    );
    final data = response.data;
    if (data is! List) throw const FormatException('not a board');
    return data.map(ArcadeScore.fromJson).nonNulls.take(3).toList();
  }

  void _useDevice() {
    fromServer = false;
    boards = {..._device};
  }

  Future<void> load() async {
    final ep = await _endpoint();
    if (ep != null) {
      try {
        final rows = await Future.wait(
          ArcadeGameId.values.map((g) => _fetch(ep, g)),
        );
        boards = {
          for (var i = 0; i < rows.length; i++) ArcadeGameId.values[i]: rows[i],
        };
        fromServer = true;
        _notify();
        return;
      } catch (e) {
        debugPrint('[AfterHours] server boards unavailable: $e');
      }
    }
    _useDevice();
    _notify();
  }

  /// Records a finished run and returns its place on the board shown, or null
  /// when it didn't place.
  Future<int?> submit(ArcadeGameId game, int score) async {
    final value = score.clamp(0, maxScore);
    final placed = placeOnBoard(
      _device[game] ?? const [],
      ArcadeScore(viewerName, value, DateTime.now().toUtc()),
    );
    _device[game] = placed.board;
    await _writeDevice();

    final ep = await _endpoint();
    if (ep != null) {
      try {
        final response = await _dio.post<Object>(
          _url(ep, game),
          data: {'score': value},
          options: Options(headers: ep.headers),
        );
        final data = response.data;
        final rank = data is Map && data['rank'] is num
            ? (data['rank'] as num).toInt()
            : null;
        if (fromServer) {
          boards[game] = await _fetch(ep, game);
          _notify();
          return rank;
        }
        // The server came back since the boards were read, so read them all.
        await load();
        return fromServer ? rank : placed.rank;
      } catch (e) {
        debugPrint('[AfterHours] score not sent to the server: $e');
      }
    }
    _useDevice();
    _notify();
    return placed.rank;
  }

  // A load or a submit can finish after the arcade has closed.
  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _dio.close(force: true);
    super.dispose();
  }
}
