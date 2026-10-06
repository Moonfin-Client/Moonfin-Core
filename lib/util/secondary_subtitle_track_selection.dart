import 'dart:convert';

import 'language_matching.dart';

List<Map<String, dynamic>> rankSecondarySubtitleStreams(
  List<Map<String, dynamic>> streams,
  String preferredLanguage,
) {
  final ranked = List<Map<String, dynamic>>.of(streams);
  final preferred = normalizeLanguage(preferredLanguage);
  if (preferred.isEmpty) return ranked;
  final preferredIso3 = toIso3Language(preferred);
  bool matches(Map<String, dynamic> stream) => languageMatchesPreferred(
    stream['Language'] as String?,
    preferred,
    preferredIso3,
  );
  return [
    ...ranked.where(matches),
    ...ranked.where((stream) => !matches(stream)),
  ];
}

Map<String, dynamic> secondarySubtitleTrackSelection(
  List<Map<String, dynamic>> streams,
  int? index,
) {
  if (index == null || index < 0) return const {'off': true};
  final ordinal = streams.indexWhere((s) => s['Index'] == index);
  if (ordinal < 0) return const {'off': true};
  final stream = streams[ordinal];
  final identity = _identity(stream);
  return {'index': index, 'ordinal': ordinal, 'identity': identity};
}

int? restoreSecondarySubtitleTrack(
  Map<String, dynamic>? saved,
  List<Map<String, dynamic>> streams, {
  required bool Function(Map<String, dynamic>) isCompatible,
}) {
  if (saved == null) return null;
  if (saved['off'] == true) return -1;
  final rawIdentity = saved['identity'];
  if (rawIdentity is! Map) return -1;
  final identity = rawIdentity.cast<String, dynamic>();
  if (identity.isEmpty) return -1;
  final signature = jsonEncode(identity);
  final candidates = streams.where(isCompatible).toList();
  final savedIndex = saved['index'] as int?;
  for (final stream in candidates) {
    if (stream['Index'] == savedIndex && _signature(stream) == signature) {
      return savedIndex;
    }
  }
  final matchingStreams = candidates
      .where((s) => _signature(s) == signature)
      .toList();
  if (matchingStreams.length == 1) {
    return matchingStreams.single['Index'] as int?;
  }
  final ordinal = saved['ordinal'] as int?;
  if (ordinal != null && ordinal >= 0 && ordinal < streams.length) {
    final stream = streams[ordinal];
    if (isCompatible(stream) && _signature(stream) == signature) {
      return stream['Index'] as int?;
    }
  }
  return -1;
}

Map<String, dynamic> _identity(Map<String, dynamic> stream) => {
  for (final key in const [
    'Language',
    'Title',
    'DisplayTitle',
    'Codec',
    'IsExternal',
    'DeliveryMethod',
    'IsForced',
    'IsHearingImpaired',
  ])
    if (stream[key] != null) key: stream[key],
};

String _signature(Map<String, dynamic> stream) => jsonEncode(_identity(stream));
