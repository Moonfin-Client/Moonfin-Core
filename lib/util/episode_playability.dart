import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';

const Duration _kFuturePremiereGrace = Duration(minutes: 5);

bool isEligibleNextEpisodeCandidate(
  AggregatedItem item, {
  DateTime? now,
}) {
  return isEligibleNextEpisodeCandidateRaw(item.rawData, now: now);
}

bool isEligibleNextEpisodeCandidateRaw(
  Map<String, dynamic> raw, {
  DateTime? now,
}) {
  if (_isExplicitPlaceholder(raw)) {
    return false;
  }
  if (_isFuturePremiere(raw, now: now)) {
    return false;
  }
  if (!_hasPlayableMediaSources(raw)) {
    return false;
  }
  if (!_hasPositiveRuntimeIfKnown(raw)) {
    return false;
  }
  return true;
}

bool _isExplicitPlaceholder(Map<String, dynamic> raw) {
  final locationType = (raw['LocationType'] as String?)?.toLowerCase();
  if (locationType == 'virtual') {
    return true;
  }
  return raw['IsVirtualItem'] == true ||
      raw['IsMissing'] == true ||
      raw['IsPlaceholder'] == true;
}

bool _isFuturePremiere(Map<String, dynamic> raw, {DateTime? now}) {
  final premiere = parseServerDate(raw['PremiereDate']);
  if (premiere == null) {
    return false;
  }
  final reference = now ?? DateTime.now();
  return premiere.isAfter(reference.add(_kFuturePremiereGrace));
}

bool _hasPlayableMediaSources(Map<String, dynamic> raw) {
  if (!raw.containsKey('MediaSources')) {
    return true;
  }
  final mediaSources = raw['MediaSources'] as List?;
  return mediaSources != null && mediaSources.isNotEmpty;
}

bool _hasPositiveRuntimeIfKnown(Map<String, dynamic> raw) {
  final itemTicks = _toInt(raw['RunTimeTicks']);
  if (itemTicks != null) {
    return itemTicks > 0;
  }

  final mediaSources = raw['MediaSources'] as List?;
  if (mediaSources == null || mediaSources.isEmpty) {
    return true;
  }
  var foundRuntime = false;
  for (final source in mediaSources) {
    if (source is! Map) {
      continue;
    }
    final sourceTicks = _toInt(source['RunTimeTicks']);
    if (sourceTicks == null) {
      continue;
    }
    foundRuntime = true;
    if (sourceTicks > 0) {
      return true;
    }
  }
  return !foundRuntime;
}

int? _toInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
