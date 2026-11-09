/// What a watch party toast says happened. The UI words it, naming
/// [WatchPartyToast.name] where there is one.
enum WatchPartyToastKind {
  paused,
  resumed,
  skipped,
  joined,
  left,
  youAreHost,
  newHost,
  policyChanged,
  switched,
  noAccess,
  reconnecting,
  reconnected,
  ended,

  /// This member tried to play, pause or skip without the right to.
  hostOnly,
}

class WatchPartyToast {
  const WatchPartyToast(this.kind, {this.name, this.detail});

  final WatchPartyToastKind kind;

  /// Who did it.
  final String? name;

  /// A position for a skip, or the title for a switch.
  final String? detail;
}

/// A chat message, or a notice (who joined, left or switched) shown in its
/// place in the chat.
class WatchPartyChatEntry {
  const WatchPartyChatEntry({
    required this.id,
    required this.name,
    required this.text,
    required this.sentAt,
    this.notice,
  });

  factory WatchPartyChatEntry.fromJson(Map<String, dynamic> json) =>
      WatchPartyChatEntry(
        id: '${json['id'] ?? ''}',
        name: json['display_name'] as String? ?? '',
        text: json['text'] as String? ?? '',
        sentAt:
            DateTime.tryParse(json['sent_at'] as String? ?? '')?.toLocal() ??
            DateTime.now(),
      );

  final String id;
  final String name;
  final String text;
  final DateTime sentAt;
  final WatchPartyToast? notice;
}

class WatchPartyReaction {
  const WatchPartyReaction({required this.name, required this.reaction});

  /// The six reactions, in the order the quick bars show them.
  static const kinds = ['love', 'haha', 'wow', 'sad', 'fire', 'popcorn'];

  static WatchPartyReaction? fromJson(Map<String, dynamic> json) {
    final reaction = json['reaction'];
    if (reaction is! String || !kinds.contains(reaction)) return null;
    return WatchPartyReaction(
      name: json['display_name'] as String? ?? '',
      reaction: reaction,
    );
  }

  final String name;
  final String reaction;
}
