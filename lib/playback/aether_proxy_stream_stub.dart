class AetherProxyStream {
  String get url => throw UnsupportedError('Native playback only');

  static Future<AetherProxyStream?> open(
    String url,
    Map<String, String> headers,
  ) async => null;

  Future<void> close() async {}

  void updateHeaders(Map<String, String> headers) {}
}
