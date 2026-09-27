import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/remote_command_queue.dart';

void main() {
  test(
    'preserves quick presses in order with only one request in flight',
    () async {
      final first = Completer<void>();
      final sent = <String>[];
      final errors = <Object>[];
      final queue = RemoteCommandQueue(
        send: (command) async {
          sent.add(command);
          if (sent.length == 1) await first.future;
        },
        onError: errors.add,
      );
      queue.add('MoveRight');
      queue.add('MoveRight');
      queue.add('Select');
      expect(sent, ['MoveRight']);
      first.complete();
      await queue.settled;
      expect(sent, ['MoveRight', 'MoveRight', 'Select']);
      expect(errors, isEmpty);
    },
  );

  test('closing discards pending presses and does not replay them', () async {
    final first = Completer<void>();
    final sent = <String>[];
    final queue = RemoteCommandQueue(
      send: (command) async {
        sent.add(command);
        await first.future;
      },
      onError: (error) => fail('$error'),
    );
    queue.add('MoveDown');
    queue.add('Select');
    queue.close();
    first.complete();
    await queue.settled;
    queue.add('Back');
    expect(sent, ['MoveDown']);
  });

  test(
    'a failed press clears the queue and reports once without retry',
    () async {
      final first = Completer<void>();
      final sent = <String>[];
      final errors = <Object>[];
      final queue = RemoteCommandQueue(
        send: (command) async {
          sent.add(command);
          await first.future;
        },
        onError: errors.add,
      );
      queue.add('Select');
      queue.add('Back');
      first.completeError(StateError('offline'));
      await queue.settled;
      queue.add('Select');
      expect(sent, ['Select']);
      expect(errors, hasLength(1));
    },
  );

  test('old presses are discarded after a slow request', () async {
    var now = DateTime(2026);
    final first = Completer<void>();
    final sent = <String>[];
    final errors = <Object>[];
    final queue = RemoteCommandQueue(
      send: (command) async {
        sent.add(command);
        await first.future;
      },
      onError: errors.add,
      now: () => now,
    );
    queue.add('MoveRight');
    queue.add('Select');
    now = now.add(const Duration(seconds: 3));
    first.complete();
    await queue.settled;
    expect(sent, ['MoveRight']);
    expect(errors.single, isA<TimeoutException>());
  });

  test('a burst cannot build an unbounded backlog', () async {
    final first = Completer<void>();
    final sent = <String>[];
    final errors = <Object>[];
    final queue = RemoteCommandQueue(
      send: (command) async {
        sent.add(command);
        await first.future;
      },
      onError: errors.add,
    );
    for (var i = 0; i < 20; i++) {
      queue.add('MoveDown');
    }
    first.complete();
    await queue.settled;
    expect(sent, ['MoveDown']);
    expect(errors, hasLength(1));
  });
}
