import 'package:server_core/server_core.dart';

/// Throws for a member of a Moonfin API that Silo has no counterpart for
/// (playlists, deleting media, Jellyfin's playback reporting, remote
/// sessions), so an unexpected call is a readable error naming the member.
/// A class answers its whole interface this way from `noSuchMethod`.
Never siloUnsupported(String api, Invocation invocation) {
  final name = invocation.memberName
      .toString()
      .replaceFirst('Symbol("', '')
      .replaceFirst('")', '')
      .replaceFirst('=', '');
  throw UnsupportedError('$api.$name is not supported on Silo');
}

/// Other devices' sessions and remote control, which Silo has no
/// counterpart for.
class SiloSessionApi implements SessionApi {
  const SiloSessionApi();

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      siloUnsupported('SessionApi', invocation);
}
