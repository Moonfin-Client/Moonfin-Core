import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/detail_section_layout.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/platform_detection.dart';
import '../../../navigation/destinations.dart';
import '../../../widgets/focus/focusable_button.dart';
import '../../../widgets/fullscreen_backdrop_switcher.dart';
import '../../../widgets/live_tv/incomplete_recording.dart';
import '../../../widgets/rating_display.dart';
import '../../../widgets/seerr/seerr_item_status.dart';
import '../../../widgets/seerr/seerr_request_dialog.dart';
import '../../../widgets/seerr/seerr_status_dot.dart';
import '../../../widgets/seerr/seerr_streaming_row.dart';
import '../detail_layout_metrics.dart';
import '../detail_page.dart';
import '../item_detail_screen.dart';

/// How wide the drawer runs down the right of a TV or a wide screen, which is
/// as much as Play, four circles and the ellipsis need.
double quickLookDrawerWidth(Size size) =>
    (size.width * 0.5).clamp(420.0, 620.0);

Color get _surface => Color.alphaBlend(
  AppColorScheme.onBackground.withValues(alpha: 0.03),
  AppColorScheme.background,
);

/// The drawer down the right of a TV or a wide screen, or the sheet up from
/// the foot of a phone, over a dimmed view of the screen it opened from. A
/// tap on that view closes it.
class QuickLookFrame extends StatelessWidget {
  final Widget child;

  const QuickLookFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final animation =
        ModalRoute.of(context)?.animation ?? kAlwaysCompleteAnimation;
    final landscape = detailUsesLandscapeLayout(context);
    final size = MediaQuery.sizeOf(context);

    final panel = SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: landscape ? const Offset(1, 0) : const Offset(0, 1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
      ),
      child: Material(
        color: _surface,
        // No tint, so the backdrop's fade ends on the drawer's own color.
        surfaceTintColor: Colors.transparent,
        elevation: 16,
        shape: landscape
            ? Border(
                left: BorderSide(
                  color: AppColorScheme.onBackground.withValues(alpha: 0.1),
                ),
              )
            : const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );

    return Stack(
      children: [
        Positioned.fill(
          child: FadeTransition(
            opacity: animation,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).maybePop(),
              child: ColoredBox(color: AppColors.black.withValues(alpha: 0.62)),
            ),
          ),
        ),
        if (landscape)
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            width: quickLookDrawerWidth(size),
            child: panel,
          )
        else
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: size.height * 0.12,
            child: panel,
          ),
      ],
    );
  }
}

/// A title in a drawer rather than a page of its own: the backdrop, the name
/// and its numbers, the buttons, the overview, the tracks, and the seasons or
/// the people behind it, with the full page a press away.
///
/// A title that's only in Seerr gets Request in place of play, and its
/// seasons each open the request dialog.
class QuickLookDetailContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final FocusNode? initialFocusNode;
  final bool autoPlay;
  final bool actionsExpanded;
  final ValueChanged<bool> onActionsExpandedChanged;
  final VoidCallback onOpenFullPage;

  const QuickLookDetailContent({
    super.key,
    required this.viewModel,
    required this.prefs,
    this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    this.initialFocusNode,
    this.autoPlay = false,
    required this.actionsExpanded,
    required this.onActionsExpandedChanged,
    required this.onOpenFullPage,
  });

  @override
  State<QuickLookDetailContent> createState() => _QuickLookDetailContentState();
}

class _QuickLookDetailContentState extends State<QuickLookDetailContent>
    with DetailPage<QuickLookDetailContent> {
  // The stops under the buttons, top to bottom. Rebuilt with the drawer,
  // since which ones exist depends on what loaded.
  List<FocusNode> _stops = const [];

  ItemDetailViewModel get _vm => widget.viewModel;

  @override
  ItemDetailViewModel get pageViewModel => widget.viewModel;

  @override
  UserPreferences get pagePrefs => widget.prefs;

  @override
  ValueChanged<bool>? get pageNavbarToggle => null;

  @override
  void moveUp(FocusNode node) {
    final i = _stops.indexOf(node);
    if (i > 0) return _enter(_stops[i - 1]);
    _toActions();
  }

  @override
  void moveDown(FocusNode node) {
    final i = _stops.indexOf(node);
    if (i >= 0 && i + 1 < _stops.length) _enter(_stops[i + 1]);
  }

  void _enter(FocusNode? node) {
    if (node?.context?.mounted == true) node!.requestFocus();
  }

  void _toActions() {
    final last = lastActionFocus;
    _enter(last?.context?.mounted == true ? last : widget.initialFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;
    if (item == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);
    final landscape = detailUsesLandscapeLayout(context);
    final sections = DetailSectionVisibility.of(widget.prefs);
    final pad = landscape ? 26.0 : 20.0;
    final muted = AppColorScheme.onBackground.withValues(alpha: 0.82);

    // Built before the buttons, so Down from them knows where to land.
    final tracks = tracksSection(l10n, onLeftEdge: () {}, shareRow: landscape);
    final seasons = item.type == 'Series' ? _seasons(l10n) : null;
    final openNode = pageNode('open');
    _stops = [?tracks?.node, ?seasons?.node, openNode];

    final ratings = RatingsRow.forDetailScreen(
      item: item,
      extraRatings: _vm.ratings,
      prefs: widget.prefs,
      labels: false,
    );
    final overview = overviewText(item);
    final facts = item.type == 'Series'
        ? null
        : _facts(item, sections, l10n, landscape);
    final seerrState = seerrItemTabState(_vm);
    final providers =
        seerrState != null &&
            SeerrDetailPieces.resolve(seerrState, sections, l10n).streaming
        ? seerrState.streamingProviders
        : null;

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _title(item, landscape),
        const SizedBox(height: 6),
        DetailMetadataRow(
          item: item,
          selectedMediaSource: selectedMediaSourceForItem(
            item,
            widget.selectedMediaSourceId,
          ),
          upcomingEpisode: _vm.upcomingEpisode,
          seerrStatus: seerrItemStatus(_vm),
        ),
        IncompleteRecordingDetailLine(itemId: item.id),
      ],
    );

    final rest = Padding(
      padding: EdgeInsets.symmetric(horizontal: pad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (ratings != null) ...[
            const SizedBox(height: 10),
            Align(alignment: Alignment.centerLeft, child: ratings),
          ],
          const SizedBox(height: 16),
          _actions(landscape),
          ..._progress(item, l10n, landscape),
          if (overview != null) ...[
            const SizedBox(height: 12),
            Text(
              overview,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: muted, height: 1.5),
            ),
          ],
          if (tracks != null) ...[
            const SizedBox(height: 14),
            // The chips sit below the fold, so they come into view with focus.
            Builder(
              builder: (context) => Focus(
                canRequestFocus: false,
                skipTraversal: true,
                onFocusChange: (focused) {
                  if (focused) reveal(context);
                },
                child: tracks.child,
              ),
            ),
          ],
          if (seasons != null) ...[const SizedBox(height: 14), seasons.child],
          if (facts != null) ...[const SizedBox(height: 14), facts],
          if (providers != null) ...[
            const SizedBox(height: 14),
            SeerrStreamingRow(providers: providers),
          ],
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: pageScroll,
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                landscape
                    ? _drawerHeader(item, info, pad, l10n)
                    : _sheetHeader(item, info, pad),
                rest,
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            pad,
            8,
            pad,
            landscape ? 22 : 16 + MediaQuery.paddingOf(context).bottom,
          ),
          child: _openFullPage(openNode, l10n),
        ),
      ],
    );
  }

  /// The backdrop across the top, faded into the drawer, with the title
  /// block running up over its foot.
  Widget _drawerHeader(
    AggregatedItem item,
    Widget info,
    double pad,
    AppLocalizations l10n,
  ) {
    final url = ownBackdropUrl(item);
    final showImage =
        url != null && widget.prefs.get(UserPreferences.detailsBackdropEnabled);
    final height = MediaQuery.sizeOf(context).height * 0.32;

    return Stack(
      children: [
        if (showImage)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height,
            // The picture would otherwise paint a row past the fade.
            child: ClipRect(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FullscreenBackdropSwitcher(
                    imageUrl: url,
                    duration: const Duration(milliseconds: 250),
                    alignment: const Alignment(0, -0.4),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [_surface.withValues(alpha: 0), _surface],
                        stops: const [0.4, 1],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            pad,
            showImage ? height - 34 : 64,
            pad,
            0,
          ),
          child: info,
        ),
        Positioned(top: 14, right: 14, child: _closeHint(l10n)),
      ],
    );
  }

  /// A TV says Back closes the drawer. Anywhere else there's a button.
  Widget _closeHint(AppLocalizations l10n) {
    if (!PlatformDetection.isTV) {
      return IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.black.withValues(alpha: 0.5),
        ),
        icon: const Icon(Icons.close, color: AppColors.white),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.5),
        borderRadius: AppRadius.circular(999),
      ),
      child: Text(
        l10n.quickLookBackToClose,
        style: TextStyle(
          fontSize: 12,
          color: AppColors.white.withValues(alpha: 0.85),
        ),
      ),
    );
  }

  /// The grab handle, then the poster with the title block beside it.
  Widget _sheetHeader(AggregatedItem item, Widget info, double pad) {
    return Padding(
      padding: EdgeInsets.fromLTRB(pad, 10, pad, 0),
      child: Column(
        children: [
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppColorScheme.onBackground.withValues(alpha: 0.3),
              borderRadius: AppRadius.circular(2),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailPosterImage(
                item: item,
                imageApi: _vm.imageApi,
                size: const Size(84, 126),
              ),
              const SizedBox(width: 14),
              Expanded(child: info),
            ],
          ),
        ],
      ),
    );
  }

  /// The name, or for a season or an episode its show's name and then its
  /// own.
  Widget _title(AggregatedItem item, bool landscape) {
    final partOfShow = item.type == 'Episode' || item.type == 'Season';
    final number = item.type == 'Episode' ? episodeNumber(item) : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          partOfShow ? (item.seriesName ?? item.name) : item.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColorScheme.onBackground,
            fontSize: landscape ? 27 : 22,
            fontWeight: FontWeight.w700,
            height: 1.15,
          ),
        ),
        if (partOfShow) ...[
          const SizedBox(height: 4),
          Text(
            [?number, item.name].join(' · '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColorScheme.onBackground.withValues(alpha: 0.85),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _actions(bool landscape) {
    // Play, four circles and the ellipsis are what fit across the drawer.
    final prefLimit = widget.prefs.get(UserPreferences.detailButtonsMaxVisible);
    final buttons = DetailActionButtons(
      key: actionsKey,
      viewModel: _vm,
      itemId: _vm.item?.id,
      selectedMediaSourceId: widget.selectedMediaSourceId,
      onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
      tvPlayFocusNode: widget.initialFocusNode,
      upTarget: actionsUpProxy,
      downTarget: _stops.firstOrNull,
      onRequestFocus: (target) {
        _enter(target);
        return KeyEventResult.handled;
      },
      autoPlay: widget.autoPlay,
      modernStyle: true,
      fullWidthPrimary: !landscape,
      overflowAsMenu: true,
      maxVisibleButtonsOverride: prefLimit > 0 ? math.min(prefLimit + 1, 6) : 6,
      actionsExpanded: widget.actionsExpanded,
      onActionsExpandedChanged: widget.onActionsExpandedChanged,
      omitTrackButtons: true,
      labelsUnderCircles: landscape,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Up from the buttons has nowhere to go in a drawer.
        Focus(
          focusNode: actionsUpProxy,
          onFocusChange: (focused) {
            if (focused) _toActions();
          },
          child: const SizedBox.shrink(),
        ),
        buttons,
      ],
    );
  }

  List<Widget> _progress(
    AggregatedItem item,
    AppLocalizations l10n,
    bool landscape,
  ) {
    final line = resumeLine(item, l10n);
    if (line == null) return const [];

    final bar = ClipRRect(
      borderRadius: AppRadius.circular(2),
      child: LinearProgressIndicator(
        value: line.fraction,
        minHeight: 4,
        color: AppColorScheme.accent,
        backgroundColor: AppColorScheme.onBackground.withValues(alpha: 0.15),
      ),
    );
    final label = Text(
      line.label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: AppColorScheme.onBackground.withValues(alpha: 0.75),
      ),
    );
    return [
      const SizedBox(height: 12),
      Row(
        children: [
          landscape ? SizedBox(width: 150, child: bar) : Expanded(child: bar),
          const SizedBox(width: 10),
          landscape ? Flexible(child: label) : label,
        ],
      ),
    ];
  }

  /// A show's seasons as cards, each with how much of it was watched. A
  /// season opens its full page, and one that's only in Seerr opens the
  /// request dialog on it.
  DetailPageSection? _seasons(AppLocalizations l10n) {
    final seasons = _vm.seasons;
    if (seasons.isEmpty) return null;
    final node = pageNode('seasons');
    final seerr = _vm.isSeerrOnly ? _vm.seerr : null;
    final status = seerrItemSeasonStatus(_vm);
    final on = AppColorScheme.onBackground;

    Widget card(int index, AggregatedItem season) {
      final number = season.indexNumber ?? 0;
      final total = season.childCount ?? 0;
      final played = total - (season.unplayedItemCount ?? total);
      final hasCount = seerr == null && total > 0;
      return FocusableButton(
        focusNode: index == 0 ? node : null,
        onPressed: () {
          if (seerr != null) {
            showSeerrRequestDialog(
              context: context,
              vm: seerr,
              is4k: false,
              qualityToggle: true,
              season: number > 0 ? number : null,
            );
          } else {
            context.push(
              Destinations.item(
                season.id,
                serverId: season.serverId,
                full: true,
              ),
            );
          }
        },
        onNavigateUp: () => moveUp(node),
        onNavigateDown: () => moveDown(node),
        onNavigateLeft: index == 0 ? () {} : null,
        onNavigateRight: index == seasons.length - 1 ? () {} : null,
        autoScroll: true,
        borderRadius: 10,
        padding: EdgeInsets.zero,
        semanticLabel: season.name,
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: on.withValues(alpha: 0.06),
            borderRadius: AppRadius.circular(10),
            border: Border.all(color: on.withValues(alpha: 0.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      season.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: on,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (hasCount)
                    Text(
                      l10n.quickLookSeasonPlayed(played, total),
                      style: TextStyle(
                        color: on.withValues(alpha: 0.7),
                        fontSize: 12,
                      ),
                    ),
                  if (seerr != null)
                    SeerrStatusDot(status: status[number], size: 14),
                ],
              ),
              if (hasCount) ...[
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: AppRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: played / total,
                    minHeight: 3,
                    color: AppColorScheme.accent,
                    backgroundColor: on.withValues(alpha: 0.15),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return DetailPageSection(
      node: node,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const gap = 8.0;
          final count = seasons.length;
          // Three share the width, and past that the fourth peeks in from the
          // edge to say there are more.
          final width = count <= 3
              ? (constraints.maxWidth - gap * (count - 1)) / count
              : (constraints.maxWidth - gap * 2) / 3.3;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              spacing: gap,
              children: [
                for (final (index, season) in seasons.indexed)
                  SizedBox(width: width, child: card(index, season)),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Who made it and when it came out, a column each.
  Widget? _facts(
    AggregatedItem item,
    DetailSectionVisibility sections,
    AppLocalizations l10n,
    bool landscape,
  ) {
    String? first(List<Map<String, dynamic>> people) =>
        people.firstOrNull?['Name'] as String?;
    final crew = sections.shows(DetailSection.crew);
    final director = crew ? first(_vm.directors) : null;
    final writer = crew ? first(_vm.writers) : null;
    final studio = sections.shows(DetailSection.studios)
        ? first(item.studios)
        : null;
    final released = item.premiereDate;

    final facts = [
      if (director != null) (l10n.director, director),
      if (writer != null) (l10n.writer, writer),
      if (studio != null) (l10n.studio, studio),
      if (released != null)
        (
          l10n.releaseDateLabel.toUpperCase(),
          DateFormat.yMMMd(Localizations.localeOf(context).toString())
              .format(released),
        ),
    ].take(landscape ? 4 : 3);
    if (facts.isEmpty) return null;

    final on = AppColorScheme.onBackground;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (label, value) in facts)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: on.withValues(alpha: 0.14)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: on.withValues(alpha: 0.6),
                      fontSize: 10,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: on,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _openFullPage(FocusNode node, AppLocalizations l10n) {
    final on = AppColorScheme.onBackground;
    return FocusableButton(
      key: const ValueKey('quick-look-open'),
      focusNode: node,
      onPressed: widget.onOpenFullPage,
      // It sits under the scrolling part, so arriving here shows the end of it.
      onFocusChange: (focused) {
        if (focused && pageScroll.hasClients) {
          pageScroll.animateTo(
            pageScroll.position.maxScrollExtent,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
          );
        }
      },
      onNavigateUp: () => moveUp(node),
      onNavigateDown: () {},
      onNavigateLeft: () {},
      onNavigateRight: () {},
      borderRadius: 23,
      padding: EdgeInsets.zero,
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular(23),
          border: Border.all(color: on.withValues(alpha: 0.25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.quickLookOpenFullPage,
              style: TextStyle(
                color: on,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            Icon(Icons.chevron_right, size: 18, color: on),
          ],
        ),
      ),
    );
  }
}
