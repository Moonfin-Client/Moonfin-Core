import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/syncplay/syncplay_manager.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

class _MockPlaybackManager extends Mock implements PlaybackManager {}

class _MockUserPreferences extends Mock implements UserPreferences {}

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _FakeUsersApi extends Fake implements AdminUsersApi {
  List<ServerUser> users = const [];
  Object? error;
  Completer<void>? gate;
  int calls = 0;

  @override
  Future<List<ServerUser>> getUsers({bool? isDisabled, bool? isHidden}) async {
    calls++;
    await gate?.future;
    final failure = error;
    if (failure != null) throw failure;
    return users;
  }
}

class _FakeImageApi extends Fake implements ImageApi {
  @override
  String getUserImageUrl(String userId) =>
      'http://jf/Users/$userId/Images/Primary';
}

MediaServerClient _client(String baseUrl, AdminUsersApi users) {
  final client = _MockMediaServerClient();
  when(() => client.baseUrl).thenReturn(baseUrl);
  when(() => client.adminUsersApi).thenReturn(users);
  when(() => client.imageApi).thenReturn(_FakeImageApi());
  return client;
}

void main() {
  late SyncPlayManager manager;
  late _FakeUsersApi users;

  setUp(() {
    manager = SyncPlayManager(_MockPlaybackManager(), _MockUserPreferences());
    users = _FakeUsersApi()
      ..users = const [
        ServerUser(id: 'u1', name: 'Mittens', primaryImageTag: 'tag1'),
        ServerUser(id: 'u2', name: 'Beep'),
      ];
    manager.setActiveClient(_client('http://jf', users));
  });

  /// Lets the background user-list fetch finish.
  Future<void> settle() => Future<void>.delayed(Duration.zero);

  test('loads the user list once and returns the avatar by name', () async {
    var notified = 0;
    manager.addListener(() => notified++);

    expect(manager.participantImageUrlFor('Mittens'), isNull);
    expect(manager.participantImageUrlFor('Beep'), isNull);
    await settle();

    expect(users.calls, 1);
    expect(notified, 1);
    final url = Uri.parse(manager.participantImageUrlFor('mittens ')!);
    expect(url.path, '/Users/u1/Images/Primary');
    expect(url.queryParameters['tag'], 'tag1');
    expect(url.queryParameters['width'], '96');
  });

  test('a user with no picture or no account gets no avatar', () async {
    manager.participantImageUrlFor('Beep');
    await settle();

    expect(manager.participantImageUrlFor('Beep'), isNull);
    expect(manager.participantImageUrlFor('Someone else'), isNull);
    expect(users.calls, 1);
  });

  test('a failed fetch leaves initials and waits before retrying', () async {
    var now = DateTime(2026, 1, 1, 12);
    manager.usersClock = () => now;
    users.error = Exception('forbidden');
    expect(manager.participantImageUrlFor('Mittens'), isNull);
    await settle();

    // Rebuilds right after the failure don't ask the server again.
    for (var i = 0; i < 5; i++) {
      expect(manager.participantImageUrlFor('Mittens'), isNull);
      await settle();
    }
    expect(users.calls, 1);

    users.error = null;
    now = now.add(SyncPlayManager.usersRetryDelay);
    manager.participantImageUrlFor('Mittens');
    await settle();
    expect(users.calls, 2);
    expect(manager.participantImageUrlFor('Mittens'), isNotNull);
  });

  test('switching servers drops the cached users', () async {
    manager.participantImageUrlFor('Mittens');
    await settle();
    expect(manager.participantImageUrlFor('Mittens'), isNotNull);

    final other = _FakeUsersApi()..users = const [];
    manager.setActiveClient(_client('http://other', other));

    expect(manager.participantImageUrlFor('Mittens'), isNull);
    await settle();
    expect(other.calls, 1);
    expect(manager.participantImageUrlFor('Mittens'), isNull);
  });

  test('a list that lands after a server switch is dropped', () async {
    users.gate = Completer<void>();
    manager.participantImageUrlFor('Mittens');

    final other = _FakeUsersApi()..users = const [];
    manager.setActiveClient(_client('http://other', other));
    expect(manager.participantImageUrlFor('Mittens'), isNull);
    await settle();
    expect(other.calls, 1);

    users.gate!.complete();
    await settle();
    expect(manager.participantImageUrlFor('Mittens'), isNull);
  });
}
