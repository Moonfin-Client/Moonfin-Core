import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/detail_section_layout.dart';
import 'package:moonfin/preference/preference_constants.dart';

class _PluginSync extends Mock implements PluginSyncService {}

void main() {
  tearDown(() => GetIt.instance.reset());

  test('ids are unique, since they are what gets stored', () {
    final ids = DetailSection.values.map((s) => s.id).toList();
    expect(ids.toSet(), hasLength(ids.length));
  });

  test('every Seerr piece has a switch of its own', () {
    final seerr = DetailSection.values
        .where((s) => s.group == DetailSectionGroup.seerr)
        .map((s) => s.id);
    expect(
      seerr,
      containsAll([
        'seerrGenresTags',
        'seerrStats',
        'seerrRecommendations',
        'seerrSimilar',
        'seerrCollection',
        'seerrPersonAppearances',
        'seerrPersonCrew',
      ]),
    );
  });

  test('a style only lists what it draws', () {
    expect(
      DetailSection.poster.isAvailableIn(DetailScreenStyle.classic),
      isTrue,
    );
    expect(
      DetailSection.poster.isAvailableIn(DetailScreenStyle.modern),
      isFalse,
    );
    expect(
      DetailSection.mediaInfo.isAvailableIn(DetailScreenStyle.classic),
      isFalse,
    );
    expect(
      DetailSection.mediaInfo.isAvailableIn(DetailScreenStyle.nouveau),
      isTrue,
    );
  });

  test('Minimalist also lists what Spotlight draws for the pages it hands '
      'over', () {
    final minimalist = DetailSection.values
        .where((s) => s.isAvailableIn(DetailScreenStyle.minimalist))
        .toSet();
    final spotlight = DetailSection.values
        .where((s) => s.isAvailableIn(DetailScreenStyle.spotlight))
        .toSet();

    expect(minimalist, containsAll(spotlight));
    expect(minimalist, contains(DetailSection.logo));
    expect(minimalist, isNot(contains(DetailSection.poster)));
  });

  test('Seerr pieces are only offered when Seerr is', () {
    final plugin = _PluginSync();
    when(() => plugin.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(plugin);

    expect(DetailSection.seerrStats.isOffered, isFalse);
    expect(DetailSection.cast.isOffered, isTrue);

    when(() => plugin.seerrAvailable).thenReturn(true);
    expect(DetailSection.seerrStats.isOffered, isTrue);
  });

  test('visibility reads the hidden ids', () {
    const visibility = DetailSectionVisibility({'cast', 'seerrStats'});

    expect(visibility.shows(DetailSection.cast), isFalse);
    expect(visibility.shows(DetailSection.seerrStats), isFalse);
    expect(visibility.shows(DetailSection.crew), isTrue);
    expect(DetailSectionVisibility.all.shows(DetailSection.cast), isTrue);
    expect(
      const DetailSectionVisibility({'a', 'b'}),
      const DetailSectionVisibility({'b', 'a'}),
    );
  });
}
