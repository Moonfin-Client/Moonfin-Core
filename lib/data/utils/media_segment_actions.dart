import '../models/media_segment.dart';
import '../../preference/preference_constants.dart';

/// Segment types that can be given an action of their own, in the order they
/// are offered in settings. [MediaSegmentType.unknown] is deliberately absent:
/// it is the parser's fallback for a type this build does not recognise, not
/// something a user can meaningfully configure.
const List<MediaSegmentType> configurableMediaSegmentTypes = <MediaSegmentType>[
  MediaSegmentType.intro,
  MediaSegmentType.recap,
  MediaSegmentType.preview,
  MediaSegmentType.commercial,
  MediaSegmentType.outro,
];

/// The action's name as it appears in the stored preference.
///
/// [MediaSegmentAction.nothing] is written as `doNothing` because that is what
/// the preset values used before this was configurable per type. Any
/// unrecognised name parses back to [MediaSegmentAction.nothing], so the two
/// round trip.
String mediaSegmentActionName(MediaSegmentAction action) => switch (action) {
  MediaSegmentAction.skip => 'skip',
  MediaSegmentAction.askToSkip => 'askToSkip',
  MediaSegmentAction.nothing => 'doNothing',
};

MediaSegmentAction mediaSegmentActionFromName(String value) =>
    switch (value.trim()) {
      'skip' => MediaSegmentAction.skip,
      'askToSkip' => MediaSegmentAction.askToSkip,
      _ => MediaSegmentAction.nothing,
    };

/// Reads the `type:action` pairs out of a stored preference value.
///
/// Malformed entries are skipped rather than thrown on. This is read on every
/// position tick during playback, so one bad entry must not take the skip
/// prompt with it.
Map<MediaSegmentType, MediaSegmentAction> parseMediaSegmentActions(String raw) {
  final actions = <MediaSegmentType, MediaSegmentAction>{};
  for (final part in raw.split(',')) {
    final pair = part.split(':');
    if (pair.length != 2) continue;
    final name = pair[0].trim();
    // Reaching for the first letter of a nameless entry throws.
    if (name.isEmpty) continue;
    final type = MediaSegmentType.fromServerString(
      name[0].toUpperCase() + name.substring(1),
    );
    actions[type] = mediaSegmentActionFromName(pair[1]);
  }
  return actions;
}

/// Writes the pairs back out in [configurableMediaSegmentTypes] order.
///
/// Types with no entry are left out rather than written as `doNothing`, which
/// keeps the shipped default (`intro:askToSkip,outro:askToSkip`) byte for byte
/// identical across a parse and serialise round trip.
String serializeMediaSegmentActions(
  Map<MediaSegmentType, MediaSegmentAction> actions,
) {
  final parts = <String>[];
  for (final type in configurableMediaSegmentTypes) {
    final action = actions[type];
    if (action == null) continue;
    parts.add('${type.name}:${mediaSegmentActionName(action)}');
  }
  return parts.join(',');
}

/// The stored value with [type] set to [action], leaving other types alone.
String withMediaSegmentAction(
  String raw,
  MediaSegmentType type,
  MediaSegmentAction action,
) {
  final actions = parseMediaSegmentActions(raw);
  actions[type] = action;
  return serializeMediaSegmentActions(actions);
}
