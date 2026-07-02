class Chapter {
  final String title;
  final int startMs;

  const Chapter({required this.title, required this.startMs});
}

enum TimelineEventType { chapter, bookmark, note }

class TimelineEvent {
  final String id;
  final TimelineEventType type;
  final String title;
  final String? content;
  final int positionMs;
  final DateTime date;
  final dynamic originalObject;

  const TimelineEvent({
    required this.id,
    required this.type,
    required this.title,
    this.content,
    required this.positionMs,
    required this.date,
    required this.originalObject,
  });
}
