import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

class WebSubtitleOverlay {
  WebSubtitleOverlay(this._video, {this.onError});

  final void Function(String message)? onError;

  static String _localUrl(String path) {
    final base = web.document.baseURI;
    if (base.isEmpty) return path;
    return Uri.parse(base).resolve(path).toString();
  }

  static String get _jassubBase => _localUrl('vendor/jassub');
  static String get _libpgsBase => _localUrl('vendor/libpgs');
  static String get _latinFontUrl =>
      _localUrl('vendor/fonts/NotoSans-Regular.ttf');
  static String get _cjkFontUrl =>
      _localUrl('vendor/fonts/NotoSansCJK-Regular.otf');

  // libass (wasm) has no OS fonts, so it can only fall back across fonts it is
  // handed here. These small per-script Noto fonts are always loaded so glyphs
  // beyond Latin (Indic, Thai, Hebrew, symbols) render instead of tofu. CJK is
  // large, so it stays lazy in availableFonts, matched by family name.
  static const _fallbackFonts = <String>[
    'NotoSansArabic-Regular.ttf',
    'NotoSansDevanagari-Regular.ttf',
    'NotoSansBengali-Regular.ttf',
    'NotoSansTamil-Regular.ttf',
    'NotoSansTelugu-Regular.ttf',
    'NotoSansKannada-Regular.ttf',
    'NotoSansMalayalam-Regular.ttf',
    'NotoSansGujarati-Regular.ttf',
    'NotoSansGurmukhi-Regular.ttf',
    'NotoSansOriya-Regular.ttf',
    'NotoSansSinhala-Regular.ttf',
    'NotoSansThai-Regular.ttf',
    'NotoSansLao-Regular.ttf',
    'NotoSansKhmer-Regular.ttf',
    'NotoSansMyanmar-Regular.ttf',
    'NotoSansHebrew-Regular.ttf',
    'NotoSansGeorgian-Regular.ttf',
    'NotoSansArmenian-Regular.ttf',
    'NotoSansEthiopic-Regular.ttf',
    'NotoSansSymbols-Regular.ttf',
    'NotoSansSymbols2-Regular.ttf',
    'NotoMusic-Regular.ttf',
  ];

  static List<String> get _fontUrls => <String>[
    _latinFontUrl,
    for (final name in _fallbackFonts) _localUrl('vendor/fonts/$name'),
  ];

  final web.HTMLVideoElement _video;

  _Jassub? _assRenderer;
  Timer? _assFontRedraw;
  _PgsRenderer? _pgsRenderer;
  double _delaySeconds = 0;
  bool _disposed = false;
  int _rendererGeneration = 0;

  static Future<void>? _jassubLoad;
  static Future<void>? _libpgsLoad;

  void _reportFailure(int generation, String format, Object error) {
    if (!_disposed && generation == _rendererGeneration) {
      onError?.call('$format subtitle renderer failed: $error');
    }
  }

  static bool isOverlayCodec(String? codec) =>
      _isAssCodec(codec) || _isPgsCodec(codec);

  static bool _isAssCodec(String? codec) {
    final c = codec?.toLowerCase() ?? '';
    return c.contains('ass') || c.contains('ssa');
  }

  static bool _isPgsCodec(String? codec) {
    final c = codec?.toLowerCase() ?? '';
    return c.contains('pgs') || c.contains('hdmv');
  }

  Future<void> show(String url, String? codec) async {
    if (_disposed || url.isEmpty) return;
    if (_isPgsCodec(codec)) {
      await _showPgs(url);
    } else if (_isAssCodec(codec)) {
      await _showAss(url);
    }
  }

  Future<void> _showAss(String url) async {
    clear();
    final generation = _rendererGeneration;
    try {
      await _ensureJassub();
    } catch (error) {
      _reportFailure(generation, 'ASS', error);
      return;
    }
    if (_disposed || generation != _rendererGeneration) return;
    final options = JSObject()
      ..setProperty('video'.toJS, _video)
      ..setProperty('timeOffset'.toJS, (-_delaySeconds).toJS)
      ..setProperty('subUrl'.toJS, url.toJS)
      ..setProperty('workerUrl'.toJS, '$_jassubBase/jassub-worker.js'.toJS)
      ..setProperty('wasmUrl'.toJS, '$_jassubBase/jassub-worker.wasm'.toJS)
      ..setProperty(
        'modernWasmUrl'.toJS,
        '$_jassubBase/jassub-worker-modern.wasm'.toJS,
      )
      ..setProperty('fonts'.toJS, _fontUrls.jsify()!)
      ..setProperty('fallbackFont'.toJS, 'Noto Sans'.toJS)
      ..setProperty('availableFonts'.toJS, _cjkAvailableFonts());
    try {
      final renderer = _Jassub(options);
      if (_disposed || generation != _rendererGeneration) {
        renderer.destroy();
        return;
      }
      _assRenderer = renderer;
      // JASSUB reports worker readiness before asynchronously loaded fonts
      // are registered. A paused video has no subsequent frame callback, so
      // repaint after registration instead of trusting the initial clock tick.
      renderer.addEventListener('fontAdded', ((JSAny? _) {
        if (_disposed || generation != _rendererGeneration ||
            !identical(_assRenderer, renderer) || !_video.paused) {
          return;
        }
        _assFontRedraw?.cancel();
        _assFontRedraw = Timer(const Duration(milliseconds: 100), () {
          _assFontRedraw = null;
          if (_disposed || generation != _rendererGeneration ||
              !identical(_assRenderer, renderer) || !_video.paused) {
            return;
          }
          _redrawAssAtCurrentTime(renderer);
        });
      }).toJS);
      _redrawAssAtCurrentTime(renderer);
    } catch (error) {
      _assRenderer?.destroy();
      _assRenderer = null;
      _reportFailure(generation, 'ASS', error);
    }
  }

  JSObject _cjkAvailableFonts() {
    const families = <String>[
      'noto sans cjk sc',
      'noto sans cjk jp',
      'noto sans cjk tc',
      'noto sans cjk kr',
      'noto sans sc',
      'noto sans jp',
      'source han sans',
      'microsoft yahei',
      'simhei',
      'simsun',
      'ms gothic',
      'msgothic',
      'meiryo',
      'yu gothic',
      'malgun gothic',
    ];
    final map = JSObject();
    final url = _cjkFontUrl.toJS;
    for (final family in families) {
      map.setProperty(family.toJS, url);
    }
    return map;
  }

  Future<void> _showPgs(String url) async {
    clear();
    final generation = _rendererGeneration;
    try {
      await _ensureLibpgs();
    } catch (error) {
      _reportFailure(generation, 'PGS', error);
      return;
    }
    if (_disposed || generation != _rendererGeneration) return;
    final options = JSObject()
      ..setProperty('video'.toJS, _video)
      ..setProperty('timeOffset'.toJS, (-_delaySeconds).toJS)
      ..setProperty('subUrl'.toJS, url.toJS)
      ..setProperty('workerUrl'.toJS, '$_libpgsBase/libpgs.worker.js'.toJS);
    try {
      final ctor = _libpgsRendererCtor();
      if (ctor == null) {
        _reportFailure(generation, 'PGS', StateError('renderer unavailable'));
        return;
      }
      _pgsRenderer = ctor.callAsConstructor<_PgsRenderer>(options);
      // Prime the empty timeline before loading completes so libpgs doesn't
      // mistake the first active cue for one it has already drawn.
      _pgsRenderer!.renderAtTimestamp(_video.currentTime - _delaySeconds);
    } catch (error) {
      _pgsRenderer = null;
      _reportFailure(generation, 'PGS', error);
    }
  }

  void _redrawAssAtCurrentTime(_Jassub renderer) {
    // Request one frame, not a predictive playback clock. JASSUB already
    // follows video frames via requestVideoFrameCallback when available.
    // Starting its own clock here makes captions advance after video pauses.
    renderer.setCurrentTime(true, _video.currentTime - _delaySeconds);
  }

  void setDelay(double seconds) {
    _delaySeconds = seconds;
    // These renderers offset their clock, so a positive delay moves it back.
    final ass = _assRenderer;
    if (ass != null) {
      ass.timeOffset = -seconds;
      _redrawAssAtCurrentTime(ass);
    }
    _pgsRenderer?.timeOffset = -seconds;
  }

  void clear() {
    // Ignore pending load results after this subtitle selection is cleared or replaced.
    _rendererGeneration++;
    _assFontRedraw?.cancel();
    _assFontRedraw = null;
    final ass = _assRenderer;
    _assRenderer = null;
    if (ass != null) {
      try {
        ass.destroy();
      } catch (_) {}
    }
    final pgs = _pgsRenderer;
    _pgsRenderer = null;
    if (pgs != null) {
      try {
        pgs.dispose();
      } catch (_) {}
    }
  }

  void dispose() {
    _disposed = true;
    clear();
  }

  static Future<void> _ensureJassub() {
    final existing = _jassubLoad;
    if (existing != null) return existing;
    final completer = Completer<void>();
    final load = completer.future.catchError((Object error, StackTrace stack) {
      _jassubLoad = null;
      Error.throwWithStackTrace(error, stack);
    });
    _jassubLoad = load;
    if (web.window.has('JASSUB')) {
      completer.complete();
      return load;
    }
    final script = web.HTMLScriptElement()
      ..type = 'module'
      ..text =
          "import JASSUB from '$_jassubBase/jassub.es.js'; window.JASSUB = JASSUB;";
    (web.document.head ?? web.document.documentElement)?.appendChild(script);
    _pollFor('JASSUB', completer);
    return load;
  }

  static Future<void> _ensureLibpgs() {
    final existing = _libpgsLoad;
    if (existing != null) return existing;
    final completer = Completer<void>();
    final load = completer.future.catchError((Object error, StackTrace stack) {
      _libpgsLoad = null;
      Error.throwWithStackTrace(error, stack);
    });
    _libpgsLoad = load;
    if (web.window.has('libpgs')) {
      completer.complete();
      return load;
    }
    // The bundled libpgs file exports PgsRenderer as an ES module. Loading it
    // as a classic script fails before the constructor can be published.
    final script = web.HTMLScriptElement()
      ..type = 'module'
      ..text =
          "import { PgsRenderer } from '$_libpgsBase/libpgs.js'; "
          "window.libpgs = { PgsRenderer };";
    (web.document.head ?? web.document.documentElement)?.appendChild(script);
    _pollFor('libpgs', completer);
    return load;
  }

  static void _pollFor(String global, Completer<void> completer) {
    var elapsedMs = 0;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (web.window.has(global)) {
        timer.cancel();
        if (!completer.isCompleted) completer.complete();
        return;
      }
      elapsedMs += 100;
      if (elapsedMs >= 15000) {
        timer.cancel();
        if (!completer.isCompleted) {
          completer.completeError(StateError('$global failed to load'));
        }
      }
    });
  }

  JSFunction? _libpgsRendererCtor() {
    final libpgs = web.window.getProperty('libpgs'.toJS);
    if (libpgs == null || !libpgs.isA<JSObject>()) return null;
    final ctor = (libpgs as JSObject).getProperty('PgsRenderer'.toJS);
    return (ctor != null && ctor.isA<JSFunction>()) ? ctor as JSFunction : null;
  }
}

@JS('JASSUB')
extension type _Jassub._(JSObject _) implements JSObject {
  external factory _Jassub(JSObject options);
  external void addEventListener(String type, JSFunction listener);
  external set timeOffset(double seconds);
  external void setCurrentTime(bool paused, double seconds);
  external void destroy();
}

extension type _PgsRenderer._(JSObject _) implements JSObject {
  external set timeOffset(double seconds);
  external void renderAtTimestamp(double seconds);
  external void dispose();
}
