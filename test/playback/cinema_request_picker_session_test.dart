import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/cinema_request_picker_session.dart';

void main() {
  test('queue transitions give one ten-second grace period', () {
    fakeAsync((time) {
      var dismissed = 0;
      final session = CinemaRequestPickerSession(
        accountKey: () => 'account',
        isMounted: () => true,
      )..dismissDialog = () => dismissed++;
      session.beginGrace();
      time.elapse(const Duration(seconds: 9));
      session.beginGrace(); // A second transition should not restart the grace period.
      expect(session.isCurrent, isTrue);
      time.elapse(const Duration(seconds: 1));
      expect(session.isCurrent, isFalse);
      expect(dismissed, 1);
      session.close();
      expect(dismissed, 1);
    });
  });

  test('Skip preserves a submitting request; player exit still closes it', () {
    fakeAsync((time) {
      var dismissals = 0;
      final session = CinemaRequestPickerSession(
        accountKey: () => 'account',
        isMounted: () => true,
      )..dismissDialog = () => dismissals++;
      session.beginGrace();
      session.markSubmitting();
      expect(session.closeForSkip(), isFalse);
      session.beginGrace();
      time.elapse(const Duration(seconds: 30));
      expect(session.isCurrent, isTrue);
      expect(dismissals, 0);

      session.close();
      expect(session.isCurrent, isFalse);
      expect(dismissals, 1);
    });
  });
}
