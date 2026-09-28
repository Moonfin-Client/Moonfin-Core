import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// A broadcast stream over a platform event channel that copes with the
/// channel having no native handler yet. An engine the system starts with no
/// Activity, for a car head unit or a media button, has none until an
/// Activity adopts it.
///
/// [EventChannel.receiveBroadcastStream] reports that as an uncaught
/// [MissingPluginException]. This stream swallows it, tries again every
/// [retryInterval] up to [maxRetries] times, and after that tries again each
/// time the app resumes, since an Activity adopting the engine resumes it.
Stream<dynamic> resilientEventChannelStream(
  String channelName, {
  BinaryMessenger? binaryMessenger,
  MethodCodec codec = const StandardMethodCodec(),
  dynamic arguments,
  int maxRetries = 5,
  Duration retryInterval = const Duration(milliseconds: 500),
}) {
  final messenger = binaryMessenger ??
      ServicesBinding.instance.defaultBinaryMessenger;
  final methodChannel = MethodChannel(channelName, codec, messenger);
  late StreamController<dynamic> controller;
  Timer? retryTimer;
  AppLifecycleListener? resumeListener;
  var retriesRemaining = maxRetries;
  var isSubscribed = false;

  void stopWaitingForResume() {
    resumeListener?.dispose();
    resumeListener = null;
  }

  Future<void> tryListen() async {
    if (!controller.hasListener || isSubscribed) return;
    try {
      await methodChannel.invokeMethod<void>('listen', arguments);
      isSubscribed = true;
      stopWaitingForResume();
    } on MissingPluginException {
      if (!controller.hasListener) return;
      if (retriesRemaining > 0) {
        retriesRemaining--;
        retryTimer = Timer(retryInterval, tryListen);
      } else {
        resumeListener ??= AppLifecycleListener(
          onResume: () => unawaited(tryListen()),
        );
      }
    } catch (e, st) {
      if (controller.hasListener) {
        controller.addError(e, st);
      }
    }
  }

  controller = StreamController<dynamic>.broadcast(
    onListen: () {
      messenger.setMessageHandler(channelName, (ByteData? reply) async {
        if (reply == null) {
          controller.close();
        } else {
          try {
            controller.add(codec.decodeEnvelope(reply));
          } on PlatformException catch (e) {
            controller.addError(e);
          } catch (e, st) {
            controller.addError(e, st);
          }
        }
        return null;
      });
      unawaited(tryListen());
    },
    onCancel: () async {
      retryTimer?.cancel();
      retryTimer = null;
      stopWaitingForResume();
      messenger.setMessageHandler(channelName, null);
      if (isSubscribed) {
        isSubscribed = false;
        try {
          await methodChannel.invokeMethod<void>('cancel', arguments);
        } catch (_) {}
      }
    },
  );

  return controller.stream;
}
