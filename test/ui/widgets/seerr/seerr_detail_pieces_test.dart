import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/detail_section_layout.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_item_status.dart';

SeerrDiscoverItem _tv(int id) =>
    SeerrDiscoverItem(id: id, mediaType: 'tv', name: 'Show $id');

void main() {
  final l10n = lookupAppLocalizations(const Locale('en'));

  test('Similar leaves out what Recommendations already shows', () {
    final state = SeerrMediaDetailState(
      recommendations: [_tv(1), _tv(2)],
      similar: [_tv(2), _tv(3)],
    );
    final pieces = SeerrDetailPieces.resolve(
      state,
      DetailSectionVisibility.all,
      l10n,
    );
    expect(pieces.similarItems.map((i) => i.id), [3]);
    expect(pieces.similar, isTrue);
  });

  test('a Similar list that only repeats Recommendations is not drawn', () {
    // Silo answers both from its one list of recommendations.
    final state = SeerrMediaDetailState(
      recommendations: [_tv(1), _tv(2)],
      similar: [_tv(1), _tv(2)],
    );
    final pieces = SeerrDetailPieces.resolve(
      state,
      DetailSectionVisibility.all,
      l10n,
    );
    expect(pieces.recommendations, isTrue);
    expect(pieces.similar, isFalse);
  });

  test('with Recommendations switched off, Similar keeps everything', () {
    final state = SeerrMediaDetailState(
      recommendations: [_tv(1), _tv(2)],
      similar: [_tv(1), _tv(2)],
    );
    final pieces = SeerrDetailPieces.resolve(
      state,
      const DetailSectionVisibility({'seerrRecommendations'}),
      l10n,
    );
    expect(pieces.recommendations, isFalse);
    expect(pieces.similarItems.map((i) => i.id), [1, 2]);
  });

  test('a film and a series with the same id are different titles', () {
    final state = SeerrMediaDetailState(
      recommendations: [SeerrDiscoverItem(id: 7, mediaType: 'movie')],
      similar: [_tv(7)],
    );
    final pieces = SeerrDetailPieces.resolve(
      state,
      DetailSectionVisibility.all,
      l10n,
    );
    expect(pieces.similarItems.map((i) => i.id), [7]);
  });
}
