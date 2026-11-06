import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/detail_section_layout.dart';
import '../../../../preference/seerr_preferences.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/focus/dpad_keys.dart';
import '../../../../util/media_source_summary.dart';
import '../../../../util/platform_detection.dart';
import '../../../../util/playback_time_label.dart';
import '../../../navigation/destinations.dart';
import '../../../widgets/bottom_nav/bottom_navbar.dart';
import '../../../widgets/navigation_layout.dart';
import '../../../widgets/offline_aware_image.dart';
import '../../../widgets/rating_display.dart';
import '../../../widgets/scroll_edge_arrows.dart';
import '../../../widgets/seerr/seerr_image_urls.dart';
import '../../../widgets/seerr/seerr_item_status.dart';
import '../../../widgets/seerr/seerr_request_dialog.dart';
import '../../../widgets/seerr/seerr_stats_card.dart';
import '../../../widgets/seerr/seerr_status_dot.dart';
import '../../../widgets/seerr/seerr_status_pill.dart';
import '../../../widgets/seerr_icons.dart';
import '../../../widgets/top_toolbar.dart';
import '../detail_layout_metrics.dart';
import '../detail_page.dart';
import '../item_detail_screen.dart';
import '../play_item_on_screen.dart';

enum _Tab { overview, episodes, seasons, cast, extras, related, seerr, details }

enum _Seg { recommended, similar, about }

/// A title Frost can point at. A Seerr one carries its request status, and a
/// library one has none.
typedef _Poster = ({
  String title,
  String? imageUrl,
  int? seerrStatus,
  VoidCallback open,
});

/// A card of rows, under a heading when it has one.
typedef _InfoGroup = (String?, List<_Row>);

/// A label and value line in a Details card, with a logo when it names a
/// streaming service.
class _Row {
  final String label;
  final String value;
  final String? logoPath;

  const _Row(this.label, this.value, [this.logoPath]);
}

// Frost takes its colors from the theme. Its text, icons and hairlines are
// the ink drawn on the background, its glass is tinted with the surface and
// focus lights up in the focused button color, each at the strength Frost's
// own look gives it.
Color _ink([double alpha = 1]) =>
    AppColorScheme.onBackground.withValues(alpha: alpha);
Color _tint(double alpha) => AppColorScheme.surface.withValues(alpha: alpha);
Color _shade(double alpha) =>
    AppColorScheme.background.withValues(alpha: alpha);
Color _lit(double alpha) =>
    AppColorScheme.buttonFocused.withValues(alpha: alpha);
Color get _muted => _ink(0.6);
Color get _platter => _lit(0.14);
const _duration = Duration(milliseconds: 200);

/// The stage Frost's TV view is laid out on: 1280 by 720 at the least, in
/// the room's own shape so it fills the room rather than leaving bars.
Size frostStageSize(BoxConstraints room) {
  if (!room.hasBoundedWidth || !room.hasBoundedHeight) {
    return const Size(1280, 720);
  }
  final aspect = room.maxWidth / room.maxHeight;
  final width = math.max(1280.0, 720 * aspect);
  return Size(width, width / aspect);
}

/// Scales [child], laid out on the stage, to fill the room the app's own
/// navigation leaves, under a top navbar, past the collapsed left sidebar or
/// the back button a bottom navbar brings, and above that bar.
class FrostStage extends StatelessWidget {
  final bool navbarTop;
  final Widget child;

  const FrostStage({super.key, required this.navbarTop, required this.child});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      top: navbarTop ? TopToolbar.heightFor(context) : 0,
      left: navbarTop ? 0 : 72,
      bottom: BottomNavInsetScope.maybeOf(context) ?? 0,
    ),
    child: LayoutBuilder(
      builder: (context, constraints) => FittedBox(
        child: SizedBox.fromSize(
          size: frostStageSize(constraints),
          child: child,
        ),
      ),
    ),
  );
}

/// The title floats in a glass window over a blurred, dimmed copy of its own
/// art. The buttons sit in a toolbar over the window's foot, with the title's
/// parts as tabs in a bar under it. Only Overview shows the art, so the other
/// tabs read as glass.
///
/// A phone gets the same idea as a glass sheet over the art, with a medium
/// and a large height, tabs across the top and the buttons in a capsule.
class FrostDetailContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final FocusNode? initialFocusNode;
  final bool autoPlay;
  final bool actionsExpanded;
  final ValueChanged<bool> onActionsExpandedChanged;

  const FrostDetailContent({
    super.key,
    required this.viewModel,
    required this.prefs,
    this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    this.initialFocusNode,
    this.autoPlay = false,
    required this.actionsExpanded,
    required this.onActionsExpandedChanged,
  });

  @override
  State<FrostDetailContent> createState() => _FrostDetailContentState();
}

class _FrostDetailContentState extends State<FrostDetailContent>
    with DetailPage<FrostDetailContent> {
  _Tab _tab = _Tab.overview;
  _Seg? _seg;
  int? _season;
  bool _overviewOpen = false;

  // Where focus was in each tab, so coming back lands there again.
  final _memory = <_Tab, FocusNode>{};

  // Back from anywhere but Play on Overview goes there first.
  bool _home = false;

  final _sheet = DraggableScrollableController();
  final _detailsScroll = ScrollController();
  final _chipScroll = ScrollController();

  ItemDetailViewModel get _vm => widget.viewModel;

  @override
  ItemDetailViewModel get pageViewModel => widget.viewModel;

  @override
  UserPreferences get pagePrefs => widget.prefs;

  @override
  ValueChanged<bool>? get pageNavbarToggle => null;

  @override
  void moveUp(FocusNode node) {}

  @override
  void moveDown(FocusNode node) => _toActions();

  GlassTier get _tier => GlassSettings.tier == GlassTier.solid
      ? GlassTier.sheen
      : GlassSettings.tier;

  String get _seerrLabel => GetIt.instance<SeerrPreferences>().labelOrDefault(
    AppLocalizations.of(context).seerr,
  );

  @override
  void initState() {
    super.initState();
    FocusManager.instance.addListener(_trackHome);
    final type = _vm.item?.type;
    if (!_vm.isSeerrOnly &&
        (type == 'Series' || type == 'Episode') &&
        _vm.seriesEpisodes.isEmpty) {
      final vm = _vm;
      vm.loadAllSeriesEpisodes().whenComplete(() {
        if (mounted && identical(vm, _vm)) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_trackHome);
    _sheet.dispose();
    _detailsScroll.dispose();
    _chipScroll.dispose();
    super.dispose();
  }

  void _trackHome() {
    final home =
        _tab == _Tab.overview &&
        FocusManager.instance.primaryFocus == widget.initialFocusNode;
    if (home != _home && mounted) setState(() => _home = home);
  }

  void _goHome() {
    setState(() => _tab = _Tab.overview);
    widget.initialFocusNode?.requestFocus();
  }

  void _enter(FocusNode? node) {
    if (node?.context?.mounted == true) node!.requestFocus();
  }

  void _toActions() {
    final last = lastActionFocus;
    _enter(last?.context?.mounted == true ? last : widget.initialFocusNode);
  }

  FocusNode _tabNode(_Tab tab) => pageNode('tab-${tab.name}');

  FocusNode _node(_Tab tab, Object index) => pageNode('${tab.name}-$index');

  /// OK on a tab, or Up off the toolbar: where focus was in that tab, or
  /// where it starts.
  void _enterContent() {
    final remembered = _memory[_tab];
    if (remembered?.context?.mounted == true) return remembered!.requestFocus();
    final start = switch (_tab) {
      _Tab.overview =>
        _node(_Tab.overview, 'text').context?.mounted == true
            ? _node(_Tab.overview, 'text')
            : _node(_Tab.overview, 'track-0'),
      _Tab.episodes => _node(_Tab.episodes, _startEpisode()),
      _ => _node(_tab, 0),
    };
    final segment = _node(_tab, 'seg-0');
    if (start.context?.mounted == true) {
      start.requestFocus();
    } else if (segment.context?.mounted == true) {
      segment.requestFocus();
    } else {
      _tabNode(_tab).requestFocus();
    }
  }

  void _toNavbar() {
    if (navbarIsTop) toNavbar();
  }

  void _remember(_Tab tab, FocusNode node, bool focused) {
    if (focused) _memory[tab] = node;
  }

  void _toSidebar() {
    if (!navbarIsTop) NavigationLayout.focusNavbarNotifier.value?.call();
  }

  /// Moves the Details cards a step, and says whether there was room to.
  bool _scrollDetails(double by) {
    if (!_detailsScroll.hasClients) return false;
    final position = _detailsScroll.position;
    final target = (position.pixels + by).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    if (target == position.pixels) return false;
    position.animateTo(
      target,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
    return true;
  }

  SeerrDetailPieces _pieces(DetailSectionVisibility sections) =>
      SeerrDetailPieces.resolve(
        seerrItemTabState(_vm),
        sections,
        AppLocalizations.of(context),
      );

  /// A phone has no Seerr tab, so its Seerr titles join the related ones.
  List<_Tab> _tabs(
    AggregatedItem item,
    DetailSectionVisibility sections, {
    required bool phone,
  }) {
    final isShow = const {'Series', 'Season', 'Episode'}.contains(item.type);
    final seerrOnly = _vm.isSeerrOnly;
    final pieces = _pieces(sections);
    final seerrPosters = pieces.recommendations || pieces.similar;
    return [
      _Tab.overview,
      if (!seerrOnly &&
          isShow &&
          (item.type != 'Episode' ||
              sections.shows(DetailSection.moreEpisodes)))
        _Tab.episodes,
      if (seerrOnly && isShow && _vm.seasons.isNotEmpty) _Tab.seasons,
      if (sections.shows(DetailSection.cast) && _vm.actors.isNotEmpty)
        _Tab.cast,
      if (sections.shows(DetailSection.extras) && _vm.features.isNotEmpty)
        _Tab.extras,
      if ((!seerrOnly &&
              sections.shows(DetailSection.moreLikeThis) &&
              _vm.similar.isNotEmpty) ||
          (seerrPosters && (seerrOnly || phone)))
        _Tab.related,
      if (!seerrOnly && !phone && _segs(_Tab.seerr, pieces).isNotEmpty)
        _Tab.seerr,
      _Tab.details,
    ];
  }

  String _tabLabel(_Tab tab, AppLocalizations l10n, {bool short = false}) =>
      switch (tab) {
        _Tab.overview => l10n.overview,
        _Tab.episodes => l10n.episodes,
        _Tab.seasons => l10n.seasons,
        _Tab.cast => short ? l10n.cast : l10n.castAndCrew,
        _Tab.extras => l10n.extras,
        _Tab.related => short ? l10n.similar : l10n.moreLikeThis,
        _Tab.seerr => _seerrLabel,
        _Tab.details => l10n.details,
      };

  Widget _tabIcon(_Tab tab) {
    final icon = switch (tab) {
      _Tab.overview => Icons.smart_display_outlined,
      _Tab.episodes => Icons.format_list_bulleted,
      _Tab.seasons => Icons.layers_outlined,
      _Tab.cast => Icons.people_outline,
      _Tab.extras => Icons.video_library_outlined,
      _Tab.related => Icons.grid_view,
      _Tab.seerr => null,
      _Tab.details => Icons.info_outline,
    };
    return icon == null
        ? SeerrIcon(size: 22, color: _ink())
        : Icon(icon, color: _ink(), size: 22);
  }

  /// The Seerr tab's segments, and the related ones for a title that's only
  /// in Seerr.
  List<_Seg> _segs(_Tab tab, SeerrDetailPieces pieces) {
    if (tab != _Tab.seerr && (tab != _Tab.related || !_vm.isSeerrOnly)) {
      return const [];
    }
    return [
      if (pieces.recommendations) _Seg.recommended,
      if (pieces.similar) _Seg.similar,
      if (tab == _Tab.seerr &&
          _seerrInfo(pieces, AppLocalizations.of(context)).isNotEmpty)
        _Seg.about,
    ];
  }

  _Seg? _shownSeg(List<_Seg> segs) =>
      segs.contains(_seg) ? _seg : segs.firstOrNull;

  String _segLabel(_Seg seg, AppLocalizations l10n) => switch (seg) {
    _Seg.recommended => l10n.recommendations,
    _Seg.similar => l10n.similar,
    _Seg.about => l10n.aboutTitle,
  };

  List<AggregatedItem> get _allEpisodes =>
      _vm.item?.type == 'Season' ? _vm.episodes : _vm.seriesEpisodes;

  List<int> get _seasonNumbers =>
      _allEpisodes
          .map((episode) => episode.parentIndexNumber)
          .whereType<int>()
          .toSet()
          .toList()
        ..sort();

  /// The season picked, else the one the viewer is in, else the first that
  /// isn't Specials.
  int? get _shownSeason {
    final numbers = _seasonNumbers;
    if (numbers.isEmpty) return null;
    final item = _vm.item;
    final current =
        _season ??
        (item?.type == 'Episode' ? item?.parentIndexNumber : null) ??
        _vm.nextUp?.parentIndexNumber;
    if (numbers.contains(current)) return current;
    return numbers.firstWhere(
      (number) => number > 0,
      orElse: () => numbers.first,
    );
  }

  List<AggregatedItem> get _episodes {
    final season = _shownSeason;
    return [
      for (final episode in _allEpisodes)
        if (episode.parentIndexNumber == season) episode,
    ];
  }

  /// The episode the viewer would carry on with, or this page's own.
  int _startEpisode() {
    final episodes = _episodes;
    final wanted = _vm.item?.type == 'Episode' ? _vm.item?.id : _vm.nextUp?.id;
    final index = episodes.indexWhere((episode) => episode.id == wanted);
    return index < 0 ? 0 : index;
  }

  List<_Poster> _libraryPosters(DetailSectionVisibility sections) {
    if (_vm.isSeerrOnly || !sections.shows(DetailSection.moreLikeThis)) {
      return const [];
    }
    return [
      for (final item in _vm.similar)
        (
          title: item.name,
          imageUrl: item.primaryImageTag == null
              ? null
              : _vm.imageApi.getPrimaryImageUrl(
                  item.id,
                  maxHeight: 360,
                  tag: item.primaryImageTag,
                ),
          seerrStatus: null,
          open: () =>
              context.push(Destinations.item(item.id, serverId: item.serverId)),
        ),
    ];
  }

  List<_Poster> _seerrPosters(_Seg seg) {
    final state = seerrItemTabState(_vm);
    if (state == null) return const [];
    return [
      for (final item
          in seg == _Seg.similar ? state.similar : state.recommendations)
        (
          title: item.title ?? item.name ?? '',
          imageUrl: item.posterPath == null
              ? null
              : '$seerrPosterBase${item.posterPath}',
          seerrStatus: item.mediaInfo?.status ?? SeerrMediaStatus.unknown,
          open: () => context.push(
            Destinations.seerrMedia(
              item.id.toString(),
              mediaType: item.mediaType ?? 'movie',
            ),
          ),
        ),
    ];
  }

  String? _names(List<Map<String, dynamic>> people, {int? take}) {
    final names = people
        .map((person) => person['Name'] as String?)
        .whereType<String>()
        .where((name) => name.isNotEmpty);
    final shown = take == null ? names : names.take(take);
    return shown.isEmpty ? null : shown.join(', ');
  }

  List<(String, String)> _credits(
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final starring = sections.shows(DetailSection.cast)
        ? _names(_vm.actors, take: 3)
        : null;
    final directors = sections.shows(DetailSection.crew)
        ? _names(_vm.directors)
        : null;
    return [
      if (starring != null) (l10n.cast, starring),
      if (directors != null) (l10n.adminMetadataPersonKindDirector, directors),
    ];
  }

  List<_InfoGroup> _info(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final locale = Localizations.localeOf(context).toString();
    final released = item.premiereDate;
    final runtime = item.runtime;
    final crew = sections.shows(DetailSection.crew);
    final studios = sections.shows(DetailSection.studios)
        ? _names(item.studios)
        : null;
    final directors = crew ? _names(_vm.directors) : null;
    final writers = crew ? _names(_vm.writers) : null;
    final information = [
      if (studios != null) _Row(l10n.studios, studios),
      if (released != null)
        _Row(l10n.releaseDateLabel, DateFormat.yMMMd(locale).format(released)),
      if (runtime != null && runtime > Duration.zero)
        _Row(l10n.runtimeLabel, formatRuntimeShort(runtime)),
      if (item.officialRating case final rating? when rating.isNotEmpty)
        _Row(l10n.detailMetadataParentalRating, rating),
      if (directors != null)
        _Row(l10n.adminMetadataPersonKindDirector, directors),
      if (writers != null) _Row(l10n.adminMetadataPersonKindWriter, writers),
      if (item.genres.isNotEmpty) _Row(l10n.genres, item.genres.join(', ')),
    ];

    final source = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );
    final streams = source == null
        ? const <Map<String, dynamic>>[]
        : mediaSourceStreams(source);
    String languages(String type) => streams
        .where((stream) => stream['Type'] == type)
        .map(
          (stream) =>
              streamLanguageLabel(stream['Language'] as String?, unknown: '?'),
        )
        .toSet()
        .join(', ');
    final audio = languages('Audio');
    final subtitles = languages('Subtitle');
    final languageRows = [
      if (audio.isNotEmpty) _Row(l10n.audio, audio),
      if (subtitles.isNotEmpty) _Row(l10n.subtitles, subtitles),
    ];

    final media = <_Row>[];
    if (source != null && sections.shows(DetailSection.mediaInfo)) {
      final versions = _names(item.mediaSources);
      final video = streams.where((stream) => stream['Type'] == 'Video');
      final size = formatMediaSourceSize(source['Size'] as int? ?? 0);
      final path = source['Path'] as String? ?? '';
      final fileName = path.split('/').last.split('\\').last;
      media.addAll([
        if (item.mediaSources.length > 1 && versions != null)
          _Row(l10n.version, versions),
        if (fileName.isNotEmpty) _Row(l10n.playbackInfoFile, fileName),
        if (video.isNotEmpty)
          _Row(
            l10n.video,
            videoStreamSummary(video.first, unknownCodec: '?').join(' · '),
          ),
        if (source['Container'] case final String container)
          _Row(l10n.container, container.toUpperCase()),
        if (size != null) _Row(l10n.sortBySize, size),
      ]);
    }

    return [
      // Straight under the Details title, so it needs no heading of its own.
      if (information.isNotEmpty) (null, information),
      if (languageRows.isNotEmpty) (l10n.settingsLanguageSection, languageRows),
      if (media.isNotEmpty) (l10n.detailSectionMediaInfo, media),
    ];
  }

  List<_InfoGroup> _seerrInfo(SeerrDetailPieces pieces, AppLocalizations l10n) {
    final state = seerrItemTabState(_vm);
    if (state == null) return const [];
    final keywords = state.keywords.map((keyword) => keyword.name).join(', ');
    return [
      if (pieces.stats)
        (
          _seerrLabel,
          [
            for (final (label, value) in SeerrStatsCard.rows(state, l10n))
              _Row(label, value),
          ],
        ),
      if (pieces.streaming)
        (
          l10n.seerrStreamingOn,
          [
            for (final provider in state.streamingProviders)
              _Row(provider.name, '', provider.logoPath),
          ],
        ),
      if (pieces.chips && keywords.isNotEmpty)
        (null, [_Row(l10n.tags, keywords)]),
    ];
  }

  String? _imageFor(Map<String, dynamic> person) {
    final id = person['Id']?.toString();
    final tag = person['PrimaryImageTag'] as String?;
    if (id != null && tag != null) {
      return _vm.imageApi.getPrimaryImageUrl(id, maxHeight: 240, tag: tag);
    }
    final path = person['ProfilePath'] as String?;
    return path == null || path.isEmpty ? null : '$seerrProfileBase$path';
  }

  void _openPerson(Map<String, dynamic> person) {
    final id = person['Id']?.toString();
    if (id == null) return;
    final serverId = _vm.item?.serverId;
    context.push(
      serverId == 'seerr'
          ? Destinations.seerrPerson(id)
          : Destinations.item(id, serverId: serverId),
    );
  }

  void _openEpisode(AggregatedItem episode) {
    if (episode.id == _vm.item?.id) {
      playItemOnScreen(context);
      return;
    }
    context.push(Destinations.item(episode.id, serverId: episode.serverId));
  }

  void _requestSeason(AggregatedItem season) {
    final seerr = _vm.seerr;
    if (seerr == null) return;
    final number = season.indexNumber ?? 0;
    showSeerrRequestDialog(
      context: context,
      vm: seerr,
      is4k: false,
      qualityToggle: true,
      season: number > 0 ? number : null,
    );
  }

  void _readMore(AggregatedItem item, String overview) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: _tint(0.95),
        insetPadding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(36)),
        child: Focus(
          autofocus: true,
          onKeyEvent: (node, event) {
            if (!isActivateKey(event)) return KeyEventResult.ignored;
            Navigator.of(context).pop();
            return KeyEventResult.handled;
          },
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(44, 40, 44, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      color: _ink(),
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    overview,
                    style: TextStyle(
                      color: _ink(0.9),
                      fontSize: 18,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;
    if (item == null) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    final sections = DetailSectionVisibility.of(widget.prefs);
    final phone = !detailUsesLandscapeLayout(context);
    final tabs = _tabs(item, sections, phone: phone);
    if (!tabs.contains(_tab)) _tab = _Tab.overview;

    if (phone) return _phone(item, sections, tabs, l10n);
    final page = _tv(item, sections, tabs, l10n);
    if (!PlatformDetection.isTV) return page;
    return PopScope(
      canPop: _home,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _goHome();
      },
      child: page,
    );
  }

  /// The art, blurred and dimmed, behind everything. It's decoded small and
  /// stretched, which softens it for nothing where a live blur costs too
  /// much.
  Widget _environment(AggregatedItem item) {
    final url = ownBackdropUrl(item);
    final showImage = widget.prefs.get(UserPreferences.detailsBackdropEnabled);
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: AppColorScheme.background),
        if (showImage && url != null)
          ImageFiltered(
            enabled: GlassSettings.blursBackdrop,
            imageFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: OfflineAwareImage(
              imageUrl: url,
              fit: BoxFit.cover,
              minDecodeWidth: 48,
              maxDecodeWidth: 96,
              filterQuality: FilterQuality.medium,
              errorWidget: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        ColoredBox(color: _shade(0.55)),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, -0.1),
              radius: 0.9,
              colors: [_shade(0), _shade(0.5)],
              stops: [0.35, 1],
            ),
          ),
        ),
      ],
    );
  }

  Widget _art(AggregatedItem item, {Alignment alignment = Alignment.center}) {
    final url = ownBackdropUrl(item);
    if (url == null ||
        !widget.prefs.get(UserPreferences.detailsBackdropEnabled)) {
      return const SizedBox.shrink();
    }
    return OfflineAwareImage(
      imageUrl: url,
      fit: BoxFit.cover,
      alignment: alignment,
      errorWidget: (_, _, _) => const SizedBox.shrink(),
    );
  }

  Widget _glass({
    required Widget child,
    required double radius,
    Color? color,
    EdgeInsetsGeometry? padding,
    bool shadow = false,
  }) => glassPane(
    tier: _tier,
    fallbackColor: color ?? _tint(0.5),
    cornerRadius: radius,
    padding: padding,
    shadow: shadow,
    context: context,
    child: child,
  );

  Widget _actions({required bool phone}) {
    final prefLimit = widget.prefs.get(UserPreferences.detailButtonsMaxVisible);
    final cap = phone ? 5 : 6;
    return DetailActionButtons(
      key: actionsKey,
      viewModel: _vm,
      itemId: _vm.item?.id,
      selectedMediaSourceId: widget.selectedMediaSourceId,
      onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
      tvPlayFocusNode: widget.initialFocusNode,
      upTarget: actionsUpProxy,
      downTarget: phone ? null : _tabNode(_tab),
      onRequestFocus: (target) {
        _enter(target);
        return KeyEventResult.handled;
      },
      autoPlay: widget.autoPlay,
      modernStyle: true,
      frosted: true,
      fullWidthPrimary: phone,
      centerRow: true,
      overflowAsMenu: true,
      maxVisibleButtonsOverride: prefLimit > 0
          ? math.min(prefLimit + 1, cap)
          : cap,
      actionsExpanded: widget.actionsExpanded,
      onActionsExpandedChanged: widget.onActionsExpandedChanged,
      omitTrackButtons: true,
    );
  }

  /// The audio, subtitle and version pickers, which the button row owns.
  List<DetailTrackChoice> _trackChoices(AppLocalizations l10n) {
    final actions = actionsKey.currentState;
    if (actions == null && !_vm.isSeerrOnly) {
      // The button row holds the tracks, so they show a frame after it.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && actionsKey.currentState != null) setState(() {});
      });
    }
    return actions?.trackChoices(l10n) ?? const [];
  }

  /// Placed from the stage's edges rather than at fixed sizes, so it can take
  /// the room's shape.
  Widget _tv(
    AggregatedItem item,
    DetailSectionVisibility sections,
    List<_Tab> tabs,
    AppLocalizations l10n,
  ) {
    final overview = _tab == _Tab.overview;

    final window = Positioned(
      left: 24,
      right: 24,
      top: 12,
      bottom: 146,
      child: _glass(
        radius: 44,
        color: _tint(0.36),
        shadow: true,
        child: ClipRRect(
          borderRadius: AppRadius.circular(44),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedOpacity(
                opacity: overview ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _art(item),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [_shade(0.95), _shade(0.74), _shade(0)],
                          stops: [0, 0.5, 0.8],
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [_shade(0.5), _shade(0)],
                          stops: [0, 0.62],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!overview)
                Positioned(
                  left: 56,
                  top: 32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name.toUpperCase(),
                        style: TextStyle(
                          color: _muted,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _tabLabel(_tab, l10n),
                        style: TextStyle(
                          color: _ink(),
                          fontSize: 36,
                          height: 1.17,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ..._tvTab(item, sections, l10n),
            ],
          ),
        ),
      ),
    );

    final toolbar = Positioned(
      left: 24,
      right: 24,
      bottom: 106,
      child: Center(
        child: _glass(
          radius: 38,
          shadow: true,
          padding: const EdgeInsets.all(8),
          // Unbounded across, so the row sizes to its buttons and never wraps.
          child: UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Focus(
                  focusNode: actionsUpProxy,
                  onFocusChange: (focused) {
                    if (focused) _enterContent();
                  },
                  child: const SizedBox.shrink(),
                ),
                _actions(phone: false),
              ],
            ),
          ),
        ),
      ),
    );

    final tabBar = Positioned(
      left: 24,
      right: 24,
      bottom: 36,
      child: Center(
        child: _glass(
          radius: 30,
          shadow: true,
          padding: const EdgeInsets.all(6),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                for (final (index, tab) in tabs.indexed)
                  _barTab(tab, index, tabs, l10n),
              ],
            ),
          ),
        ),
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        _environment(item),
        FrostStage(
          navbarTop: navbarIsTop,
          child: MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1.15,
            child: Stack(
              clipBehavior: Clip.none,
              children: [window, toolbar, tabBar],
            ),
          ),
        ),
      ],
    );
  }

  Widget _barTab(_Tab tab, int index, List<_Tab> tabs, AppLocalizations l10n) {
    final selected = tab == _tab;
    return _FrostFocus(
      focusNode: _tabNode(tab),
      onFocusChange: (focused) {
        if (focused && _tab != tab) setState(() => _tab = tab);
        _trackHome();
      },
      // Focus picks the tab, but a click doesn't move focus, so it has to.
      onSelect: selected ? _enterContent : _tabNode(tab).requestFocus,
      onLeft: index > 0
          ? () => _tabNode(tabs[index - 1]).requestFocus()
          : _toSidebar,
      onRight: () {
        if (index + 1 < tabs.length) _tabNode(tabs[index + 1]).requestFocus();
      },
      onUp: _toActions,
      onDown: () {},
      builder: (context, focused) => AnimatedScale(
        scale: focused ? 1.04 : 1,
        duration: _duration,
        child: AnimatedContainer(
          duration: _duration,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: focused
                ? _lit(0.38)
                : (selected ? _ink(0.16) : Colors.transparent),
            borderRadius: AppRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _tabIcon(tab),
              const SizedBox(width: 10),
              Text(
                _tabLabel(tab, l10n),
                maxLines: 1,
                style: TextStyle(
                  color: _ink(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _tvTab(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final pieces = _pieces(sections);
    final segs = _segs(_tab, pieces);
    final seg = _shownSeg(segs);
    final segIndex = seg == null ? -1 : segs.indexOf(seg);

    final Widget? picker;
    final VoidCallback? upFromTop;
    if (_tab == _Tab.episodes && _seasonNumbers.length > 1) {
      picker = _seasonPicker(phone: false);
      upFromTop = () => _node(
        _Tab.episodes,
        'seg-${_seasonNumbers.indexOf(_shownSeason!)}',
      ).requestFocus();
    } else if (segs.length > 1) {
      final tab = _tab;
      picker = _segmentPicker(
        tab: tab,
        labels: [for (final option in segs) _segLabel(option, l10n)],
        selected: segIndex,
        onPick: (index) => setState(() {
          _seg = segs[index];
          _memory.remove(tab);
        }),
        onDown: () => _enter(_node(tab, 0)),
        phone: false,
      );
      upFromTop = () => _node(tab, 'seg-$segIndex').requestFocus();
    } else {
      picker = null;
      upFromTop = null;
    }

    // Ends just above the toolbar.
    Widget area(Widget child, {double left = 40, double top = 112}) =>
        Positioned(left: left, right: left, top: top, bottom: 50, child: child);

    final content = switch (_tab) {
      _Tab.overview => Positioned.fill(
        child: _tvOverview(item, sections, l10n),
      ),
      _Tab.episodes => area(
        top: 108,
        _scroll(
          Column(
            spacing: 8,
            children: _episodeTiles(phone: false, upFromTop: upFromTop),
          ),
        ),
      ),
      _Tab.seasons => area(
        top: 108,
        _scroll(Column(spacing: 8, children: _seasonTiles(phone: false))),
      ),
      _Tab.cast => area(
        left: 48,
        top: 108,
        _scroll(_castGrid(columns: 5, phone: false)),
      ),
      _Tab.extras => area(_scroll(_extrasGrid(columns: 3, phone: false))),
      _Tab.seerr when seg == _Seg.about => area(
        left: 56,
        _details(_seerrInfo(pieces, l10n), phone: false, upFromTop: upFromTop),
      ),
      _Tab.related || _Tab.seerr => area(
        _scroll(
          _posterGrid(
            seg == null ? _libraryPosters(sections) : _seerrPosters(seg),
            columns: 7,
            gap: 6,
            phone: false,
            upFromTop: upFromTop,
          ),
        ),
      ),
      _Tab.details => area(
        left: 56,
        _details([
          ..._info(item, sections, l10n),
          if (_vm.isSeerrOnly) ..._seerrInfo(pieces, l10n),
        ], phone: false),
      ),
    };

    return [
      if (picker != null)
        Positioned(
          left: 360,
          right: 48,
          top: 44,
          child: Align(alignment: Alignment.centerRight, child: picker),
        ),
      content,
    ];
  }

  Widget _scroll(Widget child) => SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: child,
  );

  /// Rows of [columns], the last one padded out so its tiles keep the width
  /// of the rest.
  Widget _grid({
    required int columns,
    required double gap,
    required double runGap,
    required List<Widget> children,
  }) => Column(
    spacing: runGap,
    children: [
      for (var start = 0; start < children.length; start += columns)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: gap,
          children: [
            for (var i = start; i < start + columns; i++)
              Expanded(
                child: i < children.length
                    ? children[i]
                    : const SizedBox.shrink(),
              ),
          ],
        ),
    ],
  );

  Widget _heading(String text, {required bool phone}) => Padding(
    padding: EdgeInsets.fromLTRB(phone ? 16 : 18, 0, 16, phone ? 6 : 7),
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: _muted,
        fontSize: phone ? 12 : 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.6,
      ),
    ),
  );

  Widget _logo(String? path, {required double size}) => ClipRRect(
    borderRadius: AppRadius.circular(size / 4),
    child: SizedBox.square(
      dimension: size,
      child: path == null
          ? ColoredBox(color: _ink(0.12))
          : OfflineAwareImage(
              imageUrl: '$seerrLogoBase$path',
              fit: BoxFit.cover,
              errorWidget: (_, _, _) => const SizedBox.shrink(),
            ),
    ),
  );

  /// How far in the viewer is, what's downloading, or for a title that's
  /// only in Seerr, where its request stands.
  Widget? _status(AggregatedItem item, AppLocalizations l10n) {
    final downloads = seerrItemDownloads(_vm);
    if (downloads != null) return SeerrItemDownloadBars(state: downloads);
    final phone = !detailUsesLandscapeLayout(context);
    if (!_vm.isSeerrOnly) {
      final resume = resumeLine(item, l10n);
      return resume == null ? null : _resumeBar(resume, phone: phone);
    }
    final state = _vm.seerr?.state;
    if (state == null || state.tmdbId == 0) return null;
    final dot = phone ? 8.0 : 10.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: dot,
          height: dot,
          decoration: BoxDecoration(
            color: seerrStatusColor(state.hd.status),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: phone ? 8 : 12),
        Flexible(
          child: Text(
            seerrStatusLabel(state.hd, l10n),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: _ink(0.8),
              fontSize: phone ? 13 : 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  /// Where a title that's only in Seerr streams, in place of the track
  /// pickers it has none of.
  Widget? _whereToWatch(
    DetailSectionVisibility sections,
    AppLocalizations l10n, {
    required bool phone,
  }) {
    final state = seerrItemTabState(_vm);
    if (!_vm.isSeerrOnly || state == null || !_pieces(sections).streaming) {
      return null;
    }
    final providers = state.streamingProviders;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _heading(l10n.seerrStreamingOn, phone: phone),
        Container(
          padding: phone
              ? const EdgeInsets.fromLTRB(10, 10, 16, 10)
              : const EdgeInsets.fromLTRB(12, 12, 16, 12),
          decoration: BoxDecoration(
            color: _ink(phone ? 0.07 : 0.1),
            borderRadius: AppRadius.circular(phone ? 20 : 22),
          ),
          child: Row(
            children: [
              _logo(providers.first.logoPath, size: phone ? 44 : 52),
              SizedBox(width: phone ? 12 : 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      providers.first.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: _ink(),
                        fontSize: phone ? 16 : 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (providers.length > 1)
                      Text(
                        providers.skip(1).map((p) => p.name).join(', '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: _muted,
                          fontSize: phone ? 13 : 15,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tvOverview(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final ratings = RatingsRow.forDetailScreen(
      item: item,
      extraRatings: _vm.ratings,
      prefs: widget.prefs,
      columns: true,
      columnTextScale: 1.3,
    );
    final status = _status(item, l10n);
    final overview = overviewText(item);
    final credits = _credits(sections, l10n);
    final choices = _trackChoices(l10n);
    final watch = choices.isEmpty
        ? _whereToWatch(sections, l10n, phone: false)
        : null;
    final textNode = _node(_Tab.overview, 'text');
    final hasText = overview != null;

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasText)
          _FrostFocus(
            focusNode: textNode,
            onFocusChange: (focused) =>
                _remember(_Tab.overview, textNode, focused),
            onSelect: () => _readMore(item, overview),
            onLeft: _toSidebar,
            onRight: () {
              if (choices.isNotEmpty) {
                _node(_Tab.overview, 'track-0').requestFocus();
              }
            },
            onUp: _toNavbar,
            onDown: _toActions,
            builder: (context, focused) => AnimatedScale(
              scale: focused ? 1.02 : 1,
              duration: _duration,
              child: AnimatedContainer(
                duration: _duration,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: focused ? _platter : Colors.transparent,
                  borderRadius: AppRadius.circular(20),
                ),
                child: Text(
                  overview,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _ink(0.9),
                    fontSize: 18,
                    height: 1.44,
                  ),
                ),
              ),
            ),
          ),
        if (credits.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
            child: _creditLine(credits, fontSize: 16),
          ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(56, 0, 56, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            item.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: _ink(),
              fontSize: 64,
              height: 1.1,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.6,
            ),
          ),
          const SizedBox(height: 12),
          DetailMetadataRow(
            item: item,
            selectedMediaSource: selectedMediaSourceForItem(
              item,
              widget.selectedMediaSourceId,
            ),
            upcomingEpisode: _vm.upcomingEpisode,
            seerrStatus: _vm.isSeerrOnly ? null : seerrItemStatus(_vm),
          ),
          if (status != null) ...[const SizedBox(height: 14), status],
          if (ratings != null) ...[
            const SizedBox(height: 14),
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: _ink(0.14)),
                ),
              ),
              child: ratings,
            ),
          ],
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The focus platter reaches past the text, so the text lines
              // up with the title.
              Transform.translate(
                offset: const Offset(-12, 0),
                child: SizedBox(width: 744, child: left),
              ),
              const Spacer(),
              if (choices.isNotEmpty)
                SizedBox(
                  width: 356,
                  child: Column(
                    spacing: 6,
                    children: [
                      for (final (index, choice) in choices.indexed)
                        _trackRow(choice, index, choices.length, hasText),
                    ],
                  ),
                ),
              if (watch != null) SizedBox(width: 356, child: watch),
            ],
          ),
        ],
      ),
    );
  }

  Widget _creditLine(
    List<(String, String)> credits, {
    required double fontSize,
  }) => Text.rich(
    TextSpan(
      children: [
        for (final (index, (label, names)) in credits.indexed) ...[
          if (index > 0) const TextSpan(text: '    '),
          TextSpan(
            text: '$label  ',
            style: TextStyle(color: _muted, fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: names,
            style: TextStyle(color: _ink(0.9)),
          ),
        ],
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontSize: fontSize, height: 1.4),
  );

  Widget _resumeBar(
    ({double fraction, String label}) resume, {
    required bool phone,
  }) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: phone ? 64 : 110,
        child: ClipRRect(
          borderRadius: AppRadius.circular(3),
          child: LinearProgressIndicator(
            value: resume.fraction,
            minHeight: phone ? 4 : 5,
            color: AppColorScheme.rangeProgress,
            backgroundColor: AppColorScheme.rangeTrack,
          ),
        ),
      ),
      SizedBox(width: phone ? 8 : 12),
      Flexible(
        child: Text(
          resume.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: _ink(0.8),
            fontSize: phone ? 13 : 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );

  Widget _trackRow(
    DetailTrackChoice choice,
    int index,
    int count,
    bool hasText,
  ) {
    final node = _node(_Tab.overview, 'track-$index');
    final l10n = AppLocalizations.of(context);
    return _FrostFocus(
      focusNode: node,
      onFocusChange: (focused) => _remember(_Tab.overview, node, focused),
      onSelect: () => actionsKey.currentState?.openTrackPicker(choice.kind),
      onLeft: () {
        if (hasText) {
          _node(_Tab.overview, 'text').requestFocus();
        } else {
          _toSidebar();
        }
      },
      onRight: () {},
      onUp: () {
        if (index > 0) {
          _node(_Tab.overview, 'track-${index - 1}').requestFocus();
        } else {
          _toNavbar();
        }
      },
      onDown: () {
        if (index + 1 < count) {
          _node(_Tab.overview, 'track-${index + 1}').requestFocus();
        } else {
          _toActions();
        }
      },
      builder: (context, focused) => AnimatedScale(
        scale: focused ? 1.04 : 1,
        duration: _duration,
        child: AnimatedContainer(
          duration: _duration,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: focused ? _lit(0.32) : _ink(0.1),
            borderRadius: AppRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(choice.kind.icon, color: _ink(), size: 18),
              const SizedBox(width: 10),
              Text(
                choice.kind.label(l10n),
                style: TextStyle(
                  color: _ink(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  choice.current,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: _ink(0.72), fontSize: 16),
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.unfold_more, color: _muted, size: 14),
            ],
          ),
        ),
      ),
    );
  }

  /// Arrow keys for a tile in a grid of [columns]: Left off the first column
  /// goes to a left sidebar, Up off the top row to a top navbar, Down off the
  /// last row to the toolbar, and the grid's other edges hold.
  ({
    VoidCallback? left,
    VoidCallback? right,
    VoidCallback? up,
    VoidCallback? down,
  })
  _gridKeys(int index, int count, int columns, {VoidCallback? upFromTop}) => (
    left: index % columns == 0 ? _toSidebar : null,
    right: index % columns == columns - 1 || index == count - 1 ? () {} : null,
    up: index < columns ? (upFromTop ?? _toNavbar) : null,
    down: index ~/ columns == (count - 1) ~/ columns ? _toActions : null,
  );

  /// A row of pills, one of them picked.
  Widget _segmentPicker({
    required _Tab tab,
    required List<String> labels,
    required int selected,
    required ValueChanged<int> onPick,
    required VoidCallback onDown,
    required bool phone,
  }) {
    final chips = [
      for (final (index, label) in labels.indexed)
        _FrostFocus(
          focusNode: _node(tab, 'seg-$index'),
          onSelect: () => onPick(index),
          onLeft: index == 0 ? _toSidebar : null,
          onRight: index == labels.length - 1 ? () {} : null,
          onUp: _toNavbar,
          onDown: onDown,
          autoScroll: true,
          builder: (context, focused) {
            final picked = index == selected;
            return AnimatedScale(
              scale: focused ? 1.06 : 1,
              duration: _duration,
              child: AnimatedContainer(
                duration: _duration,
                height: phone ? 32 : 42,
                padding: EdgeInsets.symmetric(horizontal: phone ? 12 : 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: focused
                      ? _lit(0.38)
                      : (picked ? _ink(0.18) : Colors.transparent),
                  borderRadius: AppRadius.circular(phone ? 16 : 21),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: _ink(focused || picked ? 1 : 0.68),
                    fontSize: phone ? 14 : 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
    ];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: _ink(0.08),
        borderRadius: AppRadius.circular(phone ? 20 : 25),
      ),
      child: Listener(
        // A mouse wheel only turns up and down, so it moves the chips sideways.
        onPointerSignal: (signal) {
          final position = _chipScroll.positions.singleOrNull;
          if (signal is! PointerScrollEvent || position == null) return;
          position.jumpTo(
            (position.pixels + signal.scrollDelta.dy).clamp(
              position.minScrollExtent,
              position.maxScrollExtent,
            ),
          );
        },
        child: ScrollEdgeArrows(
          controller: _chipScroll,
          size: phone ? 32 : 42,
          child: SingleChildScrollView(
            controller: _chipScroll,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: chips,
            ),
          ),
        ),
      ),
    );
  }

  Widget _seasonPicker({required bool phone}) {
    final numbers = _seasonNumbers;
    if (numbers.length < 2) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    return _segmentPicker(
      tab: _Tab.episodes,
      labels: [
        for (final number in numbers)
          number == 0 ? l10n.specials : l10n.seasonNumber(number),
      ],
      selected: numbers.indexOf(_shownSeason!),
      onPick: (index) => setState(() {
        _season = numbers[index];
        _memory.remove(_Tab.episodes);
      }),
      onDown: () => _node(_Tab.episodes, _startEpisode()).requestFocus(),
      phone: phone,
    );
  }

  List<Widget> _episodeTiles({required bool phone, VoidCallback? upFromTop}) {
    final episodes = _episodes;
    return [
      for (final (index, episode) in episodes.indexed)
        _episodeTile(
          episode,
          index,
          episodes.length,
          phone: phone,
          upFromTop: upFromTop,
        ),
    ];
  }

  Widget _episodeTile(
    AggregatedItem episode,
    int index,
    int count, {
    required bool phone,
    VoidCallback? upFromTop,
  }) {
    final l10n = AppLocalizations.of(context);
    final node = _node(_Tab.episodes, index);
    final keys = _gridKeys(index, count, 1, upFromTop: upFromTop);
    final still = episode.primaryImageTag == null
        ? null
        : _vm.imageApi.getPrimaryImageUrl(
            episode.id,
            maxWidth: 400,
            tag: episode.primaryImageTag,
          );
    final runtime = episode.runtime;
    final resume = resumeLine(episode, l10n);
    final number = episode.indexNumber;
    final caps = [
      if (number != null) l10n.episodeNumber(number).toUpperCase(),
      if (phone && runtime != null) formatRuntimeShort(runtime).toUpperCase(),
    ].join(' · ');

    return _FrostFocus(
      focusNode: node,
      onFocusChange: (focused) => _remember(_Tab.episodes, node, focused),
      onSelect: () => _openEpisode(episode),
      onLeft: keys.left,
      onRight: keys.right,
      onUp: keys.up,
      onDown: keys.down,
      autoScroll: true,
      builder: (context, focused) => AnimatedContainer(
        duration: _duration,
        height: phone ? null : 120,
        padding: phone
            ? const EdgeInsets.symmetric(vertical: 12)
            : const EdgeInsets.fromLTRB(6, 6, 22, 6),
        decoration: BoxDecoration(
          color: focused ? _platter : Colors.transparent,
          borderRadius: AppRadius.circular(28),
        ),
        child: Row(
          crossAxisAlignment: phone
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: focused ? 1.05 : 1,
              duration: _duration,
              child: _thumb(
                still,
                width: phone ? 132 : 192,
                radius: phone ? 12 : 22,
                progress: phone ? resume?.fraction : null,
              ),
            ),
            SizedBox(width: phone ? 12 : 22),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      if (phone && episode.isPlayed)
                        Icon(Icons.check_circle, color: _muted, size: 12),
                      Text(
                        caps,
                        style: TextStyle(
                          color: _muted,
                          fontSize: phone ? 11 : 13,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    episode.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _ink(),
                      fontSize: phone ? 15 : 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (episode.overview case final text?
                      when text.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text(
                      text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: _muted,
                        fontSize: phone ? 13 : 15,
                        height: phone ? 1.35 : 1.33,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (!phone)
              SizedBox(
                width: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 7,
                      children: [
                        if (episode.isPlayed)
                          Icon(Icons.check_circle, color: _muted, size: 17),
                        if (runtime != null)
                          Text(
                            formatRuntimeShort(runtime),
                            style: TextStyle(
                              color: _ink(0.72),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                    if (resume != null) ...[
                      SizedBox(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: AppRadius.circular(3),
                          child: LinearProgressIndicator(
                            value: resume.fraction,
                            minHeight: 5,
                            color: AppColorScheme.rangeProgress,
                            backgroundColor: AppColorScheme.rangeTrack,
                          ),
                        ),
                      ),
                      Text(
                        resume.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: _ink(0.72), fontSize: 14),
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _thumb(
    String? url, {
    required double width,
    required double radius,
    double? progress,
    double aspect = 16 / 9,
    int? seerrStatus,
    double badge = 26,
  }) => ClipRRect(
    borderRadius: AppRadius.circular(radius),
    child: SizedBox(
      width: width,
      height: width / aspect,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: _tint(1)),
          if (url != null)
            OfflineAwareImage(
              imageUrl: url,
              fit: BoxFit.cover,
              errorWidget: (_, _, _) => const SizedBox.shrink(),
            ),
          ...switch (SeerrMediaStatus.hasDot(seerrStatus)
              ? seerrBadgeStyle()
              : null) {
            SeerrBadgeStyle.badge => [
              Positioned(
                right: badge / 3,
                top: badge / 3,
                child: SeerrStatusDot(status: seerrStatus, size: badge),
              ),
            ],
            SeerrBadgeStyle.banner => [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SeerrStatusBanner(status: seerrStatus),
              ),
            ],
            null => const <Widget>[],
          },
          if (progress != null)
            Positioned(
              left: 8,
              right: 8,
              bottom: 7,
              child: ClipRRect(
                borderRadius: AppRadius.circular(2),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 3,
                  color: AppColorScheme.rangeProgress,
                  backgroundColor: AppColorScheme.rangeTrack,
                ),
              ),
            ),
        ],
      ),
    ),
  );

  /// A show that's only in Seerr, season by season, each with its poster and
  /// where its request stands. Picking one asks for it.
  List<Widget> _seasonTiles({required bool phone}) {
    final l10n = AppLocalizations.of(context);
    final seasons = _vm.seasons;
    final state = _vm.seerr?.state;
    final status = state?.hd.seasonStatus ?? const <int, int>{};
    final details = {
      for (final season in state?.tv?.seasons ?? const <SeerrSeason>[])
        season.seasonNumber: season,
    };
    return [
      for (final (index, season) in seasons.indexed)
        _seasonTile(
          season,
          details[season.indexNumber],
          index,
          seasons.length,
          status[season.indexNumber],
          l10n,
          phone: phone,
        ),
    ];
  }

  Widget _seasonTile(
    AggregatedItem season,
    SeerrSeason? details,
    int index,
    int count,
    int? status,
    AppLocalizations l10n, {
    required bool phone,
  }) {
    final node = _node(_Tab.seasons, index);
    final keys = _gridKeys(index, count, 1);
    final number = season.indexNumber;
    final episodes = season.childCount;
    final airDate = details?.airDate;
    final year = airDate != null && airDate.length >= 4
        ? airDate.substring(0, 4)
        : null;
    final caps = [
      if (number != null) l10n.seasonNumber(number).toUpperCase(),
      ?year,
    ].join(' · ');
    final poster = details?.posterPath;
    return _FrostFocus(
      focusNode: node,
      onFocusChange: (focused) => _remember(_Tab.seasons, node, focused),
      onSelect: () => _requestSeason(season),
      onLeft: keys.left,
      onRight: keys.right,
      onUp: keys.up,
      onDown: keys.down,
      autoScroll: true,
      builder: (context, focused) => AnimatedContainer(
        duration: _duration,
        height: phone ? null : 120,
        padding: phone
            ? const EdgeInsets.symmetric(vertical: 8)
            : const EdgeInsets.fromLTRB(6, 6, 26, 6),
        decoration: BoxDecoration(
          color: focused ? _platter : Colors.transparent,
          borderRadius: AppRadius.circular(28),
        ),
        child: Row(
          children: [
            AnimatedScale(
              scale: focused ? 1.05 : 1,
              duration: _duration,
              child: _thumb(
                poster == null ? null : '$seerrPosterBase$poster',
                width: phone ? 56 : 72,
                radius: phone ? 12 : 16,
                aspect: 2 / 3,
              ),
            ),
            SizedBox(width: phone ? 14 : 22),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (caps.isNotEmpty)
                    Text(
                      caps,
                      style: TextStyle(
                        color: _muted,
                        fontSize: phone ? 11 : 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                      ),
                    ),
                  Text(
                    season.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _ink(),
                      fontSize: phone ? 16 : 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (episodes != null && episodes > 0)
                    Text(
                      l10n.episodeCount(episodes),
                      style: TextStyle(
                        color: _muted,
                        fontSize: phone ? 13 : 15,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              height: phone ? 28 : 34,
              padding: EdgeInsets.symmetric(horizontal: phone ? 12 : 16),
              decoration: BoxDecoration(
                color: _ink(0.08),
                borderRadius: AppRadius.circular(phone ? 14 : 17),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: phone ? 7 : 9,
                children: [
                  Container(
                    width: phone ? 8 : 10,
                    height: phone ? 8 : 10,
                    decoration: BoxDecoration(
                      color: seerrStatusColor(status),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    seerrMediaStatusLabel(status, l10n),
                    style: TextStyle(
                      color: _ink(),
                      fontSize: phone ? 13 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _castGrid({required int columns, required bool phone}) {
    final people = _vm.actors;
    return _grid(
      columns: columns,
      gap: phone ? 8 : 0,
      runGap: phone ? 18 : 8,
      children: [
        for (final (index, person) in people.indexed)
          _castTile(person, index, people.length, columns, phone: phone),
      ],
    );
  }

  Widget _castTile(
    Map<String, dynamic> person,
    int index,
    int count,
    int columns, {
    required bool phone,
  }) {
    final node = _node(_Tab.cast, index);
    final keys = _gridKeys(index, count, columns);
    final url = _imageFor(person);
    final role = person['Role'] as String?;
    final avatar = phone ? 88.0 : 116.0;
    return _FrostFocus(
      focusNode: node,
      onFocusChange: (focused) => _remember(_Tab.cast, node, focused),
      onSelect: () => _openPerson(person),
      onLeft: keys.left,
      onRight: keys.right,
      onUp: keys.up,
      onDown: keys.down,
      autoScroll: true,
      builder: (context, focused) => AnimatedContainer(
        duration: _duration,
        height: phone ? null : 204,
        padding: EdgeInsets.fromLTRB(8, phone ? 0 : 14, 8, 0),
        decoration: BoxDecoration(
          color: focused ? _platter : Colors.transparent,
          borderRadius: AppRadius.circular(30),
        ),
        child: Column(
          children: [
            AnimatedScale(
              scale: focused ? 1.06 : 1,
              duration: _duration,
              child: ClipOval(
                child: SizedBox(
                  width: avatar,
                  height: avatar,
                  child: url == null
                      ? ColoredBox(
                          color: _tint(1),
                          child: Icon(Icons.person, color: _muted, size: 40),
                        )
                      : OfflineAwareImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          alignment: const Alignment(0, -0.6),
                          errorWidget: (_, _, _) => ColoredBox(color: _tint(1)),
                        ),
                ),
              ),
            ),
            SizedBox(height: phone ? 8 : 12),
            Text(
              person['Name'] as String? ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: _ink(),
                fontSize: phone ? 14 : 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (role != null && role.isNotEmpty)
              Text(
                role,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: _muted, fontSize: phone ? 12 : 15),
              ),
          ],
        ),
      ),
    );
  }

  Widget _extrasGrid({required int columns, required bool phone}) {
    final extras = _vm.features;
    return _grid(
      columns: columns,
      gap: 10,
      runGap: phone ? 8 : 10,
      children: [
        for (final (index, extra) in extras.indexed)
          _extraTile(extra, index, extras.length, columns, phone: phone),
      ],
    );
  }

  Widget _extraTile(
    AggregatedItem extra,
    int index,
    int count,
    int columns, {
    required bool phone,
  }) {
    final node = _node(_Tab.extras, index);
    final keys = _gridKeys(index, count, columns);
    final url = extra.primaryImageTag == null
        ? null
        : _vm.imageApi.getPrimaryImageUrl(
            extra.id,
            maxHeight: 360,
            tag: extra.primaryImageTag,
          );
    return _FrostFocus(
      focusNode: node,
      onFocusChange: (focused) => _remember(_Tab.extras, node, focused),
      onSelect: () =>
          context.push(Destinations.item(extra.id, serverId: extra.serverId)),
      onLeft: keys.left,
      onRight: keys.right,
      onUp: keys.up,
      onDown: keys.down,
      autoScroll: true,
      builder: (context, focused) => AnimatedContainer(
        duration: _duration,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
        decoration: BoxDecoration(
          color: focused ? _platter : Colors.transparent,
          borderRadius: AppRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedScale(
              scale: focused ? 1.04 : 1,
              duration: _duration,
              child: LayoutBuilder(
                builder: (context, constraints) => _thumb(
                  url,
                  width: constraints.maxWidth,
                  radius: phone ? 18 : 20,
                ),
              ),
            ),
            SizedBox(height: phone ? 12 : 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                extra.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: _ink(),
                  fontSize: phone ? 15 : 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _posterGrid(
    List<_Poster> posters, {
    required int columns,
    required double gap,
    required bool phone,
    VoidCallback? upFromTop,
  }) => _grid(
    columns: columns,
    gap: gap,
    runGap: gap,
    children: [
      for (final (index, poster) in posters.indexed)
        _posterTile(
          poster,
          index,
          posters.length,
          columns,
          phone: phone,
          upFromTop: upFromTop,
        ),
    ],
  );

  Widget _posterTile(
    _Poster poster,
    int index,
    int count,
    int columns, {
    required bool phone,
    VoidCallback? upFromTop,
    String prefix = '',
  }) {
    final node = _node(_tab, '$prefix$index');
    final keys = _gridKeys(index, count, columns, upFromTop: upFromTop);
    final l10n = AppLocalizations.of(context);
    final status = poster.seerrStatus;
    return _FrostFocus(
      focusNode: node,
      onFocusChange: (focused) => _remember(_tab, node, focused),
      onSelect: poster.open,
      onLeft: keys.left,
      onRight: keys.right,
      onUp: keys.up,
      onDown: keys.down,
      autoScroll: true,
      builder: (context, focused) => AnimatedContainer(
        duration: _duration,
        padding: phone
            ? EdgeInsets.zero
            : const EdgeInsets.fromLTRB(8, 8, 8, 12),
        decoration: BoxDecoration(
          color: focused ? _platter : Colors.transparent,
          borderRadius: AppRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedScale(
              scale: focused ? 1.05 : 1,
              duration: _duration,
              child: LayoutBuilder(
                builder: (context, constraints) => _thumb(
                  poster.imageUrl,
                  width: constraints.maxWidth,
                  radius: phone ? 12 : 16,
                  aspect: 2 / 3,
                  seerrStatus: status,
                  badge: phone ? 22 : 26,
                ),
              ),
            ),
            SizedBox(height: phone ? 6 : 10),
            Text(
              poster.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: _ink(0.9),
                fontSize: phone ? 13 : 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (status != null)
              Text(
                seerrMediaStatusLabel(status, l10n),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: seerrStatusColor(status),
                  fontSize: phone ? 12 : 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Grouped label and value rows. On a TV the whole of it is one stop, so
  /// there's somewhere to land and Back and the toolbar are a press away, and
  /// Up and Down scroll it while there's more to see.
  Widget _details(
    List<_InfoGroup> groups, {
    required bool phone,
    VoidCallback? upFromTop,
  }) {
    Widget group(_InfoGroup info, bool focused) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (info.$1 case final heading?) _heading(heading, phone: phone),
        AnimatedContainer(
          duration: _duration,
          decoration: BoxDecoration(
            color: focused ? _lit(0.12) : _ink(phone ? 0.07 : 0.06),
            borderRadius: AppRadius.circular(phone ? 20 : 22),
          ),
          child: Column(
            children: [
              for (final (index, row) in info.$2.indexed)
                Container(
                  margin: EdgeInsets.only(left: phone ? 16 : 18),
                  padding: EdgeInsets.fromLTRB(
                    0,
                    phone ? 11 : 9,
                    phone ? 16 : 18,
                    phone ? 11 : 9,
                  ),
                  decoration: BoxDecoration(
                    border: index == info.$2.length - 1
                        ? null
                        : Border(bottom: BorderSide(color: _ink(0.08))),
                  ),
                  child: Row(
                    children: [
                      if (row.logoPath != null) ...[
                        _logo(row.logoPath, size: phone ? 28 : 30),
                        SizedBox(width: phone ? 12 : 16),
                      ],
                      Text(
                        row.label,
                        style: TextStyle(
                          color: _muted,
                          fontSize: phone ? 15 : 16,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          row.value,
                          textAlign: TextAlign.right,
                          maxLines: phone ? 3 : 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: _ink(0.92),
                            fontSize: phone ? 15 : 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );

    if (phone) {
      return Column(
        spacing: 20,
        children: [for (final g in groups) group(g, false)],
      );
    }
    final split = groups.length > 1 ? 1 : groups.length;
    return _FrostFocus(
      focusNode: _node(_tab, 0),
      onLeft: _toSidebar,
      onRight: () {},
      onUp: () {
        if (!_scrollDetails(-160)) (upFromTop ?? _toNavbar)();
      },
      onDown: () {
        if (!_scrollDetails(160)) _toActions();
      },
      builder: (context, focused) => SingleChildScrollView(
        controller: _detailsScroll,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 28,
          children: [
            Expanded(
              child: Column(
                spacing: 16,
                children: [
                  for (final g in groups.take(split)) group(g, focused),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: 16,
                children: [
                  for (final g in groups.skip(split)) group(g, focused),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _phone(
    AggregatedItem item,
    DetailSectionVisibility sections,
    List<_Tab> tabs,
    AppLocalizations l10n,
  ) {
    final size = MediaQuery.sizeOf(context);
    final bottom = bottomContentInset(context);

    final sheet = DraggableScrollableSheet(
      controller: _sheet,
      initialChildSize: 0.58,
      minChildSize: 0.58,
      maxChildSize: 0.88,
      snap: true,
      snapSizes: const [0.58, 0.88],
      builder: (context, scroll) => _glass(
        radius: 38,
        color: _tint(0.6),
        shadow: true,
        child: ListView(
          controller: scroll,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 140 + bottom),
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _sheet.animateTo(
                _sheet.size < 0.7 ? 0.88 : 0.58,
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOut,
              ),
              child: SizedBox(
                height: 22,
                child: Center(
                  child: Container(
                    width: 36,
                    height: 5,
                    decoration: BoxDecoration(
                      color: _ink(0.32),
                      borderRadius: AppRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.name,
              style: TextStyle(
                color: _ink(),
                fontSize: 30,
                height: 1.13,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 4),
            DetailMetadataRow(
              item: item,
              selectedMediaSource: selectedMediaSourceForItem(
                item,
                widget.selectedMediaSourceId,
              ),
              upcomingEpisode: _vm.upcomingEpisode,
              seerrStatus: _vm.isSeerrOnly ? null : seerrItemStatus(_vm),
            ),
            const SizedBox(height: 14),
            _phoneTabs(tabs, l10n),
            const SizedBox(height: 16),
            _phoneTab(item, sections, l10n),
          ],
        ),
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        _environment(item),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: size.height * 0.62,
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (rect) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white, Colors.transparent],
              stops: [0, 0.62, 1],
            ).createShader(rect),
            child: _art(item, alignment: Alignment.topCenter),
          ),
        ),
        sheet,
        Positioned(
          left: 12,
          right: 12,
          bottom: 12 + bottom,
          child: _glass(
            radius: 30,
            color: _tint(0.55),
            shadow: true,
            padding: const EdgeInsets.all(6),
            child: _actions(phone: true),
          ),
        ),
      ],
    );
  }

  Widget _phoneTabs(List<_Tab> tabs, AppLocalizations l10n) => Container(
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: _ink(0.08),
      borderRadius: AppRadius.circular(19),
    ),
    child: Row(
      spacing: 2,
      children: [
        for (final tab in tabs)
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => _tab = tab),
              child: AnimatedContainer(
                duration: _duration,
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tab == _tab ? _ink(0.2) : Colors.transparent,
                  borderRadius: AppRadius.circular(16),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _tabLabel(tab, l10n, short: true),
                    style: TextStyle(
                      color: _ink(tab == _tab ? 1 : 0.7),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );

  Widget _phoneTab(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    switch (_tab) {
      case _Tab.overview:
        return _phoneOverview(item, sections, l10n);
      case _Tab.episodes:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_seasonPicker(phone: true), ..._episodeTiles(phone: true)],
        );
      case _Tab.seasons:
        return Column(spacing: 8, children: _seasonTiles(phone: true));
      case _Tab.cast:
        return _castGrid(columns: 3, phone: true);
      case _Tab.extras:
        return _extrasGrid(columns: 1, phone: true);
      case _Tab.related:
      case _Tab.seerr:
        return _phoneRelated(sections, l10n);
      case _Tab.details:
        return _details([
          ..._info(item, sections, l10n),
          ..._seerrInfo(_pieces(sections), l10n),
        ], phone: true);
    }
  }

  /// The library's own matches in a grid, then Seerr's lists as rows that
  /// scroll across.
  Widget _phoneRelated(
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final library = _libraryPosters(sections);
    final pieces = _pieces(sections);
    final rows = [
      if (pieces.recommendations)
        (_Seg.recommended, _seerrPosters(_Seg.recommended)),
      if (pieces.similar) (_Seg.similar, _seerrPosters(_Seg.similar)),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (library.isNotEmpty) ...[
          if (rows.isNotEmpty) _heading(l10n.moreLikeThis, phone: true),
          _posterGrid(library, columns: 3, gap: 10, phone: true),
          const SizedBox(height: 22),
        ],
        for (final (seg, posters) in rows) ...[
          _heading('$_seerrLabel · ${_segLabel(seg, l10n)}', phone: true),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                for (final (index, poster) in posters.indexed)
                  SizedBox(
                    width: 108,
                    child: _posterTile(
                      poster,
                      index,
                      posters.length,
                      posters.length,
                      phone: true,
                      prefix: '${seg.name}-',
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 22),
        ],
      ],
    );
  }

  Widget _phoneOverview(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
  ) {
    final status = _status(item, l10n);
    final ratings = RatingsRow.forDetailScreen(
      item: item,
      extraRatings: _vm.ratings,
      prefs: widget.prefs,
      columns: true,
    );
    final overview = overviewText(item);
    final credits = _credits(sections, l10n);
    final choices = _trackChoices(l10n);
    final watch = _whereToWatch(sections, l10n, phone: true);
    const tints = [Color(0xFF0A84FF), Color(0xFFFF9F0A), Color(0xFF5E5CE6)];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ?status,
        if (ratings != null) ...[
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: _ink(0.16), width: 0.5),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ratings,
            ),
          ),
        ],
        if (overview != null) ...[
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () => setState(() => _overviewOpen = !_overviewOpen),
            child: Text(
              overview,
              maxLines: _overviewOpen ? null : 3,
              overflow: _overviewOpen ? null : TextOverflow.ellipsis,
              style: TextStyle(color: _ink(0.88), fontSize: 16, height: 1.38),
            ),
          ),
        ],
        if (credits.isNotEmpty) ...[
          const SizedBox(height: 10),
          for (final credit in credits) _creditLine([credit], fontSize: 14),
        ],
        if (choices.isNotEmpty) ...[
          const SizedBox(height: 22),
          _heading(l10n.playback, phone: true),
          Container(
            decoration: BoxDecoration(
              color: _ink(0.07),
              borderRadius: AppRadius.circular(20),
            ),
            child: Column(
              children: [
                for (final (index, choice) in choices.indexed)
                  InkWell(
                    onTap: () =>
                        actionsKey.currentState?.openTrackPicker(choice.kind),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: tints[index % tints.length],
                              borderRadius: AppRadius.circular(8),
                            ),
                            child: Icon(
                              choice.kind.icon,
                              color: _ink(),
                              size: 17,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              height: 48,
                              padding: const EdgeInsets.only(right: 14),
                              decoration: BoxDecoration(
                                border: index == choices.length - 1
                                    ? null
                                    : Border(
                                        bottom: BorderSide(
                                          color: _ink(0.12),
                                          width: 0.5,
                                        ),
                                      ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    choice.kind.label(l10n),
                                    style: TextStyle(
                                      color: _ink(),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      choice.current,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: _muted,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Icon(
                                    Icons.unfold_more,
                                    color: _ink(0.45),
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
        if (watch != null) ...[const SizedBox(height: 22), watch],
      ],
    );
  }
}

/// A focus stop that draws its own focus through [builder], since Frost
/// shows focus as a lighter platter rather than a ring. Each arrow callback
/// takes the press when it's set, and a press with none set moves focus the
/// usual way.
class _FrostFocus extends StatefulWidget {
  final FocusNode? focusNode;
  final VoidCallback? onSelect;
  final ValueChanged<bool>? onFocusChange;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;
  final VoidCallback? onUp;
  final VoidCallback? onDown;
  final bool autoScroll;
  final Widget Function(BuildContext context, bool focused) builder;

  const _FrostFocus({
    this.focusNode,
    this.onSelect,
    this.onFocusChange,
    this.onLeft,
    this.onRight,
    this.onUp,
    this.onDown,
    this.autoScroll = false,
    required this.builder,
  });

  @override
  State<_FrostFocus> createState() => _FrostFocusState();
}

class _FrostFocusState extends State<_FrostFocus> {
  bool _focused = false;
  bool _hovered = false;

  void _onFocusChange(bool focused) {
    setState(() => _focused = focused);
    widget.onFocusChange?.call(focused);
    if (focused && widget.autoScroll) {
      Scrollable.ensureVisible(
        context,
        alignment: 0.2,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    }
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (isActivateKey(event)) {
      widget.onSelect?.call();
      return widget.onSelect == null
          ? KeyEventResult.ignored
          : KeyEventResult.handled;
    }
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final action = switch (event.logicalKey) {
      LogicalKeyboardKey.arrowLeft => widget.onLeft,
      LogicalKeyboardKey.arrowRight => widget.onRight,
      LogicalKeyboardKey.arrowUp => widget.onUp,
      LogicalKeyboardKey.arrowDown => widget.onDown,
      _ => null,
    };
    if (action == null) return KeyEventResult.ignored;
    action();
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) => Focus(
    focusNode: widget.focusNode,
    onFocusChange: _onFocusChange,
    onKeyEvent: _onKey,
    child: MouseRegion(
      cursor: widget.onSelect == null
          ? MouseCursor.defer
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onSelect,
        child: widget.builder(context, _focused || _hovered),
      ),
    ),
  );
}
