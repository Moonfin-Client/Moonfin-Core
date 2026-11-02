import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/offline/offline_media_segments.dart';
import 'package:server_core/server_core.dart';

class _MockItemsApi extends Mock implements ItemsApi {}

void main() {
  late _MockItemsApi itemsApi;

  final intro = {
    'Id': 's1',
    'ItemId': 'e1',
    'Type': 'Intro',
    'StartTicks': 0,
    'EndTicks': 300000000,
  };
  final video = {'Id': 'e1', 'Type': 'Episode', 'MediaType': 'Video'};

  setUp(() => itemsApi = _MockItemsApi());

  test('a video gets the server segments saved into it', () async {
    when(() => itemsApi.getMediaSegments('e1'))
        .thenAnswer((_) async => [intro]);

    final item = await withMediaSegments(itemsApi, 'e1', video);

    expect(storedMediaSegments(item), [intro]);
    expect(item['Id'], 'e1');
  });

  test('anything but a video is left alone without asking', () async {
    final track = {'Id': 'a1', 'Type': 'Audio', 'MediaType': 'Audio'};

    final item = await withMediaSegments(itemsApi, 'a1', track);

    expect(item, same(track));
    verifyNever(() => itemsApi.getMediaSegments(any()));
  });

  test('a failed request keeps the segments already saved', () async {
    when(() => itemsApi.getMediaSegments('e1')).thenThrow(Exception('503'));

    final item = await withMediaSegments(
      itemsApi,
      'e1',
      video,
      fallback: () => [intro],
    );

    expect(storedMediaSegments(item), [intro]);
  });

  test('a video with no segments is saved unchanged', () async {
    when(() => itemsApi.getMediaSegments('e1')).thenAnswer((_) async => []);

    final item = await withMediaSegments(itemsApi, 'e1', video);

    expect(item, same(video));
  });

  test('reading stored segments survives bad or missing data', () {
    expect(storedMediaSegments(null), isEmpty);
    expect(storedMediaSegments({offlineMediaSegmentsKey: 'nope'}), isEmpty);
    expect(storedMediaSegmentsJson('not json'), isEmpty);
    expect(storedMediaSegmentsJson('[1, 2]'), isEmpty);
  });
}
