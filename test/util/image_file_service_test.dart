import 'dart:async';
import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:moonfin/util/artwork_request_scheduler.dart';
import 'package:moonfin/util/image_fetch_priority.dart';
import 'package:moonfin/util/image_file_service.dart';
import 'package:moonfin/util/tv_image_cache_io.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late HttpServer server;

  setUp(() async {
    // The test binding answers every request itself, and these need loopback.
    HttpOverrides.global = null;
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  });

  tearDown(() => server.close(force: true));

  String base() => 'http://127.0.0.1:${server.port}';

  const slots = 4;
  BoundedImageFileService boundedService() => BoundedImageFileService(
    http.Client(),
    concurrentFetches: slots,
    headerTimeout: const Duration(milliseconds: 400),
    stallTimeout: const Duration(milliseconds: 400),
  );

  void answerNormally(HttpRequest request) {
    request.response.headers.contentType = ContentType('image', 'jpeg');
    request.response.add(List<int>.filled(32, 0x41));
    request.response.close();
  }

  group('a request that never answers', () {
    test('gives up instead of waiting forever', () async {
      server.listen((request) {});

      await expectLater(
        boundedService().get('${base()}/never'),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('is not asked for a second time', () async {
      var seen = 0;
      server.listen((request) => seen++);

      await expectLater(
        boundedService().get('${base()}/never'),
        throwsA(isA<TimeoutException>()),
      );
      // Waiting the whole budget twice is worse than reporting it once.
      expect(seen, 1);
    });
  });

  group('a connection that died before answering', () {
    test('is asked for again on a fresh one', () async {
      var seen = 0;
      server.listen((request) async {
        seen++;
        if (seen == 1) {
          // No bytes at all, which is what a connection the peer let go of
          // looks like. Letting the headers out first would be a live server
          // that failed mid transfer instead.
          (await request.response.detachSocket(writeHeaders: false)).destroy();
          return;
        }
        answerNormally(request);
      });

      final response = await boundedService().get('${base()}/poster');

      expect(response.statusCode, HttpStatus.ok);
      expect(seen, 2);
    });

    test('gives up after the second death rather than looping', () async {
      var seen = 0;
      server.listen((request) async {
        seen++;
        (await request.response.detachSocket(writeHeaders: false)).destroy();
      });

      // Not a timeout, or the second attempt never went out.
      await expectLater(
        boundedService().get('${base()}/poster'),
        throwsA(isNot(isA<TimeoutException>())),
      );
      expect(seen, 2);
    });
  });

  test('a transfer that stops part way through is reported', () async {
    server.listen((request) async {
      final socket = await request.response.detachSocket(writeHeaders: false);
      socket.write(
        'HTTP/1.1 200 OK\r\n'
        'Content-Type: image/jpeg\r\n'
        'Content-Length: 4096\r\n'
        '\r\n'
        'only a little',
      );
      await socket.flush();
      // Headers and part of the body are out, then it stops delivering.
    });

    final response = await boundedService().get('${base()}/big');

    await expectLater(response.content, emitsThrough(emitsError(anything)));
  });

  // Artwork that never arrived used to hold its slot for the life of the
  // process, so every later image queued behind it and nothing short of
  // restarting the app brought pictures back.
  test(
    'a full set of stuck fetches still lets a later image through',
    () async {
      var seen = 0;
      server.listen((request) {
        seen++;
        // The first batch takes every slot and never answers.
        if (seen <= slots) return;
        answerNormally(request);
      });

      final manager = CacheManager(
        Config(
          'wedge-probe',
          stalePeriod: const Duration(days: 1),
          repo: NonStoringObjectProvider(),
          fileSystem: MemoryCacheSystem(),
          fileService: boundedService(),
        ),
      );

      for (var i = 0; i < slots; i++) {
        manager
            .getFileStream('${base()}/stuck$i')
            .listen((_) {}, onError: (_) {});
      }
      await Future<void>.delayed(const Duration(milliseconds: 150));

      final arrived = Completer<bool>();
      manager
          .getFileStream('${base()}/wanted')
          .listen(
            (_) {
              if (!arrived.isCompleted) arrived.complete(true);
            },
            onError: (_) {
              if (!arrived.isCompleted) arrived.complete(false);
            },
          );

      expect(
        await arrived.future.timeout(
          const Duration(seconds: 5),
          onTimeout: () => false,
        ),
        isTrue,
      );
    },
  );

  // Anything admitted past the connections the client will open waits in a
  // queue inside dart:io that nothing times out, which is the wedge this whole
  // service exists to avoid. The scheduler holds that line now, and the cache
  // manager's own gate is opened wide so the order is the scheduler's.
  test('never admits more artwork at once than it will connect', () {
    final service = buildImageFileService();
    expect(
      service.scheduler!.slots,
      lessThanOrEqualTo(buildImageHttpClient().maxConnectionsPerHost!),
    );
    expect(service.concurrentFetches, greaterThan(service.scheduler!.slots));
  });

  group('with a scheduler', () {
    // A server that answers nothing until told to, one path at a time, and
    // records the order requests arrived in.
    late List<String> arrived;
    late Map<String, HttpRequest> held;

    setUp(() {
      arrived = <String>[];
      held = <String, HttpRequest>{};
      server.listen((request) {
        arrived.add(request.uri.path);
        held[request.uri.path] = request;
      });
    });

    void answer(String path) {
      final request = held.remove(path)!;
      answerNormally(request);
    }

    /// Sends headers and a first chunk, then leaves the body open.
    Future<HttpResponse> openBody(String path) async {
      final response = held.remove(path)!.response;
      response.bufferOutput = false;
      response.headers.contentType = ContentType('image', 'jpeg');
      response.add(List<int>.filled(8, 0x41));
      await response.flush();
      return response;
    }

    Future<void> drain(FileServiceResponse response) =>
        response.content.drain<void>();

    BoundedImageFileService scheduled({int slots = 2}) =>
        BoundedImageFileService(
          http.Client(),
          concurrentFetches: 4096,
          scheduler: ArtworkRequestScheduler(
            slots: slots,
            batchGap: const Duration(milliseconds: 20),
          ),
        );

    Future<void> settle() =>
        Future<void>.delayed(const Duration(milliseconds: 60));

    test('a newer batch goes out before the rest of an older one', () async {
      final service = scheduled();
      final responses = <String, Future<FileServiceResponse>>{};
      for (final name in ['a1', 'a2', 'a3', 'a4']) {
        responses[name] = service.get('${base()}/$name');
      }
      await settle();
      expect(arrived, ['/a1', '/a2'], reason: 'two slots, two on the wire');
      for (final name in ['b1', 'b2']) {
        responses[name] = service.get('${base()}/$name');
      }
      await settle();
      expect(held.length, 2, reason: 'queued requests open no connection');

      answer('/a1');
      await drain(await responses['a1']!);
      await settle();
      answer('/a2');
      await drain(await responses['a2']!);
      await settle();
      expect(arrived, ['/a1', '/a2', '/b1', '/b2']);

      answer('/b1');
      await drain(await responses['b1']!);
      answer('/b2');
      await drain(await responses['b2']!);
      await settle();
      expect(arrived.sublist(4), ['/a3', '/a4']);
      for (final name in ['a3', 'a4']) {
        answer('/$name');
        await drain(await responses[name]!);
      }
    });

    test('high goes first and low waits for an idle line', () async {
      final service = scheduled(slots: 1);
      final first = service.get('${base()}/first');
      await settle();
      final low = service.get(
        '${base()}/low',
        headers: {imageFetchPriorityHeader: 'low'},
      );
      final normal = service.get('${base()}/normal');
      final high = service.get(
        '${base()}/high',
        headers: {imageFetchPriorityHeader: 'high'},
      );
      await settle();
      expect(arrived, ['/first']);
      expect(
        held['/first']!.headers.value(imageFetchPriorityHeader),
        isNull,
        reason: 'the lane never reaches the server',
      );

      for (final name in ['first', 'high', 'normal', 'low']) {
        answer('/$name');
        await drain(
          await switch (name) {
            'first' => first,
            'high' => high,
            'normal' => normal,
            _ => low,
          },
        );
        await settle();
      }
      expect(arrived, ['/first', '/high', '/normal', '/low']);
      expect(
        held.keys.where((k) => k == '/high' || k == '/low'),
        isEmpty,
      );
    });

    test('the header timeout starts at admission, not at enqueue', () async {
      final service = BoundedImageFileService(
        http.Client(),
        concurrentFetches: 4096,
        headerTimeout: const Duration(milliseconds: 150),
        scheduler: ArtworkRequestScheduler(slots: 1),
      );
      final first = service.get('${base()}/hold');
      await settle();
      // Headers arrive at once, the body doesn't, so the one slot stays
      // taken well past the header timeout.
      final holding = await openBody('/hold');
      final firstResponse = await first;
      final queued = service.get('${base()}/queued');
      await Future<void>.delayed(const Duration(milliseconds: 400));
      expect(held.containsKey('/queued'), isFalse, reason: 'still queued');
      await holding.close();
      await drain(firstResponse);
      await settle();
      expect(arrived, ['/hold', '/queued']);
      answer('/queued');
      final response = await queued;
      expect(response.statusCode, 200);
      await drain(response);
    });

    test('a failed request gives its slot back', () async {
      final service = scheduled(slots: 1);
      final failing = service.get('${base()}/fail');
      await settle();
      final next = service.get('${base()}/next');
      final request = held.remove('/fail')!;
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
      // A 404 carries nothing the cache manager reads, so the slot returns
      // as the response does.
      await failing;
      await settle();
      expect(arrived, ['/fail', '/next']);
      answer('/next');
      await drain(await next);
    });

    // Every slot is held until its body ends. A body that is abandoned, or
    // never read at all, has to give the slot back too, or a few disposed
    // widgets wedge every later image.
    test('a download abandoned partway gives its slot back', () async {
      final service = scheduled(slots: 1);
      final pending = service.get('${base()}/abandoned');
      await settle();
      await openBody('/abandoned');

      final reading = (await pending).content.listen((_) {});
      await settle();
      await reading.cancel();
      await settle();

      final next = service.get('${base()}/after');
      await settle();
      expect(arrived, ['/abandoned', '/after']);
      answer('/after');
      await drain(await next);
    });

    test('a body nobody reads gives its slot back', () async {
      final service = BoundedImageFileService(
        http.Client(),
        concurrentFetches: 4096,
        stallTimeout: const Duration(milliseconds: 100),
        scheduler: ArtworkRequestScheduler(slots: 1),
      );
      // The cache manager throws on some headers and drops the response
      // without ever touching its body.
      final pending = service.get('${base()}/unread');
      await settle();
      answer('/unread');
      await pending;
      await Future<void>.delayed(const Duration(milliseconds: 250));

      final next = service.get('${base()}/after-unread');
      await settle();
      expect(arrived, ['/unread', '/after-unread']);
      answer('/after-unread');
      await drain(await next);
    });

    test('a request past the wait ceiling goes before a newer one', () async {
      final service = BoundedImageFileService(
        http.Client(),
        concurrentFetches: 4096,
        scheduler: ArtworkRequestScheduler(
          slots: 1,
          batchGap: const Duration(milliseconds: 5),
          maxWait: const Duration(milliseconds: 100),
        ),
      );
      final holder = service.get('${base()}/holder');
      await settle();
      final waited = service.get('${base()}/waited-for');
      // Long enough that it is past the ceiling when the slot frees up.
      await Future<void>.delayed(const Duration(milliseconds: 200));
      final newer = service.get('${base()}/newer');
      await settle();
      expect(arrived, ['/holder'], reason: 'both should still be queued');

      answer('/holder');
      await drain(await holder);
      await settle();
      expect(arrived, ['/holder', '/waited-for']);

      answer('/waited-for');
      await drain(await waited);
      await settle();
      answer('/newer');
      await drain(await newer);
    });

    test('a promoted request jumps its old batch', () async {
      final scheduler = ArtworkRequestScheduler(
        slots: 1,
        batchGap: const Duration(milliseconds: 20),
      );
      final service = BoundedImageFileService(
        http.Client(),
        concurrentFetches: 4096,
        scheduler: scheduler,
      );
      final first = service.get('${base()}/first');
      await settle();
      final old = service.get('${base()}/old');
      await settle();
      final newer = service.get('${base()}/newer');
      await settle();
      scheduler.promote('${base()}/old', ImageFetchPriority.normal);

      answer('/first');
      await drain(await first);
      await settle();
      expect(arrived, ['/first', '/old']);
      answer('/old');
      await drain(await old);
      await settle();
      answer('/newer');
      await drain(await newer);
    });
  });
}
