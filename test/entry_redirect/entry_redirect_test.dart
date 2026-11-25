// Entry redirect (portnook fork): tests for entry_redirect.dart and
// entry_address_store.dart.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/entry_redirect/entry_address_store.dart';
import 'package:moonfin/entry_redirect/entry_redirect.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _AuthStore extends Fake implements AuthenticationStore {
  final saved = <Server>[];
  final removed = <String>[];
  var failPuts = false;

  /// When set, the next save waits for it.
  Completer<void>? hold;

  @override
  Future<void> putServer(Server server) async {
    final waitFor = hold;
    hold = null;
    if (waitFor != null) await waitFor.future;
    if (failPuts) throw StateError('disk full');
    saved.add(server);
  }

  @override
  Future<void> removeServer(String serverId) async => removed.add(serverId);
}

class _Client extends Fake implements MediaServerClient {
  _Client(this.baseUrl);

  @override
  String baseUrl;
}

class _ClientFactory extends Fake implements MediaServerClientFactory {
  final byId = <String, _Client>{};

  @override
  MediaServerClient? getClientIfExists(String serverId) => byId[serverId];

  @override
  void removeClient(String serverId) {}
}

void main() {
  // These tests talk to real local servers, so they skip
  // TestWidgetsFlutterBinding.
  late HttpServer entry;
  late HttpServer target;
  late _AuthStore store;
  late _ClientFactory clients;
  late EntryAddressStore entries;
  late ServerRepository repo;
  late EntryRedirect redirect;
  var targetId = 'abc';

  setUp(() async {
    store = _AuthStore();
    clients = _ClientFactory();
    entries = EntryAddressStore.memory();
    repo = ServerRepository(store, clients);
    redirect = EntryRedirect(repo, entries, clients);
    repo.entryRedirect = redirect;
    targetId = 'abc';
    target = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    target.listen((request) async {
      if (request.uri.path == '/System/Info/Public') {
        request.response
          ..headers.contentType = ContentType.json
          ..write(
            jsonEncode({
              'ServerName': 'Media',
              'Version': '10.11.0',
              'ProductName': 'Jellyfin Server',
              'Id': targetId,
            }),
          );
      } else {
        request.response.statusCode = HttpStatus.notFound;
      }
      await request.response.close();
    });
    // A stable name in front of a dynamic host:port, the way a reverse proxy
    // or redirect service answers.
    entry = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    entry.listen((request) async {
      request.response
        ..statusCode = HttpStatus.found
        ..headers.set(
          HttpHeaders.locationHeader,
          'http://127.0.0.1:${target.port}${request.uri.path}',
        );
      await request.response.close();
    });
  });

  tearDown(() async {
    gAllowSelfSignedCertificates = false;
    gIsOwnServerHost = (_) => false;
    await entry.close(force: true);
    await target.close(force: true);
  });

  String entryUrl() => 'http://127.0.0.1:${entry.port}';
  String targetUrl() => 'http://127.0.0.1:${target.port}';

  Server saved({String address = 'http://127.0.0.1:1'}) => Server(
    id: 'server-1',
    name: 'Media',
    // A port nothing listens on any more: the redirect target moved.
    address: address,
    version: '10.11.0',
    serverType: ServerType.jellyfin,
    dateAdded: DateTime(2026),
  );

  Future<void> withEntry({String serverId = 'abc'}) => entries.put(
    'server-1',
    EntryAddress(address: entryUrl(), serverId: serverId),
  );

  Future<void> saveWithEntry({String address = 'http://127.0.0.1:1'}) async {
    await repo.saveServer(saved(address: address));
    await withEntry();
  }

  test('adding through a redirect keeps the entered address', () async {
    final server = await repo.addServer(entryUrl());

    expect(server, isNotNull);
    expect(server!.address, targetUrl());
    expect(redirect.entryOf(server.id)?.address, entryUrl());
    expect(redirect.entryOf(server.id)?.serverId, 'abc');
  });

  test('adding without a redirect saves no entry address', () async {
    final server = await repo.addServer(targetUrl());

    expect(server!.address, targetUrl());
    expect(redirect.entryOf(server.id), isNull);
  });

  test('a switch to another address after the probe is no redirect', () async {
    // Like Silo's native API: the probe stayed, the saved address didn't.
    await redirect.recordAdded(
      saved(address: 'http://127.0.0.1:9'),
      entered: entryUrl(),
      probed: targetUrl(),
      info: {'Id': 'abc'},
    );

    expect(redirect.entryOf('server-1'), isNull);
  });

  test('a moved redirect target is followed and saved', () async {
    await withEntry();

    final followed = await repo.withCheckedType(saved());

    expect(followed.address, targetUrl());
    expect(redirect.entryOf('server-1')?.address, entryUrl());
    expect(store.saved.first.address, targetUrl());
  });

  test('a saved server that moved reports its new address', () async {
    await saveWithEntry();

    expect(await redirect.followEntryAddressOf('server-1'), targetUrl());
    expect(repo.getServer('server-1')!.address, targetUrl());
    // Asked again, nothing moved any more.
    expect(await redirect.followEntryAddressOf('server-1'), isNull);
  });

  test('a move reaches the cached client', () async {
    await saveWithEntry();
    clients.byId['server-1'] = _Client('http://127.0.0.1:1');

    await redirect.followEntryAddressOf('server-1');

    expect(clients.byId['server-1']!.baseUrl, targetUrl());
  });

  test('a request that failed to connect gets the new address', () async {
    await saveWithEntry();
    final moves = <ServerMove>[];
    final sub = redirect.serverMoved.listen(moves.add);

    // Requests failing together share one ask.
    final asks = await Future.wait([
      redirect.followMovedAddress('http://127.0.0.1:1/', serverId: 'server-1'),
      redirect.followMovedAddress('http://127.0.0.1:1', serverId: 'server-1'),
    ]);

    expect(asks, [targetUrl(), targetUrl()]);
    expect(repo.getServer('server-1')!.address, targetUrl());
    await Future<void>.delayed(Duration.zero);
    expect(moves.single.server.address, targetUrl());
    expect(moves.single.from, 'http://127.0.0.1:1');
    await sub.cancel();
  });

  test(
    'a request that fails after the move still gets the new address',
    () async {
      await saveWithEntry();
      expect(
        await redirect.followMovedAddress(
          'http://127.0.0.1:1',
          serverId: 'server-1',
        ),
        targetUrl(),
      );

      expect(
        await redirect.followMovedAddress(
          'http://127.0.0.1:1/',
          serverId: 'server-1',
        ),
        targetUrl(),
      );
      expect(await redirect.followMovedAddress('http://127.0.0.1:2'), isNull);
    },
  );

  test(
    'an old address another saved server uses now is not redirected',
    () async {
      await saveWithEntry();
      expect(
        await redirect.followMovedAddress(
          'http://127.0.0.1:1',
          serverId: 'server-1',
        ),
        targetUrl(),
      );
      await repo.saveServer(
        Server(
          id: 'server-2',
          name: 'Other',
          address: 'http://127.0.0.1:1',
          version: '10.11.0',
          serverType: ServerType.jellyfin,
          dateAdded: DateTime(2026),
        ),
      );

      expect(redirect.serverIdAt('http://127.0.0.1:1/'), 'server-2');
      expect(
        await redirect.followMovedAddress(
          'http://127.0.0.1:1/',
          serverId: 'server-2',
        ),
        isNull,
      );
      expect(
        await redirect.followMovedAddress(
          'http://127.0.0.1:1/',
          serverId: 'server-1',
        ),
        targetUrl(),
      );
    },
  );

  test(
    'two saved servers at one address get no server for a request',
    () async {
      await saveWithEntry();
      await repo.saveServer(
        Server(
          id: 'server-2',
          name: 'Other',
          address: 'http://127.0.0.1:1',
          version: '10.11.0',
          serverType: ServerType.jellyfin,
          dateAdded: DateTime(2026),
        ),
      );

      expect(redirect.serverIdAt('http://127.0.0.1:1'), isNull);
      expect(await redirect.followMovedAddress('http://127.0.0.1:1'), isNull);
    },
  );

  test('a slow save never leaves an older address on disk', () async {
    await saveWithEntry();
    clients.byId['server-1'] = _Client('http://127.0.0.1:1');
    store.saved.clear();

    // The move to the redirect target is held while it saves...
    final release = store.hold = Completer<void>();
    final following = redirect.withFollowedEntryAddress(
      repo.getServer('server-1')!,
    );
    while (store.hold != null) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    // ...and a later update comes in meanwhile.
    final later = repo.updateServer(
      repo.getServer('server-1')!.copyWith(address: 'http://127.0.0.1:3'),
    );
    release.complete();
    await following;
    await later;

    expect(store.saved.last.address, 'http://127.0.0.1:3');
    expect(repo.getServer('server-1')!.address, 'http://127.0.0.1:3');
    expect(clients.byId['server-1']!.baseUrl, 'http://127.0.0.1:3');
  });

  test('an HTTP entry never moves a server off its HTTPS address', () async {
    await saveWithEntry(address: 'https://127.0.0.1:1');

    expect(await redirect.followEntryAddressOf('server-1'), isNull);
    expect(repo.getServer('server-1')!.address, 'https://127.0.0.1:1');
  });

  test(
    'a server removed while its entry address is asked stays removed',
    () async {
      await saveWithEntry();
      store.saved.clear();

      final asking = redirect.withFollowedEntryAddress(
        repo.getServer('server-1')!,
      );
      await repo.deleteServer('server-1');
      await asking;

      expect(repo.getServer('server-1'), isNull);
      expect(store.saved, isEmpty);
      expect(store.removed, ['server-1']);
    },
  );

  test('an answer for an address the server already left is dropped', () async {
    await saveWithEntry();
    store.saved.clear();

    final asking = redirect.withFollowedEntryAddress(
      repo.getServer('server-1')!,
    );
    await repo.updateServer(
      repo.getServer('server-1')!.copyWith(address: 'http://127.0.0.1:3'),
    );
    final followed = await asking;

    expect(followed.address, 'http://127.0.0.1:3');
    expect(repo.getServer('server-1')!.address, 'http://127.0.0.1:3');
    expect(store.saved.single.address, 'http://127.0.0.1:3');
  });

  test('a move that could not be saved leaves the list as it was', () async {
    await saveWithEntry();
    store.failPuts = true;

    expect(await redirect.followEntryAddressOf('server-1'), isNull);
    expect(repo.getServer('server-1')!.address, 'http://127.0.0.1:1');
  });

  test(
    'adding a server at its target directly drops its entry address',
    () async {
      await saveWithEntry(address: targetUrl());

      final server = await repo.addServer(targetUrl());

      expect(server!.id, 'server-1');
      expect(redirect.entryOf('server-1'), isNull);
    },
  );

  test(
    'adding it through the redirect again keeps its entry address',
    () async {
      await saveWithEntry(address: targetUrl());

      final server = await repo.addServer(entryUrl());

      expect(redirect.entryOf(server!.id)?.address, entryUrl());
      expect(redirect.entryOf(server.id)?.serverId, 'abc');
    },
  );

  test('only a server added through a redirect can move', () async {
    await saveWithEntry();

    expect(redirect.canMove('http://127.0.0.1:1/'), isTrue);
    expect(redirect.canMove('http://127.0.0.1:2'), isFalse);
  });

  test('an address no saved server uses is not asked about', () async {
    await saveWithEntry();

    expect(await redirect.followMovedAddress('http://127.0.0.1:2'), isNull);
    expect(repo.getServer('server-1')!.address, 'http://127.0.0.1:1');
  });

  test('opening the server list follows every entry address', () async {
    await saveWithEntry();

    await redirect.followAllEntryAddresses();

    expect(repo.getServer('server-1')!.address, targetUrl());
  });

  test('a redirect to a different server is not followed', () async {
    targetId = 'other';
    await withEntry();

    final followed = await redirect.withFollowedEntryAddress(saved());

    expect(followed.address, 'http://127.0.0.1:1');
    expect(store.saved, isEmpty);
  });

  test('a server without an entry address is left alone', () async {
    final server = saved();

    final followed = await redirect.withFollowedEntryAddress(server);

    expect(followed, same(server));
    expect(store.saved, isEmpty);
  });

  test('the entry address counts as one of the user\'s own hosts', () async {
    await repo.saveServer(saved(address: 'https://203.0.113.7:51234'));
    await entries.put(
      'server-1',
      const EntryAddress(address: 'https://media.home.lan', serverId: 'abc'),
    );

    gAllowSelfSignedCertificates = true;
    expect(acceptsUntrustedCertificate('media.home.lan'), isTrue);
    expect(acceptsUntrustedCertificate('203.0.113.7'), isTrue);
    expect(acceptsUntrustedCertificate('other.home.lan'), isFalse);
  });

  group('what counts as a redirect', () {
    bool isRedirect(String from, String to) =>
        EntryRedirect.isRedirectToOtherOrigin(from, to);

    test('another port or host does', () {
      expect(
        isRedirect('https://name.example', 'https://1.2.3.4:51234'),
        isTrue,
      );
      expect(isRedirect('http://a.example', 'http://b.example'), isTrue);
    });

    test('an HTTPS upgrade on the same host and default ports does not', () {
      expect(
        isRedirect('http://media.example.com', 'https://media.example.com'),
        isFalse,
      );
      expect(
        isRedirect('http://Media.example.com:80', 'https://media.example.com/'),
        isFalse,
      );
    });

    test('an HTTPS upgrade that changes the port or host still does', () {
      expect(
        isRedirect(
          'http://media.example.com',
          'https://media.example.com:8920',
        ),
        isTrue,
      );
      expect(
        isRedirect('http://media.example.com', 'https://other.example.com'),
        isTrue,
      );
    });

    test('a path the probe added does not', () {
      expect(
        isRedirect('http://emby.local:8096', 'http://emby.local:8096/emby'),
        isFalse,
      );
    });
  });

  group('the store', () {
    test('keeps entry addresses across a restart', () async {
      SharedPreferences.setMockInitialValues({});
      final first = EntryAddressStore();
      await first.init();
      await first.put(
        'server-1',
        const EntryAddress(address: 'https://name.example', serverId: 'abc'),
      );

      final again = EntryAddressStore();
      await again.init();

      expect(again.of('server-1')?.address, 'https://name.example');
      expect(again.of('server-1')?.serverId, 'abc');
    });

    test('takes over entry addresses saved inside server records', () async {
      SharedPreferences.setMockInitialValues({
        'authentication_store_json': jsonEncode({
          'version': 2,
          'servers': {
            'server-1': {
              'name': 'Media',
              'address': 'https://1.2.3.4:51234',
              'entryAddress': 'https://name.example',
              'entryServerId': 'abc',
            },
            'server-2': {'name': 'Plain', 'address': 'https://plain.example'},
          },
        }),
      });
      final store = EntryAddressStore();
      await store.init();

      expect(store.of('server-1')?.address, 'https://name.example');
      expect(store.of('server-2'), isNull);
    });
  });
}
