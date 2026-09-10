import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';

void main() {
  group('coming back to a reachable server', () {
    bool reloads({required bool canReach, required bool couldReach}) =>
        HomeViewModel.reloadsOnReachability(
          canReachServer: canReach,
          couldReachServer: couldReach,
        );

    test('loads again once the server answers', () {
      expect(reloads(canReach: true, couldReach: false), isTrue);
    });

    test('leaves a home that was never offline alone', () {
      expect(reloads(canReach: true, couldReach: true), isFalse);
    });

    test('does not load on the way out', () {
      expect(reloads(canReach: false, couldReach: true), isFalse);
    });

    test('does not load while it stays unreachable', () {
      expect(reloads(canReach: false, couldReach: false), isFalse);
    });
  });
}
