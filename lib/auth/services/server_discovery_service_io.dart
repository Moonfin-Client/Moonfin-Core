import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show MethodChannel;
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../data/services/log_service.dart';

import 'server_discovery_types.dart';
import 'silo_lan_discovery.dart';

/// Confirms a Silo address found on the network: the native probe's answer,
/// or null when nothing Silo answers there.
typedef SiloLanProbe = Future<ServerProbeResult?> Function(String baseUrl);

class ServerDiscoveryService {
  /// Jellyfin and Emby answer a UDP broadcast on 7359, and Silo advertises
  /// `_silo._tcp` over mDNS instead. Both run at once and feed one list.
  /// [siloBrowser] and [siloProbe] are replaceable for tests.
  ServerDiscoveryService({
    Future<List<SiloLanAdvert>> Function()? siloBrowser,
    SiloLanProbe? siloProbe,
    this._udpBroadcast = true,
  }) : _siloBrowser = siloBrowser ?? const SiloLanBrowser().browse,
       _siloProbe = siloProbe ?? _probeSiloOverLan;

  final Future<List<SiloLanAdvert>> Function() _siloBrowser;
  final SiloLanProbe _siloProbe;
  final bool _udpBroadcast;

  static const _platformChannel = MethodChannel(
    'org.moonfin.androidtv/platform',
  );

  static const _discoveryPort = 7359;
  static const _jellyfinMessage = 'who is JellyfinServer?';
  static const _embyMessage = 'who is EmbyServer?';
  static const _plexDiscoveryPort = 32414;
  static const _plexMessage = 'M-SEARCH * HTTP/1.1\r\n\r\n';
  static const _listenDuration = Duration(milliseconds: 2500);
  static const _rebroadcastInterval = Duration(milliseconds: 800);

  Stream<DiscoveredServer> discoverLocalServers() async* {
    final controller = StreamController<DiscoveredServer>();
    final seen = <String>{};
    RawDatagramSocket? socket;
    Timer? rebroadcastTimer;
    Timer? stopTimer;

    // The list closes once both the broadcast's listening window and the
    // Silo browse (with its identity checks) are over.
    var running = 2;
    void finishOne() {
      if (--running == 0 && !controller.isClosed) controller.close();
    }

    void emit(DiscoveredServer server) {
      if (controller.isClosed || !seen.add(server.id)) return;
      controller.add(server);
    }

    unawaited(_discoverSilo(emit).whenComplete(finishOne));

    if (!_udpBroadcast) {
      finishOne();
      yield* controller.stream;
      return;
    }

    try {
      socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      socket.broadcastEnabled = true;

      final broadcastAddresses = await _getBroadcastAddresses();
      final jellyfinData = utf8.encode(_jellyfinMessage);
      final embyData = utf8.encode(_embyMessage);
      final plexData = utf8.encode(_plexMessage);

      void sendBroadcasts() {
        for (final addr in broadcastAddresses) {
          try {
            socket!.send(jellyfinData, addr, _discoveryPort);
            socket.send(embyData, addr, _discoveryPort);
            socket.send(plexData, addr, _plexDiscoveryPort);
          } catch (_) {}
        }
      }

      socket.listen((event) {
        if (event != RawSocketEvent.read) return;
        final datagram = socket!.receive();
        if (datagram == null) return;
        final response = utf8.decode(datagram.data);
        final server = response.startsWith('HTTP/')
            ? parsePlexGdmResponse(response, datagram.address.address)
            : _parseResponse(response);
        if (server == null) return;
        emit(server);
      });

      sendBroadcasts();
      rebroadcastTimer = Timer.periodic(_rebroadcastInterval, (_) {
        sendBroadcasts();
      });
      stopTimer = Timer(_listenDuration, finishOne);

      yield* controller.stream;
    } catch (error) {
      // Swallowing this leaves an empty list that reads exactly like a
      // network with no servers on it.
      if (GetIt.instance.isRegistered<LogService>()) {
        GetIt.instance<LogService>().network(
          'Local server discovery failed',
          level: LogLevel.error,
          error: error,
        );
      }
      // Silo's browse runs on its own sockets and may still find servers.
      finishOne();
      yield* controller.stream;
    } finally {
      rebroadcastTimer?.cancel();
      stopTimer?.cancel();
      socket?.close();
      if (!controller.isClosed) await controller.close();
    }
  }

  /// Browses for `_silo._tcp` and lists each advertised server once its
  /// address confirms the advertised id. The advert is only a hint (anyone on
  /// the network can send one), so a server is listed under the address that
  /// answered `GET /api/v2/system/identity` with the TXT `id`, and named from
  /// its branding, as Silo's discovery guide asks.
  Future<void> _discoverSilo(void Function(DiscoveredServer) emit) async {
    final List<SiloLanAdvert> adverts;
    final locked = await _multicastLock(true);
    try {
      adverts = await _siloBrowser();
    } catch (error) {
      _log('Silo LAN discovery failed', error);
      return;
    } finally {
      if (locked) await _multicastLock(false);
    }

    // One deployment can be heard several times (several API processes, or
    // one per interface): group by its id.
    final byId = <String, List<SiloLanAdvert>>{};
    for (final advert in adverts) {
      final id = advert.serverId;
      if (id != null) (byId[id] ??= []).add(advert);
    }
    await Future.wait([
      for (final MapEntry(key: id, value: found) in byId.entries)
        _confirmSilo(id, found, emit),
    ]);
  }

  Future<void> _confirmSilo(
    String id,
    List<SiloLanAdvert> adverts,
    void Function(DiscoveredServer) emit,
  ) async {
    for (final advert in adverts) {
      for (final baseUrl in advert.baseUrls) {
        ServerProbeResult? result;
        try {
          result = await _siloProbe(baseUrl);
        } catch (_) {
          continue;
        }
        if (result == null || result.serverType != ServerType.silo) continue;
        if (result.info['Id'] != id) continue;
        emit(
          DiscoveredServer(
            id: id,
            name: result.info['ServerName'] as String? ?? advert.instanceName,
            address: baseUrl,
            serverType: ServerType.silo,
          ),
        );
        return;
      }
    }
  }

  static Future<ServerProbeResult?> _probeSiloOverLan(String baseUrl) async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 2),
        receiveTimeout: const Duration(seconds: 3),
        followRedirects: false,
        validateStatus: (status) => status != null && status < 400,
      ),
    );
    configureServerDio(dio);
    try {
      return await probeSiloServer(dio, baseUrl);
    } finally {
      dio.close();
    }
  }

  /// Android drops multicast packets on Wi-Fi unless a multicast lock is
  /// held, so mDNS answers would never arrive. Elsewhere this is a no-op.
  Future<bool> _multicastLock(bool acquire) async {
    if (!Platform.isAndroid) return false;
    try {
      await _platformChannel.invokeMethod<void>(
        acquire ? 'acquireMulticastLock' : 'releaseMulticastLock',
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  void _log(String message, Object error) {
    if (GetIt.instance.isRegistered<LogService>()) {
      GetIt.instance<LogService>().network(
        message,
        level: LogLevel.warning,
        error: error,
      );
    }
  }

  DiscoveredServer? _parseResponse(String response) {
    try {
      final data = jsonDecode(response) as Map<String, dynamic>;
      final address = data['Address'] as String?;
      final id = data['Id']?.toString();
      if (address == null || id == null) return null;

      final name = data['Name'] as String? ?? id;

      final serverType = name.toLowerCase().contains('emby')
          ? ServerType.emby
          : ServerType.jellyfin;

      return DiscoveredServer(
        id: id,
        name: name,
        address: address,
        serverType: serverType,
      );
    } catch (_) {
      return null;
    }
  }

  Future<List<InternetAddress>> _getBroadcastAddresses() async {
    final addresses = <InternetAddress>[InternetAddress('255.255.255.255')];
    try {
      final interfaces = await NetworkInterface.list();
      for (final iface in interfaces) {
        for (final addr in iface.addresses) {
          if (addr.type == InternetAddressType.IPv4) {
            final parts = addr.address.split('.');
            if (parts.length == 4) {
              final broadcast = '${parts[0]}.${parts[1]}.${parts[2]}.255';
              final broadcastAddr = InternetAddress(broadcast);
              if (!addresses.any((a) => a.address == broadcastAddr.address)) {
                addresses.add(broadcastAddr);
              }
            }
          }
        }
      }
    } catch (_) {}
    return addresses;
  }
}

/// Plex answers GDM with HTTP style headers instead of JSON.
DiscoveredServer? parsePlexGdmResponse(String response, String host) {
  final headers = <String, String>{
    for (final line in response.split('\r\n'))
      if (line.indexOf(':') case final i when i > 0)
        line.substring(0, i).toLowerCase(): line.substring(i + 1).trim(),
  };
  final id = headers['resource-identifier'];
  if (id == null || headers['content-type'] != 'plex/media-server') {
    return null;
  }
  return DiscoveredServer(
    id: id,
    name: headers['name'] ?? id,
    address: 'http://$host:${headers['port'] ?? '32400'}',
    serverType: ServerType.plex,
  );
}
