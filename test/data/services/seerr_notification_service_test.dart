import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr_notification_service.dart';

class _RecordingService extends SeerrNotificationService {
  final shown = <String>[];
  final requestIds = <String?>[];

  @override
  void present(
    String title,
    String body,
    String route, {
    String? requestId,
    bool isRequest = false,
  }) {
    shown.add('$title|$body|$route');
    requestIds.add(requestId);
  }
}

void main() {
  const wait = SeerrNotificationService.pushWait;

  test('a push with no stream copy shows after the wait', () {
    fakeAsync((async) {
      final service = _RecordingService();
      service.showPush('Moonfin Push Test', 'Working', '');
      async.elapse(wait - const Duration(milliseconds: 1));
      expect(service.shown, isEmpty);
      async.elapse(const Duration(milliseconds: 1));
      expect(service.shown, ['Moonfin Push Test|Working|']);
    });
  });

  test('repeated pushes with no stream copy all show', () {
    fakeAsync((async) {
      final service = _RecordingService();
      service.showPush('Moonfin Push Test', 'Working', '');
      async.elapse(wait);
      service.showPush('Moonfin Push Test', 'Working', '');
      async.elapse(wait);
      expect(service.shown, hasLength(2));
    });
  });

  test('a push after its stream copy stays quiet', () {
    fakeAsync((async) {
      final service = _RecordingService();
      service.show('Request approved', 'Dune', '/seerr/movie/1');
      async.elapse(const Duration(seconds: 20));
      service.showPush('Request approved', 'Dune', '/seerr/movie/1');
      async.elapse(wait);
      expect(service.shown, ['Request approved|Dune|/seerr/movie/1']);
    });
  });

  test('a push that beats its stream copy stays quiet and keeps the actions',
      () {
    fakeAsync((async) {
      final service = _RecordingService();
      service.showPush('New request', 'Dune', '/seerr/movie/1');
      async.elapse(const Duration(seconds: 1));
      service.show(
        'New request',
        'Dune',
        '/seerr/movie/1',
        requestId: '7',
        isRequest: true,
      );
      async.elapse(wait);
      expect(service.shown, hasLength(1));
      expect(service.requestIds, ['7']);
    });
  });

  test('a push whose body differs from its stream copy still matches', () {
    fakeAsync((async) {
      final service = _RecordingService();
      service.show('Stuck downloads', 'Dune on /mnt/a', '/seerr/downloads');
      service.showPush('Stuck downloads', 'Dune', '/seerr/downloads');
      async.elapse(wait);
      expect(service.shown, hasLength(1));
    });
  });

  test('a stream copy older than the window no longer quiets a push', () {
    fakeAsync((async) {
      final service = _RecordingService();
      service.show('Now available', 'Dune', '/seerr/movie/1');
      async.elapse(
        SeerrNotificationService.streamCopyWindow + const Duration(seconds: 1),
      );
      service.showPush('Now available', 'Dune', '/seerr/movie/1');
      async.elapse(wait);
      expect(service.shown, hasLength(2));
    });
  });

  test("a stream copy for another route doesn't quiet a push", () {
    fakeAsync((async) {
      final service = _RecordingService();
      service.show('Now available', 'Dune', '/seerr/movie/1');
      service.showPush('Now available', 'Arrival', '/seerr/movie/2');
      async.elapse(wait);
      expect(service.shown, hasLength(2));
    });
  });

  test('server message, watch party and empty pushes never show', () {
    fakeAsync((async) {
      final service = _RecordingService();
      service.showPush('Message from your server', 'Hi', 'messages');
      service.showPush(
        'Ana started a watch party',
        'Dune',
        '/watch-party?code=AB12',
      );
      service.showPush('', '', '/seerr/movie/1');
      async.elapse(wait);
      expect(service.shown, isEmpty);
    });
  });
}
