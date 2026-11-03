import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/silo_native_offer.dart';
import 'package:moonfin/auth/repositories/server_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:server_core/server_core.dart';

class _AuthStore extends Fake implements AuthenticationStore {
  @override
  Future<void> putServer(Server server) async {}
}

class _ClientFactory extends Fake implements MediaServerClientFactory {}

void main() {
  // No TestWidgetsFlutterBinding: these tests talk to a real local server.
  late HttpServer server;
  late Map<String, Object> routes;

  setUp(() async {
    routes = {};
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      final body = routes[request.uri.path];
      if (body == null) {
        // The native Silo host and many proxies answer anything else with
        // the web app's HTML.
        request.response
          ..headers.contentType = ContentType.html
          ..write('<!doctype html><html></html>');
      } else {
        request.response
          ..headers.contentType = ContentType.json
          ..write(jsonEncode(body));
      }
      await request.response.close();
    });
  });

  tearDown(() => server.close(force: true));

  ServerRepository repo() => ServerRepository(_AuthStore(), _ClientFactory());
  String address() => 'http://127.0.0.1:${server.port}';

  test('adding a Silo address saves a Silo server', () async {
    routes = {
      '/api/v2/system/info': {
        'server_version': '4b2e921c+dirty',
        'api_major': 2,
      },
      '/api/v2/system/identity': {
        'server_id': '7b72fbd5-e741-48f0-9d05-b438990f3a7e',
      },
      '/api/v2/theme/branding': {
        'server_name': 'Silo',
        'login_subtitle': 'Sign in with an existing account.',
      },
      '/api/v2/system/setup': {'needs_setup': false, 'wizard_completed': true},
    };

    final added = await repo().addServer(address());

    expect(added, isNotNull);
    expect(added!.serverType, ServerType.silo);
    expect(added.name, 'Silo');
    expect(added.version, '4b2e921c+dirty');
    expect(added.address, address());
    expect(added.loginDisclaimer, 'Sign in with an existing account.');
    expect(added.setupCompleted, isTrue);
  });

  test('a Silo with another API major is not added', () async {
    routes = {
      '/api/v2/system/info': {'server_version': 'f00dfeed', 'api_major': 3},
    };
    final repository = repo();

    final added = await repository.addServer(address());

    expect(added, isNull);
    final unsupported = repository.lastFailure!.unsupportedSilo!;
    expect(unsupported.apiMajor, 3);
    expect(unsupported.serverIsNewer, isTrue);
    // Found once: no other scheme or port is tried after it.
    expect(repository.lastFailure!.lastCandidate, address());
  });

  group('native port hint', () {
    late HttpServer native;
    late Map<String, Object> nativeRoutes;

    Future<HttpServer> serve(Map<String, Object> Function() table) async {
      final s = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      s.listen((request) async {
        final body = table()[request.uri.path];
        if (body == null) {
          request.response
            ..headers.contentType = ContentType.html
            ..write('<!doctype html><html></html>');
        } else {
          request.response
            ..headers.contentType = ContentType.json
            ..write(jsonEncode(body));
        }
        await request.response.close();
      });
      return s;
    }

    const compatInfo = {
      'ServerName': 'Silo',
      'Version': '10.11.0',
      'ProductName': 'Jellyfin Server',
      'Id': 'f027d2ed0ce54a5a9df9a1d2cbb8ab3b',
      'StartupWizardCompleted': true,
    };
    const siloDisclaimer = {
      'LoginDisclaimer':
          'Silo provides Jellyfin-compatible app support. Silo is not '
          'affiliated with or endorsed by the Jellyfin project.',
      'SplashscreenEnabled': false,
    };

    setUp(() async {
      nativeRoutes = {
        '/api/v2/system/info': {'server_version': 'bd9d59ea', 'api_major': 2},
        '/api/v2/system/identity': {
          'server_id': '7b72fbd5-e741-48f0-9d05-b438990f3a7e',
        },
        '/api/v2/theme/branding': {'server_name': 'Snowy Streams'},
      };
      native = await serve(() => nativeRoutes);
    });

    tearDown(() => native.close(force: true));

    ServerRepository hintRepo() =>
        repo()..siloNativePorts = [native.port];
    String nativeAddress() => 'http://127.0.0.1:${native.port}';

    test('Silo\'s compat service offers the native server, and yes adds it',
        () async {
      routes = {
        '/System/Info/Public': compatInfo,
        '/Branding/Configuration': siloDisclaimer,
      };
      final offers = <SiloNativeOffer>[];

      final added = await hintRepo().addServer(
        address(),
        offerSiloNative: (offer) async {
          offers.add(offer);
          return true;
        },
      );

      expect(offers, hasLength(1));
      expect(offers.single.jellyfinAddress, address());
      expect(offers.single.siloAddress, nativeAddress());
      expect(offers.single.serverName, 'Snowy Streams');
      expect(added!.serverType, ServerType.silo);
      expect(added.address, nativeAddress());
      expect(added.name, 'Snowy Streams');
      expect(added.version, 'bd9d59ea');
    });

    test('no keeps the Jellyfin-compatible address', () async {
      routes = {
        '/System/Info/Public': compatInfo,
        '/Branding/Configuration': siloDisclaimer,
      };

      final added = await hintRepo().addServer(
        address(),
        offerSiloNative: (_) async => false,
      );

      expect(added!.serverType, ServerType.jellyfin);
      expect(added.address, address());
    });

    test('a real Jellyfin server is not offered anything', () async {
      routes = {
        '/System/Info/Public': {
          ...compatInfo,
          'ServerName': 'Jellyfin',
        },
        '/Branding/Configuration': {
          'LoginDisclaimer': '',
          'SplashscreenEnabled': false,
        },
      };
      var asked = false;

      final added = await hintRepo().addServer(
        address(),
        offerSiloNative: (_) async => asked = true,
      );

      expect(asked, isFalse);
      expect(added!.serverType, ServerType.jellyfin);
    });

    test('nothing is offered when no native Silo answers', () async {
      routes = {
        '/System/Info/Public': compatInfo,
        '/Branding/Configuration': siloDisclaimer,
      };
      nativeRoutes = {};
      var asked = false;

      final added = await hintRepo().addServer(
        address(),
        offerSiloNative: (_) async => asked = true,
      );

      expect(asked, isFalse);
      expect(added!.serverType, ServerType.jellyfin);
    });

    test('without a handler the compat address is added as before', () async {
      routes = {
        '/System/Info/Public': compatInfo,
        '/Branding/Configuration': siloDisclaimer,
      };

      final added = await hintRepo().addServer(address());

      expect(added!.serverType, ServerType.jellyfin);
      expect(added.address, address());
    });
  });
}
