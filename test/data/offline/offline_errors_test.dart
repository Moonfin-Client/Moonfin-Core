import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/offline/offline_errors.dart';

import '../services/unified_catalog_fakes.dart';

void main() {
  test('errors the downloads catalog fabricates are told apart from a '
      'server\'s own', () {
    expect(isFabricatedOfflineError(offlineNotFound('/Items/x')), isTrue);
    expect(isFabricatedOfflineError(offlineUnavailable('/Users/Me')), isTrue);

    // Only a server's own 404 lets its copy of a title be dropped.
    expect(isFabricatedOfflineError(httpError(404)), isFalse);
    expect(isFabricatedOfflineError(httpError(500)), isFalse);
    expect(isFabricatedOfflineError(StateError('x')), isFalse);
    expect(isFabricatedOfflineError(null), isFalse);
  });

  test('a fabricated error still has the status or type callers already '
      'handle', () {
    final notFound = offlineNotFound('/Items/x');
    expect(notFound.response?.statusCode, 404);
    expect(notFound.requestOptions.path, '/Items/x');

    final unavailable = offlineUnavailable('/Users/Me');
    expect(unavailable.type, DioExceptionType.connectionError);
    expect(unavailable.response, isNull);
  });
}
