import 'dart:ffi';
import 'dart:isolate';

import 'package:ffi/ffi.dart';
import 'package:media_kit/generated/libmpv/bindings.dart' as mpv;
// Use the same library as media_kit's player and screenshot implementation.
// ignore: implementation_imports
import 'package:media_kit/src/player/native/core/native_library.dart';

import 'mpv_frame_sample.dart';

class MpvFrameSampler {
  bool _busy = false;

  Future<MpvFrameSample?> capture(
    int handle,
    int width,
    int height, {
    int? windowX,
    int? windowY,
    int? windowW,
    int? windowH,
  }) async {
    if (_busy || handle == 0 || width <= 0 || height <= 0) return null;
    _busy = true;
    final path = NativeLibrary.path;
    final api = mpv.MPV(DynamicLibrary.open(path));
    final name = 'moonfin-crop-sample'.toNativeUtf8();
    // Own a client reference while the worker runs, including player teardown.
    final client = api.mpv_create_client(
      Pointer<mpv.mpv_handle>.fromAddress(handle),
      name.cast(),
    );
    calloc.free(name);
    try {
      if (client == nullptr) return null;
      final address = client.address;
      return await Isolate.run(
        () => _capture(
          path,
          address,
          width,
          height,
          windowX ?? -1,
          windowY ?? -1,
          windowW ?? -1,
          windowH ?? -1,
        ),
      );
    } finally {
      // The worker has completed before this client reference is released.
      if (client != nullptr) api.mpv_destroy(client);
      _busy = false;
    }
  }
}

MpvFrameSample? _capture(
  String path,
  int address,
  int width,
  int height,
  int windowX,
  int windowY,
  int windowW,
  int windowH,
) {
  final watch = Stopwatch()..start();
  final api = mpv.MPV(DynamicLibrary.open(path));
  final client = Pointer<mpv.mpv_handle>.fromAddress(address);
  // --screenshot-sw: the software scaler converts on its own thread.
  // The default asks the VO to render the shot, which reinitializes the
  // renderer and can interrupt playback. Caller skips this when the frame
  // is a zero-copy hardware surface libswscale cannot convert.
  final option = 'screenshot-sw'.toNativeUtf8();
  final previous = api.mpv_get_property_string(client, option.cast());
  final enabled = 'yes'.toNativeUtf8();
  final result = calloc<mpv.mpv_node>();
  final args = [
    'screenshot-raw',
    'video',
    'bgr0',
  ].map((value) => value.toNativeUtf8()).toList();
  final argv = calloc<Pointer<Char>>(args.length + 1);
  for (var i = 0; i < args.length; i++) {
    argv[i] = args[i].cast();
  }
  try {
    if (previous == nullptr ||
        api.mpv_set_property_string(client, option.cast(), enabled.cast()) <
            0) {
      return null;
    }
    int status;
    try {
      status = api.mpv_command_ret(client, argv.cast(), result);
    } finally {
      api.mpv_set_property_string(client, option.cast(), previous);
    }
    if (status < 0 || result.ref.format != mpv.mpv_format.MPV_FORMAT_NODE_MAP) {
      return null;
    }
    final map = result.ref.u.list.ref;
    var w = 0, h = 0, stride = 0;
    Pointer<mpv.mpv_byte_array>? data;
    for (var i = 0; i < map.num; i++) {
      final key = map.keys[i].cast<Utf8>().toDartString();
      final value = map.values[i];
      if (value.format == mpv.mpv_format.MPV_FORMAT_INT64) {
        if (key == 'w') w = value.u.int64;
        if (key == 'h') h = value.u.int64;
        if (key == 'stride') stride = value.u.int64;
      } else if (key == 'data' &&
          value.format == mpv.mpv_format.MPV_FORMAT_BYTE_ARRAY) {
        data = value.u.ba;
      }
    }
    if (data == null ||
        data == nullptr ||
        w <= 0 ||
        h <= 0 ||
        stride < w * 4 ||
        data.ref.size < stride * h) {
      return null;
    }
    final pixels = data.ref.data.cast<Uint8>().asTypedList(data.ref.size);
    final onWindow = screenshotIsCropWindow(
      shotWidth: w,
      shotHeight: h,
      sourceWidth: width,
      sourceHeight: height,
      windowW: windowW,
      windowH: windowH,
    );
    final scanned = scanMpvBgra(
      pixels,
      width: w,
      height: h,
      stride: stride,
      sourceWidth: onWindow ? windowW : width,
      sourceHeight: onWindow ? windowH : height,
    );
    final rect = onWindow
        ? offsetScanToSource(
            scanned,
            windowX: windowX,
            windowY: windowY,
            sourceWidth: width,
            sourceHeight: height,
          )
        : scanned;
    return MpvFrameSample(
      rect: rect,
      width: w,
      height: h,
      elapsed: watch.elapsed,
    );
  } finally {
    api.mpv_free_node_contents(result);
    calloc.free(result);
    for (final arg in args) {
      calloc.free(arg);
    }
    calloc.free(argv);
    if (previous != nullptr) api.mpv_free(previous.cast());
    calloc.free(option);
    calloc.free(enabled);
  }
}
