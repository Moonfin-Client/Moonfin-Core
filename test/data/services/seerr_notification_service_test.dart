import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr_notification_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SeerrNotificationService service;

  setUp(() {
    service = SeerrNotificationService();
  });

  test('show deduplicates identical notifications within window', () {
    service.show('Title 1', 'Body 1', '/route/1');
    // Second identical call within window is ignored
    service.show('Title 1', 'Body 1', '/route/1');

    // A different notification is accepted
    service.show('Title 2', 'Body 2', '/route/2');

    service.clearRecentEvents();
    // After clearing, Title 1 is accepted again
    service.show('Title 1', 'Body 1', '/route/1');
  });
}
