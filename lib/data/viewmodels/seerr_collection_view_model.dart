import 'package:flutter/foundation.dart';

import '../repositories/seerr_repository.dart';
import '../services/seerr/seerr_api_models.dart';
import '../services/seerr/seerr_error.dart';

class SeerrCollectionRequestResult {
  final int requested;
  final int total;
  final SeerrRequestErrorKind? firstErrorKind;

  const SeerrCollectionRequestResult({
    required this.requested,
    required this.total,
    this.firstErrorKind,
  });

  bool get allSucceeded => requested >= total;
}

class SeerrCollectionState {
  final bool isLoading;
  final String? error;
  final SeerrCollection? collection;
  final SeerrUser? currentUser;
  final SeerrQuota? quota;
  final bool isRequesting;
  final int requestProgressCurrent;
  final int requestProgressTotal;

  const SeerrCollectionState({
    this.isLoading = false,
    this.error,
    this.collection,
    this.currentUser,
    this.quota,
    this.isRequesting = false,
    this.requestProgressCurrent = 0,
    this.requestProgressTotal = 0,
  });

  SeerrCollectionState copyWith({
    bool? isLoading,
    String? error,
    SeerrCollection? collection,
    SeerrUser? currentUser,
    SeerrQuota? quota,
    bool? isRequesting,
    int? requestProgressCurrent,
    int? requestProgressTotal,
  }) => SeerrCollectionState(
    isLoading: isLoading ?? this.isLoading,
    error: error,
    collection: collection ?? this.collection,
    currentUser: currentUser ?? this.currentUser,
    quota: quota ?? this.quota,
    isRequesting: isRequesting ?? this.isRequesting,
    requestProgressCurrent:
        requestProgressCurrent ?? this.requestProgressCurrent,
    requestProgressTotal: requestProgressTotal ?? this.requestProgressTotal,
  );

  /// Parts the user could still request for the given flavor. Blocklisted
  /// parts are excluded entirely, and anything pending, processing, or
  /// available for that flavor isn't requestable again.
  List<SeerrDiscoverItem> requestableParts({required bool is4k}) {
    final parts = collection?.parts ?? const [];
    return parts.where((p) {
      final info = p.mediaInfo;
      if (info == null) return true;
      if (info.status == 6) return false;
      final status = (is4k ? info.status4k : info.status) ?? 1;
      return status <= 1;
    }).toList();
  }

  List<SeerrDiscoverItem> get visibleParts {
    final parts = collection?.parts ?? const [];
    return parts.where((p) => p.mediaInfo?.status != 6).toList();
  }

  int get availableCount {
    final parts = collection?.parts ?? const [];
    return parts.where((p) {
      final status = p.mediaInfo?.status ?? 1;
      return status == 4 || status == 5;
    }).length;
  }
}

class SeerrCollectionViewModel extends ChangeNotifier {
  final SeerrRepository _repo;
  final int collectionId;

  SeerrCollectionState _state = const SeerrCollectionState();
  SeerrCollectionState get state => _state;

  SeerrCollectionViewModel(this._repo, this.collectionId);

  bool get canRequestMovies {
    final user = _state.currentUser;
    if (user == null) return false;
    return user.hasPermission(SeerrPermission.request) ||
        user.hasPermission(SeerrPermission.requestMovie);
  }

  bool get canRequest4kMovies => _state.currentUser?.canRequest4kMovies ?? false;

  bool get canRequestAdvanced =>
      _state.currentUser?.hasAdvancedRequestPermission ?? false;

  Future<void> load() async {
    _state = _state.copyWith(isLoading: true, error: null);
    notifyListeners();

    try {
      await _repo.ensureInitialized();

      SeerrUser? user = _state.currentUser;
      if (user == null) {
        try {
          user = await _repo.getCurrentUser();
        } catch (_) {}
      }

      final collection = await _repo.getCollectionDetails(collectionId);
      _state = SeerrCollectionState(
        collection: collection,
        currentUser: user,
        quota: _state.quota,
      );
      notifyListeners();

      _loadQuota(user);
    } catch (e) {
      _state = SeerrCollectionState(error: e.toString());
      notifyListeners();
    }
  }

  Future<void> _loadQuota(SeerrUser? user) async {
    if (user == null || _state.quota != null) return;
    try {
      final quota = await _repo.getUserQuota(user.id);
      _state = _state.copyWith(quota: quota);
      notifyListeners();
    } catch (_) {}
  }

  /// Fires one request per movie sequentially. Duplicates count as success
  /// and a quota failure stops the run since the rest would fail the same way.
  Future<SeerrCollectionRequestResult> requestParts(
    List<int> tmdbIds, {
    bool is4k = false,
    int? profileId,
    String? rootFolder,
    int? serverId,
  }) async {
    if (_state.isRequesting || tmdbIds.isEmpty) {
      return SeerrCollectionRequestResult(requested: 0, total: tmdbIds.length);
    }

    _state = _state.copyWith(
      isRequesting: true,
      requestProgressCurrent: 0,
      requestProgressTotal: tmdbIds.length,
    );
    notifyListeners();

    var ok = 0;
    SeerrRequestErrorKind? firstErrorKind;

    for (var i = 0; i < tmdbIds.length; i++) {
      _state = _state.copyWith(requestProgressCurrent: i + 1);
      notifyListeners();

      try {
        await _repo.createRequest(
          mediaId: tmdbIds[i],
          mediaType: 'movie',
          is4k: is4k,
          profileId: profileId,
          rootFolder: rootFolder,
          serverId: serverId,
        );
        ok++;
      } on SeerrRequestException catch (e) {
        if (e.kind == SeerrRequestErrorKind.duplicate) {
          ok++;
          continue;
        }
        firstErrorKind ??= e.kind;
        if (e.kind == SeerrRequestErrorKind.quotaExceeded) break;
      } catch (_) {
        firstErrorKind ??= SeerrRequestErrorKind.unknown;
      }
    }

    _state = _state.copyWith(isRequesting: false);
    notifyListeners();

    await load();

    return SeerrCollectionRequestResult(
      requested: ok,
      total: tmdbIds.length,
      firstErrorKind: firstErrorKind,
    );
  }
}
