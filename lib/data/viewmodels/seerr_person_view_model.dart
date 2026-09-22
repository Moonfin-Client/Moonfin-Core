import 'package:flutter/foundation.dart';

import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';

class SeerrPersonState {
  final bool isLoading;
  final Object? error;
  final SeerrPersonDetails? person;
  final List<SeerrDiscoverItem> castCredits;
  final List<SeerrDiscoverItem> crewCredits;

  const SeerrPersonState({
    this.isLoading = false,
    this.error,
    this.person,
    this.castCredits = const [],
    this.crewCredits = const [],
  });
}

class SeerrPersonViewModel extends ChangeNotifier {
  final SeerrRepository _repo;

  SeerrPersonState _state = const SeerrPersonState();
  SeerrPersonState get state => _state;

  SeerrPersonViewModel(this._repo);

  Future<void> load(int personId) async {
    _state = const SeerrPersonState(isLoading: true);
    notifyListeners();

    try {
      await _repo.ensureInitialized();

      final results = await Future.wait([
        _repo.getPersonDetails(personId),
        _repo.getPersonCombinedCredits(personId),
      ]);

      final person = results[0] as SeerrPersonDetails;
      final credits = results[1] as SeerrPersonCombinedCredits;

      final castWithPosters = credits.cast
          .where((i) => i.posterPath != null && !i.isBlacklisted)
          .toList()
        ..sort((a, b) => a.displayTitle.compareTo(b.displayTitle));

      final crewWithPosters = credits.crew
          .where((i) => i.posterPath != null && !i.isBlacklisted)
          .toList()
        ..sort((a, b) => a.displayTitle.compareTo(b.displayTitle));

      _state = SeerrPersonState(
        person: person,
        castCredits: castWithPosters,
        crewCredits: crewWithPosters,
      );
    } catch (e) {
      _state = SeerrPersonState(error: e);
    }
    notifyListeners();
  }
}
