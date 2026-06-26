import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

import '../../../util/idiom/app_ui_idiom.dart';
import '../../../util/platform_detection.dart';
import 'adaptive_icons.dart';

const _sfChannel = MethodChannel('moonfin/sf_symbols');

bool get _sfAvailable =>
    !kIsWeb &&
    (PlatformDetection.isIOS ||
        PlatformDetection.isMacOS ||
        PlatformDetection.isAppleTV);

final Map<String, Future<Uint8List?>> _sfCache = {};

Future<Uint8List?> _renderSymbol(
  String name,
  double size,
  double scale,
  Color color,
) {
  final key = '$name|$size|$scale|${color.toARGB32()}';
  return _sfCache.putIfAbsent(key, () async {
    try {
      return await _sfChannel.invokeMethod<Uint8List>('render', {
        'name': name,
        'size': size,
        'scale': scale,
        'r': color.r,
        'g': color.g,
        'b': color.b,
        'a': color.a,
      });
    } catch (_) {
      return null;
    }
  });
}

class AdaptiveIcon extends StatelessWidget {
  const AdaptiveIcon(this.icon, {super.key, this.size, this.color});

  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (!AppUiIdiomResolver.isApple && !PlatformDetection.isAppleTV) {
      return Icon(icon, size: size, color: color);
    }
    final iconTheme = IconTheme.of(context);
    return SfSymbol(
      material: icon,
      size: size ?? iconTheme.size ?? 24,
      color: color ?? iconTheme.color ?? const Color(0xFFFFFFFF),
    );
  }
}

class SfSymbol extends StatelessWidget {
  const SfSymbol({
    super.key,
    required this.material,
    required this.size,
    required this.color,
  });

  final IconData material;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final fallback = Icon(cupertinoGlyphFor(material), size: size, color: color);
    final name = sfSymbolNameFor(material);
    if (!_sfAvailable || name == null) return fallback;
    final scale = MediaQuery.maybeOf(context)?.devicePixelRatio ?? 2.0;
    return FutureBuilder<Uint8List?>(
      future: _renderSymbol(name, size, scale, color),
      builder: (context, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return fallback;
        return SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Image.memory(
              bytes,
              width: size * 0.82,
              height: size * 0.82,
              fit: BoxFit.contain,
              gaplessPlayback: true,
            ),
          ),
        );
      },
    );
  }
}
