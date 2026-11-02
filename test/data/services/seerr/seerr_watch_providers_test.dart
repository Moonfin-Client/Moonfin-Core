import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/detail_section_layout.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_item_status.dart';

// Issue #1929: Seerr's title details carry where the title streams, per country.

final _movieJson = {
  'id': 693134,
  'title': 'Dune: Part Two',
  'watchProviders': [
    {
      'iso_3166_1': 'DE',
      'flatrate': [
        {'id': 8, 'name': 'Netflix', 'logoPath': '/netflix.jpg'},
      ],
    },
    {
      'iso_3166_1': 'US',
      'link': 'https://www.themoviedb.org/movie/693134/watch?locale=US',
      'buy': [
        {'id': 2, 'name': 'Apple TV', 'logoPath': '/apple.jpg'},
      ],
      'flatrate': [
        {'id': 1899, 'name': 'HBO Max', 'logoPath': '/max.jpg'},
        {'id': 2528, 'name': 'YouTube TV', 'logoPath': '/yttv.jpg'},
      ],
    },
  ],
};

SeerrMediaDetailState _state(String region) => SeerrMediaDetailState(
  movie: SeerrMovieDetails.fromJson(_movieJson),
  streamingRegion: region,
);

void main() {
  test('shows what streams in the region, in the order Seerr sends', () {
    expect(_state('US').streamingProviders.map((p) => p.name), [
      'HBO Max',
      'YouTube TV',
    ]);
    expect(_state('DE').streamingProviders.single.logoPath, '/netflix.jpg');
  });

  test('a region with nothing streaming gets nothing', () {
    expect(_state('FR').streamingProviders, isEmpty);
  });

  test('a series parses its providers too', () {
    final tv = SeerrTvDetails.fromJson({
      'id': 1396,
      'name': 'Breaking Bad',
      'watchProviders': [
        {
          'iso_3166_1': 'US',
          'flatrate': [
            {'id': 8, 'name': 'Netflix'},
          ],
        },
      ],
    });
    expect(
      SeerrMediaDetailState(tv: tv).streamingProviders.single.name,
      'Netflix',
    );
  });

  test("the user's region comes from their Seerr settings", () {
    final user = SeerrUser.fromJson({
      'id': 3,
      'settings': {'streamingRegion': 'GB'},
    });
    expect(user.streamingRegion, 'GB');
    expect(SeerrUser.fromJson(user.toJson()).streamingRegion, 'GB');
    expect(SeerrUser.fromJson({'id': 4}).streamingRegion, isNull);
  });

  test('switching the section off hides the row', () {
    final l10n = lookupAppLocalizations(const Locale('en'));
    final state = _state('US');

    expect(
      SeerrDetailPieces.resolve(
        state,
        DetailSectionVisibility.all,
        l10n,
      ).streaming,
      isTrue,
    );
    expect(
      SeerrDetailPieces.resolve(
        state,
        const DetailSectionVisibility({'seerrStreaming'}),
        l10n,
      ).streaming,
      isFalse,
    );
  });
}
