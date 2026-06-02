import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../l10n/current_app_localizations.dart';
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

  final stt.SpeechToText _speechToText;

  bool _isListening = false;
  bool _isInitializing = false;
  bool _isReady = false;
  String? _lastErrorCode;
  String? _lastErrorMessage;
  bool _lastErrorPermanent = false;
  bool _permissionDenied = false;
  bool _permissionPermanentlyDenied = false;

  bool get isListening => _isListening;
  bool get isInitializing => _isInitializing;
  bool get isReady => _isReady;
  String? get lastErrorCode => _lastErrorCode;
  String? get lastErrorMessage => _lastErrorMessage;
  bool get lastErrorPermanent => _lastErrorPermanent;
  bool get permissionDenied => _permissionDenied;
  bool get permissionPermanentlyDenied => _permissionPermanentlyDenied;

  void clearError() {
    _lastErrorCode = null;
    _lastErrorMessage = null;
    _lastErrorPermanent = false;
    _permissionDenied = false;
    _permissionPermanentlyDenied = false;
    notifyListeners();
  }

  Future<VoiceSearchStartResult> startListening({
    required String localeCode,
    required VoiceSearchTextListener onText,
  }) async {
    if (_isListening) {
      return VoiceSearchStartResult.listeningStarted;
    }

    _lastErrorCode = null;
    _lastErrorMessage = null;
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
    } catch (error) {
      _setError(
        code: 'speech_listen_failed',
        message: error.toString(),
        permanent: false,
      );
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
      final l10n = currentAppLocalizations();
      _permissionDenied = permission == _MicrophonePermissionState.denied;
      _permissionPermanentlyDenied =
          permission == _MicrophonePermissionState.permanentlyDenied;
      _setError(
        code: _permissionPermanentlyDenied
            ? 'permission_permanently_denied'
            : 'permission_denied',
        message: _permissionPermanentlyDenied
            ? l10n.microphonePermissionPermanentlyDenied
            : l10n.microphonePermissionDenied,
        permanent: _permissionPermanentlyDenied,
      );
      return false;
    }

    _isInitializing = true;
    notifyListeners();
    final available = await _speechToText.initialize(
      onStatus: (status) {
        _setListening(status == 'listening');
      },
      onError: (error) {
        _setError(
          code: error.errorMsg,
          message: error.errorMsg,
          permanent: error.permanent,
        );
        _setListening(false);
      },
    );
    _isInitializing = false;
    _isReady = available;
    if (!available) {
      final l10n = currentAppLocalizations();
      _setError(
        code: 'speech_unavailable',
        message: l10n.speechRecognitionUnavailable,
        permanent: false,
      );
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

  void _setListening(bool value) {
    if (_isListening == value) return;
    _isListening = value;
    notifyListeners();
  }

  void _setError({
    required String code,
    required String message,
    required bool permanent,
    bool notify = true,
  }) {
    _lastErrorCode = code;
    _lastErrorMessage = message;
    _lastErrorPermanent = permanent;
    if (notify) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _speechToText.cancel();
    super.dispose();
  }
}
