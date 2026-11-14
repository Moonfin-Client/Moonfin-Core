import 'dart:io';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

// A test CA, a server certificate for localhost and 127.0.0.1, and a client
// certificate, all EC keys.
const _caPem = '''
-----BEGIN CERTIFICATE-----
MIIBizCCATGgAwIBAgIURVGoScc79NPENiLLtsGrnsQ7YxowCgYIKoZIzj0EAwIw
GjEYMBYGA1UEAwwPTW9vbmZpbiBUZXN0IENBMCAXDTI2MTAxMjE4MTc0MVoYDzIx
MjYwOTE4MTgxNzQxWjAaMRgwFgYDVQQDDA9Nb29uZmluIFRlc3QgQ0EwWTATBgcq
hkjOPQIBBggqhkjOPQMBBwNCAATGToM1X6kfv44o3iFkGOAu+z4r3dTK3Ey1ur5F
31Epxxx7W0CTdD2O7W6h6T272KHnB289lzJ7zgQ7o/14Wpuco1MwUTAdBgNVHQ4E
FgQU4/FkJ7HBkKSNEoTlMFBIdlLB5Z0wHwYDVR0jBBgwFoAU4/FkJ7HBkKSNEoTl
MFBIdlLB5Z0wDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAgNIADBFAiEApx+o
+L4enAW3P82L8oJ2K6c64QygxK/WfWC4F7gIxwUCIERZQ/c9QkXsJ298fYjA8k0a
Fn9ki/dWiSPcEmAzXI2l
-----END CERTIFICATE-----
''';

const _serverPem = '''
-----BEGIN CERTIFICATE-----
MIIBkDCCATagAwIBAgIUepH07ooVxX/dHGNU0X7a4OB9aqwwCgYIKoZIzj0EAwIw
GjEYMBYGA1UEAwwPTW9vbmZpbiBUZXN0IENBMCAXDTI2MTAxMjE4MTc0MVoYDzIx
MjYwOTE4MTgxNzQxWjAUMRIwEAYDVQQDDAlsb2NhbGhvc3QwWTATBgcqhkjOPQIB
BggqhkjOPQMBBwNCAAR+P0wEz84AD/ysTmaTh6HwTf8mOABgGt9EwEZKD8pj4MiJ
96U92fm2M1UsNHGLq7VcAO77CWwQ/zfZMSh0ZFM/o14wXDAaBgNVHREEEzARggls
b2NhbGhvc3SHBH8AAAEwHQYDVR0OBBYEFKVm/emRPV29iSGHYOMdfMi+jx3MMB8G
A1UdIwQYMBaAFOPxZCexwZCkjRKE5TBQSHZSweWdMAoGCCqGSM49BAMCA0gAMEUC
IQDHk1C5te31Kg+HTm956orvwo/zD5jq1RlArKfncEqlTQIgXPv5/K+0c/oY5Ixb
fwfdhxF3248Niazo0kcm6JFJ7ik=
-----END CERTIFICATE-----
''';

const _serverKey = '''
-----BEGIN PRIVATE KEY-----
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgskTiDZiOdnpIQeBF
MwKZNG4hiqkC2jTJxcsWbvl02c+hRANCAAR+P0wEz84AD/ysTmaTh6HwTf8mOABg
Gt9EwEZKD8pj4MiJ96U92fm2M1UsNHGLq7VcAO77CWwQ/zfZMSh0ZFM/
-----END PRIVATE KEY-----
''';

const _clientPem = '''
-----BEGIN CERTIFICATE-----
MIIBeDCCAR+gAwIBAgIUepH07ooVxX/dHGNU0X7a4OB9aq0wCgYIKoZIzj0EAwIw
GjEYMBYGA1UEAwwPTW9vbmZpbiBUZXN0IENBMCAXDTI2MTAxMjE4MTc0MVoYDzIx
MjYwOTE4MTgxNzQxWjAZMRcwFQYDVQQDDA5tb29uZmluLWNsaWVudDBZMBMGByqG
SM49AgEGCCqGSM49AwEHA0IABK23QKwpzN4K09TzDNRTBJJzxFxwLZXkOM8bQKPT
zP5v9ELjIS47GIYsOm+k5g0t6VdNNwZPCtGOo2BLsC4k8oijQjBAMB0GA1UdDgQW
BBR9AmuY8huZ7IOUVIY094kFsMSpaTAfBgNVHSMEGDAWgBTj8WQnscGQpI0ShOUw
UEh2UsHlnTAKBggqhkjOPQQDAgNHADBEAiBSrFyjYt9T8FyPJI8mRRHetSX4LJcd
xPD6mMLzvV3DggIgcyFGECkV9XB3j9DY+f8699G94Rg29VLKAHiqhjw6tIs=
-----END CERTIFICATE-----
''';

const _clientKey = '''
-----BEGIN PRIVATE KEY-----
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgIBOtFd52t/s0cGed
olzm4C0HJ83whYW0mF1Mh2p+/UyhRANCAAStt0CsKczeCtPU8wzUUwSSc8RccC2V
5DjPG0Cj08z+b/RC4yEuOxiGLDpvpOYNLelXTTcGTwrRjqNgS7AuJPKI
-----END PRIVATE KEY-----
''';

void main() {
  late HttpServer server;
  late List<String?> presented;

  setUp(() async {
    presented = [];
    final context = SecurityContext()
      ..useCertificateChainBytes(_serverPem.codeUnits)
      ..usePrivateKeyBytes(_serverKey.codeUnits)
      ..setTrustedCertificatesBytes(_caPem.codeUnits)
      ..setClientAuthoritiesBytes(_caPem.codeUnits);
    server = await HttpServer.bindSecure(
      InternetAddress.loopbackIPv4,
      0,
      context,
      requestClientCertificate: true,
    );
    server.listen((request) {
      presented.add(request.certificate?.subject);
      request.response.close();
    });
    // The server's certificate comes from the test CA.
    gAllowSelfSignedCertificates = true;
    gIsOwnServerHost = (_) => true;
    setClientCertificates(const [
      ClientCertificateMaterial(
        host: 'LocalHost.',
        chainPem: _clientPem,
        keyPem: _clientKey,
      ),
    ]);
  });

  tearDown(() async {
    setClientCertificates(const []);
    gAllowSelfSignedCertificates = false;
    gIsOwnServerHost = (_) => false;
    await server.close(force: true);
  });

  Future<void> get(String host) async {
    final dio = Dio();
    configureServerDio(dio);
    try {
      await dio.get<void>('https://$host:${server.port}/');
    } finally {
      dio.close(force: true);
    }
  }

  test('presents the certificate to the host it was imported for', () async {
    await get('localhost');
    expect(presented, ['/CN=moonfin-client']);
  });

  test('keeps the certificate from every other host', () async {
    await get('127.0.0.1');
    expect(presented, [null]);
  });

  test('stops presenting a certificate once it is removed', () async {
    setClientCertificates(const []);
    await get('localhost');
    expect(presented, [null]);
  });
}
