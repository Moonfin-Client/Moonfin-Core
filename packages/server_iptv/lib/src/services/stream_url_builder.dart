import '../db/iptv_database.dart';
import '../models/xtream_models.dart';

/// Strips a single trailing slash so URLs can be concatenated safely.
String normalizeXtreamBaseUrl(String serverUrl) {
  return serverUrl.endsWith('/')
      ? serverUrl.substring(0, serverUrl.length - 1)
      : serverUrl;
}

const _xtreamLivePrefix = 'xtream-live:';

/// What an Xtream live channel row stores in place of its URL, which would
/// carry the account's password.
String xtreamLiveRef(int streamId) => '$_xtreamLivePrefix$streamId';

/// The stream id behind [xtreamLiveRef], or null for any other stored URL.
int? xtreamLiveStreamId(String storedUrl) =>
    storedUrl.startsWith(_xtreamLivePrefix)
    ? int.tryParse(storedUrl.substring(_xtreamLivePrefix.length))
    : null;

String _xtreamUrl(XtreamCredentials account, String? kind, String file) {
  final base = account.normalizedUrl;
  final user = Uri.encodeComponent(account.username);
  final pass = Uri.encodeComponent(account.password);
  return [base, ?kind, user, pass, file].join('/');
}

String xtreamLiveStreamUrl(XtreamCredentials account, int streamId) =>
    _xtreamUrl(account, null, '$streamId');

String xtreamVodStreamUrl(
  XtreamCredentials account,
  int streamId, {
  String containerExtension = 'mp4',
}) => _xtreamUrl(account, 'movie', '$streamId.$containerExtension');

String xtreamSeriesStreamUrl(
  XtreamCredentials account,
  int episodeId, {
  String containerExtension = 'mp4',
}) => _xtreamUrl(account, 'series', '$episodeId.$containerExtension');

/// Xtream timeshift wants the start as `YYYY-MM-DD:HH-MM` in the panel's own
/// time, which [serverOffset] gives relative to UTC.
String xtreamTimeshiftUrl(
  XtreamCredentials account,
  int streamId, {
  required DateTime start,
  required DateTime end,
  required Duration serverOffset,
}) {
  final minutes = end.difference(start).inMinutes.clamp(1, 24 * 60);
  final t = start.toUtc().add(serverOffset);
  String two(int v) => v.toString().padLeft(2, '0');
  final stamp =
      '${t.year}-${two(t.month)}-${two(t.day)}:${two(t.hour)}-${two(t.minute)}';
  return _xtreamUrl(account, 'timeshift', '$minutes/$stamp/$streamId.ts');
}

/// The URL [channel] plays from. Xtream rows only store their stream id, so
/// the account is looked up through [accountFor] to build it.
Future<String?> resolveChannelStreamUrl(
  Channel channel,
  Future<XtreamCredentials?> Function(int playlistId) accountFor,
) async {
  final streamId = xtreamLiveStreamId(channel.streamUrl);
  if (streamId == null) return channel.streamUrl;
  final account = await accountFor(channel.playlistId);
  return account == null ? null : xtreamLiveStreamUrl(account, streamId);
}
