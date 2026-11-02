import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:server_core/server_core.dart';

class _ItemsApi implements ItemsApi {
  _ItemsApi(this.respond);

  final Future<Map<String, dynamic>> Function() respond;
  String? parentId;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getItems) {
      parentId = invocation.namedArguments[#parentId] as String?;
      return respond();
    }
    return super.noSuchMethod(invocation);
  }
}

void main() {
  test('a timed out lookup leaves the file to play on its own', () async {
    final api = _ItemsApi(
      () => Future.error(
        DioException.connectionTimeout(
          timeout: const Duration(seconds: 8),
          requestOptions: RequestOptions(path: '/Items'),
        ),
      ),
    );

    expect(await audiobookSiblingsRaw(api, 'folder', fields: ''), isEmpty);
  });

  test('a lookup that answers returns the folder in server order', () async {
    final api = _ItemsApi(
      () async => {
        'Items': [
          {'Id': 'part1', 'Type': 'AudioBook'},
          {'Id': 'part2', 'Type': 'AudioBook'},
        ],
      },
    );

    final siblings = await audiobookSiblingsRaw(api, 'folder', fields: '');

    expect(api.parentId, 'folder');
    expect([for (final s in siblings) s['Id']], ['part1', 'part2']);
  });
}
