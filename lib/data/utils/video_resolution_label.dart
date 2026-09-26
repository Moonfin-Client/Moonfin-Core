int? _toInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

/// The resolution badge for a video stream, or null when it has no usable dimensions.
///
/// Thresholds sit below each nominal size so letterboxed and slightly cropped streams still match.
String? videoResolutionLabel(Map<String, dynamic> stream) {
  final width = _toInt(stream['Width']);
  final height = _toInt(stream['Height']);
  if (width == null || height == null || width <= 0 || height <= 0) return null;

  final suffix = stream['IsInterlaced'] == true ? 'i' : 'p';

  if (width >= 7600 || height >= 4300) return '8K';
  if (width >= 3800 || height >= 2000) return '4K';
  if (width >= 2500 || height >= 1400) return '1440$suffix';
  if (width >= 1800 || height >= 1000) return '1080$suffix';
  if (width >= 1200 || height >= 700) return '720$suffix';
  if (width >= 600 || height >= 400) return '480$suffix';
  return 'SD';
}
