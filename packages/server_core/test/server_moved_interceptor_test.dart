// Entry redirect (portnook fork): tests for server_moved_interceptor.dart.
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  group('a server that moved', () {
    late HttpServer moved;
    var movedHandled = 0;

    setUp(() async {
      movedHandled = 0;
      moved = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      moved.listen((request) async {
        movedHandled++;
        request.response.write('${request.method} ${request.uri.path}');
        await request.response.close();
      });
    });

    tearDown(() async {
      ServerMoved.resolver = null;
      ServerMoved.serverAt = null;
      await moved.close(force: true);
    });

    // A port nothing listens on, like the old target of a moved redirect.
    Future<String> deadBase() async {
      final socket = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
      final port = socket.port;
      await socket.close();
      return 'http://127.0.0.1:$port';
    }

    // Takes the whole request and closes before any header goes back, which
    // Dio reports as a connection error although the server got the body.
    var droppedHandled = 0;
    Future<String> droppingBase() async {
      droppedHandled = 0;
      final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      addTearDown(() => server.close(force: true));
      server.listen((request) async {
        droppedHandled++;
        await request.drain<void>();
        final socket = await request.response.detachSocket(writeHeaders: false);
        socket.destroy();
      });
      return 'http://127.0.0.1:${server.port}';
    }

    test('a GET that fails to connect goes to its new address', () async {
      ServerMoved.resolver = (_, {serverId}) async =>
          'http://127.0.0.1:${moved.port}';
      final dio = Dio(BaseOptions(baseUrl: await deadBase()));
      configureServerDio(dio);

      try {
        final response = await dio.get<String>('/System/Ping');
        expect(response.data, 'GET /System/Ping');
      } finally {
        dio.close(force: true);
      }
    });

    test(
      'a multipart upload that fails to connect goes to its new address',
      () async {
        ServerMoved.resolver = (_, {serverId}) async =>
            'http://127.0.0.1:${moved.port}';
        final dio = Dio(BaseOptions(baseUrl: await deadBase()));
        configureServerDio(dio);

        try {
          final response = await dio.post<String>(
            '/Upload',
            data: FormData.fromMap({'file': MultipartFile.fromString('x')}),
          );
          expect(response.data, 'POST /Upload');
        } finally {
          dio.close(force: true);
        }
      },
    );

    test('the resolver hears which server the request started for', () async {
      final dead = await deadBase();
      final asked = <String?>[];
      ServerMoved.serverAt = (baseUrl) => baseUrl == dead ? 'server-1' : null;
      ServerMoved.resolver = (_, {serverId}) async {
        asked.add(serverId);
        return 'http://127.0.0.1:${moved.port}';
      };
      final dio = Dio(BaseOptions(baseUrl: dead));
      configureServerDio(dio);

      try {
        await dio.get<String>('/System/Ping');
        expect(asked, ['server-1']);
      } finally {
        dio.close(force: true);
      }
    });

    test('a POST that was already sent is not sent again', () async {
      final dropping = await droppingBase();
      ServerMoved.resolver = (_, {serverId}) async =>
          'http://127.0.0.1:${moved.port}';
      final dio = Dio(BaseOptions(baseUrl: dropping));
      configureServerDio(dio);

      try {
        await expectLater(
          dio.post<String>('/Sessions/Playing', data: {'a': 1}),
          throwsA(
            isA<DioException>().having(
              (e) => e.type,
              'type',
              DioExceptionType.connectionError,
            ),
          ),
        );
        expect(droppedHandled, 1);
        expect(movedHandled, 0);
      } finally {
        dio.close(force: true);
      }
    });

    test('a GET that was already sent still goes to its new address', () async {
      final dropping = await droppingBase();
      ServerMoved.resolver = (_, {serverId}) async =>
          'http://127.0.0.1:${moved.port}';
      final dio = Dio(BaseOptions(baseUrl: dropping));
      configureServerDio(dio);

      try {
        final response = await dio.get<String>('/Users/Me');
        expect(response.data, 'GET /Users/Me');
        expect(droppedHandled, 1);
      } finally {
        dio.close(force: true);
      }
    });

    test('a request that fails to connect goes to its new address', () async {
      final dead = await deadBase();
      final asked = <String>[];
      ServerMoved.resolver = (baseUrl, {serverId}) async {
        asked.add(baseUrl);
        return 'http://127.0.0.1:${moved.port}';
      };
      final dio = Dio(BaseOptions(baseUrl: dead));
      configureServerDio(dio);

      try {
        final response = await dio.post<String>('/Sessions/Playing');
        expect(response.data, 'POST /Sessions/Playing');
        expect(asked, [dead]);
      } finally {
        dio.close(force: true);
      }
    });

    test('a server that can move gives up connecting sooner', () async {
      ServerMoved.canMove = (baseUrl) => baseUrl == 'http://127.0.0.1:1';
      Duration? used;
      final dio = Dio(
        BaseOptions(
          baseUrl: 'http://127.0.0.1:${moved.port}',
          connectTimeout: const Duration(seconds: 8),
        ),
      );
      configureServerDio(dio);
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            used = options.connectTimeout;
            handler.next(options);
          },
        ),
      );

      try {
        await dio.get<String>('/a');
        expect(used, const Duration(seconds: 8));
        dio.options.baseUrl = 'http://127.0.0.1:1';
        await expectLater(dio.get<String>('/a'), throwsA(isA<DioException>()));
        expect(used, ServerMoved.connectTimeout);
      } finally {
        ServerMoved.canMove = null;
        dio.close(force: true);
      }
    });

    test('nothing moved leaves the failure as it was', () async {
      ServerMoved.resolver = (_, {serverId}) async => null;
      final dio = Dio(BaseOptions(baseUrl: await deadBase()));
      configureServerDio(dio);

      try {
        await expectLater(
          dio.get<String>('/System/Ping'),
          throwsA(isA<DioException>()),
        );
      } finally {
        dio.close(force: true);
      }
    });
  });
}
