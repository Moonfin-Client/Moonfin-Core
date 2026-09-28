import 'package:dio/dio.dart';
import 'package:server_jellyfin/src/api/jellyfin_admin_library_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.handle);

  final void Function(RequestOptions options, RequestInterceptorHandler handler)
  handle;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handle(options, handler);
}

void main() {
  RequestOptions? request;
  late JellyfinAdminLibraryApi api;

  setUp(() {
    request = null;
    final dio = Dio()
      ..interceptors.add(
        _FakeServer((options, handler) {
          request = options;
          handler.resolve(Response(requestOptions: options, statusCode: 204));
        }),
      );
    api = JellyfinAdminLibraryApi(dio);
  });

  // Verified against Jellyfin 12.0.
  test('a new library carries its folders in its library options', () async {
    await api.addVirtualFolder(
      name: 'Movies',
      collectionType: 'movies',
      paths: ['/media/movies', '/media/other,comma'],
      refreshLibrary: true,
    );

    expect(request?.method, 'POST');
    expect(request?.path, '/Library/VirtualFolders');
    expect(request?.queryParameters, {
      'name': 'Movies',
      'collectionType': 'movies',
      'refreshLibrary': true,
    });
    expect(request?.data, {
      'LibraryOptions': {
        'PathInfos': [
          {'Path': '/media/movies'},
          {'Path': '/media/other,comma'},
        ],
      },
    });
  });

  test('a new library with no folders sends no library options', () async {
    await api.addVirtualFolder(name: 'Mixed');

    expect(request?.data, isEmpty);
  });
}
