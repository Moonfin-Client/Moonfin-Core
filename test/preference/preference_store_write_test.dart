import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Speed { slow, fast }

const _name = Preference(key: 'name', defaultValue: '');
const _enabled = Preference(key: 'enabled', defaultValue: false);
const _count = Preference(key: 'count', defaultValue: 0);
const _scale = Preference(key: 'scale', defaultValue: 1.0);
const _tags = Preference(key: 'tags', defaultValue: <String>[]);
const _speed = EnumPreference(
  key: 'speed',
  defaultValue: _Speed.slow,
  values: _Speed.values,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<String> writes;
  late PreferenceStore store;

  setUp(() async {
    writes = [];
    SharedPreferences.resetStatic();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/shared_preferences'),
          (call) async {
            if (call.method == 'getAll') {
              return <String, Object>{
                'flutter.name': 'Moonfin',
                'flutter.enabled': true,
                'flutter.count': 3,
                'flutter.scale': 1.5,
                'flutter.tags': <String>['a', 'b'],
                'flutter.speed': 'fast',
              };
            }
            writes.add('${call.method} ${(call.arguments as Map)['key']}');
            return true;
          },
        );
    store = PreferenceStore();
    await store.init();
  });

  test('writing back the values already stored sends nothing', () async {
    await store.set(_name, 'Moonfin');
    await store.set(_enabled, true);
    await store.set(_count, 3);
    await store.set(_scale, 1.5);
    await store.set(_tags, <String>['a', 'b']);
    await store.set(_speed, _Speed.fast);

    expect(writes, isEmpty);
  });

  test('a changed value is still written', () async {
    await store.set(_name, 'Jellyfin');
    await store.set(_enabled, false);
    await store.set(_tags, <String>['b', 'a']);
    await store.set(_speed, _Speed.slow);

    expect(writes, [
      'setString flutter.name',
      'setBool flutter.enabled',
      'setStringList flutter.tags',
      'setString flutter.speed',
    ]);
    expect(store.get(_name), 'Jellyfin');
    expect(store.get(_speed), _Speed.slow);
  });

  test('a missing key is written even when it holds the default', () async {
    const unset = Preference(key: 'unset', defaultValue: false);

    await store.set(unset, false);

    expect(writes, ['setBool flutter.unset']);
    expect(store.containsKey('unset'), isTrue);
  });
}
