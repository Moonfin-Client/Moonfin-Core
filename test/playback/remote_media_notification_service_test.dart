import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/cast/cast_service.dart';
import 'package:moonfin/data/services/cast/cast_target.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/playback/remote_media_notification_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeSocketHandler extends Fake implements SocketHandler {
  final eventsController = StreamController<ServerWebSocketMessage>.broadcast();
  final connectionsController = StreamController<void>.broadcast();
  final subscriptions = <String>[];
  final unsubscriptions = <String>[];

  @override
  Stream<ServerWebSocketMessage> get events => eventsController.stream;

  @override
  Stream<void> get connections => connectionsController.stream;

  @override
  void subscribe(String messageType) => subscriptions.add(messageType);

  @override
  void unsubscribe(String messageType) => unsubscriptions.add(messageType);

  Future<void> close() async {
    await eventsController.close();
    await connectionsController.close();
  }
}

class _FakeCastService extends Fake implements CastService {
  @override
  final ValueNotifier<CastTargetKind?> activeKindNotifier = ValueNotifier(null);

  @override
  final ValueNotifier<CastTarget?> activeTargetNotifier = ValueNotifier(null);

  @override
  final ValueNotifier<AggregatedItem?> castItemNotifier = ValueNotifier(null);

  @override
  final ValueNotifier<String?> remoteStateNotifier = ValueNotifier(null);

  @override
  final ValueNotifier<int> remotePositionNotifier = ValueNotifier(0);

  @override
  final ValueNotifier<double?> remoteVolumeNotifier = ValueNotifier(null);

  final calls = <String>[];

  @override
  Future<void> play(CastTargetKind kind) async => calls.add('play:${kind.name}');

  @override
  Future<void> pause(CastTargetKind kind) async =>
      calls.add('pause:${kind.name}');

  @override
  Future<void> stop(CastTargetKind kind) async => calls.add('stop:${kind.name}');

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async =>
      calls.add('seek:${kind.name}:$positionTicks');

  @override
  Future<void> setVolume(CastTargetKind kind, {required double volume}) async =>
      calls.add('setVolume:${kind.name}:${volume.toStringAsFixed(2)}');
}

class _FakeSessionApi extends Fake implements SessionApi {
  List<Map<String, dynamic>> sessionsResponse = [];
  Future<List<Map<String, dynamic>>> Function()? onGetSessions;
  Future<void> Function()? onSendPlayStateCommand;
  final commands = <String>[];

  @override
  Future<List<Map<String, dynamic>>> getSessions({
    String? controllableByUserId,
    String? deviceId,
    int? activeWithinSeconds,
  }) async => onGetSessions != null ? onGetSessions!() : sessionsResponse;

  @override
  Future<void> sendPlayStateCommand(
    String sessionId,
    String command, {
    int? seekPositionTicks,
    String? controllingUserId,
  }) async {
    commands.add(
      seekPositionTicks != null
          ? 'playstate:$sessionId:$command:$seekPositionTicks'
          : 'playstate:$sessionId:$command',
    );
    if (onSendPlayStateCommand != null) {
      await onSendPlayStateCommand!();
    }
  }

  @override
  Future<void> sendGeneralCommand(
    String sessionId,
    String command, {
    Map<String, dynamic>? arguments,
  }) async {
    commands.add(
      arguments != null
          ? 'general:$sessionId:$command:$arguments'
          : 'general:$sessionId:$command',
    );
  }
}

class _FakeImageApi extends Fake implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'https://server.test/Items/$itemId/Images/Primary?maxHeight=${maxHeight ?? 0}';
}

class _FakeDeviceInfo extends Fake implements DeviceInfo {
  @override
  String get id => 'phone-device';
}

class _FakeClient extends Fake implements MediaServerClient {
  _FakeClient(this._sessionApi);

  final _FakeSessionApi _sessionApi;
  final _imageApi = _FakeImageApi();
  final _deviceInfo = _FakeDeviceInfo();

  @override
  String? get userId => 'user-1';

  @override
  String? get accessToken => 'token-123';

  @override
  DeviceInfo get deviceInfo => _deviceInfo;

  @override
  SessionApi get sessionApi => _sessionApi;

  @override
  ImageApi get imageApi => _imageApi;
}

Map<String, dynamic> _tvSession({
  String id = 'sess-tv',
  String deviceId = 'shield-tv',
  String deviceName = 'SHIELD',
  String userId = 'user-1',
  String itemId = 'ep-1',
  String itemName = 'The Beast in the Jungle',
  bool supportsRemoteControl = true,
  bool isPaused = false,
  int positionSeconds = 120,
  int durationSeconds = 3000,
  List<String> supportedCommands = const ['SetVolume', 'VolumeUp', 'VolumeDown'],
  int? volumeLevel = 40,
}) {
  return {
    'Id': id,
    'DeviceId': deviceId,
    'DeviceName': deviceName,
    'UserId': userId,
    'SupportsRemoteControl': supportsRemoteControl,
    'SupportedCommands': supportedCommands,
    'PlayState': {
      'IsPaused': isPaused,
      'IsBuffering': false,
      'PositionTicks': positionSeconds * 10000000,
      'CanSeek': true,
      'VolumeLevel': ?volumeLevel,
    },
    'NowPlayingItem': {
      'Id': itemId,
      'Name': itemName,
      'Type': 'Episode',
      'SeriesName': 'The Haunting of Bly Manor',
      'ParentIndexNumber': 1,
      'IndexNumber': 9,
      'RunTimeTicks': durationSeconds * 10000000,
    },
  };
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeSocketHandler socket;
  late _FakeCastService castService;
  late _FakeSessionApi sessionApi;
  late _FakeClient client;
  late UserPreferences prefs;
  late RemoteMediaNotificationService service;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    socket = _FakeSocketHandler();
    castService = _FakeCastService();
    sessionApi = _FakeSessionApi();
    client = _FakeClient(sessionApi);
    service = RemoteMediaNotificationService(
      socketHandler: socket,
      castService: castService,
      prefs: prefs,
      activeClient: () => client,
      enabledOnPlatform: true,
    );
  });

  tearDown(() async {
    service.dispose();
    await socket.close();
  });

  test('is off by default until user opts in', () async {
    expect(prefs.get(UserPreferences.remoteMediaNotification), isFalse);

    service.start();
    expect(socket.subscriptions, isEmpty);

    socket.eventsController.add(SessionsMessage([_tvSession()]));
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession, isNull);
    expect(service.keepsSocketAlive, isFalse);

    await prefs.set(UserPreferences.remoteMediaNotification, true);
    await Future<void>.delayed(Duration.zero);
    expect(socket.subscriptions, contains('Sessions'));
  });

  test('subscribes to Sessions and mirrors playing TV session', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    expect(socket.subscriptions, contains('Sessions'));

    socket.eventsController.add(
      SessionsMessage([
        // Self device must be excluded.
        _tvSession(id: 'sess-self', deviceId: 'phone-device', deviceName: 'Pixel'),
        // Other user must be excluded.
        _tvSession(id: 'sess-other-user', userId: 'user-2', deviceName: 'Kitchen'),
        // Paused session should lose to actively playing session.
        _tvSession(
          id: 'sess-paused',
          deviceId: 'bedroom-tv',
          deviceName: 'Bedroom',
          isPaused: true,
        ),
        _tvSession(),
      ]),
    );
    await Future<void>.delayed(Duration.zero);

    final active = service.activeSession;
    expect(active, isNotNull);
    expect(active!.sessionId, 'sess-tv');
    expect(active.jellyfinSessionId, 'sess-tv');
    expect(active.deviceName, 'SHIELD');
    expect(active.title, 'The Beast in the Jungle');
    expect(active.subtitle, 'The Haunting of Bly Manor • S1E9');
    expect(active.activityLabel, 'Watching on Moonfin');
    expect(active.isPlaying, isTrue);
    expect(active.position, const Duration(seconds: 120));
    expect(active.duration, const Duration(seconds: 3000));
    expect(active.supportsSetVolume, isTrue);
    expect(active.volumePercent, 40);
    expect(
      active.artUrl,
      'https://server.test/Items/ep-1/Images/Primary?maxHeight=300',
    );
    expect(service.keepsSocketAlive, isTrue);
  });

  test('toggling preference off clears active session and unsubscribes', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    socket.eventsController.add(SessionsMessage([_tvSession()]));
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession, isNotNull);

    await prefs.set(UserPreferences.remoteMediaNotification, false);
    await Future<void>.delayed(Duration.zero);

    expect(service.activeSession, isNull);
    expect(service.keepsSocketAlive, isFalse);
    expect(socket.unsubscriptions, contains('Sessions'));
  });

  test('dismissCurrent stays dismissed until item changes or paused session resumes', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    socket.eventsController.add(SessionsMessage([_tvSession(isPaused: true)]));
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession, isNotNull);
    expect(service.keepsSocketAlive, isTrue);

    service.dismissCurrent();
    expect(service.activeSession, isNull);
    expect(service.keepsSocketAlive, isFalse);
    expect(sessionApi.commands, isEmpty);

    // Same paused item does not re-appear.
    socket.eventsController.add(SessionsMessage([_tvSession(isPaused: true)]));
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession, isNull);

    // Resuming the paused item re-shows it.
    socket.eventsController.add(SessionsMessage([_tvSession(isPaused: false)]));
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession, isNotNull);

    // Dismiss while playing stays dismissed for the same item, then returns on next item.
    service.dismissCurrent();
    expect(service.activeSession, isNull);
    socket.eventsController.add(
      SessionsMessage([_tvSession(itemId: 'ep-1', isPaused: false)]),
    );
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession, isNull);

    socket.eventsController.add(
      SessionsMessage([
        _tvSession(itemId: 'ep-2', itemName: 'The Altar of the Dead'),
      ]),
    );
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession?.itemId, 'ep-2');
  });

  test('transport and volume commands delegate to Jellyfin SessionApi', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    socket.eventsController.add(
      SessionsMessage([_tvSession(positionSeconds: 100, durationSeconds: 500)]),
    );
    await Future<void>.delayed(Duration.zero);

    await service.pause();
    expect(service.activeSession?.isPlaying, isFalse);
    await service.play();
    expect(service.activeSession?.isPlaying, isTrue);
    await service.fastForward(const Duration(seconds: 30));
    await service.rewind(const Duration(seconds: 10));
    await service.seek(const Duration(seconds: 250));
    await service.skipToNext();
    await service.skipToPrevious();
    await service.setVolume(65);
    await service.adjustVolume(1);
    await service.stop();

    expect(service.activeSession, isNull);
    expect(sessionApi.commands, [
      'playstate:sess-tv:Pause',
      'playstate:sess-tv:Unpause',
      'playstate:sess-tv:Seek:1300000000',
      'playstate:sess-tv:Seek:1200000000',
      'playstate:sess-tv:Seek:2500000000',
      'playstate:sess-tv:NextTrack',
      'playstate:sess-tv:PreviousTrack',
      'general:sess-tv:SetVolume:{Volume: 65}',
      'general:sess-tv:VolumeUp',
      'playstate:sess-tv:Stop',
    ]);
  });

  test('CastService target takes precedence and handles transport actions', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    castService.activeKindNotifier.value = CastTargetKind.googleCast;
    castService.activeTargetNotifier.value = const CastTarget(
      id: 'cc-living-room',
      title: 'Living Room TV',
      kind: CastTargetKind.googleCast,
    );
    castService.castItemNotifier.value = const AggregatedItem(
      id: 'movie-1',
      serverId: 'server-1',
      rawData: {
        'Id': 'movie-1',
        'Name': 'Inception',
        'Type': 'Movie',
        'ProductionYear': 2010,
        'RunTimeTicks': 88800000000,
      },
    );
    castService.remoteStateNotifier.value = 'playing';
    castService.remotePositionNotifier.value = 600000000;
    castService.remoteVolumeNotifier.value = 0.5;
    await Future<void>.delayed(Duration.zero);

    final active = service.activeSession;
    expect(active, isNotNull);
    expect(active!.isCastBacked, isTrue);
    expect(active.deviceName, 'Living Room TV');
    expect(active.title, 'Inception');
    expect(active.subtitle, '2010');
    expect(active.activityLabel, 'Watching on Moonfin');
    expect(active.position, const Duration(seconds: 60));
    expect(active.volumePercent, 50);

    await service.pause();
    await service.seek(const Duration(seconds: 90));
    await service.setVolume(75);
    await service.stop();

    expect(castService.calls, [
      'pause:googleCast',
      'seek:googleCast:900000000',
      'setVolume:googleCast:0.75',
      'stop:googleCast',
    ]);
  });

  test('audio remote sessions use Listening on Moonfin without device name', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    socket.eventsController.add(
      SessionsMessage([
        {
          'Id': 'sess-audio',
          'DeviceId': 'shield-tv',
          'DeviceName': 'FRIGHT Windows 11 Pro',
          'UserId': 'user-1',
          'SupportsMediaControl': true,
          'PlayState': {
            'IsPaused': false,
            'IsBuffering': false,
            'PositionTicks': 150000000,
          },
          'NowPlayingItem': {
            'Id': 'track-1',
            'Name': 'Midnight City',
            'Type': 'Audio',
            'Artists': ['M83'],
            'Album': "Hurry Up, We're Dreaming",
            'RunTimeTicks': 2400000000,
          },
        },
      ]),
    );
    await Future<void>.delayed(Duration.zero);

    final active = service.activeSession;
    expect(active, isNotNull);
    expect(active!.title, 'Midnight City');
    expect(active.subtitle, "M83 • Hurry Up, We're Dreaming");
    expect(active.activityLabel, 'Listening on Moonfin');
  });

  test('ignores late getSessions results after clearSessions or client switch', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    final oldCompleter = Completer<List<Map<String, dynamic>>>();
    final newApi = _FakeSessionApi()
      ..sessionsResponse = [_tvSession(id: 'sess-new', itemId: 'ep-new')];
    final newClient = _FakeClient(newApi);
    var activeClient = client;

    final switchable = RemoteMediaNotificationService(
      socketHandler: socket,
      castService: castService,
      prefs: prefs,
      activeClient: () => activeClient,
      enabledOnPlatform: true,
    );
    addTearDown(switchable.dispose);

    sessionApi.onGetSessions = () => oldCompleter.future;
    final oldRefresh = switchable.refreshSessions();

    // Switch client while old getSessions is still in flight; new client must not be blocked.
    activeClient = newClient;
    switchable.clearSessions();
    await switchable.refreshSessions();
    expect(switchable.activeSession?.sessionId, 'sess-new');

    // Old request finishes late: must not overwrite new account's session.
    oldCompleter.complete([_tvSession(id: 'sess-old', itemId: 'ep-old')]);
    await oldRefresh;
    expect(switchable.activeSession?.sessionId, 'sess-new');
  });

  test('keepsSocketAlive stays true while a playing session is dismissed until it pauses or stops', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    socket.eventsController.add(SessionsMessage([_tvSession(isPaused: false)]));
    await Future<void>.delayed(Duration.zero);
    expect(service.keepsSocketAlive, isTrue);

    service.dismissCurrent();
    expect(service.activeSession, isNull);
    expect(service.keepsSocketAlive, isTrue);

    // Same item pauses while dismissed -> keepsSocketAlive drops to false.
    socket.eventsController.add(SessionsMessage([_tvSession(isPaused: true)]));
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession, isNull);
    expect(service.keepsSocketAlive, isFalse);

    // Next item appears -> notification returns and keepsSocketAlive is true again.
    socket.eventsController.add(
      SessionsMessage([_tvSession(itemId: 'ep-2', isPaused: false)]),
    );
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession?.itemId, 'ep-2');
    expect(service.keepsSocketAlive, isTrue);

    // Dismiss again, then session stops -> dismissed key resets so restarting ep-2 later shows it.
    service.dismissCurrent();
    socket.eventsController.add(const SessionEndedMessage(sessionId: 'sess-tv'));
    await Future<void>.delayed(Duration.zero);
    expect(service.keepsSocketAlive, isFalse);

    socket.eventsController.add(
      SessionsMessage([_tvSession(itemId: 'ep-2', isPaused: false)]),
    );
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession?.itemId, 'ep-2');

    // Disabling setting after dismissing clears dismissed state and drops keepsSocketAlive.
    service.dismissCurrent();
    expect(service.keepsSocketAlive, isTrue);
    await prefs.set(UserPreferences.remoteMediaNotification, false);
    await Future<void>.delayed(Duration.zero);
    expect(service.keepsSocketAlive, isFalse);

    // Re-enabling shows the active session cleanly instead of staying suppressed.
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession?.itemId, 'ep-2');
    expect(service.keepsSocketAlive, isTrue);
  });

  test('completed stop/pause does not modify a replacement session', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    socket.eventsController.add(
      SessionsMessage([_tvSession(id: 'sess-a', itemId: 'ep-a')]),
    );
    await Future<void>.delayed(Duration.zero);

    final commandCompleter = Completer<void>();
    sessionApi.onSendPlayStateCommand = () => commandCompleter.future;

    final stopFuture = service.stop();
    socket.eventsController.add(const SessionEndedMessage(sessionId: 'sess-a'));
    socket.eventsController.add(
      SessionsMessage([
        _tvSession(id: 'sess-b', deviceId: 'tv-b', itemId: 'ep-b', isPaused: false),
      ]),
    );
    await Future<void>.delayed(Duration.zero);
    expect(service.activeSession?.sessionId, 'sess-b');

    commandCompleter.complete();
    await stopFuture;
    expect(service.activeSession?.sessionId, 'sess-b');
    expect(service.activeSession?.isPlaying, isTrue);
  });

  test('adjustVolume falls back to SetVolume without step commands and ignores non-seekable seek', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    service.start();
    final session = _tvSession(
      supportedCommands: const ['SetVolume'],
      volumeLevel: 40,
    );
    (session['PlayState'] as Map<String, dynamic>)['CanSeek'] = false;
    socket.eventsController.add(SessionsMessage([session]));
    await Future<void>.delayed(Duration.zero);

    await service.seek(const Duration(seconds: 60));
    await service.fastForward(const Duration(seconds: 10));
    await service.rewind(const Duration(seconds: 10));
    await service.adjustVolume(1);

    expect(sessionApi.commands, ['general:sess-tv:SetVolume:{Volume: 45}']);
  });

  test('keepsSocketAlive bridges pauses up to pausedSocketGrace without resetting on heartbeats', () async {
    await prefs.set(UserPreferences.remoteMediaNotification, true);
    var fakeNow = DateTime(2026, 1, 1, 12, 0, 0);
    final clockedService = RemoteMediaNotificationService(
      socketHandler: socket,
      castService: castService,
      prefs: prefs,
      activeClient: () => client,
      enabledOnPlatform: true,
      now: () => fakeNow,
    );
    addTearDown(clockedService.dispose);

    clockedService.start();
    socket.eventsController.add(SessionsMessage([_tvSession(isPaused: false)]));
    await Future<void>.delayed(Duration.zero);
    expect(clockedService.keepsSocketAlive, isTrue);

    // Pausing enters the bounded socket grace window.
    socket.eventsController.add(SessionsMessage([_tvSession(isPaused: true)]));
    await Future<void>.delayed(Duration.zero);
    expect(clockedService.activeSession?.isPlaying, isFalse);
    expect(clockedService.keepsSocketAlive, isTrue);

    // Identical paused heartbeats 20 minutes later do not extend the deadline.
    fakeNow = fakeNow.add(const Duration(minutes: 20));
    socket.eventsController.add(SessionsMessage([_tvSession(isPaused: true)]));
    await Future<void>.delayed(Duration.zero);
    expect(clockedService.keepsSocketAlive, isTrue);

    // Seeking while paused does reset the grace window.
    fakeNow = fakeNow.add(const Duration(minutes: 5));
    socket.eventsController.add(
      SessionsMessage([_tvSession(isPaused: true, positionSeconds: 180)]),
    );
    await Future<void>.delayed(Duration.zero);
    expect(clockedService.keepsSocketAlive, isTrue);

    // 10 minutes after the seek (35 minutes since initial pause), still within
    // the reset 30-minute window.
    fakeNow = fakeNow.add(const Duration(minutes: 10));
    expect(clockedService.keepsSocketAlive, isTrue);

    // Past 30 minutes from the seek, keepsSocketAlive drops to false.
    fakeNow = fakeNow.add(const Duration(minutes: 21));
    expect(clockedService.keepsSocketAlive, isFalse);

    // Resuming immediately re-arms keepsSocketAlive.
    socket.eventsController.add(
      SessionsMessage([_tvSession(isPaused: false, positionSeconds: 181)]),
    );
    await Future<void>.delayed(Duration.zero);
    expect(clockedService.keepsSocketAlive, isTrue);
  });
}

