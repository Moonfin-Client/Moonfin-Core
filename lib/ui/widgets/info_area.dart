import 'offline_aware_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/repositories/mdblist_repository.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/current_app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/overview_text.dart';
import '../../util/platform_detection.dart';
import '../../util/tv_ui_scale.dart';
import 'rating_display.dart';
import 'simple_info_row.dart';

const _textShadows = [Shadow(blurRadius: 4, color: Colors.black54)];
const _myMediaSummarySeparator = ' \u2022 ';
const _myMediaSummaryMaxParts = 3;

final Map<String, String?> _myMediaSummaryCache = {};
final Map<String, Future<String?>> _myMediaSummaryRequests = {};

class _MyMediaSummaryTypeQuery {
  final List<String>? itemTypes;
  final _MyMediaSummaryLabel label;

  const _MyMediaSummaryTypeQuery({
    required this.itemTypes,
    required this.label,
  });
}

enum _MyMediaSummaryLabel {
  movie,
  collection,
  series,
  season,
  episode,
  album,
  track,
  video,
  playlist,
  book,
  audiobook,
  folder,
  channel,
}

class InfoArea extends StatelessWidget {
  final AggregatedItem? item;

  const InfoArea({super.key, this.item});

  static double fixedHeight({
    required bool isMobile,
    double desktopScale = 1.0,
  }) {
    return (isMobile ? 184.0 : 198.0) * desktopScale;
  }

  @override
  Widget build(BuildContext context) {
    final item = this.item;
    final isMobile = PlatformDetection.useMobileUi;
    final desktopScale = GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;
    final fixedHeight = InfoArea.fixedHeight(
      isMobile: isMobile,
      desktopScale: desktopScale,
    );

    if (item == null) {
      return SizedBox(width: double.infinity, height: fixedHeight);
    }

    return SizedBox(
      width: double.infinity,
      height: fixedHeight,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        layoutBuilder: (currentChild, previousChildren) => Stack(
          alignment: Alignment.topLeft,
          children: [...previousChildren, ?currentChild],
        ),
        child: _InfoAreaContent(
          key: ValueKey('${item.serverId}:${item.id}'),
          item: item,
        ),
      ),
    );
  }
}

class _InfoAreaContent extends StatefulWidget {
  final AggregatedItem item;

  const _InfoAreaContent({super.key, required this.item});

  @override
  State<_InfoAreaContent> createState() => _InfoAreaContentState();
}

class _InfoAreaContentState extends State<_InfoAreaContent> {
  final _prefs = GetIt.instance<UserPreferences>();
  Map<String, double> _ratings = const {};
  String? _metadataSummary;
  String? _summaryLocaleName;

  @override
  void initState() {
    super.initState();
    _prefs.addListener(_onPrefsChanged);
    _loadRatings();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final localeName = currentAppLocalizations().localeName;
    if (_summaryLocaleName == localeName) return;
    _summaryLocaleName = localeName;
    _metadataSummary = null;
    _loadMyMediaSummary();
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPrefsChanged);
    super.dispose();
  }

  void _onPrefsChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _loadRatings() async {
    if (!_prefs.get(UserPreferences.homeRowsEnableAdditionalRatings)) return;

    final clientFactory = GetIt.instance<MediaServerClientFactory>();
    final resolveClient =
        clientFactory.getClientIfExists(widget.item.serverId) ??
        clientFactory.getActiveClient();

    final result = await GetIt.instance<MdbListRepository>().getRatingsForItem(
      widget.item,
      resolveClient: resolveClient,
      episodeRatingsEnabled: _prefs.canFetchEpisodeRatingsFor(
        UserPreferences.homeRowsRatings,
      ),
    );
    if (mounted && result != null && result.isNotEmpty) {
      setState(() => _ratings = result);
    }
  }

  bool _isMyMediaLibraryItem(AggregatedItem item) {
    final collectionType = item.rawData['CollectionType'] as String?;
    return collectionType != null && collectionType.isNotEmpty;
  }

  String _summaryCacheKey(AggregatedItem item, String localeName) =>
      '$localeName:${item.serverId}:${item.id}';

  List<_MyMediaSummaryTypeQuery> _summaryTypeQueries(String? collectionType) {
    switch (collectionType?.toLowerCase()) {
      case 'movies':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Movie'],
            label: _MyMediaSummaryLabel.movie,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['BoxSet'],
            label: _MyMediaSummaryLabel.collection,
          ),
        ];
      case 'tvshows':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Series'],
            label: _MyMediaSummaryLabel.series,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Season'],
            label: _MyMediaSummaryLabel.season,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Episode'],
            label: _MyMediaSummaryLabel.episode,
          ),
        ];
      case 'music':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['MusicAlbum'],
            label: _MyMediaSummaryLabel.album,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Audio'],
            label: _MyMediaSummaryLabel.track,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Playlist'],
            label: _MyMediaSummaryLabel.playlist,
          ),
        ];
      case 'photos':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Folder', 'CollectionFolder', 'UserView'],
            label: _MyMediaSummaryLabel.folder,
          ),
        ];
      case 'homevideos':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Folder', 'CollectionFolder', 'UserView'],
            label: _MyMediaSummaryLabel.folder,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Video'],
            label: _MyMediaSummaryLabel.video,
          ),
        ];
      case 'boxsets':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['BoxSet'],
            label: _MyMediaSummaryLabel.collection,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Movie'],
            label: _MyMediaSummaryLabel.movie,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Series'],
            label: _MyMediaSummaryLabel.series,
          ),
        ];
      case 'playlists':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Playlist'],
            label: _MyMediaSummaryLabel.playlist,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Audio'],
            label: _MyMediaSummaryLabel.track,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Movie'],
            label: _MyMediaSummaryLabel.movie,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Episode'],
            label: _MyMediaSummaryLabel.episode,
          ),
        ];
      case 'books':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Book'],
            label: _MyMediaSummaryLabel.book,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['AudioBook'],
            label: _MyMediaSummaryLabel.audiobook,
          ),
        ];
      case 'livetv':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['LiveTvChannel'],
            label: _MyMediaSummaryLabel.channel,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Folder', 'CollectionFolder', 'UserView'],
            label: _MyMediaSummaryLabel.folder,
          ),
        ];
      case 'folders':
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Folder', 'CollectionFolder', 'UserView'],
            label: _MyMediaSummaryLabel.folder,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Movie'],
            label: _MyMediaSummaryLabel.movie,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Series'],
            label: _MyMediaSummaryLabel.series,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Playlist'],
            label: _MyMediaSummaryLabel.playlist,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Audio'],
            label: _MyMediaSummaryLabel.track,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Book'],
            label: _MyMediaSummaryLabel.book,
          ),
        ];
      default:
        return const [
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Movie'],
            label: _MyMediaSummaryLabel.movie,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Series'],
            label: _MyMediaSummaryLabel.series,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['MusicAlbum'],
            label: _MyMediaSummaryLabel.album,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Audio'],
            label: _MyMediaSummaryLabel.track,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Playlist'],
            label: _MyMediaSummaryLabel.playlist,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Book'],
            label: _MyMediaSummaryLabel.book,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['BoxSet'],
            label: _MyMediaSummaryLabel.collection,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['Folder', 'CollectionFolder', 'UserView'],
            label: _MyMediaSummaryLabel.folder,
          ),
          _MyMediaSummaryTypeQuery(
            itemTypes: ['LiveTvChannel'],
            label: _MyMediaSummaryLabel.channel,
          ),
        ];
    }
  }

  Future<void> _loadMyMediaSummary() async {
    final summary = await _resolveMyMediaSummary(widget.item);
    if (!mounted || summary == null || summary.isEmpty) {
      return;
    }
    setState(() => _metadataSummary = summary);
  }

  Future<String?> _resolveMyMediaSummary(AggregatedItem item) async {
    if (!_isMyMediaLibraryItem(item)) return null;

    final l10n = currentAppLocalizations();
    final cacheKey = _summaryCacheKey(item, l10n.localeName);

    if (_myMediaSummaryCache.containsKey(cacheKey)) {
      return _myMediaSummaryCache[cacheKey];
    }

    final inFlightRequest = _myMediaSummaryRequests[cacheKey];
    if (inFlightRequest != null) {
      return inFlightRequest;
    }

    final request = _buildMyMediaSummary(item, l10n)
        .then((summary) {
          if (summary != null && summary.isNotEmpty) {
            _myMediaSummaryCache[cacheKey] = summary;
          }
          return summary;
        })
        .whenComplete(() {
          _myMediaSummaryRequests.remove(cacheKey);
        });
    _myMediaSummaryRequests[cacheKey] = request;
    return request;
  }

  Future<String?> _buildMyMediaSummary(
    AggregatedItem item,
    AppLocalizations l10n,
  ) async {
    final collectionType = item.rawData['CollectionType'] as String?;
    final queries = _summaryTypeQueries(collectionType);

    final clientFactory = GetIt.instance<MediaServerClientFactory>();
    final client =
        clientFactory.getClientIfExists(item.serverId) ??
        clientFactory.getActiveClient();

    final parts = <String>[];
    for (final query in queries) {
      final count = await _countItems(
        client: client,
        parentId: item.id,
        itemTypes: query.itemTypes,
      );
      final part = _summaryPartForCount(
        l10n: l10n,
        count: count,
        label: query.label,
      );
      if (part != null && part.isNotEmpty) {
        parts.add(part);
        if (parts.length >= _myMediaSummaryMaxParts) {
          break;
        }
      }
    }

    if (parts.isEmpty) {
      return null;
    }
    return parts.join(_myMediaSummarySeparator);
  }

  Future<int> _countItems({
    required MediaServerClient client,
    required String parentId,
    required List<String>? itemTypes,
  }) async {
    try {
      final response = await client.itemsApi.getItems(
        parentId: parentId,
        recursive: true,
        includeItemTypes: itemTypes,
        startIndex: 0,
        limit: 1,
        enableTotalRecordCount: true,
      );
      return (response['TotalRecordCount'] as num?)?.toInt() ?? 0;
    } catch (_) {
      return 0;
    }
  }

  String? _summaryPartForCount({
    required AppLocalizations l10n,
    required int count,
    required _MyMediaSummaryLabel label,
  }) {
    if (count <= 0) return null;
    switch (label) {
      case _MyMediaSummaryLabel.movie:
        return '$count ${count == 1 ? l10n.movie : l10n.movies}';
      case _MyMediaSummaryLabel.collection:
        return '$count ${count == 1 ? l10n.collection : l10n.collections}';
      case _MyMediaSummaryLabel.series:
        return '$count ${l10n.series}';
      case _MyMediaSummaryLabel.season:
        return '$count ${count == 1 ? l10n.season : l10n.seasons}';
      case _MyMediaSummaryLabel.episode:
        return l10n.episodeCount(count);
      case _MyMediaSummaryLabel.album:
        return '$count ${count == 1 ? l10n.album : l10n.albums}';
      case _MyMediaSummaryLabel.track:
        return l10n.trackCount(count);
      case _MyMediaSummaryLabel.video:
        return '$count ${l10n.video}';
      case _MyMediaSummaryLabel.playlist:
        return '$count ${count == 1 ? l10n.playlist : l10n.playlists}';
      case _MyMediaSummaryLabel.book:
        return l10n.booksCount(count);
      case _MyMediaSummaryLabel.audiobook:
        return l10n.audiobookCountLabel(count);
      case _MyMediaSummaryLabel.folder:
        return '$count ${count == 1 ? l10n.folder : l10n.folders}';
      case _MyMediaSummaryLabel.channel:
        return '$count ${l10n.channels}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final scale = _prefs.get(UserPreferences.desktopUiScale).scaleFactor;
    // Boxes follow the desktop scale like the area's own height does. Text
    // already grows with it through the text scaler.
    double box(double px) => tvPx(px) * scale;

    final showRatings =
        _ratings.isNotEmpty ||
        item.communityRating != null ||
        item.criticRating != null;

    // An episode is titled by its series, and the info line leads with the
    // episode itself.
    final seriesName = item.seriesName?.trim() ?? '';
    final title = item.type == 'Episode' && seriesName.isNotEmpty
        ? seriesName
        : item.displayTitle;

    final titleStyle = TextStyle(
      color: AppColorScheme.onSurface,
      fontSize: tvPx(48),
      fontWeight: FontWeight.w700,
      height: 1.2,
      shadows: _textShadows,
    );
    final overviewStyle = TextStyle(
      color: AppColorScheme.onSurface.withValues(alpha: 0.85),
      fontSize: tvPx(24),
      fontWeight: FontWeight.w400,
      height: 36 / 24,
      shadows: _textShadows,
    );
    final titleText = Text(
      title,
      style: titleStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    final clientFactory = GetIt.instance<MediaServerClientFactory>();
    final imageApi =
        clientFactory.getClientIfExists(item.serverId)?.imageApi ??
        clientFactory.getActiveClient().imageApi;

    final String? logoItemId;
    final String? logoTag;
    if (item.type == 'Episode') {
      logoItemId =
          item.rawData['ParentLogoItemId']?.toString() ?? item.seriesId;
      logoTag = item.rawData['ParentLogoImageTag'] as String?;
    } else {
      logoItemId = item.logoImageTag != null ? item.id : null;
      logoTag = item.logoImageTag;
    }
    final hasLogo = logoItemId != null && logoTag != null;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // A text title sits at the bottom of the logo's room, right above
          // the info line, so nothing moves between items with and without logos.
          SizedBox(
            height: box(96),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: hasLogo
                  ? ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: box(640)),
                      child: Image(
                        image: offlineAwareImageProvider(
                          imageApi.getLogoImageUrl(
                            logoItemId,
                            maxWidth: 640,
                            tag: logoTag,
                          ),
                        ),
                        fit: BoxFit.contain,
                        height: box(96),
                        alignment: Alignment.bottomLeft,
                        errorBuilder: (_, _, _) => titleText,
                      ),
                    )
                  : titleText,
            ),
          ),
          SizedBox(height: box(12)),
          SizedBox(
            height: box(36),
            child: SimpleInfoRow(
              item: item,
              metadataSummary: _metadataSummary,
            ),
          ),
          if (showRatings) ...[
            SizedBox(height: box(12)),
            SizedBox(
              height: box(40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RatingsRow(
                  ratings: _ratings,
                  communityRating: item.communityRating,
                  criticRating: item.criticRating,
                  enableAdditionalRatings: _prefs.get(
                    UserPreferences.homeRowsEnableAdditionalRatings,
                  ),
                  enabledRatings: _prefs.get(
                    UserPreferences.homeRowsEnabledRatings,
                  ),
                  showLabels: _prefs.get(
                    UserPreferences.homeRowsShowRatingLabels,
                  ),
                  showBadges: _prefs.get(
                    UserPreferences.homeRowsShowRatingBadges,
                  ),
                  inlineChips: true,
                ),
              ),
            ),
          ],
          if (!_prefs.get(UserPreferences.hideHomeMediaDescription)) ...[
            SizedBox(height: box(16)),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: box(1200)),
                child: Text(
                  cleanOverview(item.overview),
                  style: overviewStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
