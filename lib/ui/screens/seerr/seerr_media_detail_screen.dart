import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/services/seerr/seerr_error.dart';
import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/library_row.dart';
import '../../widgets/seerr/seerr_advanced_request_options.dart';
import '../../widgets/seerr/seerr_quota_row.dart';
import '../../widgets/seerr/seerr_text_field.dart';
import '../../widgets/seerr/seerr_tv_controls.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/seerr_download_progress_bar.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/track_selector_dialog.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/focus/request_initial_focus.dart';

const _tmdbPosterBase = 'https://image.tmdb.org/t/p/w342';
const _tmdbBackdropBase = 'https://image.tmdb.org/t/p/w1280';
const _tmdbProfileBase = 'https://image.tmdb.org/t/p/w185';

class SeerrMediaDetailScreen extends StatefulWidget {
  final String itemId;
  final String? mediaType;

  const SeerrMediaDetailScreen({
    super.key,
    required this.itemId,
    this.mediaType,
  });

  @override
  State<SeerrMediaDetailScreen> createState() => _SeerrMediaDetailScreenState();
}

class _SeerrMediaDetailScreenState extends State<SeerrMediaDetailScreen> {
  SeerrMediaDetailViewModel? _vm;
  bool _initializing = true;
  final _userPrefs = GetIt.instance<UserPreferences>();
  final FocusNode _firstActionFocusNode = FocusNode(
    debugLabel: 'seerr-first-action',
  );
  final FocusNode _overviewFocusNode = FocusNode(debugLabel: 'seerr-overview');
  final FocusNode _titleFocusNode = FocusNode(debugLabel: 'seerr-title-hidden');
  final ScrollController _wideScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final repo = await GetIt.instance.getAsync<SeerrRepository>();
    final prefs = GetIt.instance<SeerrPreferences>();
    final vm = SeerrMediaDetailViewModel(repo, prefs);
    vm.addListener(_onChanged);

    if (!mounted) {
      vm.dispose();
      return;
    }

    setState(() {
      _vm = vm;
      _initializing = false;
    });

    _loadDetails();
  }

  void _showFeedback(SeerrMediaDetailState s) {
    if (s.requestSuccess != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(s.requestSuccess!),
          backgroundColor: Colors.green[700],
          behavior: SnackBarBehavior.floating,
        ),
      );
      _vm?.clearFeedback();
    } else if (s.requestError != null) {
      final l10n = AppLocalizations.of(context);
      final message = switch (s.requestErrorKind) {
        SeerrRequestErrorKind.duplicate => l10n.requestErrorDuplicate,
        SeerrRequestErrorKind.quotaExceeded => l10n.requestErrorQuota,
        SeerrRequestErrorKind.blocklisted => l10n.requestErrorBlocklisted,
        SeerrRequestErrorKind.noSeasonsAvailable => l10n.requestErrorNoSeasons,
        SeerrRequestErrorKind.permission => l10n.requestErrorPermission,
        _ => s.requestError!,
      };
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red[700],
          behavior: SnackBarBehavior.floating,
        ),
      );
      _vm?.clearFeedback();
    }
  }

  void _loadDetails() {
    final vm = _vm;
    if (vm == null) return;

    final extra = GoRouterState.of(context).extra;
    final extraMap = extra is Map ? extra.cast<String, dynamic>() : null;
    final mediaType =
        (extraMap?['mediaType'] as String?) ?? widget.mediaType ?? 'movie';
    final title = extraMap?['title'] as String?;

    vm.load(widget.itemId, mediaType, title: title);
  }

  @override
  void dispose() {
    _vm?.removeListener(_onChanged);
    _vm?.dispose();
    _firstActionFocusNode.dispose();
    _overviewFocusNode.dispose();
    _titleFocusNode.dispose();
    _wideScrollController.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (!mounted) return;
    final s = _vm?.state;
    if (s != null) _showFeedback(s);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ready =
        !_initializing &&
        _vm != null &&
        !_vm!.state.isLoading &&
        _vm!.state.error == null;
    return RequestInitialFocus(
      targetNode: (PlatformDetection.isTV && ready) ? _overviewFocusNode : null,
      child: _buildScreenContent(context),
    );
  }

  Widget _buildScreenContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NavigationLayout(showBackButton: true, child: _buildBody()),
    );
  }

  Widget _buildBody() {
    final l10n = AppLocalizations.of(context);
    final vm = _vm;
    if (_initializing || vm == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final s = vm.state;

    if (s.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (s.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.error!, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadDetails, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    return _buildContent(s);
  }

  Widget _buildContent(SeerrMediaDetailState s) {
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;
    final useWideLayout =
        PlatformDetection.useDesktopUi ||
        PlatformDetection.isTV ||
        (PlatformDetection.useMobileUi && isLandscape);
    return Stack(
      fit: StackFit.expand,
      children: [
        if (s.backdropPath != null)
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: '$_tmdbBackdropBase${s.backdropPath}',
              fit: BoxFit.cover,
              errorWidget: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: useWideLayout ? 0.35 : 0.7),
                  Colors.black.withValues(alpha: 0.95),
                ],
                stops: const [0.0, 0.6],
              ),
            ),
          ),
        ),
        if (useWideLayout)
          _buildWideScroll(s, l10n)
        else
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildHeader(s)),
              SliverToBoxAdapter(child: _buildMetadata(s)),
              SliverToBoxAdapter(child: _buildRequestSection(s)),
              if (s.overview != null && s.overview!.isNotEmpty)
                SliverToBoxAdapter(child: _buildOverview(s.overview!)),
              if (s.credits != null && s.credits!.cast.isNotEmpty)
                SliverToBoxAdapter(child: _buildCastRow(s.credits!.cast, l10n)),
              if (s.similar.isNotEmpty)
                SliverToBoxAdapter(
                  child: _buildRelatedRow(l10n.similar, s.similar),
                ),
              if (s.recommendations.isNotEmpty)
                SliverToBoxAdapter(
                  child: _buildRelatedRow(
                    l10n.recommendations,
                    s.recommendations,
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
      ],
    );
  }

  Widget _buildWideScroll(SeerrMediaDetailState s, AppLocalizations l10n) {
    final size = MediaQuery.of(context).size;
    final topPad = MediaQuery.of(context).padding.top;
    final navbarIsTop =
        _userPrefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final navbarHeight = navbarIsTop
        ? (PlatformDetection.isTV
              ? 95.0
              : PlatformDetection.useMobileUi
              ? 60.0
              : 80.0)
        : 0.0;
    final hSidePad = PlatformDetection.isTV
        ? 56.0
        : PlatformDetection.useDesktopUi
        ? 64.0
        : 32.0;
    final heroHeight = (size.height * 0.62).clamp(360.0, 720.0);
    return CustomScrollView(
      controller: _wideScrollController,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: heroHeight,
            child: _buildWideHero(s, hSidePad, topPad + navbarHeight),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(hSidePad, 24, hSidePad, 12),
            child: _buildWideOverviewAndStats(s, l10n),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(hSidePad, 8, hSidePad, 16),
            child: _buildWideActions(s, l10n),
          ),
        ),
        if (s.credits != null && s.credits!.cast.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hSidePad),
              child: _buildCastRow(s.credits!.cast, l10n),
            ),
          ),
        if (s.similar.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hSidePad),
              child: _buildRelatedRow(l10n.similar, s.similar),
            ),
          ),
        if (s.recommendations.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hSidePad),
              child: _buildRelatedRow(l10n.recommendations, s.recommendations),
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: 60)),
      ],
    );
  }

  Widget _buildWideHero(
    SeerrMediaDetailState s,
    double hSidePad,
    double topInset,
  ) {
    final theme = Theme.of(context);
    final posterWidth = PlatformDetection.useDesktopUi ? 240.0 : 220.0;
    final posterHeight = posterWidth * 1.5;
    return Padding(
      padding: EdgeInsets.fromLTRB(hSidePad, topInset + 8, hSidePad, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (s.posterPath != null)
            ClipRRect(
              borderRadius: AppRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: '$_tmdbPosterBase${s.posterPath}',
                width: posterWidth,
                height: posterHeight,
                fit: BoxFit.cover,
                errorWidget: (_, _, _) => Container(
                  width: posterWidth,
                  height: posterHeight,
                  color: Colors.white12,
                ),
              ),
            ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWideStatusPill(s, l10n: AppLocalizations.of(context)),
                const SizedBox(height: 10),
                Focus(
                  focusNode: _titleFocusNode,
                  onFocusChange: (focused) {
                    if (focused) _scrollToTop();
                  },
                  onKeyEvent: _handleNavbarUpKey,
                  child: Text(
                    _titleWithYear(s),
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _wideMetaLine(s),
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (s.tagline != null && s.tagline!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    '"${s.tagline!}"',
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideStatusPill(
    SeerrMediaDetailState s, {
    required AppLocalizations l10n,
  }) {
    final label = _localizedStatusText(s, l10n);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: AppRadius.circular(999),
      ),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  Widget _buildWideOverviewAndStats(
    SeerrMediaDetailState s,
    AppLocalizations l10n,
  ) {
    final mediaType = s.isTv ? 'tv' : 'movie';
    final overviewText = (s.overview != null && s.overview!.isNotEmpty)
        ? Text(
            s.overview!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1.5,
            ),
          )
        : null;
    final overviewCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.overview,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        if (overviewText != null)
          PlatformDetection.isTV
              ? Focus(
                  focusNode: _overviewFocusNode,
                  onFocusChange: (focused) {
                    if (focused) _scrollToTop();
                  },
                  onKeyEvent: _handleNavbarUpKey,
                  child: Builder(
                    builder: (ctx) {
                      final focused = Focus.of(ctx).hasFocus;
                      final focusColor = Color(
                        GetIt.instance<UserPreferences>()
                            .get(UserPreferences.focusColor)
                            .colorValue,
                      );
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.circular(8),
                          border: Border.fromBorderSide(
                            ThemeRegistry.active.borders.focusBorder.copyWith(
                              color: focused ? focusColor : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: overviewText,
                      );
                    },
                  ),
                )
              : overviewText,
        if (s.genres.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: s.genres
                .map(
                  (g) => _browseChip(
                    label: g.name,
                    color: Colors.white12,
                    onTap: () => context.push(
                      Destinations.seerrBrowseWith(
                        filterId: g.id.toString(),
                        filterName: g.name,
                        mediaType: mediaType,
                        filterType: 'genre',
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
        if (s.networks.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: s.networks
                .map(
                  (n) => _browseChip(
                    label: n.name,
                    color: Colors.transparent,
                    borderColor: Colors.white24,
                    labelColor: Colors.white70,
                    onTap: () => context.push(
                      Destinations.seerrBrowseWith(
                        filterId: n.id.toString(),
                        filterName: n.name,
                        mediaType: mediaType,
                        filterType: 'network',
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
        if (s.keywords.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: s.keywords
                .map(
                  (k) => _browseChip(
                    label: k.name,
                    color: Colors.white.withValues(alpha: 0.05),
                    labelColor: Colors.white60,
                    dense: true,
                    onTap: () => context.push(
                      Destinations.seerrBrowseWith(
                        filterId: k.id.toString(),
                        filterName: k.name,
                        mediaType: mediaType,
                        filterType: 'keyword',
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
    final stats = _buildStatsCard(s, l10n);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 720) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [overviewCol, const SizedBox(height: 16), stats],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: overviewCol),
            const SizedBox(width: 32),
            Expanded(flex: 2, child: stats),
          ],
        );
      },
    );
  }

  Widget _buildStatsCard(SeerrMediaDetailState s, AppLocalizations l10n) {
    final rows = <_StatRow>[];
    if (s.voteAverage != null && s.voteAverage! > 0) {
      rows.add(_StatRow(l10n.tmdbScore, '${(s.voteAverage! * 10).round()}%'));
    }
    final statusText = _productionStatusText(s);
    if (statusText != null) {
      rows.add(_StatRow(l10n.status, statusText));
    }
    if (s.isMovie) {
      final dateLabel = _formatDate(s.releaseDate);
      if (dateLabel != null) {
        rows.add(_StatRow(l10n.releaseDateLabel, dateLabel));
      }
    } else {
      final dateLabel = _formatDate(s.firstAirDate);
      if (dateLabel != null) {
        rows.add(_StatRow(l10n.firstAirDateLabel, dateLabel));
      }
    }
    if (s.isTv) {
      if (s.numberOfSeasons != null && s.numberOfSeasons! > 0) {
        rows.add(_StatRow(l10n.seasonsLabel, s.numberOfSeasons.toString()));
      }
      if (s.numberOfEpisodes != null && s.numberOfEpisodes! > 0) {
        rows.add(_StatRow(l10n.episodesLabel, s.numberOfEpisodes.toString()));
      }
    }
    if (s.revenue != null && s.revenue! > 0) {
      rows.add(_StatRow(l10n.revenueLabel, _formatMoneyFull(s.revenue!)));
    }
    if (s.runtime != null && s.runtime! > 0) {
      rows.add(_StatRow(l10n.runtimeLabel, _formatRuntime(s.runtime!)));
    }
    if (s.budget != null && s.budget! > 0) {
      rows.add(_StatRow(l10n.budgetLabel, _formatMoneyFull(s.budget!)));
    }
    if (rows.isEmpty) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: AppRadius.circular(10),
        border: Border.fromBorderSide(ThemeRegistry.active.borders.cardBorder),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      rows[i].label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    rows[i].value,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            if (i < rows.length - 1)
              const Divider(height: 1, thickness: 1, color: Colors.white10),
          ],
        ],
      ),
    );
  }

  Widget _buildWideActions(SeerrMediaDetailState s, AppLocalizations l10n) {
    final vm = _vm!;
    final canShowRequest =
        vm.canRequest &&
        !s.isFullyAvailable &&
        (!s.hasExistingRequest || s.isPartiallyAvailable);
    final requestLabel = s.isPartiallyAvailable
        ? l10n.requestMore
        : l10n.request;
    final canManage = vm.canManageRequests;
    final trailer = s.bestTrailer;
    final showTrailer = trailer != null;
    final showCancel = s.activeRequests.isNotEmpty && !s.isFullyAvailable;

    final tiles = <Widget>[];
    FocusNode? nextFirstNode = _firstActionFocusNode;
    FocusNode? takeFirst() {
      final n = nextFirstNode;
      nextFirstNode = null;
      return n;
    }

    if (showCancel) {
      tiles.add(
        _ActionTile(
          icon: Icons.close,
          label: l10n.cancelRequest,
          onTap: s.isRequesting ? null : () => _showCancelDialog(s),
          primary: !(s.isFullyAvailable || s.isPartiallyAvailable),
          focusNode: takeFirst(),
        ),
      );
    } else if (canShowRequest) {
      tiles.add(
        _ActionTile(
          icon: Icons.add,
          label: requestLabel,
          onTap: s.isRequesting ? null : _showRequestDialog,
          primary: !(s.isFullyAvailable || s.isPartiallyAvailable),
          focusNode: takeFirst(),
        ),
      );
    }
    if (s.isFullyAvailable || s.isPartiallyAvailable) {
      tiles.add(
        _ActionTile(
          icon: Icons.play_arrow,
          label: l10n.playInMoonfin,
          onTap: () => _playInMoonfin(s),
          primary: tiles.isEmpty,
          focusNode: takeFirst(),
        ),
      );
    }
    if (showTrailer) {
      tiles.add(
        _ActionTile(
          icon: Icons.movie_outlined,
          label: l10n.trailer,
          onTap: () => _openTrailer(trailer),
          focusNode: takeFirst(),
        ),
      );
    }
    if (vm.canReportIssue) {
      tiles.add(
        _ActionTile(
          icon: Icons.report_problem_outlined,
          label: l10n.reportIssue,
          onTap: s.isRequesting ? null : _showReportIssueDialog,
          focusNode: takeFirst(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (s.activeRequests.isNotEmpty) ...[
          for (final req in s.activeRequests)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 16,
                    color: Colors.white54,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      l10n.requestedByName(
                        req.requestedBy?.bestName ?? l10n.unknown,
                      ),
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (canManage &&
                      req.status == SeerrRequest.statusPending) ...[
                    const SizedBox(width: 8),
                    _ApproveDeclineButtons(
                      isLoading: s.isRequesting,
                      onApprove: () => vm.approveRequest(req.id),
                      onDecline: () => vm.declineRequest(req.id),
                    ),
                  ],
                ],
              ),
            ),
          const SizedBox(height: 8),
        ],
        if (tiles.isNotEmpty)
          Wrap(spacing: 16, runSpacing: 16, children: tiles),
        if (s.movie?.collection != null) ...[
          const SizedBox(height: 20),
          _buildCollectionBanner(s.movie!.collection!),
        ],
      ],
    );
  }

  Widget _buildCollectionBanner(SeerrCollectionRef collection) {
    final l10n = AppLocalizations.of(context);
    return _CollectionBanner(
      collection: collection,
      label: l10n.partOfCollectionName(collection.name ?? ''),
      cta: l10n.viewCollection,
      onTap: () => context.push(
        Destinations.seerrCollection(collection.id.toString()),
      ),
    );
  }

  void _showReportIssueDialog() {
    final vm = _vm;
    if (vm == null) return;
    final s = vm.state;
    final l10n = AppLocalizations.of(context);
    showStyledPlayerDialog<void>(
      context,
      title: l10n.reportIssue,
      builder: (_) => _ReportIssueDialog(
        vm: vm,
        isTv: s.isTv,
        seasons: s.tv?.seasons ?? const [],
        numberOfSeasons: s.numberOfSeasons ?? 0,
      ),
    );
  }

  Widget _browseChip({
    required String label,
    required VoidCallback onTap,
    Color color = Colors.white12,
    Color? borderColor,
    Color labelColor = Colors.white,
    bool dense = false,
  }) => _BrowseChip(
    label: label,
    onTap: onTap,
    color: color,
    borderColor: borderColor,
    labelColor: labelColor,
    dense: dense,
  );

  KeyEventResult _handleNavbarUpKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      final navbarPos = _userPrefs.get(UserPreferences.navbarPosition);
      if (navbarPos == NavbarPosition.top) {
        NavigationLayout.focusNavbarNotifier.value?.call();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      if (identical(node, _titleFocusNode) && _requestFirstActionFocus()) {
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  bool _requestFirstActionFocus() {
    if (!_firstActionFocusNode.canRequestFocus) return false;
    if (_firstActionFocusNode.context == null) return false;
    _firstActionFocusNode.requestFocus();
    return true;
  }

  void _scrollToTop() {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_wideScrollController.hasClients) return;
      final position = _wideScrollController.position;
      if (position.pixels <= position.minScrollExtent) return;
      position.animateTo(
        position.minScrollExtent,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  String _titleWithYear(SeerrMediaDetailState s) {
    final year = _extractYear(s);
    if (year == null) return s.displayTitle;
    return '${s.displayTitle} ($year)';
  }

  String _wideMetaLine(SeerrMediaDetailState s) {
    final parts = <String>[];
    if (s.runtime != null && s.runtime! > 0) {
      parts.add('${s.runtime} min');
    }
    if (s.genres.isNotEmpty) {
      parts.addAll(s.genres.take(3).map((g) => g.name));
    } else if (s.isTv && s.tvStatus != null) {
      parts.add(s.tvStatus!);
    }
    return parts.join(' \u2022 ');
  }

  String _localizedStatusText(SeerrMediaDetailState s, AppLocalizations l10n) {
    if (s.isFullyAvailable) return l10n.seerrAvailableStatus;
    if (s.isPartiallyAvailable) return l10n.partiallyAvailable;
    if (s.isProcessing) return l10n.seerrRequestedStatus;
    if (s.isPending) return l10n.pendingStatus;
    if (s.isBlacklisted) return l10n.blocklistedStatus;
    if (s.isDeleted) return l10n.deletedStatus;
    if (s.hasExistingRequest) return l10n.seerrRequestedStatus;
    return l10n.notRequestedStatus;
  }

  String? _productionStatusText(SeerrMediaDetailState s) {
    if (s.isMovie) return s.movie?.status;
    return s.tv?.status;
  }

  String? _formatDate(String? iso) {
    if (iso == null || iso.length < 10) return null;
    try {
      final d = DateTime.parse(iso);
      const months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
      return '${months[d.month - 1]} ${d.day}, ${d.year}';
    } catch (_) {
      return iso;
    }
  }

  static String _formatMoneyFull(int amount) {
    final s = amount.toString();
    final buf = StringBuffer(r'$');
    final start = s.length % 3;
    for (var i = 0; i < s.length; i++) {
      if (i != 0 && (i - start) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    buf.write('.00');
    return buf.toString();
  }

  Future<void> _openTrailer(SeerrVideo video) async {
    final isYouTube = (video.site ?? '').toLowerCase() == 'youtube';
    final key = video.key;
    if (isYouTube && key != null && key.isNotEmpty) {
      await context.push(Destinations.trailer(videoId: key));
      return;
    }
    String? url = video.url;
    if ((url == null || url.isEmpty) && key != null && key.isNotEmpty) {
      url = 'https://www.youtube.com/watch?v=$key';
    }
    if (url == null || url.isEmpty) return;
    await context.push(Destinations.trailer(url: url));
  }

  Widget _buildHeader(SeerrMediaDetailState s) {
    final theme = Theme.of(context);
    final topPad = MediaQuery.of(context).padding.top;
    final navbarIsTop =
        _userPrefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final navbarHeight = navbarIsTop
        ? (PlatformDetection.isTV
              ? 95.0
              : PlatformDetection.useMobileUi
              ? 60.0
              : 80.0)
        : 0.0;
    return Padding(
      padding: EdgeInsets.fromLTRB(32, topPad + navbarHeight + 16, 32, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (s.posterPath != null)
            Center(
              child: ClipRRect(
                borderRadius: AppRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: '$_tmdbPosterBase${s.posterPath}',
                  width: 180,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) =>
                      const SizedBox(width: 180, height: 270),
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text(
            s.displayTitle,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          if (s.tagline != null && s.tagline!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              s.tagline!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white60,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 12),
          _buildStatusBadge(s),
          if (s.hdDownload != null) ...[
            const SizedBox(height: 8),
            SizedBox(
              width: 280,
              child: SeerrDownloadProgressBar(
                summary: s.hdDownload!,
                prefixLabel: s.download4k != null ? 'HD' : null,
              ),
            ),
          ],
          if (s.download4k != null) ...[
            const SizedBox(height: 8),
            SizedBox(
              width: 280,
              child: SeerrDownloadProgressBar(
                summary: s.download4k!,
                prefixLabel: '4K',
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge(SeerrMediaDetailState s) {
    final (label, color) = _mediaStatusInfo(s);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(color: color),
        ),
        borderRadius: AppRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  /// Media status colors matching the seerr web UI. Labels come from
  /// [_localizedStatusText].
  (String, Color) _mediaStatusInfo(SeerrMediaDetailState s) {
    final l10n = AppLocalizations.of(context);
    final label = _localizedStatusText(s, l10n);
    // Same branch order as _localizedStatusText so label and color agree.
    final Color color;
    if (s.isFullyAvailable || s.isPartiallyAvailable) {
      color = AppColorScheme.statusAvailable;
    } else if (s.isProcessing) {
      color = AppColorScheme.statusRequested;
    } else if (s.isPending) {
      color = AppColorScheme.statusPending;
    } else if (s.isBlacklisted || s.isDeleted) {
      color = AppColorScheme.statusError;
    } else if (s.hasExistingRequest) {
      color = AppColorScheme.statusRequested;
    } else {
      color = AppColorScheme.onSurface.withValues(alpha: 0.54);
    }
    return (label, color);
  }

  Widget _buildMetadata(SeerrMediaDetailState s) {
    final l10n = AppLocalizations.of(context);
    final chips = <Widget>[];

    final year = _extractYear(s);
    if (year != null) chips.add(_metaText(year));

    if (s.runtime != null && s.runtime! > 0) {
      chips.add(_metaText(_formatRuntime(s.runtime!)));
    }

    if (s.voteAverage != null && s.voteAverage! > 0) {
      chips.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, size: 16, color: Color(0xFFFFC107)),
            const SizedBox(width: 2),
            Text(
              s.voteAverage!.toStringAsFixed(1),
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      );
    }

    if (s.isTv) {
      if (s.numberOfSeasons != null) {
        final label = s.numberOfSeasons == 1 ? l10n.season : l10n.seasons;
        chips.add(_metaText(l10n.seasonsCount(s.numberOfSeasons!, label)));
      }
      if (s.tvStatus != null) {
        chips.add(_tvStatusBadge(s.tvStatus!));
      }
    }

    if (s.budget != null && s.budget! > 0) {
      chips.add(_metaText(l10n.budgetAmount(_formatMoney(s.budget!))));
    }
    if (s.revenue != null && s.revenue! > 0) {
      chips.add(_metaText(l10n.revenueAmount(_formatMoney(s.revenue!))));
    }

    final mediaType = s.isTv ? 'tv' : 'movie';

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(spacing: 8, runSpacing: 6, children: chips),
          if (s.genres.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: s.genres
                  .map(
                    (g) => ActionChip(
                      label: Text(g.name, style: const TextStyle(fontSize: 12)),
                      backgroundColor: Colors.white12,
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      onPressed: () => context.push(
                        Destinations.seerrBrowseWith(
                          filterId: g.id.toString(),
                          filterName: g.name,
                          mediaType: mediaType,
                          filterType: 'genre',
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
          if (s.networks.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: s.networks
                  .map(
                    (n) => ActionChip(
                      label: Text(
                        n.name,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white54,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      side: ThemeRegistry.active.borders.chipBorder,
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      onPressed: () => context.push(
                        Destinations.seerrBrowseWith(
                          filterId: n.id.toString(),
                          filterName: n.name,
                          mediaType: mediaType,
                          filterType: 'network',
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
          if (s.keywords.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: s.keywords
                  .map(
                    (k) => ActionChip(
                      label: Text(
                        k.name,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white60,
                        ),
                      ),
                      backgroundColor: Colors.white.withValues(alpha: 0.05),
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      onPressed: () => context.push(
                        Destinations.seerrBrowseWith(
                          filterId: k.id.toString(),
                          filterName: k.name,
                          mediaType: mediaType,
                          filterType: 'keyword',
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRequestSection(SeerrMediaDetailState s) {
    final l10n = AppLocalizations.of(context);
    final vm = _vm!;
    final canShowRequest =
        vm.canRequest &&
        !s.isFullyAvailable &&
        (!s.hasExistingRequest || s.isPartiallyAvailable);
    final requestLabel = s.isPartiallyAvailable
        ? l10n.requestMore
        : l10n.request;
    final canManage = vm.canManageRequests;

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (s.activeRequests.isNotEmpty) ...[
            for (final req in s.activeRequests)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 16,
                      color: Colors.white54,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        l10n.requestedByName(
                          req.requestedBy?.bestName ?? l10n.unknown,
                        ),
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (canManage &&
                        req.status == SeerrRequest.statusPending) ...[
                      const SizedBox(width: 8),
                      _ApproveDeclineButtons(
                        isLoading: s.isRequesting,
                        onApprove: () => vm.approveRequest(req.id),
                        onDecline: () => vm.declineRequest(req.id),
                      ),
                    ],
                  ],
                ),
              ),
            const SizedBox(height: 4),
          ],
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              if (s.isFullyAvailable || s.isPartiallyAvailable)
                ElevatedButton.icon(
                  onPressed: () => _playInMoonfin(s),
                  icon: const Icon(Icons.play_arrow),
                  label: Text(l10n.playInMoonfin),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                  ),
                ),
              if (canShowRequest)
                ElevatedButton.icon(
                  onPressed: s.isRequesting ? null : () => _showRequestDialog(),
                  icon: s.isRequesting
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.add),
                  label: Text(requestLabel),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                  ),
                ),
              if (s.activeRequests.isNotEmpty && !s.isFullyAvailable)
                OutlinedButton.icon(
                  onPressed: s.isRequesting ? null : () => _showCancelDialog(s),
                  icon: const Icon(Icons.close, size: 18),
                  label: Text(l10n.cancelRequest),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red[300],
                    side: ThemeRegistry.active.borders.chipBorder.copyWith(
                      color: Colors.red[300]!,
                    ),
                  ),
                ),
              if (vm.canReportIssue)
                OutlinedButton.icon(
                  onPressed: s.isRequesting
                      ? null
                      : _showReportIssueDialog,
                  icon: const Icon(Icons.report_problem_outlined, size: 18),
                  label: Text(l10n.reportIssue),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.amber[300],
                    side: ThemeRegistry.active.borders.chipBorder.copyWith(
                      color: Colors.amber[300]!,
                    ),
                  ),
                ),
            ],
          ),
          if (s.movie?.collection != null) ...[
            const SizedBox(height: 16),
            _buildCollectionBanner(s.movie!.collection!),
          ],
        ],
      ),
    );
  }

  Widget _buildOverview(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.white.withValues(alpha: 0.85),
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildCastRow(List<SeerrCastMember> cast, AppLocalizations l10n) {
    final visible = cast.length > 20 ? cast.sublist(0, 20) : cast;
    return LibraryRow(
      title: l10n.cast,
      rowHeight: 170,
      children: visible.asMap().entries.map((entry) {
        final index = entry.key;
        final m = entry.value;
        return _CastCard(
          member: m,
          onKeyEvent: (event) {
            if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
              return KeyEventResult.ignored;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
                index == 0) {
              NavigationLayout.focusNavbarNotifier.value?.call();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          onTap: () => context.push(Destinations.seerrPerson(m.id.toString())),
        );
      }).toList(),
    );
  }

  Widget _buildRelatedRow(String title, List<SeerrDiscoverItem> items) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final cardExpansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    return LibraryRow(
      title: title,
      rowHeight: 240,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return MediaCard(
          title: item.displayTitle,
          subtitle: _yearFromItem(item),
          imageUrl: item.posterPath != null
              ? '$_tmdbPosterBase${item.posterPath}'
              : null,
          width: 130,
          aspectRatio: 2 / 3,
          seerrMediaType: item.mediaType,
          seerrStatus: item.mediaInfo?.status,
          focusColor: focusColor,
          cardFocusExpansion: cardExpansion,
          suppressFocusGlow: isNeon,
          onKeyEvent: (_, event) {
            if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
              return KeyEventResult.ignored;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
                index == 0) {
              NavigationLayout.focusNavbarNotifier.value?.call();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          onTap: () {
            final mediaType = item.mediaType ?? 'movie';
            context.push(
              Destinations.seerrMedia(item.id.toString()),
              extra: {'mediaType': mediaType},
            );
          },
        );
      }).toList(),
    );
  }

  void _showRequestDialog() {
    final vm = _vm!;
    final s = vm.state;
    final l10n = AppLocalizations.of(context);
    showStyledPlayerDialog<void>(
      context,
      title: l10n.requestSeriesOrMovie(s.isTv ? l10n.series : l10n.movie),
      builder: (_) => _RequestDialog(
        vm: vm,
        isTv: s.isTv,
        numberOfSeasons: s.numberOfSeasons ?? 0,
        requestedSeasons: s.requestedSeasons,
      ),
    );
  }

  void _showCancelDialog(SeerrMediaDetailState s) {
    final l10n = AppLocalizations.of(context);
    final active = s.activeRequests;
    if (active.isEmpty) return;

    final title = s.displayTitle;
    final count = active.length;
    final message = count == 1
        ? l10n.cancelRequestForTitle(title)
        : l10n.cancelCountRequestsForTitle(count, title);

    showFocusRestoringDialog(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(
          l10n.cancelRequest,
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(message, style: const TextStyle(color: Colors.white70)),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.keep),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _cancelRequests(active);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red[300]),
            child: Text(l10n.cancelRequest),
          ),
        ],
      ),
    );
  }

  Future<void> _cancelRequests(List<SeerrRequest> requests) async {
    final vm = _vm;
    if (vm == null) return;
    await vm.cancelRequests(requests.map((r) => r.id).toList());
  }

  Future<void> _playInMoonfin(SeerrMediaDetailState s) async {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);

    final jellyfinId =
        s.mediaInfo?.jellyfinMediaId ?? s.mediaInfo?.jellyfinMediaId4k;
    if (jellyfinId != null) {
      context.push(Destinations.item(jellyfinId));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.itemNotFoundInLibrary),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  static String? _extractYear(SeerrMediaDetailState s) {
    final date = s.releaseDate ?? s.firstAirDate;
    if (date == null || date.length < 4) return null;
    return date.substring(0, 4);
  }

  static String? _yearFromItem(SeerrDiscoverItem item) {
    final date = item.releaseDate ?? item.firstAirDate;
    if (date == null || date.length < 4) return null;
    return date.substring(0, 4);
  }

  static Widget _metaText(String text) =>
      Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13));

  static Widget _tvStatusBadge(String status) {
    final lower = status.toLowerCase();
    final Color bg;
    if (lower == 'returning series' || lower == 'continuing') {
      bg = Colors.green;
    } else if (lower == 'ended' || lower == 'canceled') {
      bg = Colors.red;
    } else {
      bg = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg.withValues(alpha: 0.15),
        borderRadius: AppRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(color: bg, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  static String _formatRuntime(int minutes) {
    if (minutes < 60) return '${minutes}m';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return m > 0 ? '${h}h ${m}m' : '${h}h';
  }

  static String _formatMoney(int amount) {
    if (amount >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(1)}B';
    }
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    }
    if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(0)}K';
    }
    return amount.toString();
  }
}

class _ApproveDeclineButtons extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onApprove;
  final VoidCallback onDecline;

  const _ApproveDeclineButtons({
    required this.isLoading,
    required this.onApprove,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: isLoading ? null : onApprove,
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 20,
          ),
          tooltip: l10n.approve,
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
        ),
        IconButton(
          onPressed: isLoading ? null : onDecline,
          icon: Icon(Icons.cancel_outlined, color: Colors.red[300], size: 20),
          tooltip: l10n.declineAction,
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}

class _BrowseChip extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color? borderColor;
  final Color labelColor;
  final bool dense;

  const _BrowseChip({
    required this.label,
    required this.onTap,
    required this.color,
    required this.borderColor,
    required this.labelColor,
    required this.dense,
  });

  @override
  State<_BrowseChip> createState() => _BrowseChipState();
}

class _BrowseChipState extends State<_BrowseChip> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final hPad = widget.dense ? 8.0 : 10.0;
    final vPad = widget.dense ? 4.0 : 6.0;
    final borderRadius = AppRadius.circular(999);
    return Focus(
      onFocusChange: setFocused,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.gameButtonA) {
          widget.onTap();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: showFocusBorder ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: borderRadius,
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: showFocusBorder
                        ? focusColor
                        : (widget.borderColor ?? Colors.transparent),
                    width: showFocusBorder ? 2 : 1,
                  ),
                ),
              ),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: widget.dense ? 11 : 12,
                  color: widget.labelColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CastCard extends StatefulWidget {
  final SeerrCastMember member;
  final KeyEventResult Function(KeyEvent event)? onKeyEvent;
  final VoidCallback? onTap;

  const _CastCard({required this.member, this.onKeyEvent, this.onTap});

  @override
  State<_CastCard> createState() => _CastCardState();
}

class _CastCardState extends State<_CastCard> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final m = widget.member;
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    return Focus(
      onFocusChange: (f) => setFocused(f),
      onKeyEvent: (_, event) {
        final custom = widget.onKeyEvent?.call(event);
        if (custom != null && custom != KeyEventResult.ignored) {
          return custom;
        }
        if (event is KeyDownEvent || event is KeyRepeatEvent) {
          if (event.logicalKey == LogicalKeyboardKey.select ||
              event.logicalKey == LogicalKeyboardKey.enter ||
              event.logicalKey == LogicalKeyboardKey.gameButtonA) {
            widget.onTap?.call();
            return KeyEventResult.handled;
          }
        }
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.space) {
          widget.onTap?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setHovered(true),
          onExit: (_) => setHovered(false),
          child: AnimatedScale(
            scale: showFocusBorder ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 150),
            child: SizedBox(
              width: 90,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: showFocusBorder
                          ? Border.fromBorderSide(
                              ThemeRegistry.active.borders.focusBorder.copyWith(
                                color: focusColor,
                                width: 2,
                              ),
                            )
                          : null,
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[800],
                      backgroundImage: m.profilePath != null
                          ? CachedNetworkImageProvider(
                              '$_tmdbProfileBase${m.profilePath}',
                            )
                          : null,
                      child: m.profilePath == null
                          ? const Icon(
                              Icons.person,
                              color: Colors.white38,
                              size: 32,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    m.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (m.character != null)
                    Text(
                      m.character!,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatRow {
  final String label;
  final String value;
  const _StatRow(this.label, this.value);
}

class _ActionTile extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool primary;
  final FocusNode? focusNode;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.primary = false,
    this.focusNode,
  });

  @override
  State<_ActionTile> createState() => _ActionTileState();
}

class _ActionTileState extends State<_ActionTile> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final disabled = widget.onTap == null;
    final isHighlighted = showFocusBorder;
    final bg = (widget.primary && isHighlighted)
        ? Colors.white
        : Colors.white.withValues(alpha: 0.10);
    final fg = (widget.primary && isHighlighted) ? Colors.black : Colors.white;
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: setFocused,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (!disabled &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter ||
                event.logicalKey == LogicalKeyboardKey.gameButtonA)) {
          widget.onTap?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          cursor: disabled
              ? SystemMouseCursors.basic
              : SystemMouseCursors.click,
          onEnter: (_) => setHovered(true),
          onExit: (_) => setHovered(false),
          child: AnimatedScale(
            scale: showFocusBorder ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 150),
            child: SizedBox(
              width: 96,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: AppRadius.circular(14),
                      border: showFocusBorder
                          ? Border.fromBorderSide(
                              ThemeRegistry.active.borders.focusBorder.copyWith(
                                color: focusColor,
                                width: 3,
                              ),
                            )
                          : null,
                    ),
                    child: Icon(widget.icon, color: fg, size: 38),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RequestDialog extends StatefulWidget {
  final SeerrMediaDetailViewModel vm;
  final bool isTv;
  final int numberOfSeasons;
  final Set<int> requestedSeasons;

  const _RequestDialog({
    required this.vm,
    required this.isTv,
    required this.numberOfSeasons,
    this.requestedSeasons = const {},
  });

  @override
  State<_RequestDialog> createState() => _RequestDialogState();
}

class _RequestDialogState extends State<_RequestDialog> {
  bool _is4k = false;
  bool _allSeasons = true;
  bool _submitting = false;
  final Set<int> _selectedSeasons = {};
  late final SeerrAdvancedRequestController _advanced;

  @override
  void initState() {
    super.initState();
    _advanced = SeerrAdvancedRequestController(
      isTv: widget.isTv,
      isAnime: widget.vm.state.isAnime,
    );
    _applySavedPreferences(resetSelection: false);
    if (widget.vm.canRequestAdvanced) {
      _advanced.load();
    }
    widget.vm.loadQuota();
    widget.vm.addListener(_onVmChanged);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_onVmChanged);
    _advanced.dispose();
    super.dispose();
  }

  void _onVmChanged() {
    if (mounted) setState(() {});
  }

  void _applySavedPreferences({bool resetSelection = true}) {
    final vm = widget.vm;
    _advanced.applySavedPreferences(
      serverId: _is4k ? vm.saved4kServerId : vm.savedServerId,
      profileId: _is4k ? vm.saved4kProfileId : vm.savedProfileId,
      rootFolderId: _is4k ? vm.saved4kRootFolderId : vm.savedRootFolderId,
      resetSelection: resetSelection,
    );
  }

  SeerrQuotaDetail? get _quotaDetail {
    final quota = widget.vm.state.quota;
    if (quota == null) return null;
    return widget.isTv ? quota.tv : quota.movie;
  }

  int get _seasonsNeeded {
    if (!widget.isTv) return 0;
    if (_allSeasons) {
      final total = widget.numberOfSeasons;
      return (total - widget.requestedSeasons.length).clamp(1, total);
    }
    return _selectedSeasons.length;
  }

  bool get _quotaBlocked {
    final detail = _quotaDetail;
    if (detail == null || detail.isUnlimited) return false;
    if (detail.restricted) return true;
    final remaining = detail.remaining;
    if (remaining == null) return false;
    // TV quota counts seasons, movie quota counts one movie per request.
    final needed = widget.isTv ? _seasonsNeeded : 1;
    return needed > remaining;
  }

  void _submit() {
    if (_submitting || _quotaBlocked) {
      return;
    }

    List<int>? seasons;
    if (widget.isTv && !_allSeasons) {
      seasons = _selectedSeasons.toList()..sort();
      if (seasons.isEmpty) return;
    }

    _submitting = true;

    widget.vm.submitRequest(
      is4k: _is4k,
      seasons: seasons,
      allSeasons: widget.isTv && _allSeasons,
      profileId: _advanced.effectiveProfileId,
      rootFolder: _advanced.effectiveRootFolderPath,
      serverId: _advanced.effectiveServerId,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final quotaRow = _buildQuotaRow(l10n);

    var autofocusPending = true;
    bool takeAutofocus() {
      if (!autofocusPending) return false;
      autofocusPending = false;
      return true;
    }

    final children = <Widget>[];
    if (widget.vm.canRequest4k) {
      children.add(
        SeerrToggleRow(
          title: l10n.uhd4k,
          value: _is4k,
          autofocus: takeAutofocus(),
          onChanged: (v) => setState(() {
            _is4k = v;
            _applySavedPreferences();
          }),
        ),
      );
    }
    if (widget.isTv) {
      children.add(const Divider(color: Colors.white12));
      children.add(_buildSeasonSelector(autofocusAll: takeAutofocus()));
    }
    if (widget.vm.canRequestAdvanced) {
      children.add(const Divider(color: Colors.white12));
      children.add(SeerrAdvancedRequestOptions(controller: _advanced));
    }
    if (quotaRow != null) {
      children.add(const SizedBox(height: 12));
      children.add(quotaRow);
    }
    children.add(const SizedBox(height: 20));
    children.add(
      Row(
        children: [
          Expanded(
            child: SeerrDialogButton(
              label: l10n.cancel,
              onPressed: _submitting ? null : () => Navigator.of(context).pop(),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SeerrDialogButton(
              label: l10n.submitRequest,
              primary: true,
              primaryColor: const Color(0xFF6366F1),
              busy: _submitting,
              onPressed: _quotaBlocked || _submitting ? null : _submit,
            ),
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget? _buildQuotaRow(AppLocalizations l10n) {
    final detail = _quotaDetail;
    if (detail == null || detail.isUnlimited) return null;
    final limit = detail.limit ?? 0;
    final remaining = detail.remaining ?? 0;
    final blocked = _quotaBlocked;
    final label = blocked
        ? l10n.requestErrorQuota
        : widget.isTv
        ? l10n.seasonQuotaRemaining(remaining, limit)
        : l10n.movieQuotaRemaining(remaining, limit);
    return SeerrQuotaRow(label: label, blocked: blocked);
  }

  Widget _buildSeasonSelector({bool autofocusAll = false}) {
    final l10n = AppLocalizations.of(context);
    final seasonCount = widget.numberOfSeasons;
    final requested = widget.requestedSeasons;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeerrToggleRow(
          title: l10n.allSeasons,
          value: _allSeasons,
          checkbox: true,
          autofocus: autofocusAll,
          onChanged: (v) => setState(() {
            _allSeasons = v;
            if (_allSeasons) _selectedSeasons.clear();
          }),
        ),
        if (!_allSeasons && seasonCount > 0)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(seasonCount, (i) {
                final num = i + 1;
                final alreadyRequested = requested.contains(num);
                final selected = _selectedSeasons.contains(num);
                return SeerrChoiceChip(
                  label: l10n.seasonChip(num),
                  selected: selected,
                  onSelected: alreadyRequested
                      ? null
                      : (v) => setState(() {
                          if (v) {
                            _selectedSeasons.add(num);
                          } else {
                            _selectedSeasons.remove(num);
                          }
                        }),
                );
              }),
            ),
          ),
      ],
    );
  }

}

class _CollectionBanner extends StatefulWidget {
  final SeerrCollectionRef collection;
  final String label;
  final String cta;
  final VoidCallback onTap;

  const _CollectionBanner({
    required this.collection,
    required this.label,
    required this.cta,
    required this.onTap,
  });

  @override
  State<_CollectionBanner> createState() => _CollectionBannerState();
}

class _CollectionBannerState extends State<_CollectionBanner>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final backdrop = widget.collection.backdropPath;
    return Focus(
      onFocusChange: setFocused,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.gameButtonA) {
          widget.onTap();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: showFocusBorder ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 560),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: AppRadius.circular(10),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: showFocusBorder ? focusColor : Colors.white12,
                    width: showFocusBorder ? 2 : 1,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  if (backdrop != null)
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: '$_tmdbBackdropBase$backdrop',
                        fit: BoxFit.cover,
                      ),
                    ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withValues(alpha: 0.85),
                            Colors.black.withValues(alpha: 0.55),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.collections_bookmark_outlined,
                          color: Colors.white70,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            widget.label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          widget.cta,
                          style: TextStyle(
                            color: AppColorScheme.accent,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white54,
                          size: 18,
                        ),
                      ],
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
}

class _ReportIssueDialog extends StatefulWidget {
  final SeerrMediaDetailViewModel vm;
  final bool isTv;
  final List<SeerrSeason> seasons;
  final int numberOfSeasons;

  const _ReportIssueDialog({
    required this.vm,
    required this.isTv,
    required this.seasons,
    required this.numberOfSeasons,
  });

  @override
  State<_ReportIssueDialog> createState() => _ReportIssueDialogState();
}

class _ReportIssueDialogState extends State<_ReportIssueDialog> {
  int _issueType = SeerrIssue.typeVideo;
  int _season = 0;
  int _episode = 0;
  bool _submitting = false;
  final _messageController = TextEditingController();

  List<int> get _seasonNumbers {
    final fromList = widget.seasons
        .where((s) => s.seasonNumber > 0)
        .map((s) => s.seasonNumber)
        .toList();
    if (fromList.isNotEmpty) return fromList;
    return List.generate(widget.numberOfSeasons, (i) => i + 1);
  }

  int? get _episodeCount {
    if (_season <= 0) return null;
    return widget.seasons
        .where((s) => s.seasonNumber == _season)
        .firstOrNull
        ?.episodeCount;
  }

  @override
  void initState() {
    super.initState();
    if (widget.isTv && _seasonNumbers.length == 1) {
      _season = _seasonNumbers.first;
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final message = _messageController.text.trim();
    if (message.isEmpty || _submitting) return;
    setState(() => _submitting = true);

    final ok = await widget.vm.submitIssue(
      issueType: _issueType,
      message: message,
      problemSeason: widget.isTv ? _season : 0,
      problemEpisode: widget.isTv && _season > 0 ? _episode : 0,
    );

    if (!mounted) return;
    if (ok) {
      Navigator.of(context).pop();
    } else {
      setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final types = [
      (SeerrIssue.typeVideo, l10n.issueTypeVideo),
      (SeerrIssue.typeAudio, l10n.issueTypeAudio),
      (SeerrIssue.typeSubtitles, l10n.subtitles),
      (SeerrIssue.typeOther, l10n.other),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < types.length; i++)
            _buildTypeOption(types[i].$1, types[i].$2, autofocus: i == 0),
          if (widget.isTv && _seasonNumbers.isNotEmpty) ...[
            const Divider(color: Colors.white12),
            const SizedBox(height: 4),
            SeerrSelectorRow(
              label: l10n.season,
              value: _season <= 0
                  ? l10n.allSeasons
                  : l10n.seasonNumber(_season),
              onTap: () => _pickSeason(l10n),
            ),
            if (_season > 0) ...[
              const SizedBox(height: 12),
              SeerrSelectorRow(
                label: l10n.episode,
                value: _episode <= 0
                    ? l10n.allEpisodes
                    : l10n.episodeNumber(_episode),
                onTap: () => _pickEpisode(l10n),
              ),
            ],
          ],
          const SizedBox(height: 16),
          Text(
            l10n.whatsWrong,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 8),
          SeerrTextField(
            controller: _messageController,
            hint: l10n.whatsWrong,
            maxLines: PlatformDetection.isTV ? 1 : 3,
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: _messageController,
            builder: (context, value, _) {
              final canSend = value.text.trim().isNotEmpty && !_submitting;
              return Row(
                children: [
                  Expanded(
                    child: SeerrDialogButton(
                      label: l10n.cancel,
                      onPressed: _submitting
                          ? null
                          : () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SeerrDialogButton(
                      label: l10n.submitReport,
                      primary: true,
                      busy: _submitting,
                      onPressed: canSend ? _submit : null,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption(int value, String label, {bool autofocus = false}) {
    final selected = _issueType == value;
    return FocusableWrapper(
      autofocus: autofocus,
      onSelect: () => setState(() => _issueType = value),
      borderRadius: 8,
      useBackgroundFocus: true,
      disableScale: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selected ? AppColorScheme.accent : Colors.white38,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickSeason(AppLocalizations l10n) async {
    final values = <int>[0, ..._seasonNumbers];
    final current = values.indexOf(_season);
    final picked = await showSeerrOptionPicker(
      context,
      title: l10n.season,
      labels: [
        l10n.allSeasons,
        for (final num in _seasonNumbers) l10n.seasonNumber(num),
      ],
      selectedIndex: current < 0 ? 0 : current,
    );
    if (picked == null || !mounted) return;
    setState(() {
      _season = values[picked];
      _episode = 0;
    });
  }

  Future<void> _pickEpisode(AppLocalizations l10n) async {
    final count = _episodeCount ?? 0;
    final picked = await showSeerrOptionPicker(
      context,
      title: l10n.episode,
      labels: [
        l10n.allEpisodes,
        for (var i = 1; i <= count; i++) l10n.episodeNumber(i),
      ],
      selectedIndex: _episode.clamp(0, count),
    );
    if (picked == null || !mounted) return;
    setState(() => _episode = picked);
  }
}
