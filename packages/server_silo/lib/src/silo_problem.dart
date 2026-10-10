import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// An RFC 9457 Problem Details body from Silo's `/api/v2`.
///
/// Silo's stable identifier is the final segment of the `type` URI, for example
/// `.../problems/token_refresh_required` → `token_refresh_required`. Field-level
/// validation failures carry their own codes in [errors].
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

  /// The problem identifier: the last path segment of [type].
  String? get code {
    final t = type;
    if (t == null || t.isEmpty) return null;
    final path = Uri.tryParse(t)?.pathSegments;
    if (path == null || path.isEmpty) return t;
    return path.lastWhere((s) => s.isNotEmpty, orElse: () => t);
  }

  static SiloProblem? fromJson(Object? body) {
    final data = asJsonMap(body);
    if (data == null) return null;
    final type = data['type'];
    final title = data['title'];
    if (type is! String && title is! String) return null;
    final rawErrors = data['errors'];
    return SiloProblem(
      type: type is String ? type : null,
      title: title is String ? title : null,
      status: (data['status'] as num?)?.toInt(),
      detail: data['detail'] as String?,
      instance: data['instance'] as String?,
      errors: rawErrors is List
          ? rawErrors
                .whereType<Map>()
                .map(
                  (e) => SiloProblemError(
                    code: e['code'] as String?,
                    detail: e['detail'] as String?,
                    location: e['location'] as String?,
                  ),
                )
                .toList(growable: false)
          : const [],
    );
  }

  /// The problem carried by a failed Silo request, if it sent one.
  static SiloProblem? of(DioException error) =>
      fromJson(error.response?.data);

  /// The problem identifier of a failed Silo request, if any.
  static String? codeOf(DioException error) => of(error)?.code;

  /// The seconds a `Retry-After` header asks the client to wait, if any.
  static int? retryAfterSeconds(DioException error) {
    final raw = error.response?.headers.value('retry-after');
    return raw == null ? null : int.tryParse(raw.trim());
  }

  @override
  String toString() =>
      'SiloProblem(${status ?? '-'} ${code ?? type}: ${detail ?? title})';
}

class SiloProblemError {
  final String? code;
  final String? detail;
  final String? location;

  const SiloProblemError({this.code, this.detail, this.location});
}
