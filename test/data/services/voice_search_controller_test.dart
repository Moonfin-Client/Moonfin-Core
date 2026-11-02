import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/voice_search_controller.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

/// Stands in for the plugin, one instance shared by every controller like the
/// real singleton.
class _FakeSpeech extends Fake implements stt.SpeechToText {
  @override
  stt.SpeechStatusListener? statusListener;

  @override
  stt.SpeechErrorListener? errorListener;

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      switch (invocation.memberName) {
        #initialize => Future<bool>.value(true),
        #listen || #stop || #cancel => Future<void>.value(),
        _ => super.noSuchMethod(invocation),
      };
}

Future<VoiceSearchStartResult> _listen(
  VoiceSearchController controller, {
  void Function()? onError,
}) => controller.startListening(
  localeCode: 'en_US',
  onText: (_, {required isFinal}) {},
  onError: onError,
);

void main() {
  // Windows skips the mobile permission prompt and is where the sound
  // statuses come from.
  setUp(() => debugDefaultTargetPlatformOverride = TargetPlatform.windows);
  tearDown(() => debugDefaultTargetPlatformOverride = null);

  test(
    'a later controller still hears the end of listening and errors',
    () async {
      final speech = _FakeSpeech();
      final first = VoiceSearchController(speechToText: speech);
      await _listen(first);
      first.dispose();
      expect(speech.statusListener, isNull);

      final second = VoiceSearchController(speechToText: speech);
      var errors = 0;
      expect(
        await _listen(second, onError: () => errors++),
        VoiceSearchStartResult.listeningStarted,
      );
      expect(second.isListening, isTrue);

      speech.statusListener!(stt.SpeechToText.doneStatus);
      expect(second.isListening, isFalse);

      await _listen(second, onError: () => errors++);
      speech.errorListener!(SpeechRecognitionError('error_no_match', false));
      expect(second.isListening, isFalse);
      expect(second.lastErrorCode, 'error_no_match');
      expect(errors, 1);
    },
  );

  test('sound statuses keep the mic listening until it stops', () async {
    final speech = _FakeSpeech();
    final controller = VoiceSearchController(speechToText: speech);
    await _listen(controller);

    speech.statusListener!('soundDetected');
    speech.statusListener!('soundEnded');
    expect(controller.isListening, isTrue);

    speech.statusListener!(stt.SpeechToText.notListeningStatus);
    expect(controller.isListening, isFalse);
  });
}
