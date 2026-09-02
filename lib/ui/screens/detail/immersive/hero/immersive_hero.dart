import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/overview_text.dart';
import '../../../../widgets/logo_view.dart';
import '../../../../widgets/navigation_layout.dart';
import '../../../../widgets/offline_aware_image.dart';
import '../../../../widgets/seerr/seerr_item_status.dart';
import '../../../../widgets/seerr/seerr_status_dot.dart';
import '../../../../widgets/seerr/seerr_status_pill.dart';
import '../../item_detail_screen.dart';

class ImmersiveHero extends StatefulWidget {
  final AggregatedItem item;
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final FocusNode? initialFocusNode;
  final bool autoPlay;
  final bool actionsExpanded;
  final ValueChanged<bool> onActionsExpandedChanged;
  final GlobalKey<DetailActionButtonsState> actionButtonsKey;
  final bool Function()? onNavigateDown;

  const ImmersiveHero({
    super.key,
    required this.item,
    required this.viewModel,
    required this.prefs,
    required this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    required this.initialFocusNode,
    required this.autoPlay,
    required this.actionsExpanded,
    required this.onActionsExpandedChanged,
    required this.actionButtonsKey,
    this.onNavigateDown,
  });

  @override
  State<ImmersiveHero> createState() => ImmersiveHeroState();
}

class ImmersiveHeroState extends State<ImmersiveHero> {
  FocusNode? _lastFocusedAction;
  FocusNode? _primaryHeroAction;

  final FocusNode _overviewFocusNode = FocusNode(
    debugLabel: 'immersiveHeroOverview',
  );

  bool _overviewFocusable = false;

  bool _isPhonePortrait(Size size) {
    return size.height > size.width && size.width < 600;
  }

  double _scaleFor(Size size) {
    if (size.width < 700) {
      return (size.width / 430.0).clamp(0.84, 1.0);
    }

    return (size.width / 1920.0).clamp(0.90, 1.08);
  }

  bool _isInsideHero(FocusNode? node) {
    final nodeContext = node?.context;

    if (nodeContext == null) {
      return false;
    }

    return nodeContext.findAncestorStateOfType<ImmersiveHeroState>() == this;
  }

  bool _isCurrentActionNode(FocusNode? node) {
    if (node == null || !node.canRequestFocus) {
      return false;
    }

    final nodeContext = node.context;

    if (nodeContext == null) {
      return false;
    }

    final currentActionButtonsState = widget.actionButtonsKey.currentState;

    if (currentActionButtonsState == null) {
      return false;
    }

    final actionButtonsState = nodeContext
        .findAncestorStateOfType<DetailActionButtonsState>();

    if (!identical(actionButtonsState, currentActionButtonsState)) {
      return false;
    }

    final renderObject = nodeContext.findRenderObject();

    if (renderObject == null || !renderObject.attached) {
      return false;
    }

    if (renderObject is RenderBox && !renderObject.hasSize) {
      return false;
    }

    return true;
  }

  bool _requestActionFocus(FocusNode? node) {
    if (!_isCurrentActionNode(node)) {
      return false;
    }

    node!.requestFocus();

    return true;
  }

  bool focusBottom() {
    final last = _lastFocusedAction;

    if (_requestActionFocus(last)) {
      return true;
    }

    if (last != null) {
      _lastFocusedAction = null;
    }

    return _requestActionFocus(_primaryHeroAction);
  }

  bool get canFocusBottom {
    return _isCurrentActionNode(_lastFocusedAction) ||
        _isCurrentActionNode(_primaryHeroAction);
  }

  bool get hasFocusWithin {
    return _isInsideHero(FocusManager.instance.primaryFocus);
  }

  void _rememberFocusedAction() {
    final node = FocusManager.instance.primaryFocus;

    if (node == null ||
        node == _overviewFocusNode ||
        !_isInsideHero(node) ||
        !_isCurrentActionNode(node)) {
      return;
    }

    _lastFocusedAction = node;
  }

  void _handleOverviewFocusableChanged(bool focusable) {
    if (!mounted || _overviewFocusable == focusable) {
      return;
    }

    setState(() {
      _overviewFocusable = focusable;
    });
  }

  @override
  void initState() {
    super.initState();

    _primaryHeroAction = widget.initialFocusNode;

    FocusManager.instance.addListener(_rememberFocusedAction);
  }

  @override
  void didUpdateWidget(covariant ImmersiveHero oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialFocusNode != oldWidget.initialFocusNode) {
      _lastFocusedAction = null;
      _primaryHeroAction = widget.initialFocusNode;
    }

    if (widget.item.id != oldWidget.item.id) {
      _lastFocusedAction = null;
      _primaryHeroAction = widget.initialFocusNode;
    }
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_rememberFocusedAction);
    _overviewFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final viewModel = widget.viewModel;
    final textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.sizeOf(context);
    final scale = _scaleFor(size);

    final isPhonePortrait = _isPhonePortrait(size);
    final isCompact = size.width < 700;

    final foreground = AppColorScheme.onSurface;

    final isEpisode = item.type == 'Episode';
    final isSeason = item.type == 'Season';

    final shouldUseSeriesLogo = isEpisode || isSeason;

    final logoTag =
        item.logoImageTag ??
        (shouldUseSeriesLogo ? item.seriesLogoImageTag : null);

    final logoId = logoTag == null
        ? null
        : item.logoImageTag != null
        ? item.id
        : item.seriesId;

    final overview = cleanOverview(item.overview?.trim());

    final hideOverview = hidesMediaDescription(
      itemType: item.type,
      hideMediaDescription: widget.prefs.get(
        UserPreferences.hideDetailsMediaDescription,
      ),
    );

    final genres = item.genres
        .take(3)
        .map((genre) => genre.trim())
        .where((genre) => genre.isNotEmpty)
        .join('  •  ')
        .toUpperCase();

    final genreRowHeight = isPhonePortrait
        ? 13.5
        : (14.5 * scale).clamp(13.0, 15.5);

    final genreBottomSpacing = isPhonePortrait
        ? 14.0
        : (17.0 * scale).clamp(14.0, 19.0);

    final reserveGenreRow =
        genres.isEmpty && (item.type == 'Episode' || item.type == 'Season');

    final metadata = _metadataContent(context, item, scale);

    final technicalDetails = _technicalDetailsContent(item, scale);

    final status = _normalizedSeriesStatus(item);

    final seerrStatus = seerrItemStatus(viewModel);

    final l10n = AppLocalizations.of(context);

    final hasNoteworthySeerr =
        seerrStatus != null &&
        seerrStatusTracks(
          seerrStatus,
          l10n,
        ).any((track) => seerrStatusIsNoteworthy(track.$1));

    final seerrPills = hasNoteworthySeerr
        ? _immersiveSeerrPills(context, seerrStatus, scale)
        : const <Widget>[];

    final hasBadges = status != null || seerrPills.isNotEmpty;

    final heroMaxWidth = isPhonePortrait
        ? size.width
        : isCompact
        ? size.width * 0.90
        : (size.width * 0.36).clamp(540.0, 680.0);

    final descriptionMaxWidth = isPhonePortrait
        ? size.width
        : isCompact
        ? heroMaxWidth
        : (heroMaxWidth * 0.90).clamp(490.0, 590.0);

    final logoMaxWidth = isPhonePortrait
        ? (size.width - 40) * 0.72
        : isCompact
        ? heroMaxWidth * 0.73
        : (480.0 * scale).clamp(432.0, 520.0);

    final logoMaxHeight = isPhonePortrait
        ? 82.0
        : (106.0 * scale).clamp(92.0, 114.0);

    final titleStyle = textTheme.displaySmall?.copyWith(
      color: foreground,
      fontSize: isPhonePortrait ? 32 : (41.0 * scale).clamp(35.0, 44.0),
      fontWeight: FontWeight.w700,
      letterSpacing: isPhonePortrait ? -0.6 : -0.9,
      height: 1.02,
    );

    final overviewStyle = TextStyle(
      color: foreground.withValues(alpha: 0.87),
      fontSize: isPhonePortrait ? 15.5 : (18.0 * scale).clamp(16.0, 19.0),
      fontWeight: FontWeight.w400,
      height: isPhonePortrait ? 1.42 : 1.36,
      letterSpacing: -0.10,
    );

    final logoUrl = logoTag != null && logoId != null
        ? viewModel.imageApi.getLogoImageUrl(
            logoId,
            maxWidth: logoMaxWidth.round(),
            tag: logoTag,
          )
        : null;

    final branding = _ImmersiveBranding(
      title: item.name,
      logoUrl: logoUrl,
      companionTitle: isSeason ? item.name : null,
      titleStyle: titleStyle,
      maxWidth: logoMaxWidth,
      maxHeight: logoMaxHeight,
    );

    final actions = DetailActionButtons(
      key: widget.actionButtonsKey,
      viewModel: viewModel,
      itemId: item.id,
      selectedMediaSourceId: widget.selectedMediaSourceId,
      onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
      tvPlayFocusNode: widget.initialFocusNode,
      autoPlay: widget.autoPlay,
      modernStyle: true,
      immersiveStyle: true,
      fullWidthPrimary: isPhonePortrait,
      actionsExpanded: widget.actionsExpanded,
      onActionsExpandedChanged: widget.onActionsExpandedChanged,
      upTarget: _overviewFocusable && !hideOverview ? _overviewFocusNode : null,
    );

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }

        final key = event.logicalKey;
        final primaryFocus = FocusManager.instance.primaryFocus;

        if (key == LogicalKeyboardKey.arrowUp &&
            primaryFocus == _overviewFocusNode) {
          final focusNavbar = NavigationLayout.focusNavbarNotifier.value;

          if (focusNavbar != null) {
            focusNavbar();
            return KeyEventResult.handled;
          }

          return KeyEventResult.ignored;
        }

        if (key == LogicalKeyboardKey.arrowDown) {
          if (primaryFocus == _overviewFocusNode) {
            return focusBottom()
                ? KeyEventResult.handled
                : KeyEventResult.ignored;
          }

          final callback = widget.onNavigateDown;

          if (callback == null) {
            return KeyEventResult.ignored;
          }

          return callback() ? KeyEventResult.handled : KeyEventResult.ignored;
        }

        return KeyEventResult.ignored;
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: heroMaxWidth),
          child: isPhonePortrait
              ? _buildPhoneContent(
                  context: context,
                  branding: branding,
                  metadata: metadata,
                  status: status,
                  seerrPills: seerrPills,
                  hasBadges: hasBadges,
                  genres: genres,
                  genreRowHeight: genreRowHeight,
                  genreBottomSpacing: genreBottomSpacing,
                  reserveGenreRow: reserveGenreRow,
                  overview: overview,
                  hideOverview: hideOverview,
                  descriptionMaxWidth: descriptionMaxWidth,
                  overviewStyle: overviewStyle,
                  technicalDetails: technicalDetails,
                  actions: actions,
                )
              : _buildStandardContent(
                  context: context,
                  branding: branding,
                  metadata: metadata,
                  status: status,
                  seerrPills: seerrPills,
                  hasBadges: hasBadges,
                  genres: genres,
                  genreRowHeight: genreRowHeight,
                  genreBottomSpacing: genreBottomSpacing,
                  reserveGenreRow: reserveGenreRow,
                  overview: overview,
                  hideOverview: hideOverview,
                  descriptionMaxWidth: descriptionMaxWidth,
                  overviewStyle: overviewStyle,
                  technicalDetails: technicalDetails,
                  actions: actions,
                  scale: scale,
                ),
        ),
      ),
    );
  }

  Widget _buildPhoneContent({
    required BuildContext context,
    required Widget branding,
    required List<Widget> metadata,
    required String? status,
    required List<Widget> seerrPills,
    required bool hasBadges,
    required String genres,
    required double genreRowHeight,
    required double genreBottomSpacing,
    required bool reserveGenreRow,
    required String overview,
    required bool hideOverview,
    required double descriptionMaxWidth,
    required TextStyle overviewStyle,
    required List<Widget> technicalDetails,
    required Widget actions,
  }) {
    final foreground = AppColorScheme.onSurface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (genres.isNotEmpty) ...[
          Text(
            genres,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: foreground.withValues(alpha: 0.64),
              fontSize: genreRowHeight,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
              height: 1.0,
            ),
          ),
          SizedBox(height: genreBottomSpacing),
        ],

        if (reserveGenreRow)
          SizedBox(height: genreRowHeight + genreBottomSpacing),

        branding,

        const SizedBox(height: 22),

        if (hasBadges) ...[
          _badgeRow(
            context,
            status: status,
            seerrPills: seerrPills,
            scale: 0.92,
          ),
          const SizedBox(height: 12),
        ],

        if (metadata.isNotEmpty)
          Wrap(
            spacing: 6,
            runSpacing: 5,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: metadata,
          ),

        if (technicalDetails.isNotEmpty) ...[
          const SizedBox(height: 14),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: technicalDetails,
          ),
        ],

        if (overview.isNotEmpty && !hideOverview) ...[
          const SizedBox(height: 18),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: descriptionMaxWidth),
            child: _ImmersiveOverview(
              text: overview,
              maxLines: 3,
              style: overviewStyle,
              focusNode: _overviewFocusNode,
              onFocusableChanged: _handleOverviewFocusableChanged,
            ),
          ),
        ],

        const SizedBox(height: 24),

        SizedBox(width: double.infinity, child: actions),
      ],
    );
  }

  Widget _buildStandardContent({
    required BuildContext context,
    required Widget branding,
    required List<Widget> metadata,
    required String? status,
    required List<Widget> seerrPills,
    required bool hasBadges,
    required String genres,
    required double genreRowHeight,
    required double genreBottomSpacing,
    required bool reserveGenreRow,
    required String overview,
    required bool hideOverview,
    required double descriptionMaxWidth,
    required TextStyle overviewStyle,
    required List<Widget> technicalDetails,
    required Widget actions,
    required double scale,
  }) {
    final foreground = AppColorScheme.onSurface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (genres.isNotEmpty) ...[
          Text(
            genres,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: foreground.withValues(alpha: 0.64),
              fontSize: genreRowHeight,
              fontWeight: FontWeight.w700,
              letterSpacing: (1.7 * scale).clamp(1.4, 1.9),
              height: 1.0,
            ),
          ),
          SizedBox(height: genreBottomSpacing),
        ],

        if (reserveGenreRow)
          SizedBox(height: genreRowHeight + genreBottomSpacing),

        branding,

        SizedBox(height: (28.0 * scale).clamp(24.0, 30.0)),

        if (hasBadges) ...[
          _badgeRow(
            context,
            status: status,
            seerrPills: seerrPills,
            scale: scale,
          ),
          SizedBox(height: (14.0 * scale).clamp(12.0, 15.0)),
        ],

        if (metadata.isNotEmpty)
          Wrap(
            spacing: (7.0 * scale).clamp(6.0, 8.0),
            runSpacing: (6.0 * scale).clamp(5.0, 7.0),
            crossAxisAlignment: WrapCrossAlignment.center,
            children: metadata,
          ),

        if (technicalDetails.isNotEmpty) ...[
          SizedBox(height: (15.0 * scale).clamp(13.0, 17.0)),
          Wrap(
            spacing: (7.0 * scale).clamp(6.0, 8.0),
            runSpacing: (7.0 * scale).clamp(6.0, 8.0),
            crossAxisAlignment: WrapCrossAlignment.center,
            children: technicalDetails,
          ),
        ],

        if (overview.isNotEmpty && !hideOverview) ...[
          SizedBox(height: (22.0 * scale).clamp(19.0, 24.0)),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: descriptionMaxWidth),
            child: _ImmersiveOverview(
              text: overview,
              maxLines: 3,
              style: overviewStyle,
              focusNode: _overviewFocusNode,
              onFocusableChanged: _handleOverviewFocusableChanged,
            ),
          ),
        ],

        SizedBox(height: (36.0 * scale).clamp(30.0, 38.0)),

        actions,
      ],
    );
  }

  List<Widget> _technicalDetailsContent(AggregatedItem item, double scale) {
    final showTechnicalDetails = widget.prefs.get(
      UserPreferences.detailShowTechnicalDetails,
    );

    if (!showTechnicalDetails) {
      return const [];
    }

    final selectedSource = selectedMediaSourceForItem(
      item,
      widget.selectedMediaSourceId,
    );

    final tech = technicalDetailsFor(item, selectedSource);

    final values = <Widget>[];

    for (final badge in tech.badges) {
      final value = badge.trim();

      if (value.isEmpty) {
        continue;
      }

      values.add(_technicalBadge(value, scale));
    }

    final formattedSize = tech.formattedSize?.trim();

    if (formattedSize != null && formattedSize.isNotEmpty) {
      values.add(_technicalBadge(formattedSize, scale));
    }

    return values;
  }

  Widget _technicalBadge(String text, double scale) {
    final foreground = AppColorScheme.onSurface;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: foreground.withValues(alpha: 0.035),
        borderRadius: AppRadius.circular((6.0 * scale).clamp(5.0, 7.0)),
        border: Border.all(color: foreground.withValues(alpha: 0.10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (10.0 * scale).clamp(9.0, 11.0),
          vertical: (5.0 * scale).clamp(4.5, 6.0),
        ),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: foreground.withValues(alpha: 0.70),
            fontSize: (12.5 * scale).clamp(11.5, 13.5),
            fontWeight: FontWeight.w600,
            height: 1.0,
            letterSpacing: 0.1,
          ),
        ),
      ),
    );
  }

  String? _normalizedSeriesStatus(AggregatedItem item) {
    if (item.type != 'Series') {
      return null;
    }

    final status = item.status?.trim();

    if (status == null || status.isEmpty) {
      return null;
    }

    return switch (status.toLowerCase()) {
      'continuing' => 'continuing',
      'ended' => 'ended',
      _ => null,
    };
  }

  double? _validCommunityRating(double? rating) {
    if (rating == null || !rating.isFinite || rating <= 0 || rating > 10) {
      return null;
    }

    return rating;
  }

  double? _validCriticRating(num? rating) {
    if (rating == null || !rating.isFinite || rating <= 0 || rating > 100) {
      return null;
    }

    return rating.toDouble();
  }

  Duration? _seasonRuntime() {
    final episodes = widget.viewModel.episodes;

    if (episodes.isEmpty) {
      return null;
    }

    var total = Duration.zero;
    var hasRuntime = false;

    for (final episode in episodes) {
      final runtime = episode.runtime;

      if (runtime == null || runtime <= Duration.zero) {
        continue;
      }

      total += runtime;
      hasRuntime = true;
    }

    return hasRuntime ? total : null;
  }

  Duration? _effectiveRuntime(AggregatedItem item) {
    if (item.type == 'Season') {
      return _seasonRuntime() ?? item.runtime;
    }

    return item.runtime;
  }

  String _seasonEndTime(BuildContext context, Duration runtime) {
    final end = DateTime.now().add(runtime);

    return MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay.fromDateTime(end),
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
    );
  }

  List<Widget> _metadataContent(
    BuildContext context,
    AggregatedItem item,
    double scale,
  ) {
    final l10n = AppLocalizations.of(context);
    final foreground = AppColorScheme.onSurface;

    final style = TextStyle(
      color: foreground.withValues(alpha: 0.66),
      fontSize: (16.0 * scale).clamp(14.0, 17.0),
      fontWeight: FontWeight.w500,
      height: 1.1,
    );

    final values = <Widget>[];

    void addSeparator() {
      if (values.isEmpty) {
        return;
      }

      values.add(
        Text(
          '·',
          style: style.copyWith(color: foreground.withValues(alpha: 0.40)),
        ),
      );
    }

    void addText(String? value) {
      if (value == null || value.trim().isEmpty) {
        return;
      }

      addSeparator();
      values.add(Text(value, style: style));
    }

    void addFirstText(String? value) {
      if (value == null || value.trim().isEmpty) {
        return;
      }

      values.add(Text(value, style: style));
    }

    addFirstText(item.productionYear?.toString());

    if (item.officialRating?.trim().isNotEmpty ?? false) {
      addText(item.officialRating);
    }

    if (item.type == 'Series' && item.childCount != null) {
      addText(l10n.seasonCount(item.childCount!));
    }

    if (item.type == 'Season') {
      final episodeCount = widget.viewModel.episodes.isNotEmpty
          ? widget.viewModel.episodes.length
          : (item.childCount ?? 0);

      if (episodeCount > 0) {
        addText(l10n.episodeCount(episodeCount));
      }
    }

    if (item.type == 'Episode') {
      final season = item.parentIndexNumber;
      final episode = item.indexNumber;

      if (season != null && episode != null) {
        addText(l10n.seasonEpisodeLabel(season, episode));
      }
    }

    final runtime = _effectiveRuntime(item);

    if (runtime != null && runtime > Duration.zero && item.type != 'Series') {
      addText(_formatDuration(runtime));

      if (item.type == 'Season') {
        final endTime = _seasonEndTime(context, runtime);

        addText(l10n.endsAt(endTime));
      }
    }

    final communityRating = _validCommunityRating(item.communityRating);

    if (communityRating != null) {
      addSeparator();

      values.add(_inlineCommunityRating(communityRating, style, scale));
    }

    final criticRating = _validCriticRating(item.criticRating);

    if (criticRating != null) {
      addSeparator();

      values.add(_inlineCriticRating(criticRating, style, scale));
    }

    return values;
  }

  Widget _badgeRow(
    BuildContext context, {
    required String? status,
    required List<Widget> seerrPills,
    required double scale,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (status != null) _statusBadge(context, status, scale),

          if (status != null && seerrPills.isNotEmpty)
            SizedBox(width: (9.0 * scale).clamp(8.0, 10.0)),

          for (var index = 0; index < seerrPills.length; index++) ...[
            if (index > 0) SizedBox(width: (9.0 * scale).clamp(8.0, 10.0)),
            _ImmersiveBadgeEntrance(
              key: ValueKey<String>('immersive-seerr-badge-$index'),
              child: seerrPills[index],
            ),
          ],
        ],
      ),
    );
  }

  Widget _inlineCommunityRating(double rating, TextStyle style, double scale) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star_rounded,
          size: (17.0 * scale).clamp(15.0, 18.0),
          color: Colors.amber,
        ),
        SizedBox(width: (3.0 * scale).clamp(2.5, 3.5)),
        Text(rating.toStringAsFixed(1), style: style),
      ],
    );
  }

  Widget _inlineCriticRating(double rating, TextStyle style, double scale) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.reviews_rounded,
          size: (16.0 * scale).clamp(14.0, 17.0),
          color: AppColorScheme.onSurface.withValues(alpha: 0.72),
        ),
        SizedBox(width: (3.0 * scale).clamp(2.5, 3.5)),
        Text('${rating.round()}%', style: style),
      ],
    );
  }

  List<Widget> _immersiveSeerrPills(
    BuildContext context,
    SeerrMediaDetailState state,
    double scale,
  ) {
    final l10n = AppLocalizations.of(context);

    return [
      for (final track in seerrStatusTracks(state, l10n))
        if (seerrStatusIsNoteworthy(track.$1))
          _immersiveSeerrPill(track.$1, track.$2, l10n, scale),
    ];
  }

  Widget _immersiveSeerrPill(
    SeerrQualityStatus track,
    String? qualityLabel,
    AppLocalizations l10n,
    double scale,
  ) {
    final text = qualityLabel == null
        ? seerrStatusLabel(track, l10n)
        : '$qualityLabel · ${seerrStatusLabel(track, l10n)}';

    final effectiveStatus = track.status > SeerrMediaStatus.unknown
        ? track.status
        : track.hasExistingRequest
        ? SeerrMediaStatus.processing
        : SeerrMediaStatus.unknown;

    final color = seerrStatusColor(effectiveStatus);

    final height = (30.0 * scale).clamp(27.0, 32.0);

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: (11.0 * scale).clamp(9.0, 12.0),
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: color.withValues(alpha: 0.90),
          ),
        ),
        borderRadius: AppRadius.circular((6.0 * scale).clamp(5.0, 7.0)),
      ),
      child: Center(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: (13.0 * scale).clamp(11.5, 14.0),
            height: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _statusBadge(BuildContext context, String status, double scale) {
    final l10n = AppLocalizations.of(context);

    final color = status == 'ended'
        ? const Color(0xFFB71C1C)
        : const Color(0xFF2E7D32);

    final label = status == 'ended' ? l10n.ended : l10n.continuing;

    return Container(
      height: (30.0 * scale).clamp(27.0, 32.0),
      padding: EdgeInsets.symmetric(
        horizontal: (11.0 * scale).clamp(9.0, 12.0),
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppRadius.circular((6.0 * scale).clamp(5.0, 7.0)),
      ),
      child: Center(
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: (13.0 * scale).clamp(11.5, 14.0),
            height: 1.0,
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}m';
    }

    if (hours > 0) {
      return '${hours}h';
    }

    return '${duration.inMinutes}m';
  }
}

class _ImmersiveBadgeEntrance extends StatefulWidget {
  final Widget child;

  const _ImmersiveBadgeEntrance({super.key, required this.child});

  @override
  State<_ImmersiveBadgeEntrance> createState() =>
      _ImmersiveBadgeEntranceState();
}

class _ImmersiveBadgeEntranceState extends State<_ImmersiveBadgeEntrance>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(milliseconds: 220);

  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _duration);

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(curved);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(curved);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}

class _ImmersiveOverview extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final FocusNode focusNode;
  final ValueChanged<bool> onFocusableChanged;

  const _ImmersiveOverview({
    required this.text,
    required this.maxLines,
    required this.style,
    required this.focusNode,
    required this.onFocusableChanged,
  });

  @override
  State<_ImmersiveOverview> createState() => _ImmersiveOverviewState();
}

class _ImmersiveOverviewState extends State<_ImmersiveOverview> {
  bool _focused = false;
  bool _hovered = false;
  bool? _lastReportedFocusable;

  bool _isOverflowing(BuildContext context, double maxWidth) {
    if (!maxWidth.isFinite || maxWidth <= 0) {
      return false;
    }

    final painter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      maxLines: widget.maxLines,
      ellipsis: '…',
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout(maxWidth: maxWidth);

    return painter.didExceedMaxLines;
  }

  void _reportFocusable(bool focusable) {
    if (_lastReportedFocusable == focusable) {
      return;
    }

    _lastReportedFocusable = focusable;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      widget.onFocusableChanged(focusable);
    });
  }

  void _setFocused(bool focused) {
    if (!mounted || _focused == focused) {
      return;
    }

    setState(() {
      _focused = focused;
    });
  }

  void _setHovered(bool hovered) {
    if (!mounted || _hovered == hovered) {
      return;
    }

    setState(() {
      _hovered = hovered;
    });
  }

  Future<void> _showFullOverview() async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final theme = Theme.of(dialogContext);
        final foreground = AppColorScheme.onSurface;
        final size = MediaQuery.sizeOf(dialogContext);

        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 720,
              maxHeight: size.height * 0.72,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 18, 18, 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CloseButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.text,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: foreground.withValues(alpha: 0.92),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final foreground = AppColorScheme.onSurface;

    return LayoutBuilder(
      builder: (context, constraints) {
        const horizontalPadding = 10.0;

        final textWidth = constraints.maxWidth.isFinite
            ? (constraints.maxWidth - horizontalPadding * 2)
                  .clamp(0.0, double.infinity)
                  .toDouble()
            : constraints.maxWidth;

        final overflowing = _isOverflowing(context, textWidth);

        _reportFocusable(overflowing);

        return Focus(
          focusNode: widget.focusNode,
          canRequestFocus: overflowing,
          skipTraversal: !overflowing,
          onFocusChange: _setFocused,
          onKeyEvent: (_, event) {
            if (!overflowing ||
                (event is! KeyDownEvent && event is! KeyRepeatEvent)) {
              return KeyEventResult.ignored;
            }

            final key = event.logicalKey;

            if (key == LogicalKeyboardKey.arrowLeft ||
                key == LogicalKeyboardKey.arrowRight) {
              return KeyEventResult.handled;
            }

            if (event is KeyDownEvent &&
                (key == LogicalKeyboardKey.enter ||
                    key == LogicalKeyboardKey.select ||
                    key == LogicalKeyboardKey.space)) {
              _showFullOverview();

              return KeyEventResult.handled;
            }

            return KeyEventResult.ignored;
          },
          child: MouseRegion(
            cursor: overflowing ? SystemMouseCursors.click : MouseCursor.defer,
            onEnter: overflowing ? (_) => _setHovered(true) : null,
            onExit: overflowing ? (_) => _setHovered(false) : null,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: overflowing ? _showFullOverview : null,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    widget.text,
                    maxLines: widget.maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: widget.style,
                  ),
                  if (_focused || _hovered)
                    Positioned.fill(
                      left: -10,
                      right: -10,
                      top: -7,
                      bottom: -7,
                      child: IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: foreground.withValues(alpha: 0.92),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ImmersiveBranding extends StatefulWidget {
  final String title;
  final String? logoUrl;
  final String? companionTitle;
  final TextStyle? titleStyle;
  final double maxWidth;
  final double maxHeight;

  const _ImmersiveBranding({
    required this.title,
    required this.logoUrl,
    required this.companionTitle,
    required this.titleStyle,
    required this.maxWidth,
    required this.maxHeight,
  });

  @override
  State<_ImmersiveBranding> createState() => _ImmersiveBrandingState();
}

class _ImmersiveBrandingState extends State<_ImmersiveBranding> {
  ImageStream? _stream;
  ImageStreamListener? _listener;
  String? _watchedUrl;

  bool _hasWatchedUrl = false;

  _ImmersiveBrandingMode _mode = _ImmersiveBrandingMode.pending;

  bool _animateLogo = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _watchLogo();
  }

  @override
  void didUpdateWidget(covariant _ImmersiveBranding oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.logoUrl != oldWidget.logoUrl) {
      _watchLogo();
    }
  }

  void _watchLogo() {
    final url = widget.logoUrl;

    if (_hasWatchedUrl && url == _watchedUrl) {
      return;
    }

    _hasWatchedUrl = true;
    _watchedUrl = url;

    if (url == null || url.isEmpty) {
      _removeListener();

      _mode = _ImmersiveBrandingMode.fallback;
      _animateLogo = false;

      return;
    }

    _removeListener();

    _mode = _ImmersiveBrandingMode.pending;
    _animateLogo = false;

    final stream = offlineAwareImageProvider(
      url,
    ).resolve(createLocalImageConfiguration(context));

    var resolvingSynchronously = true;

    final listener = ImageStreamListener(
      (_, synchronousCall) {
        if (!mounted) {
          return;
        }

        if (synchronousCall) {
          _mode = _ImmersiveBrandingMode.logo;
          _animateLogo = false;

          return;
        }

        setState(() {
          _mode = _ImmersiveBrandingMode.logo;
          _animateLogo = true;
        });
      },
      onError: (_, _) {
        if (!mounted) {
          return;
        }

        if (resolvingSynchronously) {
          _mode = _ImmersiveBrandingMode.fallback;
          _animateLogo = false;

          return;
        }

        setState(() {
          _mode = _ImmersiveBrandingMode.fallback;
          _animateLogo = false;
        });
      },
    );

    stream.addListener(listener);

    resolvingSynchronously = false;

    _stream = stream;
    _listener = listener;
  }

  void _removeListener() {
    if (_stream != null && _listener != null) {
      _stream!.removeListener(_listener!);
    }

    _stream = null;
    _listener = null;
  }

  Widget _buildLogo() {
    final companionTitle = widget.companionTitle;

    if (companionTitle == null || companionTitle.trim().isEmpty) {
      return Align(
        alignment: Alignment.centerLeft,
        child: LogoView(
          imageUrl: widget.logoUrl,
          maxHeight: widget.maxHeight,
          maxWidth: widget.maxWidth,
        ),
      );
    }

    final logoWidth = widget.maxWidth * 0.42;
    final logoHeight = widget.maxHeight * 0.76;

    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: logoWidth,
            height: widget.maxHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: LogoView(
                imageUrl: widget.logoUrl,
                maxHeight: logoHeight,
                maxWidth: logoWidth,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Flexible(
            child: Text(
              companionTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.titleStyle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _removeListener();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.maxHeight,
      width: widget.maxWidth,
      child: AnimatedSwitcher(
        duration: _animateLogo
            ? const Duration(milliseconds: 220)
            : Duration.zero,
        switchInCurve: Curves.linear,
        switchOutCurve: Curves.linear,
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: switch (_mode) {
          _ImmersiveBrandingMode.logo => KeyedSubtree(
            key: const ValueKey('immersive-logo'),
            child: _buildLogo(),
          ),
          _ImmersiveBrandingMode.fallback => Align(
            key: const ValueKey('immersive-title'),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: widget.titleStyle,
            ),
          ),
          _ImmersiveBrandingMode.pending => const SizedBox(
            key: ValueKey('immersive-branding-pending'),
          ),
        },
      ),
    );
  }
}

enum _ImmersiveBrandingMode { pending, logo, fallback }
