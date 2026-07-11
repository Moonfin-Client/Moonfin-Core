enum SeerrRequestErrorKind {
  duplicate,
  quotaExceeded,
  blocklisted,
  noSeasonsAvailable,
  permission,
  unknown,
}

class SeerrRequestException implements Exception {
  final SeerrRequestErrorKind kind;
  final String? serverMessage;

  const SeerrRequestException(this.kind, [this.serverMessage]);

  static SeerrRequestException? fromResponse(int? statusCode, dynamic body) {
    if (statusCode == null) return null;
    final message = body is Map<String, dynamic>
        ? body['message'] as String?
        : null;
    switch (statusCode) {
      case 409:
        return SeerrRequestException(
          SeerrRequestErrorKind.duplicate,
          message,
        );
      case 202:
        return SeerrRequestException(
          SeerrRequestErrorKind.noSeasonsAvailable,
          message,
        );
      case 403:
        final lower = message?.toLowerCase() ?? '';
        if (lower.contains('quota')) {
          return SeerrRequestException(
            SeerrRequestErrorKind.quotaExceeded,
            message,
          );
        }
        if (lower.contains('blocklist') || lower.contains('blacklist')) {
          return SeerrRequestException(
            SeerrRequestErrorKind.blocklisted,
            message,
          );
        }
        return SeerrRequestException(
          SeerrRequestErrorKind.permission,
          message,
        );
    }
    return null;
  }

  @override
  String toString() =>
      'SeerrRequestException(${kind.name}${serverMessage != null ? ': $serverMessage' : ''})';
}
