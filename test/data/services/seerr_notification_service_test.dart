import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr_notification_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SeerrNotificationService service;

  setUp(() {
    service = SeerrNotificationService();
  });

  test('show deduplicates identical notifications within window and clears properly', () {
    expect(service.recentEventsCount, equals(0));

    service.show('Title 1', 'Body 1', '/route/1');
    expect(service.recentEventsCount, equals(1));

    // Second identical call within window is ignored
    service.show('Title 1', 'Body 1', '/route/1');
    expect(service.recentEventsCount, equals(1));

    // A different notification is accepted
    service.show('Title 2', 'Body 2', '/route/2');
    expect(service.recentEventsCount, equals(2));

    service.clearRecentEvents();
    expect(service.recentEventsCount, equals(0));

    // After clearing, Title 1 is accepted again
    service.show('Title 1', 'Body 1', '/route/1');
    expect(service.recentEventsCount, equals(1));
  });

  test('show deduplicates Android push without requestId against stream copy with requestId', () {
    // Android FCM push arrives first without requestId
    service.show(
      'Movie Requested',
      'User requested The Matrix',
      '/requests/42',
      requestId: null,
      isRequest: false,
    );
    expect(service.recentEventsCount, equals(1));

    // Stream event arrives with requestId populated
    service.show(
      'Movie Requested',
      'User requested The Matrix',
      '/requests/42',
      requestId: '42',
      isRequest: true,
    );
    // Keys match, so duplicate is dropped
    expect(service.recentEventsCount, equals(1));
  });
}
