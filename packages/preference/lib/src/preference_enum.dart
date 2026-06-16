import 'preference_base.dart';

class EnumPreference<T extends Enum> extends Preference<T> {
  final List<T> values;

  const EnumPreference({
    required super.key,
    required super.defaultValue,
    required this.values,
  });

  @override
  EnumPreference<T> withKey(String newKey) => EnumPreference<T>(
    key: newKey,
    defaultValue: defaultValue,
    values: values,
  );
}
