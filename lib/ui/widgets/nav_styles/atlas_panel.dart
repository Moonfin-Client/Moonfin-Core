import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/aggregated_library.dart';
import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/game_library.dart';
import '../../navigation/destinations.dart';
import '../offline_aware_image.dart';
import 'nav_art.dart';
import 'nav_button_style.dart';
import 'nav_focusable.dart';

class AtlasLink {
  const AtlasLink(this.label, this.route);

  final String label;
  final String route;
}

class AtlasTile {
  const AtlasTile({
    required this.title,
    required this.route,
    this.subtitle,
    this.imageUrl,
    this.progress,
  });

  final String title;
  final String? subtitle;
  final String? imageUrl;

  /// Played fraction from 0 to 1, drawn as a bar along the bottom.
  final double? progress;
  final String route;
}

class AtlasPanelData {
  const AtlasPanelData({this.cards = const [], this.posters = const []});

  final List<AtlasTile> cards;
  final List<AtlasTile> posters;
}

class AtlasPanelSpec {
  const AtlasPanelSpec({
    required this.key,
    required this.title,
    required this.links,
    this.cardsTitle,
    this.postersTitle,
    this.squarePosters = false,
    this.load,
  });

  final String key;
  final String title;

  /// The first link is the section's own main page.
  final List<AtlasLink> links;
  final String? cardsTitle;
  final String? postersTitle;
  final bool squarePosters;
  final Future<AtlasPanelData> Function()? load;
}

/// The shortcuts a library's panel offers, which depend on its type.
List<AtlasLink> atlasLibraryLinks(
  AppLocalizations l10n,
  AggregatedLibrary lib,
) {
  final main = libraryRoute(
    lib.id,
    lib.collectionType,
    lib.name,
    serverId: lib.serverId,
  );
  final links = [AtlasLink(l10n.browseAll, main)];
  if (isGameLibrary(lib.id, lib.collectionType, lib.name)) return links;
  switch (lib.collectionType.toLowerCase()) {
    case 'music':
      links.addAll([
        AtlasLink(l10n.albums, Destinations.musicCategory(lib.id, 'albums')),
        AtlasLink(l10n.artists, Destinations.musicCategory(lib.id, 'artists')),
        AtlasLink(
          l10n.playlists,
          Destinations.musicCategory(lib.id, 'playlists'),
        ),
        AtlasLink(l10n.genres, Destinations.musicCategory(lib.id, 'genres')),
        AtlasLink(l10n.songs, Destinations.musicCategory(lib.id, 'songs')),
      ]);
    case 'movies':
    case 'tvshows':
      links.addAll([
        AtlasLink(l10n.genres, Destinations.libraryGenresOf(lib.id)),
        AtlasLink(
          l10n.favorites,
          Destinations.library(lib.id, favorites: true, serverId: lib.serverId),
        ),
      ]);
    case 'books':
    case 'audiobooks':
    case 'livetv':
      break;
    default:
      links.add(
        AtlasLink(
          l10n.favorites,
          Destinations.library(lib.id, favorites: true, serverId: lib.serverId),
        ),
      );
  }
  return links;
}

AtlasPanelSpec atlasLibrarySpec(AppLocalizations l10n, AggregatedLibrary lib) {
  final type = lib.collectionType.toLowerCase();
  if (type == 'livetv') return atlasLiveTvSpec(l10n);
  final isGame = isGameLibrary(lib.id, lib.collectionType, lib.name);
  final isMusic = type == 'music';
  return AtlasPanelSpec(
    key: 'lib:${lib.serverId}:${lib.id}',
    title: lib.name,
    links: atlasLibraryLinks(l10n, lib),
    cardsTitle: isMusic ? null : l10n.navContinueIn(lib.name),
    postersTitle: l10n.recentlyAdded,
    squarePosters: isMusic,
    load: isGame ? null : () => _loadLibrary(lib, resume: !isMusic),
  );
}

AtlasPanelSpec atlasLiveTvSpec(AppLocalizations l10n) => AtlasPanelSpec(
  key: 'livetv',
  title: l10n.liveTv,
  links: [
    AtlasLink(l10n.guide, Destinations.liveTvGuide),
    AtlasLink(l10n.recordings, Destinations.liveTvRecordings),
    AtlasLink(l10n.schedule, Destinations.liveTvSchedule),
    AtlasLink(l10n.seriesRecordings, Destinations.liveTvSeriesRecordings),
  ],
);

AtlasPanelSpec atlasSeerrSpec(AppLocalizations l10n, String label) =>
    AtlasPanelSpec(
      key: 'seerr',
      title: label,
      links: [
        AtlasLink(l10n.discover, Destinations.seerrDiscover),
        AtlasLink(l10n.seerrRequestsTitle, Destinations.seerrRequests),
      ],
      cardsTitle: l10n.trending,
      load: _loadSeerr,
    );

AtlasPanelSpec atlasLibrariesSpec(
  AppLocalizations l10n,
  List<AggregatedLibrary> libraries,
) {
  String routeOf(AggregatedLibrary lib) => libraryRoute(
    lib.id,
    lib.collectionType,
    lib.name,
    serverId: lib.serverId,
  );
  return AtlasPanelSpec(
    key: 'libraries:${libraries.map((l) => l.id).join(',')}',
    title: l10n.libraries,
    links: [for (final lib in libraries) AtlasLink(lib.name, routeOf(lib))],
    load: () async => AtlasPanelData(
      cards: [
        for (final lib in libraries.take(3))
          AtlasTile(
            title: lib.name,
            imageUrl: navLibraryCoverUrl(lib),
            route: routeOf(lib),
          ),
      ],
    ),
  );
}

final _cache = <String, (DateTime, Future<AtlasPanelData>)>{};

Future<AtlasPanelData> _cachedData(AtlasPanelSpec spec) {
  final hit = _cache[spec.key];
  if (hit != null &&
      DateTime.now().difference(hit.$1) < const Duration(minutes: 5)) {
    return hit.$2;
  }
  final future = spec.load!().catchError((Object _) => const AtlasPanelData());
  _cache[spec.key] = (DateTime.now(), future);
  return future;
}

List<AggregatedItem> _itemsOf(Map<String, dynamic> response, String serverId) {
  final list = response['Items'];
  if (list is! List) return const [];
  return [
    for (final raw in list.whereType<Map>())
      if (raw['Id'] != null)
        AggregatedItem(
          id: raw['Id'].toString(),
          serverId: serverId,
          rawData: Map<String, dynamic>.from(raw),
        ),
  ];
}

String _itemRoute(AggregatedItem item) => Destinations.itemOrPhoto(
  item.id,
  serverId: item.serverId,
  type: item.type,
  channelId: item.channelId,
);

Future<AtlasPanelData> _loadLibrary(
  AggregatedLibrary lib, {
  required bool resume,
}) async {
  final api = GetIt.instance<MediaServerClientFactory>()
      .clientForServerOrActive(lib.serverId)
      .itemsApi;
  Future<Map<String, dynamic>> safe(Future<Map<String, dynamic>> f) =>
      f.catchError((Object _) => <String, dynamic>{});
  final results = await Future.wait([
    resume
        ? safe(
            api.getResumeItems(
              parentId: lib.id,
              limit: 2,
              fields: 'PrimaryImageAspectRatio',
              enableImageTypes: 'Primary,Backdrop,Thumb',
              imageTypeLimit: 1,
            ),
          )
        : Future.value(<String, dynamic>{}),
    safe(
      api.getLatestItems(
        parentId: lib.id,
        limit: 4,
        fields: 'PrimaryImageAspectRatio',
        enableImageTypes: 'Primary,Backdrop,Thumb',
        imageTypeLimit: 1,
      ),
    ),
  ]);
  final resumeItems = _itemsOf(results[0], lib.serverId);
  final latestItems = _itemsOf(results[1], lib.serverId);
  return AtlasPanelData(
    cards: [
      for (final item in resumeItems.take(2))
        AtlasTile(
          title: item.type == 'Episode'
              ? (item.seriesName ?? item.name)
              : item.name,
          subtitle: item.type == 'Episode'
              ? item.name
              : item.productionYear?.toString(),
          imageUrl: navWideArtUrl(item),
          progress: ((item.playedPercentage ?? 0) / 100).clamp(0.0, 1.0),
          route: _itemRoute(item),
        ),
    ],
    posters: [
      for (final item in latestItems.take(4))
        AtlasTile(
          title: item.name,
          imageUrl: navPosterArtUrl(item),
          route: _itemRoute(item),
        ),
    ],
  );
}

Future<AtlasPanelData> _loadSeerr() async {
  final repo = await GetIt.instance.getAsync<SeerrRepository>();
  final page = await repo.getTrending(limit: 8);
  String route(SeerrDiscoverItem r) => Destinations.seerrMedia(
    '${r.id}',
    mediaType: r.mediaType,
    title: r.title ?? r.name,
  );
  final results = page.results;
  return AtlasPanelData(
    cards: [
      for (final r in results.where((r) => r.backdropPath != null).take(2))
        AtlasTile(
          title: r.title ?? r.name ?? '',
          subtitle: (r.releaseDate ?? r.firstAirDate)?.split('-').first,
          imageUrl: 'https://image.tmdb.org/t/p/w780${r.backdropPath}',
          route: route(r),
        ),
    ],
  );
}

/// The panel an Atlas tab drops under the bar. Links show at once, the
/// artwork columns fill in when their data arrives, and a column that comes
/// back empty is left out.
class AtlasPanel extends StatefulWidget {
  const AtlasPanel({
    super.key,
    required this.spec,
    required this.scopeNode,
    required this.firstFocus,
    required this.onExit,
    required this.onOpen,
    this.compact = false,
  });

  final AtlasPanelSpec spec;
  final FocusScopeNode scopeNode;
  final FocusNode firstFocus;

  /// Up from the top of a column, or Back.
  final VoidCallback onExit;
  final void Function(String route, {required bool topLevel}) onOpen;

  /// The phone layout, stacked instead of in columns.
  final bool compact;

  @override
  State<AtlasPanel> createState() => _AtlasPanelState();
}

class _AtlasPanelState extends State<AtlasPanel> {
  AtlasPanelData _data = const AtlasPanelData();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(AtlasPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.spec.key != widget.spec.key) {
      _data = const AtlasPanelData();
      _load();
    }
  }

  void _load() {
    if (widget.spec.load == null) return;
    final key = widget.spec.key;
    unawaited(
      _cachedData(widget.spec).then((data) {
        if (mounted && widget.spec.key == key) setState(() => _data = data);
      }),
    );
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isBackKey) {
      if (event is KeyDownEvent) widget.onExit();
      return KeyEventResult.handled;
    }
    final direction = key.isUpKey
        ? TraversalDirection.up
        : key.isDownKey
        ? TraversalDirection.down
        : key.isLeftKey
        ? TraversalDirection.left
        : key.isRightKey
        ? TraversalDirection.right
        : null;
    if (direction == null) return KeyEventResult.ignored;
    final primary = FocusManager.instance.primaryFocus;
    final moved = primary != null && primary.focusInDirection(direction);
    if (!moved && direction == TraversalDirection.up) widget.onExit();
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    // Sizes are laid out for a 720 point tall screen and scale from there.
    final s = widget.compact
        ? 1.0
        : (MediaQuery.sizeOf(context).height / 720).clamp(0.8, 1.3);
    final radius = Radius.circular(widget.compact ? 20 : 18 * s);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.compact ? 0 : 40 * s),
      padding: widget.compact
          ? const EdgeInsets.fromLTRB(0, 16, 0, 20)
          : EdgeInsets.fromLTRB(32 * s, 26 * s, 32 * s, 28 * s),
      decoration: BoxDecoration(
        color: kAtlasPanelColor,
        borderRadius: BorderRadius.vertical(bottom: radius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x8C000000),
            blurRadius: 60,
            offset: Offset(0, 30),
          ),
        ],
      ),
      child: FocusScope(
        node: widget.scopeNode,
        onKeyEvent: _onKey,
        child: FocusTraversalGroup(
          child: widget.compact ? _compactBody() : _wideBody(s),
        ),
      ),
    );
  }

  Widget _eyebrow(double size) => Text(
    widget.spec.title.toUpperCase(),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      letterSpacing: size * 0.12,
      color: Colors.white.withValues(alpha: 0.55),
    ),
  );

  Widget _heading(String text, double size) => Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontSize: size, fontWeight: FontWeight.w600),
  );

  Widget _wideBody(double s) {
    final cards = _data.cards;
    final posters = _data.posters;
    final links = widget.spec.links;
    return DefaultTextStyle.merge(
      style: const TextStyle(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 220 * s,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                _eyebrow(12 * s),
                SizedBox(height: 12 * s),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 260 * s),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var i = 0; i < links.length; i++)
                          Padding(
                            padding: EdgeInsets.only(bottom: 4 * s),
                            child: _link(links[i], i, s),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (cards.isNotEmpty || posters.isNotEmpty)
            Container(
              width: 1,
              height: 230 * s,
              margin: EdgeInsets.symmetric(horizontal: 20 * s),
              color: Colors.white.withValues(alpha: 0.08),
            ),
          if (cards.isNotEmpty) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.spec.cardsTitle case final title?)
                  _heading(title, 15 * s),
                SizedBox(height: 12 * s),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < cards.length; i++) ...[
                      if (i > 0) SizedBox(width: 16 * s),
                      _card(cards[i], width: 200 * s, s: s),
                    ],
                  ],
                ),
              ],
            ),
            SizedBox(width: 40 * s),
          ],
          if (posters.isNotEmpty)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.spec.postersTitle case final title?)
                    _heading(title, 15 * s),
                  SizedBox(height: 12 * s),
                  Row(
                    children: [
                      for (var i = 0; i < posters.length; i++) ...[
                        if (i > 0) SizedBox(width: 12 * s),
                        _poster(posters[i], width: 92 * s, s: s),
                      ],
                    ],
                  ),
                ],
              ),
            )
          else
            const Spacer(),
        ],
      ),
    );
  }

  Widget _compactBody() {
    final cards = _data.cards;
    final posters = _data.posters;
    final links = widget.spec.links;
    return DefaultTextStyle.merge(
      style: const TextStyle(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _eyebrow(11),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: links.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, i) => _chip(links[i], i),
            ),
          ),
          if (cards.isNotEmpty) ...[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.spec.cardsTitle case final title?)
                    _heading(title, 14),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < 2; i++) ...[
                        if (i > 0) const SizedBox(width: 10),
                        Expanded(
                          child: i < cards.length
                              ? LayoutBuilder(
                                  builder: (context, c) => _card(
                                    cards[i],
                                    width: c.maxWidth,
                                    s: 0.87,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
          if (posters.isNotEmpty) ...[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.spec.postersTitle case final title?)
                    _heading(title, 14),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      for (var i = 0; i < 4; i++) ...[
                        if (i > 0) const SizedBox(width: 10),
                        Expanded(
                          child: i < posters.length
                              ? LayoutBuilder(
                                  builder: (context, c) => _poster(
                                    posters[i],
                                    width: c.maxWidth,
                                    s: 1,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _link(AtlasLink link, int index, double s) => NavFocusable(
    focusNode: index == 0 ? widget.firstFocus : null,
    semanticLabel: link.label,
    onPressed: () => widget.onOpen(link.route, topLevel: true),
    builder: (context, focused) => AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      height: 40 * s,
      padding: EdgeInsets.symmetric(horizontal: 16 * s),
      decoration: BoxDecoration(
        color: focused ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20 * s),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              link.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15 * s,
                fontWeight: focused ? FontWeight.w600 : FontWeight.w500,
                color: focused
                    ? const Color(0xFF101010)
                    : Colors.white.withValues(alpha: 0.82),
              ),
            ),
          ),
          if (focused)
            Icon(
              Icons.chevron_right_rounded,
              size: 18 * s,
              color: const Color(0xFF101010),
            ),
        ],
      ),
    ),
  );

  Widget _chip(AtlasLink link, int index) {
    final primary = index == 0;
    return NavFocusable(
      focusNode: primary ? widget.firstFocus : null,
      semanticLabel: link.label,
      onPressed: () => widget.onOpen(link.route, topLevel: true),
      builder: (context, focused) => Container(
        padding: EdgeInsets.fromLTRB(14, 0, primary ? 10 : 14, 0),
        decoration: BoxDecoration(
          color: primary || focused
              ? Colors.white
              : Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(17),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              link.label,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: primary ? FontWeight.w600 : FontWeight.w500,
                color: primary || focused
                    ? const Color(0xFF101010)
                    : Colors.white.withValues(alpha: 0.85),
              ),
            ),
            if (primary)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 16,
                  color: Color(0xFF101010),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _art(String? url, {required double width, required double height}) =>
      SizedBox(
        width: width,
        height: height,
        child: url == null
            ? const ColoredBox(color: Color(0xFF2A2E36))
            : OfflineAwareImage(
                imageUrl: url,
                fit: BoxFit.cover,
                width: width,
                height: height,
                errorWidget: (_, _, _) =>
                    const ColoredBox(color: Color(0xFF2A2E36)),
              ),
      );

  BoxDecoration? _ring(bool focused, double radius) => focused
      ? BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: Colors.white, width: 3),
        )
      : null;

  Widget _card(AtlasTile tile, {required double width, required double s}) {
    final height = width * 9 / 16;
    final radius = 10 * s;
    return NavFocusable(
      semanticLabel: tile.title,
      onPressed: () => widget.onOpen(tile.route, topLevel: false),
      builder: (context, focused) => SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: focused ? 1.04 : 1,
              duration: const Duration(milliseconds: 150),
              child: Container(
                foregroundDecoration: _ring(focused, radius),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Stack(
                    children: [
                      _art(tile.imageUrl, width: width, height: height),
                      if (tile.progress case final progress? when progress > 0)
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 4,
                            color: Colors.white.withValues(alpha: 0.18),
                            alignment: Alignment.centerLeft,
                            child: FractionallySizedBox(
                              widthFactor: progress,
                              child: Container(color: AppColorScheme.accent),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8 * s),
            Text(
              tile.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14 * s, fontWeight: FontWeight.w600),
            ),
            if (tile.subtitle case final subtitle?)
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12 * s,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _poster(AtlasTile tile, {required double width, required double s}) {
    final height = widget.spec.squarePosters ? width : width * 1.5;
    final radius = 8 * s;
    return NavFocusable(
      semanticLabel: tile.title,
      onPressed: () => widget.onOpen(tile.route, topLevel: false),
      builder: (context, focused) => AnimatedScale(
        scale: focused ? 1.05 : 1,
        duration: const Duration(milliseconds: 150),
        child: Container(
          foregroundDecoration: _ring(focused, radius),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: _art(tile.imageUrl, width: width, height: height),
          ),
        ),
      ),
    );
  }
}
