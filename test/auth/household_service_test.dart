import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/services/household_service.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

/// Answers the plugin's household endpoints and records each request.
class _PluginAdapter implements HttpClientAdapter {
  Map<String, dynamic> household = const {};
  Map<String, dynamic> sessions = const {'results': []};
  int householdStatus = 200;
  int sessionsStatus = 200;

  final requests = <String>[];
  final headers = <String, Map<String, dynamic>>{};
  Object? lastPost;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add('${options.method} ${options.uri.path}');
    headers[options.uri.path] = Map.of(options.headers);
    if (options.method == 'POST') lastPost = options.data;
    final path = options.uri.path;
    final status = path.endsWith('/Household/Sessions')
        ? sessionsStatus
        : householdStatus;
    if (status >= 400) {
      throw DioException(
        requestOptions: options,
        response: Response(requestOptions: options, statusCode: status),
      );
    }
    final body = path.endsWith('/Household/Sessions')
        ? jsonEncode(sessions)
        : jsonEncode(household);
    return ResponseBody.fromString(
      body,
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, dynamic> _member(
  String id, {
  String? name,
  bool isDisabled = false,
  bool signedInOnThisDevice = false,
  String? imageTag,
}) => {
  'id': id,
  'name': name ?? 'Name $id',
  'isDisabled': isDisabled,
  'signedInOnThisDevice': signedInOnThisDevice,
  'primaryImageTag': ?imageTag,
};

void main() {
  group('householdJoinNames', () {
    test('joins as a sentence with and before the last name', () {
      expect(householdJoinNames([]), '');
      expect(householdJoinNames(['baby']), 'baby');
      expect(householdJoinNames(['teen', 'toddler']), 'teen and toddler');
      expect(
        householdJoinNames(['teen', 'toddler', 'cousin']),
        'teen, toddler and cousin',
      );
    });

    test('drops blank names', () {
      expect(householdJoinNames(['', 'teen', ' ']), 'teen');
    });
  });

  group('HouseholdMember.fromJson', () {
    test('reads the plugin fields with tolerant defaults', () {
      final member = HouseholdMember.fromJson(
        Map<String, dynamic>.from(_member('u1', imageTag: 'tag')),
      );
      expect(member.id, 'u1');
      expect(member.name, 'Name u1');
      expect(member.imageTag, 'tag');
      expect(member.isDisabled, isFalse);
      expect(member.signedInOnThisDevice, isFalse);
    });

    test('reads a disabled member signed in on this device', () {
      final member = HouseholdMember.fromJson(
        Map<String, dynamic>.from(
          _member('u2', isDisabled: true, signedInOnThisDevice: true),
        ),
      );
      expect(member.isDisabled, isTrue);
      expect(member.signedInOnThisDevice, isTrue);
      expect(member.imageTag, isNull);
    });
  });

  group('HouseholdInfo.fromJson', () {
    test('parses the full read', () {
      final info = HouseholdInfo.fromJson(<String, dynamic>{
        'isManager': true,
        'sessionsSupported': true,
        'users': [_member('u1'), 'junk', _member('u2')],
      });
      expect(info.isManager, isTrue);
      expect(info.sessionsSupported, isTrue);
      expect(info.members.map((member) => member.id), ['u1', 'u2']);
    });

    test('answers non-managers with nothing to manage', () {
      final info = HouseholdInfo.fromJson(const {
        'isManager': false,
        'sessionsSupported': true,
      });
      expect(info.isManager, isFalse);
      expect(info.members, isEmpty);
    });
  });

  group('HouseholdSessionResult.fromJson', () {
    test('reads a minted sign in', () {
      final result = HouseholdSessionResult.fromJson(const {
        'userId': 'u1',
        'name': 'Baby',
        'success': true,
        'reused': false,
        'accessToken': 'token-1',
      });
      expect(result.userId, 'u1');
      expect(result.name, 'Baby');
      expect(result.success, isTrue);
      expect(result.reused, isFalse);
      expect(result.accessToken, 'token-1');
      expect(result.imageTag, isNull);
    });

    test('falls back to the nested user, which speaks PascalCase', () {
      final result = HouseholdSessionResult.fromJson(const {
        'userId': 'u2',
        'success': true,
        'reused': true,
        'accessToken': 'token-2',
        'user': {'Name': 'Teen', 'PrimaryImageTag': 'img-2'},
      });
      expect(result.name, 'Teen');
      expect(result.reused, isTrue);
      expect(result.imageTag, 'img-2');
    });

    test('a refusal carries no token and no name', () {
      final result = HouseholdSessionResult.fromJson(const {
        'userId': 'u3',
        'success': false,
        'errorCode': 'disabled_account',
      });
      expect(result.success, isFalse);
      expect(result.name, isNull);
      expect(result.accessToken, isNull);
    });
  });

  group('missingHouseholdMembers', () {
    final info = HouseholdInfo.fromJson(<String, dynamic>{
      'isManager': true,
      'sessionsSupported': true,
      'users': [
        _member('kept'),
        _member('disabled', isDisabled: true),
        _member('here', signedInOnThisDevice: true),
        _member('stored'),
      ],
    });

    test('keeps only what is enabled, missing on the server and unstored',
        () {
      expect(
        missingHouseholdMembers(info, ['stored']).map((member) => member.id),
        ['kept'],
      );
    });

    test('ignores the local store when the server already says the account is here',
        () {
      expect(
        missingHouseholdMembers(info, []).length,
        2,
      );
    });
  });

  group('HouseholdService', () {
    late _MockClient client;
    late _PluginAdapter adapter;
    late HouseholdService service;

    setUp(() {
      client = _MockClient();
      when(() => client.baseUrl).thenReturn('http://server.test');
      when(() => client.accessToken).thenReturn('token');
      when(() => client.deviceInfo).thenReturn(
        const DeviceInfo(
          id: 'dev1',
          name: 'test',
          appName: 'moonfin',
          appVersion: '0.0.0',
        ),
      );
      adapter = _PluginAdapter();
      service = HouseholdService(
        client: () => client,
        dio: Dio()..httpClientAdapter = adapter,
      );
    });

    test('reads the household and signs the given members in', () async {
      adapter.household = <String, dynamic>{
        'isManager': true,
        'sessionsSupported': true,
        'users': [_member('u1'), _member('u2')],
      };
      final info = await service.household();
      expect(info, isNotNull);
      expect(info!.isManager, isTrue);
      expect(info.sessionsSupported, isTrue);
      expect(info.members.length, 2);
      expect(adapter.requests, ['GET /Moonfin/Household']);

      adapter.sessions = const {
        'results': [
          {'userId': 'u1', 'name': 'Baby', 'success': true,
              'accessToken': 't-1'},
          {'userId': 'u2', 'success': false, 'errorCode': 'disabled'},
        ],
      };
      final results = await service.createSessions(['u1', 'u2']);
      expect(results, isNotNull);
      expect(results!.length, 2);
      expect(results.first.accessToken, 't-1');
      expect(results.last.success, isFalse);
      expect(
        adapter.requests,
        ['GET /Moonfin/Household', 'POST /Moonfin/Household/Sessions'],
      );
      expect(lastPostIsUserIdList(adapter.lastPost), isTrue);
      expect(
        adapter.headers['/Moonfin/Household/Sessions']!['Authorization'],
        contains('MediaBrowser'),
      );
    });

    test('a server without the endpoints reads as no household', () async {
      adapter.householdStatus = 404;
      expect(await service.household(), isNull);
      adapter.sessionsStatus = 404;
      expect(await service.createSessions(['u1']), isNull);
    });

    test('a refusal or outage reads as no household', () async {
      adapter.householdStatus = 403;
      expect(await service.household(), isNull);
      adapter.householdStatus = 500;
      adapter.sessions = const {};
      expect(await service.createSessions(['u1']), isNull);
    });

    test('with no signed in client nothing is offered', () async {
      final service = HouseholdService(
        client: () => null,
        dio: Dio()..httpClientAdapter = adapter,
      );
      expect(await service.household(), isNull);
      expect(await service.createSessions(['u1']), isNull);
    });
  });

  group('AuthenticationPreferences household offer', () {
    late AuthenticationPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues(const {});
      await GetIt.instance.reset();
      final store = PreferenceStore();
      await store.init();
      prefs = AuthenticationPreferences(store);
    });

    tearDown(() async {
      await GetIt.instance.reset();
    });

    test('suppresses per server and manager only', () async {
      expect(prefs.isHouseholdOfferSuppressed('s1', 'm1'), isFalse);
      await prefs.suppressHouseholdOffer('s1', 'm1');
      expect(prefs.isHouseholdOfferSuppressed('s1', 'm1'), isTrue);
      expect(prefs.isHouseholdOfferSuppressed('s1', 'm2'), isFalse);
      expect(prefs.isHouseholdOfferSuppressed('s2', 'm1'), isFalse);
    });

    test('tolerates a corrupted value', () async {
      final store = PreferenceStore();
      await store.init();
      SharedPreferences.setMockInitialValues(
        const {'pref_household_offer_suppressed': 'not json'});
      final prefs = AuthenticationPreferences(store);
      expect(prefs.isHouseholdOfferSuppressed('s1', 'm1'), isFalse);
    });
  });
}

bool lastPostIsUserIdList(Object? post) =>
    post is Map &&
    post['userIds'] is List &&
    (post['userIds'] as List).every((id) => id is String);
