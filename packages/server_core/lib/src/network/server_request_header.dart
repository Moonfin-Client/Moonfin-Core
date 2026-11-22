/// A header override scoped to a server's scheme, host and port.
class ServerRequestHeader {
  const ServerRequestHeader._(this.origin, this.name, this.value);

  final String origin;
  final String name;
  final String value;

  static ServerRequestHeader? tryCreate({
    required String serverUrl,
    required String name,
    required String value,
  }) {
    final uri = Uri.tryParse(serverUrl.trim());
    final headerName = name.trim();
    if (uri == null ||
        (uri.scheme != 'https' && uri.scheme != 'http') ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty ||
        uri.port < 1 ||
        uri.port > 65535 ||
        !_fieldName.hasMatch(headerName) ||
        _transportHeaders.contains(headerName.toLowerCase()) ||
        _invalidFieldValue.hasMatch(value)) {
      return null;
    }
    return ServerRequestHeader._(uri.origin, headerName, value.trim());
  }

  static ServerRequestHeader? fromJson(Object? json) {
    if (json case {
      'origin': final String origin,
      'name': final String name,
      'value': final String value,
    }) {
      return tryCreate(serverUrl: origin, name: name, value: value);
    }
    return null;
  }

  Map<String, String> toJson() => {
    'origin': origin,
    'name': name,
    'value': value,
  };

  bool matches(ServerRequestHeader other) =>
      origin == other.origin && name.toLowerCase() == other.name.toLowerCase();

  static final _fieldName = RegExp(r"^[!#$%&'*+.^_`|~0-9a-zA-Z-]+$");
  static final _invalidFieldValue = RegExp(r'[^\t\x20-\x7e\x80-\xff]');
  static const _transportHeaders = {
    'connection',
    'content-length',
    'host',
    'proxy-authorization',
    'transfer-encoding',
  };
}
