import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' show AppLifecycleState;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/tv_channels_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:server_core/server_core.dart' show MediaServerClient;
import 'package:shared_preferences/shared_preferences.dart';

/// Every row request fails, so each build comes back with the same five empty
/// channels.
class _Client extends Fake implements MediaServerClient {
  @override
  String get baseUrl => 'http://server';
}

const _channel = MethodChannel('org.moonfin.androidtv/watch_next');

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  final service = TvChannelsService();
  var publishes = 0;
  Completer<void>? holdPublish;

  void moveTo(List<AppLifecycleState> states) {
    for (final state in states) {
      binding.handleAppLifecycleStateChanged(state);
    }
  }

  void hide() => moveTo([AppLifecycleState.inactive, AppLifecycleState.hidden]);

  void show() =>
      moveTo([AppLifecycleState.inactive, AppLifecycleState.resumed]);

  setUp(() async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    SharedPreferences.setMockInitialValues({});
    PackageInfo.setMockInitialValues(
      appName: 'Moonfin',
      packageName: 'org.moonfin.androidtv',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
    final store = PreferenceStore();
    await store.init();
    GetIt.instance
      ..registerSingleton<UserPreferences>(UserPreferences(store))
      ..registerSingleton<MediaServerClient>(_Client());
    binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, (
      call,
    ) async {
      if (call.method == 'publishChannels') {
        publishes++;
        await holdPublish?.future;
      }
      return null;
    });
    service.clear();
  });

  tearDown(() async {
    binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, null);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    debugDefaultTargetPlatformOverride = null;
    await GetIt.instance.reset();
    publishes = 0;
    holdPublish = null;
  });

  test('a Home refresh waits for the app to be hidden', () async {
    service.update();
    await pumpEventQueue();
    expect(publishes, 0);

    hide();
    addTearDown(show);
    await pumpEventQueue();
    expect(publishes, 1);
  });

  test(
    'a refresh that lands after the app was hidden publishes at once',
    () async {
      hide();
      addTearDown(show);

      service.update();
      await pumpEventQueue();
      expect(publishes, 1);
    },
  );

  test(
    'a sign-out during a publish leaves the next sign-in to publish',
    () async {
      holdPublish = Completer<void>();
      unawaited(service.publish());
      await pumpEventQueue();
      expect(publishes, 1);

      service.clear();
      holdPublish!.complete();
      await pumpEventQueue();

      unawaited(service.publish());
      await pumpEventQueue();
      expect(publishes, 2);
    },
  );
}
