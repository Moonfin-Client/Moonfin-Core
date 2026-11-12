/// The channel groups of one raw Live TV channel, read from the tags its tuner
/// set on it. Some tuner plugins tag each channel with its group, and Emby
/// imports M3U groups as tags. The guide's group chips need only these names
/// and the channels in each, so another source of groups can feed them too.
///
/// Jellyfin stores a channel's tags joined with `|` and splits them on every
/// `|` when it reads them back, so "FR | Kids" arrives as "FR " and " Kids".
/// The pieces are joined again where the `|` touches whitespace or an empty
/// piece. A bare `|` ("US|SPORTS") reads the same as two tags, so it stays
/// split. Emby lists tags only as `TagItems`, whose names arrive whole.
///
/// Jellyfin also tags a channel "Kids" by itself when it airs children's
/// programs, which the Kids filter already covers, so a tag that is just
/// "Kids", in any case, is left out.
List<String> channelGroupsFromTags(Map<String, dynamic> channel) {
  final tags = channel['Tags'];
  final tagItems = channel['TagItems'];
  final List<String> names;
  if (tags is List) {
    names = _joinSplitTags(tags);
  } else if (tagItems is List) {
    names = [
      for (final item in tagItems)
        if (item is Map && item['Name'] is String) item['Name'] as String,
    ];
  } else {
    return const [];
  }
  final groups = <String>[];
  for (final name in names) {
    final group = name.trim();
    if (group.isEmpty || group.toLowerCase() == 'kids') continue;
    if (!groups.contains(group)) groups.add(group);
  }
  return groups;
}

List<String> _joinSplitTags(List<dynamic> pieces) {
  final tags = <String>[];
  for (final piece in pieces) {
    if (piece is! String) continue;
    if (tags.isNotEmpty && _joinsPrevious(tags.last, piece)) {
      tags[tags.length - 1] = '${tags.last}|$piece';
    } else {
      tags.add(piece);
    }
  }
  return tags;
}

/// Whether the `|` between [previous] and [piece] sat inside one tag: it
/// touches whitespace or an empty piece. An empty piece already joined leaves
/// [previous] ending in `|`.
bool _joinsPrevious(String previous, String piece) =>
    previous.isEmpty ||
    piece.isEmpty ||
    previous.endsWith('|') ||
    previous != previous.trimRight() ||
    piece != piece.trimLeft();
