/// Answers read from Silo, kept per key for [lifetime].
///
/// Everyone asking for a key while its read is on the way shares that read.
/// A read that fails isn't kept, nor an answer [keep] turns down, so the
/// next ask reads again. With [maxKeys], the oldest answers make room for
/// new ones.
class SiloKeptReads<K, T> {
  SiloKeptReads({
    required this.lifetime,
    this.keep,
    this.maxKeys,
    DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now;

  final Duration lifetime;

  /// Whether an answer is worth keeping. All are when null.
  final bool Function(T value)? keep;

  /// How many answers are kept at most, or no limit when null.
  final int? maxKeys;

  final DateTime Function() _clock;
  final _kept = <K, ({DateTime at, Future<T> value})>{};

  /// [key]'s kept answer, or a new one from [read]. [refresh] reads anew
  /// even when one is kept.
  Future<T> get(K key, Future<T> Function() read, {bool refresh = false}) {
    final now = _clock();
    final kept = _kept[key];
    if (!refresh && kept != null && now.difference(kept.at) < lifetime) {
      return kept.value;
    }
    final value = read();
    _kept
      ..remove(key)
      ..[key] = (at: now, value: value);
    final max = maxKeys;
    while (max != null && _kept.length > max) {
      _kept.remove(_kept.keys.first);
    }
    void drop() {
      if (identical(_kept[key]?.value, value)) _kept.remove(key);
    }

    value.then((v) {
      if (keep?.call(v) == false) drop();
    }, onError: (Object _) => drop());
    return value;
  }

  /// Forgets [key]'s answer, or every answer when [key] is null.
  void forget([K? key]) => key == null ? _kept.clear() : _kept.remove(key);
}
