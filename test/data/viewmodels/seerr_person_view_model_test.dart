import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_person_view_model.dart';

class _FakeSeerr extends Fake implements SeerrRepository {
  _FakeSeerr(this.cast);

  final List<SeerrDiscoverItem> cast;

  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  Future<SeerrPersonDetails> getPersonDetails(int personId) async =>
      SeerrPersonDetails(id: personId, name: 'Adam Scott');

  @override
  Future<SeerrPersonCombinedCredits> getPersonCombinedCredits(
    int personId,
  ) async => SeerrPersonCombinedCredits(cast: cast);
}

void main() {
  test('a library title without a poster stays, a TMDB one does not', () async {
    final vm = SeerrPersonViewModel(
      _FakeSeerr(const [
        SeerrDiscoverItem(id: 1, title: 'Poster', posterPath: '/a.jpg'),
        SeerrDiscoverItem(id: 2, title: 'TMDB, no poster'),
        SeerrDiscoverItem(
          id: 3,
          title: 'Library, no poster',
          mediaInfo: SeerrMediaInfo(status: 5, jellyfinMediaId: 'movie-heat'),
        ),
        SeerrDiscoverItem(
          id: 4,
          title: 'Blocklisted',
          posterPath: '/b.jpg',
          mediaInfo: SeerrMediaInfo(status: 6, jellyfinMediaId: 'movie-x'),
        ),
      ]),
    );

    await vm.load(1);

    expect(vm.state.castCredits.map((c) => c.id), [3, 1]);
  });
}
