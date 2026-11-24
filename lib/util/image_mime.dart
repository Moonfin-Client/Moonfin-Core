/// Returns the image MIME type for a file name by extension, or null if the
/// extension is not a supported image format.
String? imageContentTypeForFileName(String fileName) {
  final dot = fileName.lastIndexOf('.');
  final ext = dot == -1 ? '' : fileName.substring(dot + 1).toLowerCase();
  return switch (ext) {
    'jpg' || 'jpeg' => 'image/jpeg',
    'png' => 'image/png',
    'webp' => 'image/webp',
    'gif' => 'image/gif',
    'bmp' => 'image/bmp',
    _ => null,
  };
}

/// The image MIME type of [bytes] from the file's own header, or null when it
/// isn't JPEG, PNG, GIF, WebP or BMP. A picked file's name can say one thing
/// while the file is another (an iPhone photo named .jpg can be HEIC).
String? imageContentTypeForBytes(List<int> bytes) {
  bool startsWith(List<int> magic, [int offset = 0]) {
    if (bytes.length < offset + magic.length) return false;
    for (var i = 0; i < magic.length; i++) {
      if (bytes[offset + i] != magic[i]) return false;
    }
    return true;
  }

  if (startsWith(const [0xFF, 0xD8, 0xFF])) return 'image/jpeg';
  if (startsWith(const [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])) {
    return 'image/png';
  }
  if (startsWith(const [0x47, 0x49, 0x46, 0x38])) return 'image/gif';
  if (startsWith(const [0x52, 0x49, 0x46, 0x46]) &&
      startsWith(const [0x57, 0x45, 0x42, 0x50], 8)) {
    return 'image/webp';
  }
  if (startsWith(const [0x42, 0x4D])) return 'image/bmp';
  return null;
}
