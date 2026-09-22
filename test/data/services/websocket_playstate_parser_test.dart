import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';

import 'package:moonfin/data/services/websocket_message_parser.dart';

PlaystateMessage? _parsePlaystate(Map<String, dynamic> data) =>
    WebSocketMessageParser.parseJson({'MessageType': 'Playstate', 'Data': data})
        as PlaystateMessage?;

void main() {
  test('a seek position arrives as a whole number', () {
    final message = _parsePlaystate({
      'Command': 'Seek',
      'SeekPositionTicks': 300000000,
    });

    expect(message?.command, 'Seek');
    expect(message?.seekPositionTicks, 300000000);
  });

  // A server answering with a JSON double used to throw here, and the throw
  // took the whole Seek with it, so the command looked like it did nothing.
  test('a seek position that arrives as a double still parses', () {
    final message = _parsePlaystate({
      'Command': 'Seek',
      'SeekPositionTicks': 300000000.0,
    });

    expect(message?.seekPositionTicks, 300000000);
  });

  test('a seek position that arrives as a string still parses', () {
    final message = _parsePlaystate({
      'Command': 'Seek',
      'SeekPositionTicks': '300000000',
    });

    expect(message?.seekPositionTicks, 300000000);
  });

  test('a command with no position is left with none', () {
    final message = _parsePlaystate({'Command': 'PlayPause'});

    expect(message?.command, 'PlayPause');
    expect(message?.seekPositionTicks, isNull);
  });

  test('a message with no command at all is dropped', () {
    expect(_parsePlaystate({'SeekPositionTicks': 1}), isNull);
  });
}
