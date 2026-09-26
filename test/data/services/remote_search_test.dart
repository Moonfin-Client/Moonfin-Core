import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/remote_search_sender.dart';
import 'package:moonfin/data/services/remote_search_session.dart';

void main() {
  test('keeps the newest phrase while opening, then replaces and clears', () {
    final session = RemoteSearchSession('phone');
    final values = <String>[];
    session.receive({'String': 'al'});
    session.receive({'String': 'alien'});
    session.attach(values.add);
    session.receive({'String': 'ali'});
    session.receive({'String': ''});
    session.receive({});
    expect(values, ['alien', 'ali', '']);
    expect(session.opening, isFalse);
  });

  test('ignores another editor, malformed and out-of-order revisions', () {
    final session = RemoteSearchSession('phone');
    final values = <String>[];
    session.attach(values.add);
    void edit(String id, String revision, String text) => session.receive({
      'String': text,
      'MoonfinInputId': id,
      'MoonfinRevision': revision,
    });
    edit('phone', '2', 'élève 日本語');
    edit('phone', '1', 'old');
    edit('other', '3', 'wrong phone');
    edit('phone', 'oops', 'invalid');
    edit('phone', '2', 'duplicate');
    expect(values, ['', 'élève 日本語']);
    session.close();
    edit('phone', '4', 'closed');
    session.attach(values.add);
    expect(values, ['', 'élève 日本語']);
  });

  test(
    'waits for navigation before sending the newest committed text',
    () async {
      final open = Completer<void>();
      final commands = <(String, Map<String, String>)>[];
      final sender = RemoteSearchSender(
        inputId: 'phone',
        send: (name, args) async {
          commands.add((name, args));
          if (name == 'GoToSearch') await open.future;
        },
      );
      final flush = sender.flush();
      sender.setText('a');
      sender.setText('alien');
      expect(commands.map((c) => c.$1), ['GoToSearch']);
      open.complete();
      await flush;
      expect(commands.last.$1, 'SendString');
      expect(commands.last.$2, {
        'String': 'alien',
        'MoonfinInputId': 'phone',
        'MoonfinRevision': '1',
      });
      sender.close();
    },
  );

  test(
    'coalesces in-flight edits and sends clear after the previous value',
    () async {
      final firstText = Completer<void>();
      final values = <String>[];
      final sender = RemoteSearchSender(
        inputId: 'p',
        send: (name, args) async {
          if (name == 'SendString') {
            values.add(args['String']!);
            if (values.length == 1) await firstText.future;
          }
        },
      );
      await sender.flush();
      sender.setText('first');
      final pending = sender.flush();
      sender.setText('second');
      sender.setText('');
      firstText.complete();
      await pending;
      expect(values, ['first', '']);
      sender.close();
    },
  );

  test('failed text can be retried without replaying navigation', () async {
    var fail = true;
    final calls = <String>[];
    final sender = RemoteSearchSender(
      inputId: 'p',
      send: (name, args) async {
        calls.add(name);
        if (name == 'SendString' && fail) throw StateError('offline');
      },
    );
    sender.setText('alien');
    await expectLater(sender.flush(), throwsStateError);
    fail = false;
    await sender.flush();
    expect(calls, ['GoToSearch', 'SendString', 'SendString']);
    sender.close();
  });

  test('closing drops text waiting behind an in-flight command', () async {
    final open = Completer<void>();
    final calls = <String>[];
    final sender = RemoteSearchSender(
      inputId: 'p',
      send: (name, args) async {
        calls.add(name);
        await open.future;
      },
    );
    sender.setText('must not escape');
    final pending = sender.flush();
    sender.close();
    open.complete();
    await pending;
    await sender.flush();
    expect(calls, ['GoToSearch']);
  });
}
