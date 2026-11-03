import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Finding Silo servers on the local network.
///
/// Silo advertises each API process with DNS-SD over multicast DNS as
/// `_silo._tcp.local` (its `internal/landiscovery`): the instance name is the
/// server's name, SRV gives the host and the plain-HTTP port, A/AAAA the
/// addresses, and TXT carries `v=1` and `id=<server id>`. This file has a
/// small DNS message codec ([buildSiloBrowseQuery], [SiloMdnsRecords]) and a
/// one-shot browser ([SiloLanBrowser]). Nothing found here is trusted until
/// the caller has confirmed it with `GET /api/v2/system/identity`.

/// The DNS-SD service Silo advertises.
const siloServiceType = '_silo._tcp.local';

const _typeA = 1;
const _typePtr = 12;
const _typeTxt = 16;
const _typeAaaa = 28;
const _typeSrv = 33;
const _classIn = 1;

/// A one-question mDNS query for [siloServiceType]'s PTR records. Asks for
/// multicast answers (QM): Silo answers by multicast on the link, never to
/// the sender.
Uint8List buildSiloBrowseQuery() {
  final bytes = BytesBuilder();
  // Header: id 0 (RFC 6762 §18.1), standard query, one question.
  bytes.add(const [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]);
  for (final label in siloServiceType.split('.')) {
    final encoded = utf8.encode(label);
    bytes
      ..addByte(encoded.length)
      ..add(encoded);
  }
  bytes.add(const [0, 0, _typePtr, 0, _classIn]);
  return bytes.toBytes();
}

/// One `_silo._tcp` advertisement, put together from its records.
class SiloLanAdvert {
  /// The instance name (the server's branding name, maybe with a conflict
  /// suffix such as " (2)"). A label only: two servers can share it.
  final String instanceName;

  /// TXT `id`: the server id `GET /api/v2/system/identity` must answer.
  final String? serverId;

  /// The SRV port Silo's API listens on (plain HTTP).
  final int port;

  /// Addresses of the SRV target, IPv4 first.
  final List<String> addresses;

  const SiloLanAdvert({
    required this.instanceName,
    required this.serverId,
    required this.port,
    required this.addresses,
  });

  /// `http://<address>:<port>` for each address, IPv6 in brackets.
  List<String> get baseUrls => [
    for (final address in addresses)
      address.contains(':')
          ? 'http://[$address]:$port'
          : 'http://$address:$port',
  ];

  @override
  String toString() =>
      'SiloLanAdvert($instanceName, id: $serverId, $addresses:$port)';
}

/// The records collected from mDNS responses. Feed every packet to [add],
/// then read [adverts]. Names are matched without regard to case, as DNS
/// does. A record with TTL 0 (a goodbye) removes what it names.
class SiloMdnsRecords {
  final _instances = <String, String>{}; // Labels by lowercased full name.
  final _srv = <String, ({String target, int port})>{};
  final _txt = <String, Map<String, String>>{};
  final _addresses = <String, Set<String>>{};

  /// Parses one mDNS packet. Queries and malformed packets are ignored.
  void add(Uint8List packet) {
    try {
      _parse(packet);
    } on RangeError {
      // Truncated or malformed: whatever was read before stays.
    } on FormatException {
      // Not UTF-8 or a looping name.
    }
  }

  /// Advertisements with a port and at least one address.
  List<SiloLanAdvert> get adverts {
    final found = <SiloLanAdvert>[];
    for (final MapEntry(key: name, value: label) in _instances.entries) {
      final srv = _srv[name];
      if (srv == null) continue;
      final addresses = _addresses[srv.target]?.toList() ?? const <String>[];
      if (addresses.isEmpty) continue;
      addresses.sort((a, b) {
        final aV6 = a.contains(':') ? 1 : 0;
        final bV6 = b.contains(':') ? 1 : 0;
        return aV6.compareTo(bV6);
      });
      final id = _txt[name]?['id']?.trim();
      found.add(
        SiloLanAdvert(
          instanceName: label,
          serverId: id == null || id.isEmpty ? null : id,
          port: srv.port,
          addresses: addresses,
        ),
      );
    }
    return found;
  }

  void _parse(Uint8List packet) {
    final data = ByteData.sublistView(packet);
    final flags = data.getUint16(2);
    // A query, our own looping back or another browser's.
    if (flags & 0x8000 == 0) return;
    final questions = data.getUint16(4);
    final records =
        data.getUint16(6) + data.getUint16(8) + data.getUint16(10);

    var offset = 12;
    for (var i = 0; i < questions; i++) {
      offset = _readName(packet, offset).end + 4;
    }
    for (var i = 0; i < records; i++) {
      final name = _readName(packet, offset);
      offset = name.end;
      final type = data.getUint16(offset);
      final ttl = data.getUint32(offset + 4);
      final length = data.getUint16(offset + 8);
      final start = offset + 10;
      final end = start + length;
      if (end > packet.length) throw RangeError('record past the packet');
      offset = end;
      _record(packet, data, name.value, type, ttl, start, end);
    }
  }

  void _record(
    Uint8List packet,
    ByteData data,
    String owner,
    int type,
    int ttl,
    int start,
    int end,
  ) {
    final key = owner.toLowerCase();
    switch (type) {
      case _typePtr when key == siloServiceType:
        final target = _readName(packet, start).value;
        final targetKey = target.toLowerCase();
        if (!targetKey.endsWith('.$siloServiceType')) return;
        if (ttl == 0) {
          _instances.remove(targetKey);
          return;
        }
        _instances[targetKey] = target.substring(
          0,
          target.length - siloServiceType.length - 1,
        );
      case _typeSrv:
        if (ttl == 0) {
          _srv.remove(key);
          return;
        }
        final port = data.getUint16(start + 4);
        final target = _readName(packet, start + 6).value.toLowerCase();
        _srv[key] = (target: target, port: port);
      case _typeTxt:
        final entries = <String, String>{};
        var at = start;
        while (at < end) {
          final length = packet[at];
          final text = utf8.decode(
            packet.sublist(at + 1, at + 1 + length),
            allowMalformed: true,
          );
          at += 1 + length;
          final equals = text.indexOf('=');
          if (equals <= 0) continue;
          entries.putIfAbsent(
            text.substring(0, equals).toLowerCase(),
            () => text.substring(equals + 1),
          );
        }
        if (ttl == 0) {
          _txt.remove(key);
        } else {
          _txt[key] = entries;
        }
      case _typeA when end - start == 4:
        _address(key, packet.sublist(start, end).join('.'), ttl);
      case _typeAaaa when end - start == 16:
        // Link-local addresses (fe80::/10) need a scope id a URL can't
        // carry, and Silo never advertises them.
        if (data.getUint16(start) & 0xFFC0 == 0xFE80) return;
        final groups = [
          for (var i = start; i < end; i += 2)
            data.getUint16(i).toRadixString(16),
        ];
        _address(key, groups.join(':'), ttl);
    }
  }

  void _address(String host, String address, int ttl) {
    if (ttl == 0) {
      _addresses[host]?.remove(address);
    } else {
      (_addresses[host] ??= <String>{}).add(address);
    }
  }

  /// Reads a (possibly compressed) domain name at [offset]. [end] is where
  /// the name ends in place, after the first pointer if there is one.
  static ({String value, int end}) _readName(Uint8List packet, int offset) {
    final labels = <String>[];
    var at = offset;
    int? end;
    var jumps = 0;
    while (true) {
      final length = packet[at];
      if (length == 0) {
        end ??= at + 1;
        break;
      }
      if (length & 0xC0 == 0xC0) {
        if (++jumps > 32) throw const FormatException('name pointer loop');
        end ??= at + 2;
        at = ((length & 0x3F) << 8) | packet[at + 1];
        continue;
      }
      if (at + 1 + length > packet.length) {
        throw RangeError('label past the packet');
      }
      labels.add(utf8.decode(packet.sublist(at + 1, at + 1 + length)));
      at += 1 + length;
    }
    return (value: labels.join('.'), end: end);
  }
}

/// Browses the local network once for [siloServiceType].
///
/// The socket is bound to UDP 5353 (shared with the system's mDNS daemon),
/// because Silo's responder only answers queries sent from port 5353. The
/// query goes out on every IPv4 interface twice, a second apart, and answers
/// are collected for [listenFor].
class SiloLanBrowser {
  static const _mdnsPort = 5353;
  static final _group = InternetAddress('224.0.0.251');

  final Duration listenFor;

  const SiloLanBrowser({this.listenFor = const Duration(milliseconds: 2500)});

  /// The advertisements heard. Throws if the mDNS port can't be opened.
  Future<List<SiloLanAdvert>> browse() async {
    final socket = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      _mdnsPort,
      reuseAddress: true,
      reusePort: !Platform.isWindows,
      ttl: 255,
    );
    final records = SiloMdnsRecords();
    Timer? repeat;
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
      );
      final sendFrom = <InternetAddress>[];
      for (final interface in interfaces) {
        try {
          socket.joinMulticast(_group, interface);
          sendFrom.add(interface.addresses.first);
        } catch (_) {
          // Not multicast-capable (a VPN tunnel, say).
        }
      }

      final done = Completer<void>();
      final subscription = socket.listen((event) {
        if (event != RawSocketEvent.read) return;
        final datagram = socket.receive();
        if (datagram != null) records.add(datagram.data);
      }, onDone: () {
        if (!done.isCompleted) done.complete();
      });

      final query = buildSiloBrowseQuery();
      void send() {
        for (final address in sendFrom) {
          try {
            socket.setRawOption(
              RawSocketOption(
                RawSocketOption.levelIPv4,
                RawSocketOption.IPv4MulticastInterface,
                address.rawAddress,
              ),
            );
            socket.send(query, _group, _mdnsPort);
          } catch (_) {}
        }
        if (sendFrom.isEmpty) {
          try {
            socket.send(query, _group, _mdnsPort);
          } catch (_) {}
        }
      }

      send();
      repeat = Timer(const Duration(seconds: 1), send);
      await Future.any([Future<void>.delayed(listenFor), done.future]);
      await subscription.cancel();
    } finally {
      repeat?.cancel();
      socket.close();
    }
    return records.adverts;
  }
}
