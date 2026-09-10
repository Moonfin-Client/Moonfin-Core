import 'dart:async' show unawaited;
import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/repositories/seerr_repository.dart';
import '../../../../data/repositories/tmdb_repository.dart';
import '../../../../data/services/plugin_sync_service.dart';
import '../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/preference_constants.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/overview_text.dart';
import '../../../../util/platform_detection.dart';
import '../../../navigation/destinations.dart';
import '../../../navigation/playback_launcher.dart';
import '../../../widgets/logo_view.dart';
import '../../../widgets/navigation_layout.dart';
import '../../../widgets/offline_aware_image.dart';
import '../../../widgets/quick_return_wrapper.dart';
import '../../../widgets/rating_display.dart';
import '../../../widgets/seerr/seerr_collection_banner.dart';
import '../../../widgets/seerr/seerr_image_urls.dart';
import '../../../widgets/seerr/seerr_item_chips.dart';
import '../../../widgets/seerr/seerr_item_status.dart';
import '../../../widgets/seerr/seerr_stats_card.dart';
import '../../../widgets/seerr/seerr_status_pill.dart';
import '../../../widgets/top_toolbar.dart';
import '../item_detail_screen.dart'
    show
        DetailActionButtons,
        ExpandableBiography,
        PersonDates,
        selectedMediaSourceForItem,
        technicalDetailsFor;
import 'spotlight_cards.dart';
import 'spotlight_images.dart';
import 'spotlight_landscape_layout.dart';
import 'spotlight_portrait_layout.dart';
import 'widgets/spotlight_section_modal.dart';
import 'widgets/spotlight_summary_card.dart';

/// "Spotlight" detail-screen style: a hero-first layout with Play plus at most
/// three action buttons (the rest behind an ellipsis menu, ordered by the
/// shared detail button layout) and summary cards that open sectioned grid
/// modals.
///
/// Takes the same constructor contract as the other detail content widgets so
/// the style switch swaps it in as a drop-in, and reuses the public action and
/// content widgets so playback and data logic stay shared.
class SpotlightDetailContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final ValueListenable<String?> backdropUrl;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final FocusNode? initialFocusNode;
  final bool autoPlay;
  final void Function(Duration position)? onPlayFromChapter;
  final ValueChanged<bool>? onToggleNavbar;
  final bool actionsExpanded;
  final ValueChanged<bool> onActionsExpandedChanged;
  final ValueChanged<AggregatedItem>? onBackdropItemFocused;
  final VoidCallback? onCollapseBiography;

  const SpotlightDetailContent({
    super.key,
    required this.viewModel,
    required this.prefs,
    required this.backdropUrl,
    this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    this.onBackdropItemFocused,
    this.initialFocusNode,
    this.autoPlay = false,
    this.onPlayFromChapter,
    this.onToggleNavbar,
    required this.actionsExpanded,
    required this.onActionsExpandedChanged,
    this.onCollapseBiography,
  });

  @override
  State<SpotlightDetailContent> createState() => _SpotlightDetailContentState();
}

class _SpotlightDetailContentState extends State<SpotlightDetailContent> {
  bool _landscape = true;
  bool _modalOpen = false;
  final _scrollController = ScrollController();
  final _overviewFocusNode = FocusNode(debugLabel: 'SpotlightOverview');
  final _cardFocusNodes = <String, FocusNode>{};
  final _trackFocusNodes = <String, FocusNode>{};

  // Studios for the people modal. Logos always come from TMDB via the Moonfin
  // plugin's server-side cache. The Jellyfin studio list is only a name
  // fallback.
  List<StudioCompany> _tmdbStudios = const [];
  String? _tmdbStudiosItemId;

  // A person's Seerr combined credits, for the filmography modal.
  List<SeerrDiscoverItem> _seerrAppearances = const [];
  List<SeerrDiscoverItem> _seerrCrewCredits = const [];
  String? _seerrLoadedForItemId;

  ItemDetailViewModel get _vm => widget.viewModel;

  double get _desktopScale =>
      widget.prefs.get(UserPreferences.desktopUiScale).scaleFactor;

  @override
  void initState() {
    super.initState();
    _vm.addListener(_onViewModelChanged);
    if (PlatformDetection.isTV) {
      // The top toolbar's Down press needs a target from the first frame,
      // not only after a pushed child page pops back.
      NavigationLayout.focusDetailsPlayButtonNotifier.value =
          widget.initialFocusNode;
    }
    unawaited(_loadStudioLogos());
    unawaited(_loadSeerrAppearances());
  }

  @override
  void didUpdateWidget(SpotlightDetailContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewModel != oldWidget.viewModel) {
      oldWidget.viewModel.removeListener(_onViewModelChanged);
      _vm.addListener(_onViewModelChanged);
    }
    if (widget.initialFocusNode != oldWidget.initialFocusNode &&
        PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.initialFocusNode?.requestFocus();
      });
      NavigationLayout.focusDetailsPlayButtonNotifier.value =
          widget.initialFocusNode;
    }
  }

  /// The lazy loads key off the item, so they re-run as the view model swaps
  /// or fills it in. Rebuilds come from the ListenableBuilder in build.
  void _onViewModelChanged() {
    if (!mounted) return;
    unawaited(_loadStudioLogos());
    unawaited(_loadSeerrAppearances());
  }

  @override
  void dispose() {
    if (NavigationLayout.focusDetailsPlayButtonNotifier.value ==
        widget.initialFocusNode) {
      NavigationLayout.focusDetailsPlayButtonNotifier.value = null;
    }
    _vm.removeListener(_onViewModelChanged);
    _scrollController.dispose();
    _overviewFocusNode.dispose();
    for (final node in _cardFocusNodes.values) {
      node.dispose();
    }
    for (final node in _trackFocusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> _loadStudioLogos() async {
    final item = _vm.item;
    if (item == null || _tmdbStudiosItemId == item.id) return;
    _tmdbStudiosItemId = item.id;

    final tmdbId = item.tmdbId;
    final pluginAvailable = GetIt.instance<PluginSyncService>().pluginAvailable;
    if (tmdbId == null || !pluginAvailable) {
      if (_tmdbStudios.isNotEmpty && mounted) {
        setState(() => _tmdbStudios = const []);
      }
      return;
    }

    final companies = await GetIt.instance<TmdbRepository>()
        .getProductionCompanies(
          tmdbId: tmdbId,
          type: item.type == 'Series' ? 'tv' : 'movie',
        );
    if (!mounted || companies == null) return;
    setState(() => _tmdbStudios = companies);
  }

  Future<void> _loadSeerrAppearances() async {
    final item = _vm.item;
    if (item == null || item.type != 'Person') return;
    final tmdbId = item.tmdbId;
    if (tmdbId == null || tmdbId.isEmpty) return;
    if (!GetIt.instance<PluginSyncService>().seerrAvailable) return;
    // Run once per person. The view model notifies many times as data streams
    // in and each call would otherwise re-issue the same combined-credits
    // fetch.
    if (_seerrLoadedForItemId == item.id) return;
    _seerrLoadedForItemId = item.id;

    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      await repo.ensureInitialized();
      final personId = int.tryParse(tmdbId);
      if (personId == null) return;
      final credits = await repo.getPersonCombinedCredits(personId);
      const excludedJobs = {'thanks', 'special thanks'};
      final castWithPosters =
          credits.cast.where((i) => i.posterPath != null).toList()
            ..sort((a, b) => a.displayTitle.compareTo(b.displayTitle));
      final crewWithPosters =
          credits.crew
              .where(
                (i) =>
                    i.posterPath != null &&
                    !excludedJobs.contains(i.job?.toLowerCase()),
              )
              .toList()
            ..sort((a, b) => a.displayTitle.compareTo(b.displayTitle));
      if (mounted) {
        setState(() {
          _seerrAppearances = castWithPosters;
          _seerrCrewCredits = crewWithPosters;
        });
      }
    } catch (_) {
      // Seerr credits are an extra. The filmography card falls back to the
      // library lists when the lookup fails.
    }
  }

  // ---------------------------------------------------------------------------
  // Modal plumbing

  /// Closes the open section modal (if any), then runs [action] on the next
  /// frame. Modal content never navigates or starts playback over the dialog
  /// route, so the back stack stays predictable.
  void _closeModalThen(VoidCallback action) {
    if (_modalOpen) {
      Navigator.of(context, rootNavigator: true).pop();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) action();
    });
  }

  SpotlightCardActions _cardActions(AggregatedItem item) {
    return SpotlightCardActions(
      openItem: (entry) => _closeModalThen(() {
        if (entry.serverId == 'seerr') {
          final mediaType =
              entry.seerrMediaType ?? (entry.type == 'Series' ? 'tv' : 'movie');
          context.push(Destinations.seerrMedia(entry.id, mediaType: mediaType));
        } else {
          context.push(Destinations.item(entry.id, serverId: entry.serverId));
        }
      }),
      openPerson: (personId) => _closeModalThen(() {
        context.push(
          item.serverId == 'seerr'
              ? Destinations.seerrPerson(personId)
              : Destinations.item(personId, serverId: item.serverId),
        );
      }),
      openSeerrItem: (entry) => _closeModalThen(() {
        context.push(
          Destinations.seerrMedia(
            entry.id.toString(),
            mediaType: entry.mediaType ?? 'movie',
          ),
        );
      }),
      openStudio: (name) =>
          _closeModalThen(() => context.push(Destinations.studio(name))),
      playFromChapter: (position) =>
          _closeModalThen(() => widget.onPlayFromChapter?.call(position)),
      playExtra: (extra) => _closeModalThen(() => _playItems([extra], 0)),
      playTrack: (index) => _closeModalThen(() => _playItems(_vm.tracks, index)),
      playPlaylistTrack: (index) =>
          _closeModalThen(() => _playItems(_vm.playlistItems, index)),
      trackFocusNode: (id) =>
          _trackFocusNodes.putIfAbsent(id, () => FocusNode()),
    );
  }

  bool _isAudioItem(AggregatedItem item) {
    final mediaType = item.rawData['MediaType'] as String?;
    return item.type == 'Audio' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
  }

  Future<void> _playItems(List<AggregatedItem> items, int index) async {
    if (items.isEmpty) return;
    final manager = GetIt.instance<PlaybackManager>();
    final isAudio = items.every(_isAudioItem);
    await launchPlayerWhilePreparing(
      context,
      manager: manager,
      destination: isAudio
          ? Destinations.audioPlayer
          : Destinations.videoPlayer,
      startPlayback: (launchSession) async {
        await runPlaybackStart(
          launchSession,
          () => manager.playItems(items, startIndex: index),
        );
        return true;
      },
    );
  }

  Future<void> _openCard(SpotlightCardSpec spec) async {
    if (_modalOpen) return;
    _modalOpen = true;
    widget.onToggleNavbar?.call(false);
    try {
      await SpotlightSectionModal.show(
        context,
        title: spec.title,
        icon: spec.icon,
        sections: spec.sections,
        returnFocus: _cardFocusNodes[spec.id],
        // The view model fires the Seerr lookup without awaiting it, so that a
        // slow Seerr server never holds up library content. A card opened
        // before that lands would otherwise keep the sections it was built
        // with and never gain its Seerr rows, which is most visible on the
        // similar card. Re-derive the card while the modal is open instead.
        refreshOn: _vm,
        refresh: () => _liveCardContent(spec),
      );
    } finally {
      _modalOpen = false;
    }
  }

  /// The current state of the open card, falling back to what it was opened
  /// with when the item is gone or the card no longer applies.
  SpotlightModalContent _liveCardContent(SpotlightCardSpec opened) {
    final fallback = (
      title: opened.title,
      icon: opened.icon,
      sections: opened.sections,
    );
    final item = _vm.item;
    if (!mounted || item == null) return fallback;
    for (final card in _currentCards(context, item)) {
      if (card.id == opened.id) {
        return (
          title: card.title,
          icon: card.icon,
          sections: card.sections,
        );
      }
    }
    return fallback;
  }

  // ---------------------------------------------------------------------------
  // Backdrop

  /// Full-bleed cinematic backdrop. Layered scrims keep the hero text
  /// readable, and the background blur preference is consumed as a darkening
  /// opacity.
  Widget _buildBackdrop(bool landscape, String? backdropUrl) {
    final base = AppColorScheme.background;
    final item = _vm.item;
    final url =
        backdropUrl ??
        (item?.type == 'Person' ? _personProfileUrl(item!) : null);
    final blurAmount = widget.prefs
        .get(UserPreferences.detailsBackgroundBlurAmount)
        .toDouble();
    final opacityFactor = blurAmount / 25.0;
    final maxAlpha = item?.type == 'Person' ? 0.40 : 0.80;
    final alpha = opacityFactor * maxAlpha;
    final gradientScale = 0.3 + 0.7 * opacityFactor;

    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: base),
        if (url != null && url.isNotEmpty) ...[
          OfflineAwareImage(
            imageUrl: url,
            fit: BoxFit.cover,
            alignment: landscape ? Alignment.centerRight : Alignment.topCenter,
            fadeInDuration: const Duration(milliseconds: 250),
            errorWidget: (context, url, error) => const SizedBox.shrink(),
          ),
          if (item?.type == 'Person')
            Positioned.fill(
              child: GlassSettings.blursBackdrop
                  ? BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: GlassSettings.capSigma(12),
                        sigmaY: GlassSettings.capSigma(12),
                      ),
                      child: Container(
                        color: Colors.black.withValues(alpha: 0.2),
                      ),
                    )
                  : Container(color: Colors.black.withValues(alpha: 0.35)),
            ),
          ColoredBox(color: Colors.black.withValues(alpha: alpha)),
        ],
        if (landscape) ...[
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  base.withValues(alpha: gradientScale),
                  base.withValues(alpha: 0.90 * gradientScale),
                  base.withValues(alpha: 0.45 * gradientScale),
                  base.withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.35, 0.60, 0.85],
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  base.withValues(alpha: gradientScale),
                  base.withValues(alpha: 0.80 * gradientScale),
                  base.withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.45, 0.80],
              ),
            ),
          ),
          // Modern's radial vignette, so the edges fall off the same way.
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.05,
                colors: [
                  base.withValues(alpha: 0.0),
                  base.withValues(alpha: 0.0),
                  base.withValues(alpha: 0.32 * gradientScale),
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),
        ] else
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  base.withValues(alpha: 0.15 * gradientScale),
                  base.withValues(alpha: 0.45 * gradientScale),
                  base.withValues(alpha: 0.85 * gradientScale),
                ],
                stops: const [0.0, 0.55, 1.0],
              ),
            ),
          ),
      ],
    );
  }

  String? _personProfileUrl(AggregatedItem item) => spotlightPersonImageUrl(
    _vm.imageApi,
    id: item.id,
    tag: item.primaryImageTag,
    profilePath: item.rawData['ProfilePath'] as String?,
    maxHeight: 720,
    tmdbProfileBase: seerrProfileLargeBase,
  );

  // ---------------------------------------------------------------------------
  // Hero pieces

  Color get _titleColor => ThemeRegistry.active.id == ThemeRegistry.neonPulseId
      ? AppColorScheme.accent
      : Colors.white;

  Widget? _buildTagline(BuildContext context, AggregatedItem item) {
    final tagline = item.tagline?.trim();
    if (tagline == null || tagline.isEmpty) return null;
    return Text(
      tagline.toUpperCase(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppColorScheme.accent,
        fontWeight: FontWeight.w700,
        letterSpacing: 3.0,
      ),
    );
  }

  Widget _buildTitleOrLogo(BuildContext context, AggregatedItem item) {
    final textTheme = Theme.of(context).textTheme;
    final logoScaleFactor = _desktopScale > 1.1 ? 0.70 : 1.0;
    final isEpisode = item.type == 'Episode';
    final logoTag =
        item.logoImageTag ?? (isEpisode ? item.seriesLogoImageTag : null);
    final logoId = logoTag != null
        ? (item.logoImageTag != null ? item.id : item.seriesId)
        : null;

    final titleText = Text(
      item.name,
      style: (_landscape ? textTheme.displaySmall : textTheme.headlineMedium)
          ?.copyWith(fontWeight: FontWeight.w700, color: _titleColor),
    );

    if (isEpisode) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (logoTag != null && logoId != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: LogoView(
                imageUrl: _vm.imageApi.getLogoImageUrl(
                  logoId,
                  maxWidth: 350,
                  tag: logoTag,
                ),
                maxHeight: (_landscape ? 90 : 64) * logoScaleFactor,
                maxWidth: (_landscape ? 360 : 260) * logoScaleFactor,
              ),
            )
          else if (item.seriesName != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                item.seriesName!,
                style: textTheme.labelLarge?.copyWith(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                  letterSpacing: 1.2,
                ),
              ),
            ),
          titleText,
        ],
      );
    }

    if (logoTag != null && logoId != null) {
      return LogoView(
        imageUrl: _vm.imageApi.getLogoImageUrl(
          logoId,
          maxWidth: 350,
          tag: logoTag,
        ),
        maxHeight: (_landscape ? 90 : 64) * logoScaleFactor,
        maxWidth: (_landscape ? 360 : 260) * logoScaleFactor,
      );
    }
    return titleText;
  }

  Widget _metadataRow(
    BuildContext context,
    AggregatedItem item,
    Map<String, dynamic>? selectedMediaSource,
  ) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onBackground.withValues(alpha: 0.75);
    final style = textTheme.bodyMedium?.copyWith(color: muted);

    final pieces = <Widget>[];
    void addText(String? value) {
      if (value == null || value.isEmpty) return;
      pieces.add(Text(value, style: style));
    }

    addText(item.productionYear?.toString());
    addText(item.officialRating);
    if (item.type == 'Series' && item.childCount != null) {
      addText(l10n.seasonCount(item.childCount!));
    }
    if (item.type == 'Season') {
      final epCount = _vm.episodes.isNotEmpty
          ? _vm.episodes.length
          : (item.childCount ?? 0);
      if (epCount > 0) addText(l10n.episodeCount(epCount));
    }
    if (item.type == 'Episode') {
      final s = item.parentIndexNumber;
      final e = item.indexNumber;
      if (s != null && e != null) addText('S$s:E$e');
    }
    final status = item.status;
    if (item.type == 'Series' && status != null && status.isNotEmpty) {
      final isEnded = status.toLowerCase() == 'ended';
      pieces.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: isEnded ? const Color(0xFFB71C1C) : const Color(0xFF2E7D32),
            borderRadius: JellyfinTokens.shapes.smallRadius,
          ),
          child: Text(
            status,
            style: textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
    final runtime = item.runtime;
    if (runtime != null && runtime > Duration.zero && item.type != 'Series') {
      pieces.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.schedule, size: 14, color: muted),
            const SizedBox(width: 4),
            Text(spotlightRuntimeLabel(runtime), style: style),
          ],
        ),
      );
    }
    if (item.genres.isNotEmpty) {
      addText(item.genres.take(3).join(' · '));
    }
    // A badge rather than another word in the line, so it sits outside the
    // dot separators.
    final seerrStatus = seerrItemStatus(_vm);
    final seerrPills = seerrStatus == null
        ? null
        : SeerrStatusPills(state: seerrStatus, onlyNoteworthy: true);
    if (pieces.isEmpty) return seerrPills ?? const SizedBox.shrink();

    final separated = <Widget>[];
    for (var i = 0; i < pieces.length; i++) {
      if (i > 0) separated.add(Text('·', style: style));
      separated.add(pieces[i]);
    }
    if (seerrPills != null) separated.add(seerrPills);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 6,
      children: separated,
    );
  }

  Widget _techChip(ThemeData theme, String label) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: isNeon
                ? AppColorScheme.accent.withValues(alpha: 0.7)
                : Colors.white.withValues(alpha: 0.3),
          ),
        ),
        borderRadius: AppRadius.circular(4),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: AppColorScheme.onSurface,
          shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
        ),
      ),
    );
  }

  Widget? _buildTechnicalDetailsRow(
    BuildContext context,
    AggregatedItem item,
    Map<String, dynamic>? selectedMediaSource,
  ) {
    final theme = Theme.of(context);
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.75);
    final style = theme.textTheme.bodyMedium?.copyWith(color: muted);

    final tech = technicalDetailsFor(item, selectedMediaSource);
    final pieces = <Widget>[];
    if (tech.formattedSize != null) {
      pieces.add(
        Text(
          tech.formattedSize!,
          style: style?.copyWith(
            fontWeight: FontWeight.w700,
            shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
          ),
        ),
      );
    }
    pieces.addAll(tech.badges.map((b) => _techChip(theme, b)));
    if (pieces.isEmpty) return null;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 6,
      children: pieces,
    );
  }

  Widget _buildOverview(BuildContext context, String overview) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: _landscape ? 800 : double.infinity,
      ),
      child: ExpandableBiography(
        text: overview,
        toggleFocusNode: _overviewFocusNode,
        onArrowDown: () => widget.initialFocusNode?.requestFocus(),
        onArrowUp: () => NavigationLayout.focusNavbarNotifier.value?.call(),
        onArrowLeft: () {
          final navbarPosition = widget.prefs.get(
            UserPreferences.navbarPosition,
          );
          if (navbarPosition == NavbarPosition.left) {
            NavigationLayout.focusNavbarNotifier.value?.call();
          }
        },
        onCollapse: widget.onCollapseBiography,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          height: 1.45,
          color: AppColorScheme.onBackground.withValues(alpha: 0.85),
        ),
      ),
    );
  }

  Widget _buildPersonHeader(BuildContext context, AggregatedItem item) {
    final textTheme = Theme.of(context).textTheme;
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final focusColor = Color(
      widget.prefs.get(UserPreferences.focusColor).colorValue,
    );
    final profileUrl = _personProfileUrl(item);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isNeon ? AppColorScheme.accent : focusColor,
              width: 3.0,
            ),
          ),
          child: CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.white.withValues(alpha: 0.1),
            backgroundImage: profileUrl != null
                ? offlineAwareImageProvider(profileUrl)
                : null,
            child: profileUrl == null
                ? const Icon(Icons.person, color: Colors.white54, size: 48)
                : null,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.name,
                style: textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: _titleColor,
                ),
              ),
              const SizedBox(height: 8),
              PersonDates(item: item),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Assembly

  Widget _buildHero(
    BuildContext context,
    AggregatedItem item,
    List<SpotlightCardSpec> cards,
  ) {
    final overview = cleanOverview(item.overview?.trim());
    final isPerson = item.type == 'Person';
    final selectedSource = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );
    final showTech =
        !isPerson && widget.prefs.get(UserPreferences.detailShowTechnicalDetails);
    final techRow = showTech
        ? _buildTechnicalDetailsRow(context, item, selectedSource)
        : null;
    final showRatings =
        !isPerson &&
        (_vm.ratings.isNotEmpty ||
            item.communityRating != null ||
            item.criticRating != null);
    final showOverview =
        overview.isNotEmpty &&
        !hidesMediaDescription(
          itemType: item.type,
          hideMediaDescription: widget.prefs.get(
            UserPreferences.hideDetailsMediaDescription,
          ),
        );
    final tagline = isPerson ? null : _buildTagline(context, item);

    // A Seerr-only title's page is otherwise sparse, so its Seerr facts
    // render inline: chips and stats in the hero, the collection banner under
    // the action row. Library titles keep their Seerr data behind the status
    // pills and the similar card.
    final seerrState = _vm.isSeerrOnly ? seerrItemTabState(_vm) : null;
    final l10n = AppLocalizations.of(context);
    final seerrChips = seerrState != null && SeerrItemChips.hasContent(seerrState)
        ? SeerrItemChips(state: seerrState)
        : null;
    final seerrStats =
        seerrState != null && SeerrStatsCard.hasContent(seerrState, l10n)
        ? SeerrStatsCard(state: seerrState)
        : null;
    final seerrCollection = seerrState?.movie?.collection;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (tagline != null) ...[tagline, const SizedBox(height: 8)],
        if (isPerson)
          _buildPersonHeader(context, item)
        else
          _buildTitleOrLogo(context, item),
        const SizedBox(height: 8),
        if (!isPerson) _metadataRow(context, item, selectedSource),
        if (techRow != null) ...[const SizedBox(height: 8), techRow],
        if (showRatings) ...[
          const SizedBox(height: 8),
          RatingsRow(
            ratings: _vm.ratings,
            communityRating: item.communityRating,
            criticRating: item.criticRating,
            personalRating: item.personalRating,
            enableAdditionalRatings: widget.prefs.get(
              UserPreferences.enableAdditionalRatings,
            ),
            enabledRatings: widget.prefs.get(UserPreferences.enabledRatings),
            showLabels: widget.prefs.get(UserPreferences.showRatingLabels),
            showBadges: widget.prefs.get(UserPreferences.showRatingBadges),
          ),
        ],
        if (seerrChips != null) ...[const SizedBox(height: 10), seerrChips],
        if (seerrStats != null) ...[const SizedBox(height: 10), seerrStats],
        if (showOverview) ...[
          const SizedBox(height: 10),
          _buildOverview(context, overview),
        ],
        const SizedBox(height: 16),
        _buildActions(context, item, cards),
        if (seerrCollection != null) ...[
          const SizedBox(height: 16),
          SeerrCollectionBanner(
            collection: seerrCollection,
            onNavigateUp: () => widget.initialFocusNode?.requestFocus(),
          ),
        ],
      ],
    );
  }

  Widget _buildActions(
    BuildContext context,
    AggregatedItem item,
    List<SpotlightCardSpec> cards,
  ) {
    final firstCardNode = cards.isNotEmpty
        ? _cardFocusNodes[cards.first.id]
        : null;
    return DetailActionButtons(
      viewModel: _vm,
      itemId: item.id,
      selectedMediaSourceId: widget.selectedMediaSourceId,
      onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
      tvPlayFocusNode: widget.initialFocusNode,
      upTarget: _overviewFocusNode,
      downTarget: firstCardNode,
      autoPlay: widget.autoPlay,
      modernStyle: true,
      fullWidthPrimary: !_landscape,
      overflowAsMenu: true,
      maxVisibleButtonsOverride: _landscape ? 5 : 4,
      rowMaxWidth: _landscape
          ? SpotlightLandscapeLayout.heroWidthFor(MediaQuery.sizeOf(context))
          : null,
      actionsExpanded: widget.actionsExpanded,
      onActionsExpandedChanged: widget.onActionsExpandedChanged,
    );
  }

  List<SpotlightCardSpec> _currentCards(
    BuildContext context,
    AggregatedItem item,
  ) {
    final cards = spotlightCardsFor(
      vm: _vm,
      item: item,
      prefs: widget.prefs,
      l10n: AppLocalizations.of(context),
      tmdbStudios: _tmdbStudios,
      actions: _cardActions(item),
      seerrAppearances: _seerrAppearances,
      seerrCrewCredits: _seerrCrewCredits,
      fallbackImageUrl: widget.backdropUrl.value,
    );
    for (final card in cards) {
      _cardFocusNodes.putIfAbsent(
        card.id,
        () => FocusNode(debugLabel: 'SpotlightCard:${card.id}'),
      );
    }
    return cards;
  }

  Widget _buildCards(BuildContext context, List<SpotlightCardSpec> cards) {
    if (cards.isEmpty) return const SizedBox.shrink();
    // Taller cards show more of the artwork through the scrim. The landscape
    // band is capped against screen height because TV never scrolls this
    // page, so the row has to fit under the hero whatever the UI scale is.
    final cardHeight = _landscape
        ? math.min(
            200.0 * _desktopScale,
            math.max(120.0, MediaQuery.sizeOf(context).height * 0.28),
          )
        : 150.0;

    Widget cardAt(int i) => SpotlightSummaryCard(
      title: cards[i].title,
      subtitle: cards[i].subtitle,
      imageUrl: cards[i].imageUrl,
      icon: cards[i].icon,
      compact: !_landscape,
      focusNode: _cardFocusNodes[cards[i].id],
      onOpen: () => _openCard(cards[i]),
      onNavigateUp: () => widget.initialFocusNode?.requestFocus(),
    );

    final Widget band;
    if (_landscape) {
      band = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(width: 16),
            Expanded(child: SizedBox(height: cardHeight, child: cardAt(i))),
          ],
        ],
      );
    } else if (cards.length == 1) {
      band = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(height: cardHeight, child: cardAt(0)),
      );
    } else {
      // A portrait phone would squeeze five cards into ~60px each, so the
      // band scrolls sideways at a readable width and bleeds to the screen
      // edges like the home rows.
      band = SizedBox(
        height: cardHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: cards.length,
          separatorBuilder: (_, _) => const SizedBox(width: 12),
          itemBuilder: (_, i) => SizedBox(width: 250, child: cardAt(i)),
        ),
      );
    }

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (focused) {
        if (mounted) widget.onToggleNavbar?.call(!focused);
      },
      child: band,
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;
    if (item == null) return const SizedBox.shrink();

    _landscape =
        PlatformDetection.isTV ||
        PlatformDetection.useDesktopUi ||
        MediaQuery.orientationOf(context) == Orientation.landscape;

    return ListenableBuilder(
      listenable: _vm,
      builder: (context, _) {
        final currentItem = _vm.item;
        if (currentItem == null) return const SizedBox.shrink();

        final cardSpecs = _currentCards(context, currentItem);

        // Isolate hero art and backdrop into their own layers so scrolling
        // content doesn't re-rasterize them. The backdrop repaints only when
        // its URL swaps.
        final hero = RepaintBoundary(
          child: _buildHero(context, currentItem, cardSpecs),
        );
        final cards = _buildCards(context, cardSpecs);
        final backdrop = RepaintBoundary(
          child: ValueListenableBuilder<String?>(
            valueListenable: widget.backdropUrl,
            builder: (context, backdropUrl, _) =>
                _buildBackdrop(_landscape, backdropUrl),
          ),
        );
        final topInset = TopToolbar.baseHeightFor(context);

        final layout = _landscape
            ? SpotlightLandscapeLayout(
                backdrop: backdrop,
                hero: hero,
                cards: cards,
                topInset: topInset,
                scrollController: _scrollController,
              )
            : SpotlightPortraitLayout(
                backdrop: backdrop,
                hero: hero,
                cards: cards,
                topInset: topInset,
                scrollController: _scrollController,
              );

        return QuickReturnWrapper(
          scrollController: _scrollController,
          topFocusNode: widget.initialFocusNode,
          child: layout,
        );
      },
    );
  }
}
