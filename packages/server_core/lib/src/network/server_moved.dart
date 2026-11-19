/// Finds where a server went when a request couldn't reach it at all.
///
/// Gets the base URL the failed request used and hands back the address the
/// server answers on now, or null when it didn't move. The app sets this for
/// servers added through a redirect to a dynamic `host:port` (a stable name
/// in front of VPN port forwarding), where only the entered address knows
/// the current target.
typedef ServerMovedResolver = Future<String?> Function(String baseUrl);

abstract final class ServerMoved {
  /// Asked by every server client's Dio once a request fails to connect.
  /// Null leaves failed requests as they are.
  static ServerMovedResolver? resolver;

  /// Whether [baseUrl] belongs to a server that can move this way. Its
  /// requests give up connecting after [connectTimeout], so a target that
  /// moved and stopped answering is asked about sooner. Null for none.
  static bool Function(String baseUrl)? canMove;

  static const connectTimeout = Duration(seconds: 3);
}
