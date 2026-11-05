import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/focus/dpad_keys.dart';

void main() {
  test('DVR and CEC Contents Menu open Recordings, Menu does not', () {
    expect(LogicalKeyboardKey.dvr.isRecordingsKey, isTrue);
    expect(LogicalKeyboardKey.tvContentsMenu.isRecordingsKey, isTrue);
    expect(LogicalKeyboardKey.contextMenu.isRecordingsKey, isFalse);
  });
}
