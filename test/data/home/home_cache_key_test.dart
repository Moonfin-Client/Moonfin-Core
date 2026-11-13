import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';

void main() {
  String token({required bool multiServer, required bool mergeLibraries}) =>
      HomeViewModel.multiServerCacheToken(
        multiServerEnabled: multiServer,
        mergeLibrariesByType: mergeLibraries,
      );

  test('a single server keeps the cache key it had before libraries could '
      'be merged, whatever the merge setting says', () {
    expect(token(multiServer: false, mergeLibraries: false), 'false');
    expect(token(multiServer: false, mergeLibraries: true), 'false');
  });

  test('several servers cache merged and unmerged rows apart', () {
    expect(token(multiServer: true, mergeLibraries: false), 'true');
    expect(token(multiServer: true, mergeLibraries: true), 'true+merged');
  });
}
