import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:test/test.dart';

/// Answers the handful of routes the views and user configuration calls use,
/// from state a test can change, and counts the views requests that reach it.
class _FakeEmby extends Interceptor {
  _FakeEmby({required this.views, required this.config});

  List<String> views;
  Map<String, dynamic> config;
  int viewsRequests = 0;
  List<Map<String, dynamic>>? itemsByIds;
  Future<void> Function()? beforeViewsResponse;

  Map<String, dynamic> _item(String id) => {'Id': id, 'Name': 'Library $id'};

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    Object? data;
    switch ((options.method, options.path)) {
      case ('GET', '/Users/user-1/Views' || '/Users/user-2/Views'):
        viewsRequests++;
        data = {
          'Items': [for (final id in views) _item(id)],
        };
        await beforeViewsResponse?.call();
      case ('GET', '/Users/user-1' || '/Users/user-2'):
        data = {'Configuration': config};
      case ('GET', '/Users/user-1/Items'):
        final ids = (options.queryParameters['Ids'] as String).split(',');
        data = {
          'Items': itemsByIds ?? [for (final id in ids) _item(id)],
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
  late EmbyMediaServerClient client;

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
    client = EmbyMediaServerClient(
      baseUrl: 'https://emby.example',
      deviceInfo: const DeviceInfo(
        id: 'test',
        name: 'Views test',
        appName: 'Moonfin',
        appVersion: 'test',
      ),
      interceptors: [server],
    )..userId = 'user-1';
  }

  Future<List<String>> ids({bool includeHidden = false}) async {
    final response = await client.userViewsApi.getUserViews(
      includeHidden: includeHidden,
    );
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

    final config = await client.usersApi.getUserConfiguration();
    server.views = ['5', '3'];
    await client.usersApi.updateUserConfiguration(
      config.copyWith(orderedViews: ['5', '3']),
    );

    expect(await ids(), ['5', '3']);
    expect(server.viewsRequests, 2);
  });

  test(
    'the previous user’s cached libraries are not used after switching',
    () async {
      serve(views: ['john-library']);
      expect(await ids(), ['john-library']);

      client.userId = 'user-2';
      server.views = ['alice-library'];

      expect(await ids(), ['alice-library']);
      expect(server.viewsRequests, 2);
    },
  );

  test(
    'an in-flight lookup cannot cache another user’s hidden views',
    () async {
      serve(views: ['john-visible'], myMediaExcludes: ['john-hidden']);
      final requested = Completer<void>();
      final release = Completer<void>();
      server.beforeViewsResponse = () {
        requested.complete();
        return release.future;
      };

      final pendingViews = ids(includeHidden: true);
      await requested.future;
      client.userId = 'user-2';
      server.config = {
        'MyMediaExcludes': ['alice-hidden'],
      };
      release.complete();
      expect(await pendingViews, ['john-visible']);

      client.userId = 'user-1';
      server.beforeViewsResponse = null;
      server.config = {
        'MyMediaExcludes': ['john-hidden'],
      };
      expect(await ids(includeHidden: true), ['john-visible', 'john-hidden']);
    },
  );

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

  test("a stale hidden Guid doesn't bring back every library", () async {
    serve(
      views: ['3', '5'],
      myMediaExcludes: ['0123456789abcdef0123456789abcdef'],
    );
    server.itemsByIds = [server._item('3'), server._item('5')];

    expect(await ids(includeHidden: true), ['3', '5']);
  });

  test('a library hidden by Guid still comes back', () async {
    serve(views: ['3'], myMediaExcludes: ['abcdef0123456789abcdef0123456789']);
    server.itemsByIds = [
      {
        'Id': '9',
        'Guid': 'abcdef0123456789abcdef0123456789',
        'Name': 'Library 9',
      },
    ];

    expect(await ids(includeHidden: true), ['3', '9']);
  });
}
