import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';
import 'package:uuid/uuid.dart';

import '../util/loggable_url.dart';

/// Serves Aether's Emby direct stream requests through Moonfin's HTTP proxy.
/// The loopback URL is valid for one playback session and carries no token.
class AetherProxyStream {
  AetherProxyStream._(this._server, this._client, this._source, this._headers)
    : _localUrl = Uri(
        scheme: 'http',
        host: _server.address.address,
        port: _server.port,
        pathSegments: [const Uuid().v4(), _source.pathSegments.last],
      );

  final HttpServer _server;
  final HttpClient _client;
  final Uri _source;
  Map<String, String> _headers;
  final Uri _localUrl;

  String get url => _localUrl.toString();

  /// Replaces the headers every later upstream request carries.
  ///
  /// A credential refresh arrives after the engine already opened the local
  /// URL, so the relay has to take the new token itself instead of asking the
  /// engine to reopen the stream.
  void updateHeaders(Map<String, String> headers) {
    if (headers.isEmpty) return;
    _headers = Map.unmodifiable(headers);
  }

  static Future<AetherProxyStream?> open(
    String url,
    Map<String, String> headers,
  ) async {
    final proxy = serverProxyFindProxy;
    final source = Uri.tryParse(url);
    if (proxy == null ||
        source == null ||
        (source.scheme != 'http' && source.scheme != 'https') ||
        source.host.isEmpty ||
        source.pathSegments.isEmpty ||
        source.queryParameters['Static']?.toLowerCase() != 'true' ||
        !headers.keys.any(
          (key) => EmbyAuthorizationHeader.values.any(
            (header) => header.value == key,
          ),
        )) {
      return null;
    }
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final client = HttpClient()
      ..autoUncompress = false
      ..connectionTimeout = const Duration(seconds: 10)
      ..findProxy = (_) => proxy;
    final relay = AetherProxyStream._(server, client, source, headers);
    server.listen(relay._serve);
    return relay;
  }

  Future<void> close() async {
    _client.close(force: true);
    await _server.close(force: true);
  }

  Future<void> _serve(HttpRequest request) async {
    final response = request.response;
    if (request.uri.path != _localUrl.path ||
        (request.method != 'GET' && request.method != 'HEAD')) {
      response.statusCode = HttpStatus.notFound;
      await response.close();
      return;
    }

    try {
      final upstream = await _openUpstream(request);
      response.statusCode = upstream.statusCode;
      for (final name in _responseHeaders) {
        final values = upstream.headers[name];
        if (values != null) response.headers.set(name, values);
      }
      if (request.method == 'HEAD') {
        await upstream.drain<void>();
        await response.close();
      } else {
        await upstream.pipe(response);
      }
    } catch (error) {
      // The player may disconnect while seeking or replacing a source.
      // Report the upstream failure so a broken proxy route is diagnosable
      // rather than a silent 502, then return a gateway error if no bytes
      // have been written yet.
      debugPrint(
        'Aether relay failed for ${loggableUrl(_source.toString())}: $error',
      );
      try {
        response.statusCode = HttpStatus.badGateway;
        await response.close();
      } on StateError {
        await response.close();
      }
    }
  }

  Future<HttpClientResponse> _openUpstream(HttpRequest incoming) async {
    var target = _source;
    for (var redirects = 0; ; redirects++) {
      final outgoing = await _client.openUrl(incoming.method, target);
      outgoing.followRedirects = false;
      _headers.forEach(outgoing.headers.set);
      for (final header in gServerRequestHeaders) {
        if (header.origin == target.origin) {
          outgoing.headers.set(header.name, header.value);
        }
      }
      outgoing.headers.set(HttpHeaders.acceptEncodingHeader, 'identity');
      for (final header in [HttpHeaders.rangeHeader, 'if-range']) {
        final value = incoming.headers[header];
        if (value != null) outgoing.headers.set(header, value);
      }
      final upstream = await outgoing.close();
      final location = upstream.headers.value(HttpHeaders.locationHeader);
      if (!upstream.isRedirect || location == null) return upstream;
      final next = target.resolve(location);
      if (redirects == 4 || next.origin != _source.origin) {
        await upstream.drain<void>();
        throw const HttpException('Emby stream redirected outside its origin');
      }
      await upstream.drain<void>();
      target = next;
    }
  }

  static const _responseHeaders = [
    'accept-ranges',
    HttpHeaders.contentEncodingHeader,
    HttpHeaders.contentLengthHeader,
    HttpHeaders.contentRangeHeader,
    HttpHeaders.contentTypeHeader,
    HttpHeaders.etagHeader,
    HttpHeaders.lastModifiedHeader,
  ];
}
