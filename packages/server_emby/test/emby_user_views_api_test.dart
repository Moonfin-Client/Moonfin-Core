import 'package:dio/dio.dart';
import 'package:server_emby/src/api/emby_user_views_api.dart';
import 'package:server_emby/src/api/emby_users_api.dart';
import 'package:test/test.dart';

/// Answers the handful of routes the views and user configuration calls use,
/// from state a test can change, and counts the views requests that reach it.
class _FakeEmby extends Interceptor {
  _FakeEmby({required this.views, required this.config});

  List<String> views;
  Map<String, dynamic> config;
  int viewsRequests = 0;

  Map<String, dynamic> _item(String id) => {'Id': id, 'Name': 'Library $id'};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Object? data;
    switch ((options.method, options.path)) {
      case ('GET', '/Users/user-1/Views'):
        viewsRequests++;
        data = {
          'Items': [for (final id in views) _item(id)],
        };
      case ('GET', '/Users/user-1'):
        data = {'Configuration': config};
      case ('GET', '/Users/user-1/Items'):
        final ids = (options.queryParameters['Ids'] as String).split(',');
        data = {
          'Items': [for (final id in ids) _item(id)],
        };
      case ('POST', '/Users/user-1/Configuration'):
        config = Map<String, dynamic>.from(options.data as Map);
    }
    handler.resolve(
      Response<dynamic>(requestOptions: options, statusCode: 200, data: data),
    );
  }
}

void main() {
  late _FakeEmby server;
  late EmbyUserViewsApi viewsApi;
  late EmbyUsersApi usersApi;

  void serve({
    required List<String> views,
    List<String> orderedViews = const [],
    List<String> myMediaExcludes = const [],
  }) {
    server = _FakeEmby(
      views: views,
      config: {
        'OrderedViews': orderedViews,
        'MyMediaExcludes': myMediaExcludes,
      },
    );
    final dio = Dio()..interceptors.add(server);
    // Wired the way EmbyMediaServerClient wires them.
    viewsApi = EmbyUserViewsApi(dio, () => 'user-1', () => usersApi);
    usersApi = EmbyUsersApi(
      dio,
      () => 'user-1',
      onConfigurationUpdated: viewsApi.invalidateCache,
    );
  }

  Future<List<String>> ids({bool includeHidden = false}) async {
    final response = await viewsApi.getUserViews(includeHidden: includeHidden);
    return [
      for (final item in response['Items'] as List)
        (item as Map)['Id'] as String,
    ];
  }

  test('a configuration write drops the cached views', () async {
    serve(views: ['3', '5']);
    await ids();
    await ids();
    expect(server.viewsRequests, 1);

    final config = await usersApi.getUserConfiguration();
    server.views = ['5', '3'];
    await usersApi.updateUserConfiguration(
      config.copyWith(orderedViews: ['5', '3']),
    );

    expect(await ids(), ['5', '3']);
    expect(server.viewsRequests, 2);
  });

  test('a hidden library comes back in its saved slot', () async {
    serve(
      views: ['3', '5'],
      orderedViews: ['9', '3', '5'],
      myMediaExcludes: ['9'],
    );

    expect(await ids(includeHidden: true), ['9', '3', '5']);
  });

  test(
    'libraries the saved order leaves out keep their place after it',
    () async {
      serve(
        views: ['3', '5', '7'],
        orderedViews: ['5', '9'],
        myMediaExcludes: ['9'],
      );

      expect(await ids(includeHidden: true), ['5', '9', '3', '7']);
    },
  );

  test('with no saved order a hidden library still goes last', () async {
    serve(views: ['3', '5'], myMediaExcludes: ['9']);

    expect(await ids(includeHidden: true), ['3', '5', '9']);
  });
}
