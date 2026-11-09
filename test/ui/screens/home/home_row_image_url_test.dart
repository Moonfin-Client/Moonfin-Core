import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/screens/home/home_row_card_image.dart';
import 'package:server_core/server_core.dart' show ImageApi;

/// Names the image kind, item, size and tag in the url so a test can tell
/// exactly which artwork a card asked for.
class _EchoImageApi implements ImageApi {
  String _query(Map<String, Object?> params) => params.entries
      .where((e) => e.value != null)
      .map((e) => '${e.key}=${e.value}')
      .join('&');

  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'P/$itemId?${_query({'w': maxWidth, 'h': maxHeight, 't': tag})}';

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => 'B/$itemId?${_query({'w': maxWidth, 't': tag})}';

  @override
  String getLogoImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      'L/$itemId?${_query({'w': maxWidth, 't': tag})}';

  @override
  String getBannerImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      'N/$itemId?${_query({'w': maxWidth, 't': tag})}';

  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      'T/$itemId?${_query({'w': maxWidth, 't': tag})}';

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _series = {
  'SeriesId': 'ser',
  'SeriesPrimaryImageTag': 'sp',
  'SeriesImageTags': {'Banner': 'sbn'},
};
const _parents = {
  'ParentPrimaryImageItemId': 'pp',
  'ParentPrimaryImageTag': 'ppt',
  'ParentThumbItemId': 'pth',
  'ParentThumbImageTag': 'ptt',
  'ParentBackdropItemId': 'pbd',
  'ParentBackdropImageTags': ['pbt'],
};

typedef _Case = ({
  String name,
  String type,
  Map<String, Object> raw,
  ImageType imageType,
  bool useSeriesThumbs,
  bool isMyMediaRow,
  String? expected,
  String serverId,
});

_Case _case(
  String name,
  String type,
  Map<String, Object> raw,
  ImageType imageType,
  String? expected, {
  bool useSeriesThumbs = false,
  bool isMyMediaRow = false,
  String serverId = 'srv',
}) => (
  name: name,
  type: type,
  raw: raw,
  imageType: imageType,
  useSeriesThumbs: useSeriesThumbs,
  isMyMediaRow: isMyMediaRow,
  expected: expected,
  serverId: serverId,
);

void main() {
  final api = _EchoImageApi();

  // A 150 px tall card at 1x. The expected urls are what Home asked for
  // before these helpers moved out of home_screen.dart.
  final cases = [
    _case(
      'an episode poster is the series poster',
      'Episode',
      _series,
      ImageType.poster,
      'P/ser?h=280&t=sp',
    ),
    _case(
      'an episode thumb with series thumbs on is the parent thumb',
      'Episode',
      _parents,
      ImageType.thumb,
      'T/pth?w=266&t=ptt',
      useSeriesThumbs: true,
    ),
    _case(
      'an episode thumb with series thumbs off skips the parent thumb',
      'Episode',
      _parents,
      ImageType.thumb,
      'P/pp?w=480&h=280&t=ppt',
    ),
    _case(
      'an episode banner is the series banner',
      'Episode',
      _series,
      ImageType.banner,
      'N/ser?w=810&t=sbn',
      useSeriesThumbs: true,
    ),
    _case(
      'an episode banner falls back to the series poster',
      'Episode',
      {'SeriesId': 'ser', 'SeriesPrimaryImageTag': 'sp'},
      ImageType.banner,
      'P/ser?w=810&t=sp',
      useSeriesThumbs: true,
    ),
    _case(
      'a banner row uses the banner',
      'Series',
      {
        'ImageTags': {'Banner': 'bn'},
      },
      ImageType.banner,
      'N/item?w=960&t=bn',
    ),
    _case(
      'a banner row falls back to the thumb',
      'Movie',
      {
        'ImageTags': {'Thumb': 'th'},
      },
      ImageType.banner,
      'T/item?w=960&t=th',
    ),
    _case(
      'a banner row falls back to the backdrop',
      'Movie',
      {
        'BackdropImageTags': ['bd'],
      },
      ImageType.banner,
      'B/item?w=960&t=bd',
    ),
    _case(
      'a thumb row falls back to the backdrop',
      'Movie',
      {
        'BackdropImageTags': ['bd'],
      },
      ImageType.thumb,
      'B/item?w=480&t=bd',
    ),
    _case(
      'a video thumb uses the parent backdrop',
      'Video',
      {
        'ParentBackdropItemId': 'pbd',
        'ParentBackdropImageTags': ['pbt'],
      },
      ImageType.thumb,
      'B/pbd?w=480&t=pbt',
    ),
    _case(
      'a channel shows its logo',
      'TvChannel',
      {
        'ImageTags': {'Logo': 'lg'},
      },
      ImageType.poster,
      'L/item?w=280&t=lg',
    ),
    _case(
      'a wide library poster on My Media asks for nothing',
      'CollectionFolder',
      {
        'PrimaryImageAspectRatio': 1.78,
        'ImageTags': {'Primary': 'p'},
      },
      ImageType.poster,
      null,
      isMyMediaRow: true,
    ),
    _case(
      'a wide library poster elsewhere is its primary',
      'CollectionFolder',
      {
        'PrimaryImageAspectRatio': 1.78,
        'ImageTags': {'Primary': 'p'},
      },
      ImageType.poster,
      'P/item?h=280&t=p',
    ),
    _case(
      'a My Media banner is the library primary',
      'CollectionFolder',
      {
        'PrimaryImageAspectRatio': 1.78,
        'ImageTags': {'Primary': 'p'},
      },
      ImageType.banner,
      'P/item?w=960&t=p',
      isMyMediaRow: true,
    ),
    _case(
      'a studio logo url wins',
      'Movie',
      {
        studioLogoUrlKey: 'https://logo/x.png',
        'ImageTags': {'Primary': 'p'},
      },
      ImageType.poster,
      'https://logo/x.png',
    ),
    _case(
      'a genre without portrait art takes the representative item',
      'Genre',
      {
        'PrimaryImageItemId': 'rep',
        'PrimaryImageTag': 'rpt',
        'PrimaryImageAspectRatio': 1.5,
        'ImageTags': {'Primary': 'p'},
      },
      ImageType.poster,
      'P/rep?h=280&t=rpt',
    ),
    _case(
      'a genre with portrait art keeps its own',
      'Genre',
      {
        'PrimaryImageItemId': 'rep',
        'PrimaryImageTag': 'rpt',
        'PrimaryImageAspectRatio': 0.67,
        'ImageTags': {'Primary': 'p'},
      },
      ImageType.poster,
      'P/item?h=280&t=p',
    ),
    _case(
      'a Seerr poster row uses the TMDB poster',
      'Movie',
      {'PosterPath': '/poster.jpg', 'BackdropPath': 'https://full/bd.jpg'},
      ImageType.poster,
      'https://image.tmdb.org/t/p/w300/poster.jpg',
      serverId: 'seerr',
    ),
    _case(
      'a Seerr thumb row uses the backdrop as is',
      'Movie',
      {'PosterPath': '/poster.jpg', 'BackdropPath': 'https://full/bd.jpg'},
      ImageType.thumb,
      'https://full/bd.jpg',
      serverId: 'seerr',
    ),
    _case(
      'a Seerr banner row with only a poster uses the poster',
      'Movie',
      {'PosterPath': '/poster.jpg'},
      ImageType.banner,
      'https://image.tmdb.org/t/p/w300/poster.jpg',
      serverId: 'seerr',
    ),
  ];

  group('resolveRowImageUrl', () {
    for (final c in cases) {
      test(c.name, () {
        final item = AggregatedItem(
          id: 'item',
          serverId: c.serverId,
          rawData: {'Id': 'item', 'Type': c.type, ...c.raw},
        );
        expect(
          resolveRowImageUrl(
            item,
            api,
            150,
            c.imageType,
            c.useSeriesThumbs,
            1,
            isMyMediaRow: c.isMyMediaRow,
          ),
          c.expected,
        );
      });
    }
  });
}
