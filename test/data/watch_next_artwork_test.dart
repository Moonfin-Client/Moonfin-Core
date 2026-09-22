import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/watch_next_service.dart';
import 'package:server_core/server_core.dart';

/// Names the image type in the URL so a test can say which one was chosen.
class _FakeImageApi implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'http://fake/$itemId/Primary';

  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      'http://fake/$itemId/Thumb';

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => 'http://fake/$itemId/Backdrop';

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient implements MediaServerClient {
  final _imageApi = _FakeImageApi();

  @override
  ImageApi get imageApi => _imageApi;

  @override
  String? get accessToken => null;

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

AggregatedItem _movie(Map<String, dynamic> images) => AggregatedItem(
  id: 'm1',
  serverId: 's1',
  rawData: <String, dynamic>{
    'Id': 'm1',
    'Name': 'A Movie',
    'Type': 'Movie',
    ...images,
  },
);

AggregatedItem _series(Map<String, dynamic> images) => AggregatedItem(
  id: 's1',
  serverId: 's1',
  rawData: <String, dynamic>{
    'Id': 's1',
    'Name': 'A Show',
    'Type': 'Series',
    ...images,
  },
);

void main() {
  final client = _FakeClient();

  String? artFor(AggregatedItem item) =>
      WatchNextService.buildProgramPayload(item, client)?['posterUri']
          as String?;

  test('a wide thumb wins, because the launcher card is 16:9', () {
    final art = artFor(
      _movie({
        'ImageTags': {'Thumb': 't', 'Primary': 'p'},
        'BackdropImageTags': ['b'],
      }),
    );
    expect(art, contains('/Thumb'));
  });

  test('a backdrop stands in when there is no thumb', () {
    final art = artFor(
      _movie({
        'ImageTags': {'Primary': 'p'},
        'BackdropImageTags': ['b'],
      }),
    );
    expect(art, contains('/Backdrop'));
  });

  test('the upright poster is only the last resort', () {
    final art = artFor(
      _movie({
        'ImageTags': {'Primary': 'p'},
      }),
    );
    expect(art, contains('/Primary'));
  });

  test('series card uses thumbnail when available', () {
    final art = artFor(
      _series({
        'ImageTags': {'Thumb': 't', 'Primary': 'p'},
        'BackdropImageTags': ['b'],
      }),
    );
    expect(art, contains('/Thumb'));
  });

  test('series card uses parent thumb tag if ImageTags Thumb is missing', () {
    final art = artFor(
      _series({
        'ParentThumbImageTag': 'pt',
        'ParentThumbItemId': 'p1',
        'ImageTags': {'Primary': 'p'},
        'BackdropImageTags': ['b'],
      }),
    );
    expect(art, contains('/p1/Thumb'));
  });

  test(
    'series card prefers primary poster over backdrop when thumb is missing',
    () {
      final art = artFor(
        _series({
          'ImageTags': {'Primary': 'p'},
          'BackdropImageTags': ['b'],
        }),
      );
      expect(art, contains('/Primary'));
    },
  );

  test('series card falls back to backdrop only when neither thumb nor poster exists', () {
    final art = artFor(
      _series({
        'BackdropImageTags': ['b'],
      }),
    );
    expect(art, contains('/Backdrop'));
  });

  // A show sitting in a library folder with artwork of its own carries both
  // sets of tags, which is where a mixed up pairing shows itself.
  test(
    'a series own thumb is asked for against the series, not its parent',
    () {
      final art = artFor(
        _series({
          'ImageTags': {'Thumb': 'own'},
          'ParentThumbItemId': 'library1',
          'ParentThumbImageTag': 'parent',
        }),
      );
      expect(art, contains('/s1/Thumb'));
    },
  );

  test(
    'a series own backdrop is asked for against the series, not its parent',
    () {
      final art = artFor(
        _series({
          'BackdropImageTags': ['own'],
          'ParentBackdropItemId': 'library1',
          'ParentBackdropImageTags': ['parent'],
        }),
      );
      expect(art, contains('/s1/Backdrop'));
    },
  );

  test(
    'a series own poster is asked for against the series, not its series id',
    () {
      final art = artFor(
        _series({
          'ImageTags': {'Primary': 'own'},
          'SeriesId': 'other1',
          'SeriesPrimaryImageTag': 'parent',
        }),
      );
      expect(art, contains('/s1/Primary'));
    },
  );
}
