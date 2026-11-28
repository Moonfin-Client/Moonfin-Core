import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/now_playing_artwork.dart';
import 'package:server_core/server_core.dart' show ImageApi;

/// Names the image kind, item and tag in the url so a test can tell which
/// artwork was picked.
class _EchoImageApi implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'Primary/$itemId/$tag${maxHeight != null ? '?h=$maxHeight' : ''}';

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => 'Backdrop/$itemId/$tag';

  @override
  String getLogoImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      'Logo/$itemId/$tag';

  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      'Thumb/$itemId/$tag';

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _seriesImages = {
  'SeriesId': 'ser',
  'SeriesPrimaryImageTag': 'sp',
  'ParentLogoItemId': 'ser',
  'ParentLogoImageTag': 'logo',
  'ParentThumbItemId': 'ser',
  'ParentThumbImageTag': 'st',
  'ParentBackdropItemId': 'ser',
  'ParentBackdropImageTags': ['sb'],
};

void main() {
  final api = _EchoImageApi();
  String? pick(Map<String, dynamic> raw) =>
      nowPlayingArtworkUrl(api, raw, itemId: raw['Id'] as String?);

  test('an episode uses its own still, not the series logo', () {
    expect(
      pick({
        'Id': 'ep',
        'Type': 'Episode',
        'ImageTags': {'Primary': 'still'},
        ..._seriesImages,
      }),
      'Primary/ep/still',
    );
  });

  test('an episode without a still falls back to the series thumb', () {
    expect(
      pick({'Id': 'ep', 'Type': 'Episode', 'ImageTags': {}, ..._seriesImages}),
      'Thumb/ser/st',
    );
  });

  test('then the series backdrop, then the series poster', () {
    final raw = <String, dynamic>{'Id': 'ep', 'Type': 'Episode'}
      ..addAll(_seriesImages)
      ..remove('ParentThumbImageTag');
    expect(pick(raw), 'Backdrop/ser/sb');
    raw.remove('ParentBackdropImageTags');
    expect(pick(raw), 'Primary/ser/sp');
  });

  test('a movie uses its poster, then thumb, then backdrop', () {
    expect(
      pick({
        'Id': 'mv',
        'ImageTags': {'Primary': 'p', 'Thumb': 't', 'Logo': 'l'},
        'BackdropImageTags': ['b'],
      }),
      'Primary/mv/p',
    );
    expect(
      pick({
        'Id': 'mv',
        'ImageTags': {'Thumb': 't', 'Logo': 'l'},
        'BackdropImageTags': ['b'],
      }),
      'Thumb/mv/t',
    );
    expect(
      pick({
        'Id': 'mv',
        'ImageTags': {'Logo': 'l'},
        'BackdropImageTags': ['b'],
      }),
      'Backdrop/mv/b',
    );
  });

  test('never the logo: null when only a logo exists', () {
    expect(
      pick({
        'Id': 'mv',
        'ImageTags': {'Logo': 'l'},
        'ParentLogoItemId': 'ser',
        'ParentLogoImageTag': 'logo',
      }),
      isNull,
    );
  });

  test('blank tags are skipped', () {
    expect(
      pick({
        'Id': 'ep',
        'ImageTags': {'Primary': '  '},
        'BackdropImageTags': [''],
        ..._seriesImages,
      }),
      'Thumb/ser/st',
    );
  });

  test('maxHeight sizes the picture by height, as the music surfaces do', () {
    expect(
      nowPlayingArtworkUrl(
        api,
        {'Id': 'ep', 'ImageTags': {'Primary': 'still'}},
        maxHeight: 300,
      ),
      'Primary/ep/still?h=300',
    );
  });
}
