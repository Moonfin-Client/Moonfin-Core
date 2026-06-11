class PlaybackExitBeacon {
  const PlaybackExitBeacon._();

  static bool get supported => false;

  static void arm({required String url, required String body}) {}

  static void disarm() {}
}
