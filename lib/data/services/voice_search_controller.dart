import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../util/platform_detection.dart';

typedef VoiceSearchTextListener =
    void Function(String text, {required bool isFinal});

enum VoiceSearchStartResult {
  listeningStarted,
  unavailable,
  permissionDenied,
  permissionDeniedPermanently,
  failed,
}

enum _MicrophonePermissionState { granted, denied, permanentlyDenied }

class VoiceSearchController extends ChangeNotifier {
  VoiceSearchController({stt.SpeechToText? speechToText})
    : _speechToText = speechToText ?? stt.SpeechToText();

  /// Linux and tvOS have no speech recognizer for the plugin to use.
  static bool get isSupported =>
      !PlatformDetection.isLinux && !PlatformDetection.isAppleTV;

  final stt.SpeechToText _speechToText;
  VoidCallback? _onListenError;

  bool _isListening = false;
  bool _isInitializing = false;
  bool _isReady = false;
  String? _lastErrorCode;
  bool _lastErrorPermanent = false;
  bool _permissionDenied = false;
  bool _permissionPermanentlyDenied = false;

  bool get isListening => _isListening;
  bool get isInitializing => _isInitializing;
  bool get isReady => _isReady;
  String? get lastErrorCode => _lastErrorCode;
  bool get lastErrorPermanent => _lastErrorPermanent;
  bool get permissionDenied => _permissionDenied;
  bool get permissionPermanentlyDenied => _permissionPermanentlyDenied;

  void clearError() {
    _lastErrorCode = null;
    _lastErrorPermanent = false;
    _permissionDenied = false;
    _permissionPermanentlyDenied = false;
    notifyListeners();
  }

  /// [onError] runs when the recognizer gives up after it started, for example
  /// when it heard nothing.
  Future<VoiceSearchStartResult> startListening({
    required String localeCode,
    required VoiceSearchTextListener onText,
    VoidCallback? onError,
  }) async {
    if (_isListening) {
      return VoiceSearchStartResult.listeningStarted;
    }

    _lastErrorCode = null;
    _lastErrorPermanent = false;
    _permissionDenied = false;
    _permissionPermanentlyDenied = false;

    final ready = await _ensureReady();
    if (!ready) {
      if (_permissionPermanentlyDenied) {
        return VoiceSearchStartResult.permissionDeniedPermanently;
      }
      if (_permissionDenied) {
        return VoiceSearchStartResult.permissionDenied;
      }
      return VoiceSearchStartResult.unavailable;
    }

    // The plugin is one instance for the whole app and only takes listeners on
    // its first initialize, so each listen points them back at this controller.
    _speechToText
      ..statusListener = _onStatus
      ..errorListener = _onError;
    _onListenError = onError;
    try {
      await _speechToText.listen(
        localeId: localeCode,
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 3),
        listenOptions: stt.SpeechListenOptions(
          partialResults: true,
          cancelOnError: true,
          listenMode: stt.ListenMode.dictation,
          autoPunctuation: false,
          enableHapticFeedback: false,
        ),
        onResult: (result) {
          final words = result.recognizedWords.trim();
          if (words.isEmpty) return;
          onText(words, isFinal: result.finalResult);
        },
      );
      _setListening(true);
      return VoiceSearchStartResult.listeningStarted;
    } catch (_) {
      _setError(code: 'speech_listen_failed', permanent: false);
      return VoiceSearchStartResult.failed;
    }
  }

  Future<void> stopListening() async {
    if (!_isListening) return;
    try {
      await _speechToText.stop();
    } catch (_) {}
    _setListening(false);
  }

  Future<void> cancelListening() async {
    try {
      await _speechToText.cancel();
    } catch (_) {}
    _setListening(false);
  }

  Future<bool> _ensureReady() async {
    if (_isReady) return true;
    if (_isInitializing) return false;

    final permission = await _ensureMicrophonePermission();
    if (permission != _MicrophonePermissionState.granted) {
      _permissionDenied = permission == _MicrophonePermissionState.denied;
      _permissionPermanentlyDenied =
          permission == _MicrophonePermissionState.permanentlyDenied;
      _setError(
        code: _permissionPermanentlyDenied
            ? 'permission_permanently_denied'
            : 'permission_denied',
        permanent: _permissionPermanentlyDenied,
      );
      return false;
    }

    _isInitializing = true;
    notifyListeners();
    bool available;
    try {
      available = await _speechToText.initialize();
    } catch (_) {
      // Android throws when the device has no speech recognizer.
      available = false;
    }
    _isInitializing = false;
    _isReady = available;
    if (!available) {
      _setError(code: 'speech_unavailable', permanent: false);
    }
    notifyListeners();
    return available;
  }

  Future<_MicrophonePermissionState> _ensureMicrophonePermission() async {
    if (!PlatformDetection.isAndroid && !PlatformDetection.isIOS) {
      return _MicrophonePermissionState.granted;
    }

    final currentStatus = await Permission.microphone.status;
    if (currentStatus.isGranted) {
      return _MicrophonePermissionState.granted;
    }

    if (currentStatus.isPermanentlyDenied ||
        currentStatus.isRestricted ||
        currentStatus.isLimited) {
      return _MicrophonePermissionState.permanentlyDenied;
    }

    final requested = await Permission.microphone.request();
    if (requested.isGranted) {
      return _MicrophonePermissionState.granted;
    }
    if (requested.isPermanentlyDenied ||
        requested.isRestricted ||
        requested.isLimited) {
      return _MicrophonePermissionState.permanentlyDenied;
    }
    return _MicrophonePermissionState.denied;
  }

  void _onStatus(String status) {
    // Windows also reports sound starting and stopping while it listens.
    if (status == stt.SpeechToText.listeningStatus) {
      _setListening(true);
    } else if (status == stt.SpeechToText.notListeningStatus ||
        status == stt.SpeechToText.doneStatus) {
      _setListening(false);
    }
  }

  void _onError(SpeechRecognitionError error) {
    _setError(code: error.errorMsg, permanent: error.permanent);
    _setListening(false);
    _onListenError?.call();
  }

  void _setListening(bool value) {
    if (_isListening == value) return;
    _isListening = value;
    notifyListeners();
  }

  void _setError({
    required String code,
    required bool permanent,
    bool notify = true,
  }) {
    _lastErrorCode = code;
    _lastErrorPermanent = permanent;
    if (notify) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    // A newer controller may already have taken the listeners.
    if (_speechToText.statusListener == _onStatus) {
      _speechToText
        ..statusListener = null
        ..errorListener = null;
    }
    _speechToText.cancel();
    super.dispose();
  }
}
