import 'dart:async';

import 'package:server_core/server_core.dart';

class _Measurement {
  final int offset;
  final int roundTripTime;
  final int delay;
  const _Measurement({
    required this.offset,
    required this.roundTripTime,
    required this.delay,
  });
}

class TimeSyncManager {
  static const int _maxMeasurements = 8;
  static const int _greedyIntervalMs = 1000;
  static const int _lowProfileIntervalMs = 60000;
  static const int _greedyPingCount = 3;
  static const int _maxRttMs = 5000;

  final SyncPlayApi _api;

  final List<_Measurement> _measurements = [];
  Timer? _timer;
  bool _isSyncing = false;
  int _measurementCount = 0;

  int _timeOffset = 0;
  int _roundTripTime = 0;
  int _offsetJitterMs = 0;

  TimeSyncManager(this._api);

  int get timeOffset => _timeOffset;
  int get roundTripTime => _roundTripTime;
  int get offsetJitterMs => _offsetJitterMs;
  int get measurementCount => _measurementCount;
  bool get isGreedyMode => _measurementCount < _greedyPingCount;

  void startSync() {
    if (_isSyncing) return;
    _isSyncing = true;
    _measurementCount = 0;
    _scheduleNext(0);
  }

  void stopSync() {
    _isSyncing = false;
    _timer?.cancel();
    _timer = null;
    _measurements.clear();
    _measurementCount = 0;
  }

  Future<void> syncNow() => _performMeasurement();

  int getServerTimeNow() => _nowMs() + _timeOffset;
  int serverTimeToLocal(int serverMs) => serverMs - _timeOffset;
  int localTimeToServer(int localMs) => localMs + _timeOffset;

  void _scheduleNext(int delayMs) {
    if (!_isSyncing) return;
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: delayMs), () async {
      if (!_isSyncing) return;
      await _performMeasurement();
      _measurementCount++;
      final next = _measurementCount < _greedyPingCount
          ? _greedyIntervalMs
          : _lowProfileIntervalMs;
      _scheduleNext(next);
    });
  }

  Future<void> _performMeasurement() async {
    try {
      final t0 = _nowMs();
      final response = await _api.getUtcTime();
      final t3 = _nowMs();
      final t1 = response.requestReceptionTimeMs;
      final t2 = response.responseTransmissionTimeMs;
      if (t1 <= 0 || t2 <= 0) return;

      final offset = ((t1 - t0) + (t2 - t3)) ~/ 2;
      final rtt = (t3 - t0) - (t2 - t1);
      final delay = (t3 - t0) ~/ 2;

      if (rtt < 0 || rtt > _maxRttMs) return;

      _measurements.add(_Measurement(
        offset: offset,
        roundTripTime: rtt,
        delay: delay,
      ));
      while (_measurements.length > _maxMeasurements) {
        _measurements.removeAt(0);
      }

      final offsets = _measurements.map((m) => m.offset).toList();
      _offsetJitterMs =
          offsets.reduce((a, b) => a > b ? a : b) -
              offsets.reduce((a, b) => a < b ? a : b);

      _Measurement? best;
      for (final m in _measurements) {
        if (best == null || m.delay < best.delay) best = m;
      }
      if (best != null) {
        _timeOffset = best.offset;
        _roundTripTime = best.roundTripTime;
      }
    } catch (_) {}
  }

  int _nowMs() => DateTime.now().toUtc().millisecondsSinceEpoch;
}
