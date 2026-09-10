import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/auto_download_service.dart';
import 'package:moonfin/background/auto_download_background.dart';
import 'package:moonfin/platform/auto_download_background_binding.dart';
import 'package:moonfin/platform/background_refresh.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../offline/auto_download_test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel(BackgroundRefresh.channelName);
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  late OfflineDatabase db;
  late OfflineRepository repo;
  late UserPreferences prefs;
  late FakeDownloader downloader;
  late AutoDownloadService service;
  late List<MethodCall> nativeCalls;
  late AutoDownloadBackgroundBinding binding;

  Future<void> subscribe(String seriesId) => repo.upsertSubscription(
    AutoDownloadSubscriptionsCompanion(
      seriesId: Value(seriesId),
      serverId: const Value(server),
      userId: const Value(user),
      seriesName: Value('Series $seriesId'),
      qualityPreset: const Value('original'),
      createdAt: Value(followedAt),
    ),
  );

  List<bool> configuredValues() => [
    for (final call in nativeCalls)
      if (call.method == 'configure')
        (call.arguments as Map)['enabled'] as bool,
  ];

  List<bool> configuredWifiOnly() => [
    for (final call in nativeCalls)
      if (call.method == 'configure')
        (call.arguments as Map)['wifiOnly'] as bool,
  ];

  Future<void> settle() =>
      Future<void>.delayed(const Duration(milliseconds: 20));

  setUp(() async {
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    repo = OfflineRepository(db);
    downloader = FakeDownloader();
    service = AutoDownloadService(
      repository: repo,
      downloader: downloader,
      prefs: prefs,
      serverId: server,
      userId: user,
    );
    nativeCalls = [];
    messenger.setMockMethodCallHandler(channel, (call) async {
      nativeCalls.add(call);
      return null;
    });
    binding = AutoDownloadBackgroundBinding(
      service: service,
      prefs: prefs,
      refresh: BackgroundRefresh(channel: channel),
    );
  });

  tearDown(() async {
    binding.detach();
    service.dispose();
    messenger.setMockMethodCallHandler(channel, null);
    await db.close();
    await GetIt.instance.reset();
  });

  test('schedules only while a series is followed', () async {
    binding.attach();
    await settle();
    expect(configuredValues(), [false]);

    await subscribe('series-1');
    await settle();
    expect(configuredValues(), [false, true]);

    await service.unsubscribe('series-1');
    await settle();
    expect(configuredValues(), [false, true, false]);
  });

  test('the background refresh and master switches turn it off', () async {
    await subscribe('series-1');
    binding.attach();
    await settle();
    expect(configuredValues(), [true]);

    await prefs.set(UserPreferences.autoDownloadBackgroundRefresh, false);
    await settle();
    expect(configuredValues(), [true, false]);

    await prefs.set(UserPreferences.autoDownloadBackgroundRefresh, true);
    await settle();
    await prefs.set(UserPreferences.autoDownloadEnabled, false);
    await settle();
    expect(configuredValues(), [true, false, true, false]);
  });

  test('a Wi-Fi-only change re-configures the task', () async {
    await subscribe('series-1');
    binding.attach();
    await settle();
    expect(configuredWifiOnly(), [false]);

    await prefs.set(UserPreferences.downloadWifiOnly, true);
    await settle();
    expect(configuredValues(), [true, true]);
    expect(configuredWifiOnly(), [false, true]);
  });

  test('detach stops reacting', () async {
    binding.attach();
    await settle();
    binding.detach();
    await subscribe('series-1');
    await settle();
    expect(configuredValues(), [false]);
  });

  test('detach with disable cancels the task', () async {
    await subscribe('series-1');
    binding.attach();
    await settle();
    expect(configuredValues(), [true]);

    binding.detach(disable: true);
    await settle();
    expect(configuredValues(), [true, false]);

    binding.attach();
    await settle();
    binding.detach(disable: true);
    await settle();
    // Re-attaching schedules it again; the second disable cancels again.
    expect(configuredValues(), [true, false, true, false]);
  });

  group('runAutoDownloadBackgroundRefresh', () {
    test('counts no session as a finished run, not a failure', () async {
      expect(
        await runAutoDownloadBackgroundRefresh(const Duration(seconds: 20)),
        isTrue,
      );
    });

    test(
      'runs a budgeted background check on the registered service',
      () async {
        GetIt.instance.registerSingleton<AutoDownloadService>(service);
        await subscribe('series-1');
        downloader.episodesBySeries['series-1'] = [episode('e1')];

        final ok = await runAutoDownloadBackgroundRefresh(
          const Duration(seconds: 20),
        );

        expect(ok, isTrue);
        expect(downloader.queuedIds, ['e1']);
        expect(service.lastRun!.trigger, AutoDownloadTrigger.backgroundRefresh);
      },
    );

    test('reports failure when the check hit an error', () async {
      GetIt.instance.registerSingleton<AutoDownloadService>(service);
      await subscribe('series-1');
      downloader.failSeries.add('series-1');

      expect(
        await runAutoDownloadBackgroundRefresh(const Duration(seconds: 20)),
        isFalse,
      );
    });
  });
}
