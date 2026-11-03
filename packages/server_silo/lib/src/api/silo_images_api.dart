import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// Silo's artwork sizes, from `GET /images/capabilities`.
///
/// Silo serves each piece of artwork in a few size buckets (`small`,
/// `medium`, `large`, `original`). A request that returns items picks one with
/// a query parameter ([param], `image_size`), and every URL in the answer is
/// at that size. [widths] gives each bucket's width per artwork kind
/// (`poster`, `backdrop`, `logo`, `still`, `profile`…).
class SiloImageCapabilities {
  const SiloImageCapabilities({
    required this.param,
    required this.sizes,
    required this.widths,
    required this.originalMaxWidth,
  });

  factory SiloImageCapabilities.fromJson(Map<String, dynamic> json) {
    final widths = <String, Map<String, int>>{};
    final rawWidths = asJsonMap(json['widths']);
    if (rawWidths != null) {
      for (final entry in rawWidths.entries) {
        final buckets = asJsonMap(entry.value);
        if (buckets == null) continue;
        widths[entry.key] = {
          for (final b in buckets.entries)
            if (b.value is num) b.key: (b.value as num).toInt(),
        };
      }
    }
    final sizes = json['sizes'];
    final original = json['original_max_width_px'];
    return SiloImageCapabilities(
      param: json['param'] as String? ?? 'image_size',
      sizes: sizes is List
          ? [
              for (final s in sizes)
                if (s is String) s,
            ]
          : const ['small', 'medium', 'large', 'original'],
      widths: widths,
      originalMaxWidth: original is num ? original.toInt() : null,
    );
  }

  /// The query parameter that selects a bucket (`image_size`).
  final String param;

  /// The buckets, smallest first.
  final List<String> sizes;

  /// Width in pixels of each bucket, per artwork kind.
  final Map<String, Map<String, int>> widths;

  /// Widest an `original` image is served, when Silo caps it.
  final int? originalMaxWidth;

  /// The smallest bucket at least [width] pixels wide for [kind], so artwork
  /// is sharp without downloading more than needed.
  ///
  /// With no [width] it picks `medium`, a middle size suited to grids. When
  /// no fixed bucket is wide enough it takes `original` if Silo offers it,
  /// else the widest bucket. An unknown [kind] is treated like a poster.
  String sizeFor(String kind, int? width) {
    if (width == null || width <= 0) {
      return sizes.contains('medium') ? 'medium' : sizes.first;
    }
    final buckets = widths[kind] ?? widths['poster'] ?? const {};
    for (final size in sizes) {
      final w = buckets[size];
      if (w != null && w >= width) return size;
    }
    if (sizes.contains('original')) return 'original';
    return sizes.last;
  }
}

/// Silo's image endpoints. Not a Moonfin interface: Moonfin asks for images
/// through `ImageApi`, which the Silo client answers from the URLs items carry
/// (`SiloImageRegistry`).
class SiloImagesApi {
  SiloImagesApi(this._dio);

  final Dio _dio;

  /// The size buckets and their widths.
  Future<SiloImageCapabilities> capabilities() async {
    final response = await _dio.get<dynamic>('/api/v2/images/capabilities');
    final json = asJsonMap(response.data);
    if (json == null) {
      throw FormatException(
        'Expected image capabilities from Silo, got '
        '${response.data.runtimeType}',
      );
    }
    return SiloImageCapabilities.fromJson(json);
  }
}
