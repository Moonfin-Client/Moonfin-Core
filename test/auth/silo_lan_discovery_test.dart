import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/services/server_discovery_service_io.dart';
import 'package:moonfin/auth/services/server_discovery_types.dart';
import 'package:moonfin/auth/services/silo_lan_discovery.dart';
import 'package:server_core/server_core.dart';

const _snowyId = '7b72fbd5-e741-48f0-9d05-b438990f3a7e';

void main() {
  late Map<String, dynamic> fixtures;

  setUpAll(() {
    fixtures =
        jsonDecode(File('test/fixtures/silo_mdns.json').readAsStringSync())
            as Map<String, dynamic>;
  });

  Uint8List packet(String name) => base64Decode(fixtures[name] as String);

  group('buildSiloBrowseQuery', () {
    test('is one PTR question for _silo._tcp.local, id 0, QM', () {
      // Silo's responder recognized exactly these bytes as a question it
      // answers when the fixtures were made.
      expect(buildSiloBrowseQuery(), [
        0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, //
        5, ...'_silo'.codeUnits, 4, ...'_tcp'.codeUnits,
        5, ...'local'.codeUnits, 0, //
        0, 12, 0, 1,
      ]);
    });
  });

  group('SiloMdnsRecords', () {
    for (final name in ['answer', 'answer_compressed']) {
      test('reads Silo\'s answer ($name)', () {
        final records = SiloMdnsRecords()..add(packet(name));

        final advert = records.adverts.single;
        expect(advert.instanceName, 'Snowy Streams');
        expect(advert.serverId, _snowyId);
        expect(advert.port, 8080);
        // IPv4 first, and fe80::1 was never advertised.
        expect(advert.addresses, ['192.168.1.20', 'fd00:0:0:0:0:0:0:20']);
        expect(advert.baseUrls, [
          'http://192.168.1.20:8080',
          'http://[fd00:0:0:0:0:0:0:20]:8080',
        ]);
      });
    }

    test('reads the start announcement', () {
      final records = SiloMdnsRecords()..add(packet('announcement'));

      expect(records.adverts.single.serverId, _snowyId);
    });

    for (final name in ['goodbye', 'goodbye_compressed']) {
      test('a goodbye withdraws the server ($name)', () {
        final records = SiloMdnsRecords()
          ..add(packet('announcement'))
          ..add(packet(name));

        expect(records.adverts, isEmpty);
      });
    }

    for (final name in ['dotted', 'dotted_compressed']) {
      test('keeps an instance name with a dot in one piece ($name)', () {
        final records = SiloMdnsRecords()..add(packet(name));

        final advert = records.adverts.single;
        expect(advert.instanceName, "Brady's Silo v2.0");
        expect(advert.serverId, '12345678-aaaa');
        expect(advert.baseUrls, ['http://192.168.1.20:8090']);
      });
    }

    test('two servers in two packets are two adverts', () {
      final records = SiloMdnsRecords()
        ..add(packet('answer'))
        ..add(packet('dotted'));

      expect(
        records.adverts.map((a) => a.serverId),
        unorderedEquals([_snowyId, '12345678-aaaa']),
      );
    });

    test('ignores queries, including its own looping back', () {
      final records = SiloMdnsRecords()..add(buildSiloBrowseQuery());

      expect(records.adverts, isEmpty);
    });

    test('a truncated packet keeps what was read before it', () {
      final whole = packet('answer');
      final records = SiloMdnsRecords()
        ..add(packet('dotted'))
        ..add(Uint8List.sublistView(whole, 0, whole.length - 7))
        ..add(Uint8List.fromList([0x84, 0x00]));

      // The cut lands in Snowy's AAAA record: its other records were read.
      final adverts = {for (final a in records.adverts) a.serverId: a};
      expect(adverts.keys, unorderedEquals([_snowyId, '12345678-aaaa']));
      expect(adverts[_snowyId]!.addresses, ['192.168.1.20']);
    });

    test('a name pointer loop is dropped', () {
      final loop = Uint8List.fromList([
        0, 0, 0x84, 0, 0, 0, 0, 1, 0, 0, 0, 0, //
        0xC0, 12, // points at itself
        0, 12, 0, 1, 0, 0, 0, 120, 0, 0,
      ]);

      expect(() => SiloMdnsRecords().add(loop), returnsNormally);
    });
  });

  group('ServerDiscoveryService (Silo)', () {
    SiloLanAdvert advert({
      String? id = _snowyId,
      List<String> addresses = const ['192.168.1.20', 'fd00:0:0:0:0:0:0:20'],
    }) => SiloLanAdvert(
      instanceName: 'Snowy Streams',
      serverId: id,
      port: 8080,
      addresses: addresses,
    );

    ServerProbeResult silo(String id, String name) => ServerProbeResult(
      info: {'Id': id, 'ServerName': name, 'ProductName': 'Silo'},
      serverType: ServerType.silo,
      resolvedBaseUrl: '',
    );

    Future<List<DiscoveredServer>> discover({
      required List<SiloLanAdvert> adverts,
      required Future<ServerProbeResult?> Function(String) probe,
    }) => ServerDiscoveryService(
      siloBrowser: () async => adverts,
      siloProbe: probe,
      udpBroadcast: false,
    ).discoverLocalServers().toList();

    test('lists a server whose identity matches, named from its branding',
        () async {
      final probed = <String>[];
      final found = await discover(
        adverts: [advert()],
        probe: (url) async {
          probed.add(url);
          return silo(_snowyId, 'Snowy');
        },
      );

      expect(probed, ['http://192.168.1.20:8080']);
      final server = found.single;
      expect(server.id, _snowyId);
      expect(server.name, 'Snowy');
      expect(server.address, 'http://192.168.1.20:8080');
      expect(server.serverType, ServerType.silo);
    });

    test('a different identity is not listed', () async {
      final found = await discover(
        adverts: [advert()],
        probe: (_) async => silo('someone-else', 'Snowy'),
      );

      expect(found, isEmpty);
    });

    test('tries the next address when one does not answer', () async {
      final found = await discover(
        adverts: [advert()],
        probe: (url) async {
          if (url.contains('192.168')) throw const SocketException('refused');
          return silo(_snowyId, 'Snowy');
        },
      );

      expect(found.single.address, 'http://[fd00:0:0:0:0:0:0:20]:8080');
    });

    test('one deployment heard twice is listed once', () async {
      final found = await discover(
        adverts: [
          advert(addresses: ['192.168.1.20']),
          advert(addresses: ['10.0.0.5']),
        ],
        probe: (_) async => silo(_snowyId, 'Snowy'),
      );

      expect(found, hasLength(1));
    });

    test('an advert without an id is ignored', () async {
      var probed = false;
      final found = await discover(
        adverts: [advert(id: null)],
        probe: (_) async {
          probed = true;
          return silo(_snowyId, 'Snowy');
        },
      );

      expect(probed, isFalse);
      expect(found, isEmpty);
    });

    test('a failed browse ends the list without an error', () async {
      final found = await ServerDiscoveryService(
        siloBrowser: () async => throw const SocketException('5353 busy'),
        siloProbe: (_) async => null,
        udpBroadcast: false,
      ).discoverLocalServers().toList();

      expect(found, isEmpty);
    });
  });
}
