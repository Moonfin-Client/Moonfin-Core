import 'package:server_core/server_core.dart';

/// Silo has no music libraries, so there is nothing to mix.
class SiloInstantMixApi implements InstantMixApi {
  const SiloInstantMixApi();

  @override
  Future<Map<String, dynamic>> getInstantMix(String itemId, {int? limit}) async => {
    'Items': <Map<String, dynamic>>[],
    'TotalRecordCount': 0,
  };
}
