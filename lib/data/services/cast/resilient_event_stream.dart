import 'dart:async';

import 'package:flutter/services.dart';

/// Creates a broadcast stream from a platform event channel that gracefully
/// handles [MissingPluginException] when native handlers have not yet registered
/// during cold startup or on headless engines.
///
/// Unlike Flutter's default [EventChannel.receiveBroadcastStream], which reports
/// an uncaught [FlutterError] whenever the native channel is unhandled, this stream
/// catches [MissingPluginException] and retries with a backoff interval until the
/// platform host completes engine configuration, or until [maxRetries] is reached.
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
  var retriesRemaining = maxRetries;
  var isSubscribed = false;

  Future<void> tryListen() async {
    if (!controller.hasListener || isSubscribed) return;
    try {
      await methodChannel.invokeMethod<void>('listen', arguments);
      isSubscribed = true;
    } on MissingPluginException {
      if (retriesRemaining > 0 && controller.hasListener) {
        retriesRemaining--;
        retryTimer = Timer(retryInterval, tryListen);
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
