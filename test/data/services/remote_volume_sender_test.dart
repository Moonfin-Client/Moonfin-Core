import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/remote_volume_sender.dart';

void main() {
  test(
    'coalesces pending slider edits without reordering mute or steps',
    () async {
      final sent = <(String, int?)>[];
      final barrier = Completer<void>();
      final sender = RemoteVolumeSender((command, volume) async {
        sent.add((command, volume));
        if (sent.length == 1) await barrier.future;
      });
      final first = sender.add('SetVolume', volume: 20);
      sender.add('SetVolume', volume: 30);
      sender.add('SetVolume', volume: 40);
      sender.add('Mute');
      sender.add('SetVolume', volume: 1);
      sender.add('VolumeUp');
      expect(sent, [('SetVolume', 20)]);
      barrier.complete();
      await first;
      expect(sent, [
        ('SetVolume', 20),
        ('SetVolume', 40),
        ('Mute', null),
        ('SetVolume', 1),
        ('VolumeUp', null),
      ]);
    },
  );
  test(
    'closing drops queued actions on receiver change or backgrounding',
    () async {
      final barrier = Completer<void>();
      final sent = <int?>[];
      final sender = RemoteVolumeSender((_, value) async {
        sent.add(value);
        await barrier.future;
      });
      final pending = sender.add('SetVolume', volume: 20);
      sender.add('SetVolume', volume: 40);
      sender.close();
      barrier.complete();
      await pending;
      expect(sent, [20]);
    },
  );
  test('failure does not replay later gestures', () async {
    final barrier = Completer<void>();
    var sends = 0;
    final sender = RemoteVolumeSender((_, _) async {
      sends++;
      await barrier.future;
      throw StateError('offline');
    });
    final pending = sender.add('Mute');
    sender.add('SetVolume', volume: 80);
    final failed = expectLater(pending, throwsStateError);
    barrier.complete();
    await failed;
    expect(sends, 1);
  });
}
