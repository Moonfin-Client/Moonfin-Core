import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';

void main() {
  test('Top 10 sections keep stable persisted identifiers', () {
    expect(
      HomeSectionType.fromSerialized('toptenmovies'),
      HomeSectionType.topTenMovies,
    );
    expect(
      HomeSectionType.fromSerialized('toptentvshows'),
      HomeSectionType.topTenTvShows,
    );
  });

  test('new profiles enable separate movie and TV Top 10 sections', () {
    final defaults = HomeSectionConfig.defaults();
    expect(
      defaults
          .where((c) => c.type == HomeSectionType.topTenMovies)
          .single
          .enabled,
      isTrue,
    );
    expect(
      defaults
          .where((c) => c.type == HomeSectionType.topTenTvShows)
          .single
          .enabled,
      isTrue,
    );
  });
}
