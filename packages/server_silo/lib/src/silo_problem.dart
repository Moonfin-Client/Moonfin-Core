import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// An RFC 9457 Problem Details body from Silo's `/api/v2`.
///
/// Every Silo error answers with one, for example:
///
/// ```json
/// {"type": "https://siloserver.org/docs/api/v2/problems/validation_failed",
///  "title": "Validation failed", "status": 422,
///  "detail": "The request did not pass validation; see errors.",
///  "instance": "urn:silo:request:b48fe77a06badf012d80e6ce",
///  "errors": [{"location": "header.x-silo-device-id", "code": "invalid",
///              "detail": "X-Silo-Device-Id must be a single device identifier: ..."}]}
/// ```
///
/// Silo's stable identifier is the last segment of [type] ([code]). Code that
/// reacts to an error checks [code], never [title] or [detail], which are
/// human text. [instance] identifies the request in Silo's logs.
class SiloProblem {
  final String? type;
  final String? title;
  final int? status;
  final String? detail;
  final String? instance;
  final List<SiloProblemError> errors;

  const SiloProblem({
    this.type,
    this.title,
    this.status,
    this.detail,
    this.instance,
    this.errors = const [],
  });

  /// The problem identifier, the last path segment of [type]. For
  /// `.../problems/token_refresh_required` it's `token_refresh_required`.
  String? get code {
    final t = type;
    if (t == null || t.isEmpty) return null;
    final segments = Uri.tryParse(t)?.pathSegments;
    if (segments == null || segments.isEmpty) return t;
    return segments.lastWhere((s) => s.isNotEmpty, orElse: () => t);
  }

  /// The best text to show a person: the detail, else the title.
  String? get message {
    final d = detail?.trim();
    if (d != null && d.isNotEmpty) return d;
    final t = title?.trim();
    return (t != null && t.isNotEmpty) ? t : null;
  }

  /// Parses [body] (a map, or JSON text served as `text/plain`). Returns null
  /// for anything that isn't a problem: no body, HTML, or JSON without a
  /// `type` or `title`.
  static SiloProblem? fromJson(Object? body) {
    final data = asJsonMap(body);
    if (data == null) return null;
    final type = data['type'];
    final title = data['title'];
    if (type is! String && title is! String) return null;
    final status = data['status'];
    final detail = data['detail'];
    final instance = data['instance'];
    final rawErrors = data['errors'];
    return SiloProblem(
      type: type is String ? type : null,
      title: title is String ? title : null,
      status: status is num ? status.toInt() : null,
      detail: detail is String ? detail : null,
      instance: instance is String ? instance : null,
      errors: rawErrors is List
          ? rawErrors
                .whereType<Map>()
                .map(SiloProblemError._fromJson)
                .toList(growable: false)
          : const [],
    );
  }

  /// The problem a failed Silo request carried, if any. Reads the one the
  /// client's [siloProblemInterceptor] attached, else parses the body.
  static SiloProblem? of(DioException error) {
    final attached = error.error;
    if (attached is SiloProblem) return attached;
    return fromJson(error.response?.data);
  }

  static String? codeOf(DioException error) => of(error)?.code;

  /// How long a `Retry-After` header asks the client to wait (Silo sends it
  /// with `429` and `503`), as seconds or an HTTP date. Null when absent or
  /// unreadable, and never negative.
  static Duration? retryAfter(DioException error, {DateTime? now}) {
    final raw = error.response?.headers.value('retry-after')?.trim();
    if (raw == null || raw.isEmpty) return null;
    final seconds = int.tryParse(raw);
    if (seconds != null) return Duration(seconds: seconds < 0 ? 0 : seconds);
    final at = _parseHttpDate(raw);
    if (at == null) return null;
    final wait = at.difference((now ?? DateTime.now()).toUtc());
    return wait.isNegative ? Duration.zero : wait;
  }

  /// The server's clock when it answered (the `Date` header), to the
  /// second. Null when absent or unreadable.
  static DateTime? serverDate(DioException error) {
    final raw = error.response?.headers.value('date')?.trim();
    return raw == null || raw.isEmpty ? null : _parseHttpDate(raw);
  }

  @override
  String toString() {
    final buffer = StringBuffer('Silo ${status ?? '-'} ${code ?? '?'}');
    final text = message;
    if (text != null) buffer.write(': $text');
    for (final e in errors) {
      buffer.write(' [${e.location ?? '?'} ${e.code ?? '?'}');
      if (e.detail != null) buffer.write(': ${e.detail}');
      buffer.write(']');
    }
    return buffer.toString();
  }
}

const _months = {
  'jan': 1,
  'feb': 2,
  'mar': 3,
  'apr': 4,
  'may': 5,
  'jun': 6,
  'jul': 7,
  'aug': 8,
  'sep': 9,
  'oct': 10,
  'nov': 11,
  'dec': 12,
};

/// Parses an HTTP date in the IMF-fixdate form every current server sends
/// (`Sun, 06 Nov 1994 08:49:37 GMT`). `dart:io`'s `HttpDate` would do this,
/// but it isn't available on the web build.
DateTime? _parseHttpDate(String raw) {
  final m = RegExp(
    r'^[A-Za-z]{3}, (\d{2}) ([A-Za-z]{3}) (\d{4}) (\d{2}):(\d{2}):(\d{2}) GMT$',
  ).firstMatch(raw);
  if (m == null) return null;
  final month = _months[m.group(2)!.toLowerCase()];
  if (month == null) return null;
  return DateTime.utc(
    int.parse(m.group(3)!),
    month,
    int.parse(m.group(1)!),
    int.parse(m.group(4)!),
    int.parse(m.group(5)!),
    int.parse(m.group(6)!),
  );
}

/// One field-level failure inside a `validation_failed` problem.
class SiloProblemError {
  /// Where the problem is, e.g. `header.x-silo-device-id` or `body.username`.
  final String? location;

  /// What is wrong, e.g. `invalid`, `required`.
  final String? code;
  final String? detail;

  const SiloProblemError({this.location, this.code, this.detail});

  static SiloProblemError _fromJson(Map<dynamic, dynamic> e) {
    String? str(Object? v) => v is String ? v : null;
    return SiloProblemError(
      location: str(e['location']),
      code: str(e['code']),
      detail: str(e['detail']),
    );
  }
}

/// Puts the [SiloProblem] of a failed response into [DioException.error] and
/// its text into [DioException.message], so errors read "Silo 401
/// invalid_token: Invalid username or password." in logs and anywhere the
/// app shows `e.message`, and later code can check [SiloProblem.code].
/// Failures without a problem body (network errors, HTML) pass through as is.
Interceptor siloProblemInterceptor() => InterceptorsWrapper(
  onError: (error, handler) {
    final problem = SiloProblem.fromJson(error.response?.data);
    if (problem == null) {
      handler.next(error);
      return;
    }
    handler.next(error.copyWith(error: problem, message: problem.toString()));
  },
);
