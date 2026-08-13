import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'package:get_it/get_it.dart';

import '../../data/models/aggregated_item.dart';
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

  // Decode width for a blurred backdrop. Kept here, alongside backdropMaxWidth
  // for the unblurred case, so _evictBackgrounds can rebuild the same cache
  // keys the backdrop widgets insert.
  static const backdropBlurredDecodeWidth = 640;
  static const slideshowDuration = Duration(seconds: 30);
  static const transitionDuration = Duration(milliseconds: 800);

  final _backgroundController = StreamController<String?>.broadcast();
  final _blurContextController = StreamController<BlurContext>.broadcast();

  List<String> _backgrounds = [];
  int _currentIndex = 0;
  Timer? _slideshowTimer;
  String? _currentUrl;
  BlurContext _blurContext = BlurContext.none;

  String? get currentUrl => _currentUrl;
  BlurContext get blurContext => _blurContext;
  Stream<String?> get backgroundStream => _backgroundController.stream;
  Stream<BlurContext> get blurContextStream => _blurContextController.stream;

  void setBackground(AggregatedItem? item, {BlurContext context = BlurContext.details}) {
    if (item == null) return clearBackgrounds();

    _blurContext = context;
    _blurContextController.add(context);

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

    _loadBackgrounds(urls);
  }

  void setBackgroundUrl(String url, {BlurContext context = BlurContext.browsing}) {
    _blurContext = context;
    _blurContextController.add(context);
    _loadBackgrounds([url]);
  }

  void clearBackgrounds() {
    final previousUrls = List<String>.from(_backgrounds);
    _slideshowTimer?.cancel();
    _backgrounds = [];
    _currentUrl = null;
    _backgroundController.add(null);
    _evictBackgrounds(previousUrls);
  }

  void _loadBackgrounds(List<String> urls) {
    final uniqueUrls = urls.where((u) => u.isNotEmpty).toSet().toList();
    if (uniqueUrls.isEmpty) return clearBackgrounds();
    _slideshowTimer?.cancel();
    _backgrounds = uniqueUrls;
    _currentIndex = 0;
    _update();
  }

  void _update() {
    if (_currentIndex >= _backgrounds.length) _currentIndex = 0;
    _currentUrl = _backgrounds[_currentIndex];
    _backgroundController.add(_currentUrl);

    if (_backgrounds.length > 1) {
      _slideshowTimer?.cancel();
      _slideshowTimer = Timer(slideshowDuration, () {
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
    final imageCache = PaintingBinding.instance.imageCache;
    for (final url in urls) {
      final provider = CachedNetworkImageProvider(url);
      // memCacheWidth wraps the provider in a ResizeImage, so evicting the bare
      // provider alone would miss the key the backdrop actually inserted.
      imageCache.evict(provider);
      imageCache.evict(ResizeImage(provider, width: backdropMaxWidth));
      imageCache.evict(
        ResizeImage(provider, width: backdropBlurredDecodeWidth),
      );
    }
  }
}
