import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/services/download_notification_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/preference/user_preferences.dart';

/// The command handlers never reach the collaborators the repository is built
/// from, so these stay empty on purpose.
class _FakeAuthStore extends Fake implements AuthenticationStore {}

class _FakeAuthPrefs extends Fake implements AuthenticationPreferences {}

class _FakeCredentialStore extends Fake implements CredentialStore {}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

class _FakeSocketHandler extends Fake implements SocketHandler {}

class _FakeServerRepository extends Fake implements ServerRepository {}

class _FakeUserRepository extends Fake implements UserRepository {}

class _FakePluginSyncService extends Fake implements PluginSyncService {}

class _FakeNotifications extends Fake implements DownloadNotificationService {
  final List<String> messages = [];

  @override
  Future<bool> showRemoteMessage({required String text, String? header}) async {
    messages.add(text);
    return true;
  }
}

/// Records what the remote command asked playback to do.
class _RecordingManager extends Fake implements PlaybackManager {
  final List<String> calls = [];
  final List<Duration> seeks = [];

  double trackedVolume = 100;
  bool trackedMuted = false;

  @override
  final PlayerState state = PlayerState();

  @override
  PlayerBackend? get backend => null;

  @override
  double get volume => trackedVolume;

  @override
  void reportVolumeState({required double volume, required bool isMuted}) {
    trackedVolume = volume.clamp(0, 100).toDouble();
    trackedMuted = isMuted;
  }

  @override
  Future<void> pause() async => calls.add('pause');

  @override
  Future<void> resume() async => calls.add('resume');

  @override
  Future<void> next() async => calls.add('next');

  @override
  Future<void> previous() async => calls.add('previous');

  @override
  Future<void> stop({bool userInitiated = true}) async => calls.add('stop');

  @override
  Future<void> seekTo(Duration position) async {
    calls.add('seek');
    seeks.add(position);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingManager manager;
  late _FakeNotifications notifications;
  late SessionRepository repository;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();

    manager = _RecordingManager();
    notifications = _FakeNotifications();
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    GetIt.instance.registerSingleton<DownloadNotificationService>(
      notifications,
    );

    repository = SessionRepository(
      _FakeAuthStore(),
      _FakeAuthPrefs(),
      _FakeCredentialStore(),
      _FakeClientFactory(),
      _FakeSocketHandler(),
      _FakeServerRepository(),
      _FakeUserRepository(),
      _FakePluginSyncService(),
    );
  });

  tearDown(() => GetIt.instance.reset());

  Future<void> send(String command, {int? seekTicks}) =>
      repository.handleRemoteCommandForTest(
        PlaystateMessage(command: command, seekPositionTicks: seekTicks),
      );

  Future<void> sendGeneral(String name, {Map<String, String> args = const {}}) =>
      repository.handleRemoteCommandForTest(
        GeneralCommandMessage(name: name, arguments: args),
      );

  group('play and pause', () {
    test('PlayPause pauses what is playing', () async {
      manager.state.setPlaying(true);
      await send('PlayPause');
      expect(manager.calls, ['pause']);
    });

    test('PlayPause resumes what is paused', () async {
      manager.state.setPlaying(false);
      await send('PlayPause');
      expect(manager.calls, ['resume']);
    });

    test('the discrete Pause and Unpause still work', () async {
      await send('Pause');
      await send('Unpause');
      expect(manager.calls, ['pause', 'resume']);
    });
  });

  group('relative skips', () {
    test('Rewind goes back the configured skip length', () async {
      manager.state.setPosition(const Duration(seconds: 60));
      manager.state.setDuration(const Duration(minutes: 30));

      await send('Rewind');

      // The shipped default for skipBackLength is 10 seconds.
      expect(manager.seeks, [const Duration(seconds: 50)]);
    });

    test('FastForward goes on the configured skip length', () async {
      manager.state.setPosition(const Duration(seconds: 60));
      manager.state.setDuration(const Duration(minutes: 30));

      await send('FastForward');

      // The shipped default for skipForwardLength is 30 seconds.
      expect(manager.seeks, [const Duration(seconds: 90)]);
    });

    test('a rewind past the start lands on the start', () async {
      manager.state.setPosition(const Duration(seconds: 3));
      manager.state.setDuration(const Duration(minutes: 30));

      await send('Rewind');

      expect(manager.seeks, [Duration.zero]);
    });

    test('a skip past the end lands on the end', () async {
      manager.state.setPosition(const Duration(seconds: 50));
      manager.state.setDuration(const Duration(seconds: 60));

      await send('FastForward');

      expect(manager.seeks, [const Duration(seconds: 60)]);
    });

    test(
      "an unknown duration doesn't drag the skip back to the start",
      () async {
        manager.state.setPosition(const Duration(seconds: 50));
        manager.state.setDuration(Duration.zero);

        await send('FastForward');

        expect(manager.seeks, [const Duration(seconds: 80)]);
      },
    );
  });

  test('the command name is matched whatever its casing', () async {
    await send('playpause');
    await send('PLAYPAUSE');
    expect(manager.calls, ['resume', 'resume']);
  });

  group('stepped volume', () {
    test('VolumeUp steps up from what the device last reported', () async {
      manager.reportVolumeState(volume: 40, isMuted: false);

      await sendGeneral('VolumeUp');

      expect(manager.trackedVolume, 50);
    });

    test('VolumeDown steps down from what the device last reported', () async {
      manager.reportVolumeState(volume: 40, isMuted: false);

      await sendGeneral('VolumeDown');

      expect(manager.trackedVolume, 30);
    });

    test('a step up stops at full', () async {
      manager.reportVolumeState(volume: 95, isMuted: false);

      await sendGeneral('VolumeUp');

      expect(manager.trackedVolume, 100);
    });

    test('a step down stops at silence and reads as muted', () async {
      manager.reportVolumeState(volume: 5, isMuted: false);

      await sendGeneral('VolumeDown');

      expect(manager.trackedVolume, 0);
      expect(manager.trackedMuted, isTrue);
    });

    test('SetVolume takes the level it was given', () async {
      await sendGeneral('SetVolume', args: {'Volume': '25'});

      expect(manager.trackedVolume, 25);
    });
  });

  test('a message from another client is shown', () async {
    await sendGeneral('DisplayMessage', args: {'Text': 'dinner is ready'});

    expect(notifications.messages, ['dinner is ready']);
  });

  test("an empty message isn't shown at all", () async {
    await sendGeneral('DisplayMessage', args: {'Text': '   '});

    expect(notifications.messages, isEmpty);
  });

  // The control surfaces sent names the receiver had no case for, so every
  // button but Stop did nothing. Every name either surface sends has to reach
  // playback.
  group('every playstate command the control UIs send is handled', () {
    const sentByControlSurfaces = [
      'PreviousTrack',
      'Rewind',
      'PlayPause',
      'FastForward',
      'NextTrack',
      'Stop',
      'Seek',
    ];

    for (final command in sentByControlSurfaces) {
      test(command, () async {
        await send(command, seekTicks: 300000000);
        expect(
          manager.calls,
          isNotEmpty,
          reason: '$command reached no playback call',
        );
      });
    }
  });
}
