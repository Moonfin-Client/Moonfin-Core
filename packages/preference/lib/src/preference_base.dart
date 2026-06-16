class Preference<T> {
  final String key;
  final T defaultValue;

  const Preference({required this.key, required this.defaultValue});

  /// Returns a copy of this preference pointing at [newKey], preserving the
  /// runtime type so the result can be used wherever the original
  /// `Preference<T>` is expected.
  Preference<T> withKey(String newKey) =>
      Preference<T>(key: newKey, defaultValue: defaultValue);
}
