/// Finds where a server went when a request couldn't reach it at all.
///
/// Gets the base URL the failed request used and hands back the address the
/// server answers on now, or null when it didn't move. The app sets this for
/// servers added through a redirect to a dynamic `host:port` (a stable name
/// in front of VPN port forwarding), where only the entered address knows
/// the current target.
/// [serverId] is the saved server the request was for when it started (see
/// [ServerMoved.serverAt]); the answer must be an address of that server.
typedef ServerMovedResolver =
    Future<String?> Function(String baseUrl, {String? serverId});

abstract final class ServerMoved {
  /// Asked by every server client's Dio once a request fails to connect.
  /// Null leaves failed requests as they are.
  static ServerMovedResolver? resolver;

  /// Whether [baseUrl] belongs to a server that can move this way. Its
  /// requests give up connecting after [connectTimeout], so a target that
  /// moved and stopped answering is asked about sooner. Null for none.
  static bool Function(String baseUrl)? canMove;

  /// The saved server a request to [baseUrl] is for, taken when it starts,
  /// so a later move can only send it to that same server. Null for none.
  static String? Function(String baseUrl)? serverAt;

  static const connectTimeout = Duration(seconds: 3);
}
