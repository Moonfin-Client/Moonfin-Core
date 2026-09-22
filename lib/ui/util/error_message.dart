import 'dart:async';

import 'package:dio/dio.dart';

import '../../l10n/app_localizations.dart';

const _maxDetailLength = 200;

const _detailKeys = ['message', 'Message', 'error', 'detail', 'title'];

const _connectionMarkers = [
  'socketexception',
  'handshakeexception',
  'failed host lookup',
  'connection refused',
  'connection reset',
  'network is unreachable',
  'no route to host',
];

/// Turns a caught error into text for the screen, preferring the server's
/// reason and then the HTTP status over the raw exception.
String describeError(Object error, AppLocalizations l10n) {
  if (error is DioException) return _describeDioError(error, l10n);
  if (error is TimeoutException) return l10n.unableToConnectToServer;
  final text = error.toString();
  const prefix = 'Exception: ';
  return text.startsWith(prefix) ? text.substring(prefix.length) : text;
}

String _describeDioError(DioException error, AppLocalizations l10n) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return l10n.unableToConnectToServer;
    case DioExceptionType.badResponse:
    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
      break;
  }

  final detail = _serverDetail(error.response?.data);
  if (detail != null) return detail;

  final status = error.response?.statusCode;
  if (status != null && (status < 200 || status > 299)) {
    return l10n.adminServerReturnedHttp(status);
  }

  final cause = error.error?.toString().toLowerCase() ?? '';
  if (_connectionMarkers.any(cause.contains)) {
    return l10n.unableToConnectToServer;
  }
  return l10n.adminUnknownError;
}

String? _serverDetail(Object? data) {
  String? text;
  if (data is Map) {
    for (final key in _detailKeys) {
      final value = data[key];
      if (value is String && value.trim().isNotEmpty) {
        text = value;
        break;
      }
    }
  } else if (data is String && !data.contains('<')) {
    text = data;
  }

  text = text?.trim();
  if (text == null || text.isEmpty) return null;
  if (text.length > _maxDetailLength) {
    return '${text.substring(0, _maxDetailLength)}...';
  }
  return text;
}
