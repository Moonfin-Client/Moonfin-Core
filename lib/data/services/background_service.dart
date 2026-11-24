import 'dart:async';
import 'dart:math';

import 'package:get_it/get_it.dart';

import '../../data/models/aggregated_item.dart';
import '../../preference/user_preferences.dart';
import '../../ui/widgets/image_source.dart';
import '../../util/game_library.dart';
import 'connectivity_service.dart';
import 'media_server_client_factory.dart';

enum BlurContext { details, browsing, none }

class BackgroundService {
  static const backdropMaxWidth = 1920;

  // Item types whose art is a cover, not a backdrop, so the backdrop layer
  // falls back to their primary image.
  static const _audioTypes = {
    'Audio',
    'AudioBook',
    'MusicAlbum',
    'MusicArtist',
    'AlbumArtist',
  };

  // Decode width for a blurred backdrop, alongside backdropMaxWidth for the
  // unblurred case. The classic detail and library screens decode at these
  // explicit widths.
  static const backdropBlurredDecodeWidth = 640;
  static const slideshowDuration = Duration(seconds: 30);
  static const defaultDetailsSlideshowDuration = Duration(seconds: 15);
  static const validDetailsIntervalsMs = {5000, 10000, 15000, 30000};
  static const transitionDuration = Duration(milliseconds: 800);

  final Random _random;
  final bool Function()? _shuffleDetailsOverride;
  final Duration Function()? _detailsDurationOverride;

  BackgroundService({
    Random? random,
    bool Function()? shuffleDetails,
    Duration Function()? detailsDuration,
  }) : _random = random ?? Random(),
       _shuffleDetailsOverride = shuffleDetails,
       _detailsDurationOverride = detailsDuration;

  final _backgroundController = StreamController<String?>.broadcast();
  final _blurContextController = StreamController<BlurContext>.broadcast();

  List<String> _sourceBackgrounds = [];
  List<String> _backgrounds = [];
  int _currentIndex = 0;
  Timer? _slideshowTimer;
  String? _currentUrl;
  BlurContext _blurContext = BlurContext.none;

  String? get currentUrl => _currentUrl;
  BlurContext get blurContext => _blurContext;
  Stream<String?> get backgroundStream => _backgroundController.stream;
  Stream<BlurContext> get blurContextStream => _blurContextController.stream;

  void setBackground(
    AggregatedItem? item, {
    BlurContext context = BlurContext.details,
  }) {
    if (item == null) return clearBackgrounds();

    _blurContext = context;
    _blurContextController.add(context);
    _loadBackgrounds(backdropUrlsFor(item));
  }

  /// The artwork [setBackground] would show behind [item], best first.
  List<String> backdropUrlsFor(AggregatedItem item) {
    final client = GetIt.instance<MediaServerClientFactory>()
        .clientForServerOrActive(item.serverId);
    final urls = <String>[];

    final isOffline =
        GetIt.instance.isRegistered<ConnectivityService>() &&
        !GetIt.instance<ConnectivityService>().canReachServer;

    final backdropTags = item.backdropImageTags;
    if (backdropTags.isNotEmpty) {
      final limit = isOffline ? 1 : backdropTags.length;
      for (var i = 0; i < limit; i++) {
        urls.add(client.imageApi.getBackdropImageUrl(
          item.id,
          maxWidth: backdropMaxWidth,
          index: i,
          tag: backdropTags[i],
        ));
      }
    }

    if (urls.isEmpty) {
      final parentBackdropId = item.parentBackdropItemId;
      final parentTags = item.parentBackdropImageTags;
      if (parentBackdropId != null && parentTags.isNotEmpty) {
        final limit = isOffline ? 1 : parentTags.length;
        for (var i = 0; i < limit; i++) {
          urls.add(client.imageApi.getBackdropImageUrl(
            parentBackdropId,
            maxWidth: backdropMaxWidth,
            index: i,
            tag: parentTags[i],
          ));
        }
      }
    }

    // External rows carry artwork as a URL or a TMDB path rather than as
    // Jellyfin image tags. Network and studio tiles are left out because their
    // artwork is a duotone logo, which washes out behind the library.
    final filterType = item.rawData['FilterType'];
    final isLogoTile = filterType == 'network' || filterType == 'studio';
    if (urls.isEmpty && !isLogoTile) {
      final backdropPath = item.rawData['BackdropPath'] as String?;
      if (backdropPath != null && backdropPath.isNotEmpty) {
        if (backdropPath.startsWith('http')) {
          urls.add(backdropPath);
        } else if (backdropPath.startsWith('/')) {
          urls.add('https://image.tmdb.org/t/p/w1280$backdropPath');
        }
      }
    }

    // Albums, artists, and tracks carry no backdrop art, so fall back to their
    // cover blurred behind the library rather than clearing to nothing.
    if (urls.isEmpty && _audioTypes.contains(item.type)) {
      final primaryTag = item.primaryImageTag;
      if (primaryTag != null && primaryTag.isNotEmpty) {
        urls.add(client.imageApi.getPrimaryImageUrl(
          item.id,
          maxWidth: backdropMaxWidth,
          tag: primaryTag,
        ));
      } else {
        final albumId = item.rawData['AlbumId']?.toString();
        final albumTag = item.rawData['AlbumPrimaryImageTag'] as String?;
        if (albumId != null && albumTag != null && albumTag.isNotEmpty) {
          urls.add(client.imageApi.getPrimaryImageUrl(
            albumId,
            maxWidth: backdropMaxWidth,
            tag: albumTag,
          ));
        }
      }
    }

    // A game shows its in-game screenshot, the way its details screen does.
    // The address carries the sign-in token, so it's built here, never stored.
    if (urls.isEmpty && isGameHomeItem(item)) {
      final snap = client.gamesApi?.thumbUrl(
        libraryId: gameItemLibraryId(item),
        gameId: item.id,
        kind: 'snap',
      );
      if (snap != null) urls.add(snap);
    }

    return urls;
  }

  void setBackgroundUrl(String url, {BlurContext context = BlurContext.browsing}) {
    _blurContext = context;
    _blurContextController.add(context);
    _loadBackgrounds([url]);
  }

  /// Exposed for tests and callers that already hold resolved backdrop URLs.
  void setBackgroundUrls(
    List<String> urls, {
    BlurContext context = BlurContext.details,
  }) {
    _blurContext = context;
    _blurContextController.add(context);
    _loadBackgrounds(urls);
  }

  void clearBackgrounds() {
    final previousUrls = List<String>.from(_sourceBackgrounds);
    _slideshowTimer?.cancel();
    _sourceBackgrounds = [];
    _backgrounds = [];
    _currentUrl = null;
    _backgroundController.add(null);
    _evictBackgrounds(previousUrls);
  }

  bool get _shouldShuffleDetails {
    if (_blurContext != BlurContext.details) return false;
    if (_shuffleDetailsOverride != null) return _shuffleDetailsOverride();
    if (GetIt.instance.isRegistered<UserPreferences>()) {
      return GetIt.instance<UserPreferences>().get(
        UserPreferences.detailsBackdropShuffle,
      );
    }
    return true;
  }

  Duration get _activeSlideshowDuration {
    if (_blurContext != BlurContext.details) return slideshowDuration;
    if (_detailsDurationOverride != null) return _detailsDurationOverride();
    if (GetIt.instance.isRegistered<UserPreferences>()) {
      final ms = GetIt.instance<UserPreferences>().get(
        UserPreferences.detailsBackdropIntervalMs,
      );
      if (validDetailsIntervalsMs.contains(ms)) {
        return Duration(milliseconds: ms);
      }
    }
    return defaultDetailsSlideshowDuration;
  }

  List<String> _buildCycleOrder(List<String> source, {String? avoidFirst}) {
    final order = List<String>.from(source);
    if (!_shouldShuffleDetails || order.length <= 1) return order;
    // Fisher-Yates shuffle without replacement so every backdrop is shown once
    // before the set repeats.
    for (var i = order.length - 1; i > 0; i--) {
      final j = _random.nextInt(i + 1);
      final tmp = order[i];
      order[i] = order[j];
      order[j] = tmp;
    }
    if (avoidFirst != null && order.first == avoidFirst) {
      final swapIdx = 1 + _random.nextInt(order.length - 1);
      final tmp = order[0];
      order[0] = order[swapIdx];
      order[swapIdx] = tmp;
    }
    return order;
  }

  void _loadBackgrounds(List<String> urls) {
    final uniqueUrls = urls.where((u) => u.isNotEmpty).toSet().toList();
    if (uniqueUrls.isEmpty) return clearBackgrounds();
    _slideshowTimer?.cancel();
    _sourceBackgrounds = uniqueUrls;
    _backgrounds = _buildCycleOrder(_sourceBackgrounds);
    _currentIndex = 0;
    _update();
  }

  void _update() {
    if (_currentIndex >= _backgrounds.length) {
      final lastShown = _currentUrl;
      _backgrounds = _buildCycleOrder(
        _sourceBackgrounds,
        avoidFirst: lastShown,
      );
      _currentIndex = 0;
    }
    _currentUrl = _backgrounds[_currentIndex];
    _backgroundController.add(_currentUrl);

    if (_backgrounds.length > 1) {
      _slideshowTimer?.cancel();
      _slideshowTimer = Timer(_activeSlideshowDuration, () {
        _currentIndex++;
        _update();
      });
    }
  }

  void dispose() {
    _slideshowTimer?.cancel();
    _backgroundController.close();
    _blurContextController.close();
  }

  void _evictBackgrounds(Iterable<String> urls) {
    // Every backdrop widget builds its provider through ArtworkDecode, which
    // remembers the sizes each URL was decoded at, so this drops the entries
    // that were actually inserted rather than guessing at widths. Handing a
    // ResizeImage straight to imageCache.evict never matched anything: the
    // cache is keyed by what obtainKey returns, and for a ResizeImage that is
    // a ResizeImageKey, not the ResizeImage itself.
    for (final url in urls) {
      unawaited(ArtworkDecode.evict(url));
    }
  }
}
