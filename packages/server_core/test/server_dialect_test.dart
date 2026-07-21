import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

class _Capture extends Interceptor {
  RequestOptions? last;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) {
    last = options;
    h.resolve(
      Response(
        requestOptions: options,
        statusCode: 200,
        data: {'Items': <dynamic>[], 'TotalRecordCount': 0},
      ),
    );
  }
}

void main() {
  group('dialect endpoint paths', () {
    test('jellyfin uses user-less resume/latest/views paths', () async {
      final cap = _Capture();
      final dio = Dio()..interceptors.add(cap);
      const d = ServerDialect.jellyfin;
      final items = ServerItemsApi(dio, d, () => 'u1');
      final views = ServerUserViewsApi(dio, d, () => 'u1');

      await items.getResumeItems();
      expect(cap.last!.path, '/UserItems/Resume');
      await items.getLatestItems();
      expect(cap.last!.path, '/Items/Latest');
      await views.getUserViews();
      expect(cap.last!.path, '/UserViews');
    });

    test('emby uses /Users/{id} scoped paths', () async {
      final cap = _Capture();
      final dio = Dio()..interceptors.add(cap);
      const d = ServerDialect.emby;
      final items = ServerItemsApi(dio, d, () => 'u1');
      final views = ServerUserViewsApi(dio, d, () => 'u1');

      await items.getResumeItems();
      expect(cap.last!.path, '/Users/u1/Items/Resume');
      await items.getLatestItems();
      expect(cap.last!.path, '/Users/u1/Items/Latest');
      await views.getUserViews();
      expect(cap.last!.path, '/Users/u1/Views');
    });
  });

  group('dialect query param casing', () {
    // Jellyfin documents camelCase, Emby documents PascalCase for the
    // /Sessions controllable-user filter; each server gets its prescribed
    // wire format.
    Future<String> capturedParamName(ServerDialect d) async {
      RequestOptions? last;
      final dio = Dio()
        ..interceptors.add(InterceptorsWrapper(onRequest: (o, h) {
          last = o;
          h.resolve(
              Response(requestOptions: o, statusCode: 200, data: <dynamic>[]));
        }));
      await ServerSessionApi(dio, d).getSessions(controllableByUserId: 'u1');
      return last!.queryParameters.keys.single;
    }

    test('jellyfin sends controllableByUserId', () async {
      expect(await capturedParamName(ServerDialect.jellyfin),
          'controllableByUserId');
    });

    test('emby sends ControllableByUserId', () async {
      expect(await capturedParamName(ServerDialect.emby),
          'ControllableByUserId');
    });
  });

  group('dialect capabilities', () {
    test('emby returns empty lyrics/segments without a request', () async {
      var requests = 0;
      final dio = Dio()
        ..interceptors.add(InterceptorsWrapper(onRequest: (o, h) {
          requests++;
          h.resolve(Response(requestOptions: o, statusCode: 200, data: {}));
        }));
      final api = ServerItemsApi(dio, ServerDialect.emby, () => 'u1');

      expect(await api.getLyrics('i1'), {'Lyrics': []});
      expect(await api.getMediaSegments('i1'), isEmpty);
      expect(requests, 0);
    });

    test('emby throws on quick connect and remote subtitle search', () {
      final auth = ServerAuthApi(Dio(), ServerDialect.emby);
      final items = ServerItemsApi(Dio(), ServerDialect.emby, () => 'u1');

      expect(auth.initiateQuickConnect, throwsUnsupportedError);
      expect(
        () => items.searchRemoteSubtitles('i1', language: 'en'),
        throwsUnsupportedError,
      );
      expect(
        () => items.downloadRemoteSubtitle('i1', 's1'),
        throwsUnsupportedError,
      );
    });

    test('jellyfin image urls omit api_key, emby includes it', () {
      const base = 'http://server.local';
      final jf = ServerImageApi(() => base, () => 'tok', ServerDialect.jellyfin);
      final em = ServerImageApi(() => base, () => 'tok', ServerDialect.emby);

      expect(
        jf.getPrimaryImageUrl('i1'),
        '$base/Items/i1/Images/Primary',
      );
      expect(
        em.getPrimaryImageUrl('i1'),
        '$base/Items/i1/Images/Primary?api_key=tok',
      );
    });
  });
}
