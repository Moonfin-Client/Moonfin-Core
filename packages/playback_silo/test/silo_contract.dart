import 'dart:convert';
import 'dart:io';

/// Silo's pinned v2 contract (`server_silo`'s fixture).
final Map<String, dynamic> siloContract =
    jsonDecode(
          utf8.decode(
            gzip.decode(
              File(
                '../server_silo/test/fixtures/openapi-bd9d59ea.json.gz',
              ).readAsBytesSync(),
            ),
          ),
        )
        as Map<String, dynamic>;

Map<String, dynamic> get _schemas =>
    (siloContract['components'] as Map)['schemas'] as Map<String, dynamic>;

/// What's wrong with [value] as the contract's schema [name], as paths
/// (`client_capabilities.video_evidence: required`), or empty when it fits.
///
/// A small validator for the parts of JSON Schema the contract's playback
/// bodies use: `$ref`, `type` (one or a list), `required`, `properties`,
/// `additionalProperties` (Silo refuses unknown keys), `items`, `enum`,
/// `minimum`/`maximum`, `minLength`/`maxLength`, `maxItems`.
List<String> siloSchemaErrors(String name, Object? value) {
  final errors = <String>[];
  _check({r'$ref': '#/components/schemas/$name'}, value, name, errors);
  return errors;
}

void _check(
  Map<String, dynamic> schema,
  Object? value,
  String path,
  List<String> errors,
) {
  if (schema[r'$ref'] case final String ref) {
    _check(
      _schemas[ref.split('/').last] as Map<String, dynamic>,
      value,
      path,
      errors,
    );
    return;
  }
  final type = schema['type'];
  final types = type is List ? type.cast<String>() : [?type as String?];
  if (types.isNotEmpty && !types.any((t) => _isType(t, value))) {
    errors.add('$path: expected ${types.join('/')}, got $value');
    return;
  }
  if (schema['enum'] case final List allowed when !allowed.contains(value)) {
    errors.add('$path: $value not in $allowed');
  }
  if (value is num) {
    if (schema['minimum'] case final num min when value < min) {
      errors.add('$path: $value < $min');
    }
    if (schema['maximum'] case final num max when value > max) {
      errors.add('$path: $value > $max');
    }
  }
  if (value is String) {
    if (schema['minLength'] case final int min when value.length < min) {
      errors.add('$path: shorter than $min');
    }
    if (schema['maxLength'] case final int max when value.length > max) {
      errors.add('$path: longer than $max');
    }
  }
  if (value is List) {
    if (schema['maxItems'] case final int max when value.length > max) {
      errors.add('$path: more than $max items');
    }
    if (schema['items'] case final Map items) {
      for (final (i, v) in value.indexed) {
        _check(items.cast<String, dynamic>(), v, '$path[$i]', errors);
      }
    }
  }
  if (value is Map) {
    final properties =
        (schema['properties'] as Map?)?.cast<String, dynamic>() ?? const {};
    for (final key in (schema['required'] as List?) ?? const []) {
      if (!value.containsKey(key)) errors.add('$path.$key: required');
    }
    final extra = schema['additionalProperties'];
    for (final entry in value.entries) {
      final key = '${entry.key}';
      final property = properties[key];
      if (property is Map) {
        _check(
          property.cast<String, dynamic>(),
          entry.value,
          '$path.$key',
          errors,
        );
      } else if (extra is Map) {
        _check(
          extra.cast<String, dynamic>(),
          entry.value,
          '$path.$key',
          errors,
        );
      } else if (extra == false) {
        errors.add('$path.$key: not in the contract');
      }
    }
  }
}

bool _isType(String type, Object? value) => switch (type) {
  'object' => value is Map,
  'array' => value is List,
  'string' => value is String,
  'integer' => value is int,
  'number' => value is num,
  'boolean' => value is bool,
  'null' => value == null,
  _ => true,
};
