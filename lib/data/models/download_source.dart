/// Who asked for a download. Stored on the downloaded-items row so the
/// auto-download delete-after-watched rule never removes a manual download.
enum DownloadSource {
  manual,
  auto;

  static DownloadSource fromName(String? name) =>
      name == auto.name ? auto : manual;
}
