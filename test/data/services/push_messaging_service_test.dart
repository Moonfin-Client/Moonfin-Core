import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/push_messaging_service.dart';
import 'package:moonfin/data/services/seerr_notification_service.dart';

class _MockSeerrNotificationService extends Mock
    implements SeerrNotificationService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockSeerrNotificationService mockService;

  setUp(() {
    mockService = _MockSeerrNotificationService();
    GetIt.instance.registerSingleton<SeerrNotificationService>(mockService);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  test('handleForegroundMessage forwards notification payload to SeerrNotificationService', () {
    const message = RemoteMessage(
      notification: RemoteNotification(
        title: 'Moonfin Push Test',
        body: 'Notifications are working properly!',
      ),
      data: {
        'route': '/settings/seerr',
        'requestId': '123',
        'kind': 'request',
      },
    );

    when(() => mockService.show(
          any(),
          any(),
          any(),
          requestId: any(named: 'requestId'),
          isRequest: any(named: 'isRequest'),
        )).thenReturn(null);

    PushMessagingService.handleForegroundMessage(message);

    verify(() => mockService.show(
          'Moonfin Push Test',
          'Notifications are working properly!',
          '/settings/seerr',
          requestId: '123',
          isRequest: true,
        )).called(1);
  });

  test('handleForegroundMessage falls back to data payload if notification is absent', () {
    const message = RemoteMessage(
      data: {
        'title': 'Data Title',
        'body': 'Data Body',
        'route': '/movies/456',
      },
    );

    when(() => mockService.show(
          any(),
          any(),
          any(),
          requestId: any(named: 'requestId'),
          isRequest: any(named: 'isRequest'),
        )).thenReturn(null);

    PushMessagingService.handleForegroundMessage(message);

    verify(() => mockService.show(
          'Data Title',
          'Data Body',
          '/movies/456',
          requestId: null,
          isRequest: false,
        )).called(1);
  });

  test('handleForegroundMessage does nothing when title and body are empty', () {
    const message = RemoteMessage(
      data: {'route': '/settings'},
    );

    PushMessagingService.handleForegroundMessage(message);

    verifyNever(() => mockService.show(
          any(),
          any(),
          any(),
          requestId: any(named: 'requestId'),
          isRequest: any(named: 'isRequest'),
        ));
  });
}
