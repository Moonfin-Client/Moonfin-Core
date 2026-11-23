import 'dart:math' show min;

/// Splits [items] so each `isIn` list stays under SQLite's bound variable
/// limit.
Iterable<List<T>> chunked<T>(List<T> items, [int size = 900]) sync* {
  for (var i = 0; i < items.length; i += size) {
    yield items.sublist(i, min(i + size, items.length));
  }
}
