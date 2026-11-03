import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/user.dart';

final _lastUsed = DateTime.utc(2026, 10, 13, 12);

PrivateUser _user({String? siloAccountId}) => PrivateUser(
  id: 'u1',
  name: 'Brady',
  serverId: 's1',
  accessToken: 'tok',
  lastUsed: _lastUsed,
  isAdministrator: true,
  siloAccountId: siloAccountId,
);

void main() {
  test('a Silo user round-trips its account id', () {
    final user = _user(siloAccountId: '9');

    final json = user.toJson();
    final back = PrivateUser.fromJson('u1', 's1', json);

    expect(json['siloAccountId'], '9');
    expect(back.siloAccountId, '9');
    expect(back.isSiloProfile, isTrue);
    expect(back.isAdministrator, isTrue);
  });

  test('a Jellyfin or Emby user is stored exactly as before', () {
    final json = _user().toJson();

    expect(json.containsKey('siloAccountId'), isFalse);
    expect(json.keys.toSet(), {
      'name',
      'accessToken',
      'lastUsed',
      'imageTag',
      'isAdministrator',
      'canDownload',
      'canManageSubtitles',
      'canManageCollections',
      'canManageLiveTv',
    });
    expect(_user().isSiloProfile, isFalse);
  });

  test('entries saved by an older build still load', () {
    final stored = jsonDecode(
      '{"name":"Brady","accessToken":"tok",'
      '"lastUsed":"2026-10-01T10:00:00.000Z","imageTag":null,'
      '"isAdministrator":false,"canDownload":true,'
      '"canManageSubtitles":false,"canManageCollections":true}',
    ) as Map<String, dynamic>;

    final user = PrivateUser.fromJson('u1', 's1', stored);

    expect(user.siloAccountId, isNull);
    expect(user.isSiloProfile, isFalse);
    expect(user.canDownload, isTrue);
  });

  test('an empty or wrongly typed account id reads as none', () {
    for (final bad in ['', 9, true]) {
      final json = {..._user().toJson(), 'siloAccountId': bad};
      expect(
        PrivateUser.fromJson('u1', 's1', json).siloAccountId,
        isNull,
        reason: '$bad',
      );
    }
  });

  test('copyWith keeps the account id', () {
    final user = _user(siloAccountId: '9');

    expect(user.copyWith(isAdministrator: false).siloAccountId, '9');
    expect(user.copyWith(siloAccountId: '10').siloAccountId, '10');
  });

  test('a PIN-locked profile round-trips and others write nothing', () {
    final locked = _user(siloAccountId: '9').copyWith(siloHasPin: true);

    final json = locked.toJson();
    expect(json['siloHasPin'], isTrue);
    expect(PrivateUser.fromJson('u1', 's1', json).siloHasPin, isTrue);
    expect(
      _user(siloAccountId: '9').toJson().containsKey('siloHasPin'),
      isFalse,
    );
    expect(
      PrivateUser.fromJson('u1', 's1', _user().toJson()).siloHasPin,
      isFalse,
    );
    expect(locked.copyWith(name: 'x').siloHasPin, isTrue);
  });
}
