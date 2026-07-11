import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/services/seerr/seerr_download_progress.dart';
import '../../../data/services/seerr/seerr_models.dart';
import '../../../data/viewmodels/seerr_issues_view_model.dart';
import '../../../data/viewmodels/seerr_requests_view_model.dart';
import '../../mixins/focus_state_mixin.dart';
import '../../navigation/destinations.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/adaptive/adaptive_glass.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/seerr_download_progress_bar.dart';
import '../../widgets/seerr/seerr_text_field.dart';
import '../../widgets/seerr/seerr_tv_controls.dart';
import '../../widgets/track_selector_dialog.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/focus/request_initial_focus.dart';

const _tmdbPosterBase = 'https://image.tmdb.org/t/p/w200';

double _uiScale() => PlatformDetection.useDesktopUi
    ? GetIt.instance<UserPreferences>()
          .get(UserPreferences.desktopUiScale)
          .scaleFactor
    : 1.0;

/// Foreground that stays readable on a filled status-colored button.
Color _onStatusColor(Color background) =>
    ThemeData.estimateBrightnessForColor(background) == Brightness.light
    ? Colors.black87
    : Colors.white;

class SeerrRequestsScreen extends StatefulWidget {
  final int initialTab;

  const SeerrRequestsScreen({super.key, this.initialTab = 0});

  @override
  State<SeerrRequestsScreen> createState() => _SeerrRequestsScreenState();
}

class _SeerrRequestsScreenState extends State<SeerrRequestsScreen>
    with RouteAware {
  SeerrRequestsViewModel? _requestsVm;
  SeerrIssuesViewModel? _issuesVm;
  bool _initializing = true;
  int _tab = 0;
  bool _issuesLoaded = false;
  final _requestsScroll = ScrollController();
  final _issuesScroll = ScrollController();
  final _animatedRequestIds = <int>{};
  final _animatedIssueIds = <int>{};

  @override
  void initState() {
    super.initState();
    _tab = widget.initialTab;
    _issuesLoaded = _tab == 1;
    _requestsScroll.addListener(_onRequestsScroll);
    _issuesScroll.addListener(_onIssuesScroll);
    _init();
  }

  Future<void> _init() async {
    final repo = await GetIt.instance.getAsync<SeerrRepository>();
    final prefs = GetIt.instance<SeerrPreferences>();
    final requestsVm = SeerrRequestsViewModel(repo, prefs);
    final issuesVm = SeerrIssuesViewModel(repo);
    requestsVm.addListener(_onChanged);
    issuesVm.addListener(_onChanged);

    if (!mounted) {
      requestsVm.dispose();
      issuesVm.dispose();
      return;
    }

    setState(() {
      _requestsVm = requestsVm;
      _issuesVm = issuesVm;
      _initializing = false;
    });

    requestsVm.load();
    if (_issuesLoaded) {
      issuesVm.load();
    } else {
      issuesVm.loadCounts();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null) {
      routeLifecycleObserver.unsubscribe(this);
      routeLifecycleObserver.subscribe(this, route);
    }
  }

  @override
  void didPopNext() {
    // Coming back from a detail screen where a request may have changed.
    if (_tab == 0) {
      _requestsVm?.refresh();
    } else {
      _issuesVm?.refresh();
    }
  }

  @override
  void dispose() {
    routeLifecycleObserver.unsubscribe(this);
    _requestsScroll.dispose();
    _issuesScroll.dispose();
    _requestsVm?.removeListener(_onChanged);
    _requestsVm?.dispose();
    _issuesVm?.removeListener(_onChanged);
    _issuesVm?.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  void _onRequestsScroll() {
    if (_requestsScroll.position.extentAfter < 400) {
      _requestsVm?.loadMore();
    }
  }

  void _onIssuesScroll() {
    if (_issuesScroll.position.extentAfter < 400) {
      _issuesVm?.loadMore();
    }
  }

  void _selectTab(int tab) {
    if (tab == _tab) return;
    setState(() => _tab = tab);
    if (tab == 1 && !_issuesLoaded) {
      _issuesLoaded = true;
      _issuesVm?.load();
    }
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        child: _buildBody(),
      ),
    );
  }

  double get _leftInset {
    final prefs = GetIt.instance<UserPreferences>();
    final navbarPosition = prefs.get(UserPreferences.navbarPosition);
    final navbarIsLeft = navbarPosition == NavbarPosition.left;
    return (navbarIsLeft && !PlatformDetection.useMobileUi) ? 72.0 : 16.0;
  }

  Widget _buildBody() {
    final l10n = AppLocalizations.of(context);
    if (_initializing || _requestsVm == null || _issuesVm == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final prefs = GetIt.instance<UserPreferences>();
    final navbarIsTop =
        prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final navbarHeight = navbarIsTop
        ? (PlatformDetection.isTV
              ? 95.0
              : PlatformDetection.useMobileUi
              ? 60.0
              : 80.0)
        : 0.0;
    final topInset = MediaQuery.of(context).padding.top + navbarHeight;
    // Without a top navbar the floating back button shares the tab row, so
    // the tabs shift right to clear it.
    final tabsLeft = navbarIsTop ? _leftInset : _leftInset + 56;

    final openIssues = _issuesVm!.state.counts?.open;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(tabsLeft, topInset + 16, 16, 0),
          child: Row(
            children: [
              _HubTab(
                label: l10n.seerrRequestsTitle,
                count: _tab == 0 ? null : _requestsVm!.state.counts?.pending,
                selected: _tab == 0,
                onTap: () => _selectTab(0),
              ),
              const SizedBox(width: 20),
              _HubTab(
                label: l10n.seerrIssuesTitle,
                count: openIssues != null && openIssues > 0 ? openIssues : null,
                selected: _tab == 1,
                onTap: () => _selectTab(1),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: IndexedStack(
            index: _tab,
            children: [
              _buildRequestsTab(),
              _buildIssuesTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRequestsTab() {
    final l10n = AppLocalizations.of(context);
    final vm = _requestsVm!;
    final s = vm.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRequestFilters(vm),
        Expanded(child: _buildRequestsList(vm, s, l10n)),
      ],
    );
  }

  Widget _buildRequestFilters(SeerrRequestsViewModel vm) {
    final l10n = AppLocalizations.of(context);
    final s = vm.state;
    final counts = s.counts;

    String filterLabel(SeerrRequestFilter f) => switch (f) {
      SeerrRequestFilter.all => l10n.all,
      SeerrRequestFilter.pending => l10n.pendingStatus,
      SeerrRequestFilter.approved => l10n.approvedStatus,
      SeerrRequestFilter.processing => l10n.processingStatus,
      SeerrRequestFilter.available => l10n.seerrAvailableStatus,
      SeerrRequestFilter.failed => l10n.failedStatus,
    };

    final pendingCount = s.canManageRequests ? counts?.pending : null;

    return Padding(
      padding: EdgeInsets.fromLTRB(_leftInset, 4, 16, 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final f in SeerrRequestFilter.values) ...[
              _HubChip(
                label: filterLabel(f),
                count: f == SeerrRequestFilter.pending ? pendingCount : null,
                selected: s.filter == f,
                onTap: () => vm.setFilter(f),
              ),
              const SizedBox(width: 8),
            ],
            const SizedBox(width: 8),
            _HubChip(
              label: s.sort == 'added'
                  ? '${l10n.sortBy}: ${l10n.sortNewest}'
                  : '${l10n.sortBy}: ${l10n.sortLastModified}',
              selected: false,
              onTap: () =>
                  vm.setSort(s.sort == 'added' ? 'modified' : 'added'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsList(
    SeerrRequestsViewModel vm,
    SeerrRequestsState s,
    AppLocalizations l10n,
  ) {
    if (s.isLoading) {
      return _buildSkeletonList();
    }

    if (s.error != null) {
      return _buildError(s.error!, vm.load);
    }

    if (s.requests.isEmpty) {
      return Center(
        child: Text(
          l10n.noRequests,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.54),
          ),
        ),
      );
    }

    final disableAnimations = MediaQuery.of(context).disableAnimations;
    return RefreshIndicator(
      onRefresh: vm.refresh,
      child: ListView.builder(
        controller: _requestsScroll,
        padding: EdgeInsets.fromLTRB(_leftInset, 8, 16, 80),
        itemCount: s.requests.length + (s.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= s.requests.length) {
            return const _LoaderRow();
          }
          final req = s.requests[index];
          final animate =
              !disableAnimations && !_animatedRequestIds.contains(req.id);
          if (animate) _animatedRequestIds.add(req.id);
          return _Entrance(
            key: ValueKey('req-${req.id}'),
            animate: animate,
            slot: index.clamp(0, 8),
            child: _RequestCard(
              request: req,
              summary: s.summaryFor(req),
              canManage: s.canManageRequests,
              isActioning: s.actioningRequestId == req.id,
              onTap: () => _onRequestTap(req),
              onApprove: () => vm.approveRequest(req.id),
              onDecline: () => vm.declineRequest(req.id),
              onRetry: () => vm.retryRequest(req.id),
            ),
          );
        },
      ),
    );
  }

  void _onRequestTap(SeerrRequest request) {
    final media = request.media;
    if (media == null) return;
    final tmdbId = media.tmdbId;
    if (tmdbId == null) return;
    context.push(
      Destinations.seerrMedia(tmdbId.toString()),
      extra: {'mediaType': request.type},
    );
  }

  Widget _buildIssuesTab() {
    final l10n = AppLocalizations.of(context);
    final vm = _issuesVm!;
    final s = vm.state;

    // The IndexedStack builds this before the tab is first opened.
    if (!_issuesLoaded) {
      return const SizedBox.shrink();
    }

    String filterLabel(SeerrIssueFilter f) => switch (f) {
      SeerrIssueFilter.open => l10n.openStatus,
      SeerrIssueFilter.resolved => l10n.resolvedStatus,
      SeerrIssueFilter.all => l10n.all,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(_leftInset, 4, 16, 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final f in SeerrIssueFilter.values) ...[
                  _HubChip(
                    label: filterLabel(f),
                    count: f == SeerrIssueFilter.open ? s.counts?.open : null,
                    selected: s.filter == f,
                    onTap: () => vm.setFilter(f),
                  ),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
        ),
        Expanded(child: _buildIssuesList(vm, s, l10n)),
      ],
    );
  }

  Widget _buildIssuesList(
    SeerrIssuesViewModel vm,
    SeerrIssuesState s,
    AppLocalizations l10n,
  ) {
    if (s.isLoading) {
      return _buildSkeletonList();
    }

    if (s.error != null) {
      return _buildError(s.error!, vm.load);
    }

    if (s.issues.isEmpty) {
      return Center(
        child: Text(
          l10n.noIssues,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.54),
          ),
        ),
      );
    }

    final disableAnimations = MediaQuery.of(context).disableAnimations;
    return RefreshIndicator(
      onRefresh: vm.refresh,
      child: ListView.builder(
        controller: _issuesScroll,
        padding: EdgeInsets.fromLTRB(_leftInset, 8, 16, 80),
        itemCount: s.issues.length + (s.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= s.issues.length) {
            return const _LoaderRow();
          }
          final issue = s.issues[index];
          final animate =
              !disableAnimations && !_animatedIssueIds.contains(issue.id);
          if (animate) _animatedIssueIds.add(issue.id);
          return _Entrance(
            key: ValueKey('issue-${issue.id}'),
            animate: animate,
            slot: index.clamp(0, 8),
            child: _IssueCard(
              issue: issue,
              summary: s.summaryFor(issue),
              canResolve: vm.canResolve(issue),
              isActioning: s.actioningIssueId == issue.id,
              onTap: () => _showIssueDialog(issue),
              onResolve: () => issue.isOpen
                  ? vm.resolveIssue(issue.id)
                  : vm.reopenIssue(issue.id),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkeletonList() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(_leftInset, 8, 16, 80),
      children: const [
        _SkeletonCard(),
        _SkeletonCard(),
        _SkeletonCard(),
        _SkeletonCard(),
        _SkeletonCard(),
      ],
    );
  }

  Widget _buildError(String error, Future<void> Function() onRetry) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: Text(l10n.retry)),
        ],
      ),
    );
  }

  void _showIssueDialog(SeerrIssue issue) {
    final vm = _issuesVm!;
    vm.loadIssueDetails(issue.id);
    final l10n = AppLocalizations.of(context);
    final media = issue.media;
    final title = media?.title ??
        media?.name ??
        vm.state.summaryFor(issue)?.title ??
        l10n.seerrIssuesTitle;
    showStyledPlayerDialog<void>(
      context,
      title: title,
      builder: (ctx) => _IssueThreadDialog(vm: vm, issueId: issue.id),
    );
  }
}

String _issueTypeLabel(AppLocalizations l10n, int type) => switch (type) {
  SeerrIssue.typeVideo => l10n.issueTypeVideo,
  SeerrIssue.typeAudio => l10n.issueTypeAudio,
  SeerrIssue.typeSubtitles => l10n.subtitles,
  _ => l10n.other,
};

String _issueScopeLabel(AppLocalizations l10n, SeerrIssue issue) {
  if (issue.problemSeason <= 0) return '';
  if (issue.problemEpisode <= 0) {
    return l10n.seasonNumber(issue.problemSeason);
  }
  return l10n.seasonEpisodeLabel(issue.problemSeason, issue.problemEpisode);
}

/// One-shot fade and slide entrance, staggered by [slot].
class _Entrance extends StatefulWidget {
  final bool animate;
  final int slot;
  final Widget child;

  const _Entrance({
    super.key,
    required this.animate,
    required this.slot,
    required this.child,
  });

  @override
  State<_Entrance> createState() => _EntranceState();
}

class _EntranceState extends State<_Entrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  @override
  void initState() {
    super.initState();
    if (!widget.animate) {
      _controller.value = 1;
    } else {
      Future.delayed(Duration(milliseconds: 30 * widget.slot), () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeOut.transform(_controller.value);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 12 * (1 - t)),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class _LoaderRow extends StatelessWidget {
  const _LoaderRow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

/// Pulsing placeholder card shown while a tab loads.
class _SkeletonCard extends StatefulWidget {
  const _SkeletonCard();

  @override
  State<_SkeletonCard> createState() => _SkeletonCardState();
}

class _SkeletonCardState extends State<_SkeletonCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = _uiScale();
    final radius = ThemeRegistry.active.borders.cardRadius;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final alpha = 0.05 + 0.08 * _controller.value;
        final fill = AppColorScheme.onSurface.withValues(alpha: alpha);
        Widget bar(double width, double height) => Container(
          width: width * scale,
          height: height * scale,
          decoration: BoxDecoration(
            color: fill,
            borderRadius: AppRadius.circular(4),
          ),
        );
        return Container(
          height: 140 * scale,
          margin: EdgeInsets.only(bottom: 12 * scale),
          decoration: BoxDecoration(
            color: AppColorScheme.onSurface.withValues(alpha: 0.04),
            borderRadius: radius,
          ),
          child: Row(
            children: [
              Container(
                width: 93 * scale,
                decoration: BoxDecoration(
                  color: fill,
                  borderRadius: BorderRadius.only(
                    topLeft: radius.topLeft,
                    bottomLeft: radius.bottomLeft,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12 * scale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bar(180, 14),
                    SizedBox(height: 10 * scale),
                    bar(70, 10),
                    const Spacer(),
                    bar(120, 10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HubTab extends StatefulWidget {
  final String label;
  final int? count;
  final bool selected;
  final VoidCallback onTap;

  const _HubTab({
    required this.label,
    this.count,
    required this.selected,
    required this.onTap,
  });

  @override
  State<_HubTab> createState() => _HubTabState();
}

class _HubTabState extends State<_HubTab> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final scale = _uiScale();
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: widget.selected
                      ? AppColorScheme.accent
                      : showFocusBorder
                      ? focusColor
                      : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.selected || showFocusBorder
                        ? AppColorScheme.onSurface
                        : AppColorScheme.onSurface.withValues(alpha: 0.54),
                    fontSize: 17 * scale,
                    fontWeight: widget.selected
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
                if (widget.count != null && widget.count! > 0) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: AppColorScheme.accent.withValues(alpha: 0.2),
                      borderRadius: AppRadius.circular(10),
                    ),
                    child: Text(
                      '${widget.count}',
                      style: TextStyle(
                        color: AppColorScheme.accent,
                        fontSize: 12 * scale,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HubChip extends StatefulWidget {
  final String label;
  final int? count;
  final bool selected;
  final VoidCallback onTap;

  const _HubChip({
    required this.label,
    this.count,
    required this.selected,
    required this.onTap,
  });

  @override
  State<_HubChip> createState() => _HubChipState();
}

class _HubChipState extends State<_HubChip> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final scale = _uiScale();
    final label = widget.count != null && widget.count! > 0
        ? '${widget.label} (${widget.count})'
        : widget.label;
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
              padding: EdgeInsets.symmetric(
                horizontal: 12 * scale,
                vertical: 6 * scale,
              ),
              decoration: BoxDecoration(
                color: widget.selected
                    ? AppColorScheme.accent.withValues(alpha: 0.18)
                    : ThemeRegistry.active.borders.chipBackground,
                borderRadius: ThemeRegistry.active.borders.chipRadius,
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: showFocusBorder
                        ? focusColor
                        : widget.selected
                        ? AppColorScheme.accent.withValues(alpha: 0.6)
                        : ThemeRegistry.active.borders.chipBorder.color,
                    width: showFocusBorder ? 2 : 1,
                  ),
                ),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13 * scale,
                  color: widget.selected
                      ? AppColorScheme.onSurface
                      : AppColorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final FocusNode? focusNode;
  final VoidCallback? onPressed;

  const _CardActionButton({
    required this.label,
    required this.icon,
    required this.color,
    this.focusNode,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final scale = _uiScale();
    final button = TextButton.icon(
      onPressed: onPressed,
      focusNode: focusNode,
      icon: Icon(icon, size: 16 * scale, color: color),
      label: Text(
        label,
        style: TextStyle(color: color, fontSize: 12.5 * scale),
      ),
      style:
          TextButton.styleFrom(
            backgroundColor: color.withValues(alpha: 0.12),
            padding: EdgeInsets.symmetric(
              horizontal: 10 * scale,
              vertical: 6 * scale,
            ),
            minimumSize: Size(0, 32 * scale),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(8)),
          ).copyWith(
            side: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.focused)
                  ? BorderSide(color: color, width: 2)
                  : BorderSide.none,
            ),
          ),
    );

    final node = focusNode;
    if (node == null) return button;
    return ListenableBuilder(
      listenable: node,
      builder: (context, child) => AnimatedScale(
        scale: node.hasFocus ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: child,
      ),
      child: button,
    );
  }
}

/// Routes left and right presses between a card and its inline action
/// buttons. Directional traversal skips the buttons because they sit inside
/// the focused card's own bounds.
class _CardActionFocus extends StatelessWidget {
  final FocusNode cardFocus;
  final List<FocusNode> actionFocuses;
  final Widget child;

  const _CardActionFocus({
    required this.cardFocus,
    required this.actionFocuses,
    required this.child,
  });

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final actions = actionFocuses.where((n) => n.context != null).toList();
    if (actions.isEmpty) return KeyEventResult.ignored;
    final actionIndex = actions.indexWhere((n) => n.hasFocus);

    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      if (actionIndex == -1 && cardFocus.hasFocus) {
        actions.first.requestFocus();
        return KeyEventResult.handled;
      }
      if (actionIndex >= 0 && actionIndex < actions.length - 1) {
        actions[actionIndex + 1].requestFocus();
        return KeyEventResult.handled;
      }
      if (actionIndex == actions.length - 1) {
        return KeyEventResult.handled;
      }
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      if (actionIndex > 0) {
        actions[actionIndex - 1].requestFocus();
        return KeyEventResult.handled;
      }
      if (actionIndex == 0) {
        cardFocus.requestFocus();
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      skipTraversal: true,
      canRequestFocus: false,
      onKeyEvent: _onKey,
      child: child,
    );
  }
}

/// Glass-aware card shell with themed border, focus glow, and hover/focus
/// scale shared by request and issue cards.
class _HubCardShell extends StatelessWidget {
  final bool highlighted;
  final Color highlightColor;
  final bool expandOnFocus;
  final Widget child;

  const _HubCardShell({
    required this.highlighted,
    required this.highlightColor,
    required this.expandOnFocus,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final borders = ThemeRegistry.active.borders;
    final radius = borders.cardRadius;
    final scale = _uiScale();
    return AnimatedScale(
      scale: highlighted && expandOnFocus ? 1.02 : 1.0,
      duration: const Duration(milliseconds: 120),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        margin: EdgeInsets.only(bottom: 12 * scale),
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.fromBorderSide(
            highlighted
                ? borders.focusBorder.copyWith(color: highlightColor)
                : borders.cardBorder,
          ),
          boxShadow: highlighted ? borders.focusGlow : null,
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: adaptiveGlass(
            context: context,
            fallbackColor: AppColorScheme.surface.withValues(alpha: 0.85),
            cornerRadius: radius.topLeft.x,
            child: Material(
              type: MaterialType.transparency,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _TypeBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final scale = _uiScale();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6 * scale, vertical: 2 * scale),
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColorScheme.onBadge,
          fontSize: 9.5 * scale,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _RequestCard extends StatefulWidget {
  final SeerrRequest request;
  final SeerrMediaSummary? summary;
  final bool canManage;
  final bool isActioning;
  final VoidCallback? onTap;
  final VoidCallback? onApprove;
  final VoidCallback? onDecline;
  final VoidCallback? onRetry;

  const _RequestCard({
    required this.request,
    this.summary,
    required this.canManage,
    required this.isActioning,
    this.onTap,
    this.onApprove,
    this.onDecline,
    this.onRetry,
  });

  @override
  State<_RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<_RequestCard> with FocusStateMixin {
  final _cardFocus = FocusNode(debugLabel: 'request-card');
  final _approveFocus = FocusNode(debugLabel: 'request-approve');
  final _declineFocus = FocusNode(debugLabel: 'request-decline');
  final _retryFocus = FocusNode(debugLabel: 'request-retry');

  SeerrRequest get request => widget.request;

  @override
  void dispose() {
    _cardFocus.dispose();
    _approveFocus.dispose();
    _declineFocus.dispose();
    _retryFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final media = request.media;
    final posterPath = media?.posterPath ?? widget.summary?.posterPath;
    final title =
        media?.title ?? media?.name ?? widget.summary?.title ?? l10n.unknown;
    final requester = request.requestedBy?.bestName ?? l10n.unknown;
    final date = request.createdAt?.split('T').first ?? '';

    return _CardActionFocus(
      cardFocus: _cardFocus,
      actionFocuses: [_approveFocus, _declineFocus, _retryFocus],
      child: MouseRegion(
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: _HubCardShell(
          highlighted: showFocusBorder,
          highlightColor: focusColor,
          expandOnFocus: cardFocusExpansion,
          child: _buildCard(l10n, posterPath, title, requester, date),
        ),
      ),
    );
  }

  Widget _buildCard(
    AppLocalizations l10n,
    String? posterPath,
    String title,
    String requester,
    String date,
  ) {
    final scale = _uiScale();
    final onSurface = AppColorScheme.onSurface;
    final isTv = request.type == 'tv';
    final typeLabel = (isTv ? l10n.series : l10n.movie).toUpperCase();
    final modifier = request.modifiedBy?.bestName;
    final downloadSummary = SeerrDownloadSummary.forRequest(request);

    return InkWell(
      onTap: widget.onTap,
      focusNode: _cardFocus,
      onFocusChange: setFocused,
      child: SizedBox(
        height: 140 * scale,
        child: Row(
          children: [
            SizedBox(
              width: 93 * scale,
              child: posterPath != null
                  ? CachedNetworkImage(
                      imageUrl: '$_tmdbPosterBase$posterPath',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      placeholder: (_, _) =>
                          ColoredBox(color: AppColorScheme.surfaceVariant),
                    )
                  : Container(
                      color: AppColorScheme.surfaceVariant,
                      child: Icon(
                        Icons.movie,
                        color: onSurface.withValues(alpha: 0.24),
                        size: 40 * scale,
                      ),
                    ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12 * scale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: onSurface,
                        fontSize: 15 * scale,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6 * scale),
                    Row(
                      children: [
                        _TypeBadge(
                          label: request.is4k ? '$typeLabel · 4K' : typeLabel,
                          color: isTv
                              ? AppColorScheme.mediaTypeBadgeShow
                              : AppColorScheme.mediaTypeBadgeMovie,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _StatusChip(request: request),
                        const Spacer(),
                        if (date.isNotEmpty)
                          Text(
                            date,
                            style: TextStyle(
                              color: onSurface.withValues(alpha: 0.38),
                              fontSize: 11 * scale,
                            ),
                          ),
                      ],
                    ),
                    if (downloadSummary != null) ...[
                      SizedBox(height: 4 * scale),
                      SeerrDownloadProgressBar(
                        summary: downloadSummary,
                        scale: scale,
                      ),
                    ],
                    SizedBox(height: 4 * scale),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            modifier != null
                                ? '${l10n.requestedByName(requester)} · ${l10n.modifiedByName(modifier)}'
                                : l10n.requestedByName(requester),
                            style: TextStyle(
                              color: onSurface.withValues(alpha: 0.54),
                              fontSize: 12 * scale,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (widget.isActioning)
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: onSurface,
                            ),
                          )
                        else if (widget.canManage &&
                            request.status == SeerrRequest.statusPending) ...[
                          _CardActionButton(
                            label: l10n.approve,
                            icon: Icons.check_circle_outline,
                            color: AppColorScheme.statusAvailable,
                            focusNode: _approveFocus,
                            onPressed: widget.onApprove,
                          ),
                          const SizedBox(width: 6),
                          _CardActionButton(
                            label: l10n.declineAction,
                            icon: Icons.cancel_outlined,
                            color: AppColorScheme.statusError,
                            focusNode: _declineFocus,
                            onPressed: widget.onDecline,
                          ),
                        ] else if (widget.canManage &&
                            request.status == SeerrRequest.statusFailed)
                          _CardActionButton(
                            label: l10n.retry,
                            icon: Icons.refresh,
                            color: AppColorScheme.statusPending,
                            focusNode: _retryFocus,
                            onPressed: widget.onRetry,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusPill({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final scale = _uiScale();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8 * scale, vertical: 3 * scale),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: AppRadius.circular(4),
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: color.withValues(alpha: 0.4),
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11 * scale,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final SeerrRequest request;

  const _StatusChip({required this.request});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final (label, color) = _statusInfo(l10n);
    return _StatusPill(label: label, color: color);
  }

  /// Mirrors the seerr web UI: the request's own status wins only for
  /// declined and failed, everything else reflects the media status.
  (String, Color) _statusInfo(AppLocalizations l10n) {
    if (request.status == SeerrRequest.statusDeclined) {
      return (l10n.declinedStatus, AppColorScheme.statusError);
    }
    if (request.status == SeerrRequest.statusFailed) {
      return (l10n.failedStatus, AppColorScheme.statusError);
    }
    if (request.status == SeerrRequest.statusCompleted) {
      return (l10n.seerrAvailableStatus, AppColorScheme.statusAvailable);
    }
    return switch (request.media?.status) {
      2 => (l10n.pendingStatus, AppColorScheme.statusPending),
      3 => (l10n.seerrRequestedStatus, AppColorScheme.statusRequested),
      4 => (l10n.partiallyAvailable, AppColorScheme.statusAvailable),
      5 => (l10n.seerrAvailableStatus, AppColorScheme.statusAvailable),
      6 => (l10n.blocklistedStatus, AppColorScheme.statusError),
      7 => (l10n.deletedStatus, AppColorScheme.statusError),
      _ => request.status == SeerrRequest.statusPending
          ? (l10n.pendingStatus, AppColorScheme.statusPending)
          : (l10n.approvedStatus, AppColorScheme.accent),
    };
  }
}

class _IssueCard extends StatefulWidget {
  final SeerrIssue issue;
  final SeerrMediaSummary? summary;
  final bool canResolve;
  final bool isActioning;
  final VoidCallback? onTap;
  final VoidCallback? onResolve;

  const _IssueCard({
    required this.issue,
    this.summary,
    required this.canResolve,
    required this.isActioning,
    this.onTap,
    this.onResolve,
  });

  @override
  State<_IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<_IssueCard> with FocusStateMixin {
  final _cardFocus = FocusNode(debugLabel: 'issue-card');
  final _resolveFocus = FocusNode(debugLabel: 'issue-resolve');

  SeerrIssue get issue => widget.issue;

  @override
  void dispose() {
    _cardFocus.dispose();
    _resolveFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final media = issue.media;
    final posterPath = media?.posterPath ?? widget.summary?.posterPath;
    final title =
        media?.title ?? media?.name ?? widget.summary?.title ?? l10n.unknown;
    final reporter = issue.createdBy?.bestName ?? l10n.unknown;
    final date = issue.createdAt?.split('T').first ?? '';
    final scope = _issueScopeLabel(l10n, issue);
    final typeLine = scope.isEmpty
        ? _issueTypeLabel(l10n, issue.issueType).toUpperCase()
        : '${_issueTypeLabel(l10n, issue.issueType).toUpperCase()} · $scope';
    final replyCount = issue.comments.length - 1;

    return _CardActionFocus(
      cardFocus: _cardFocus,
      actionFocuses: [_resolveFocus],
      child: MouseRegion(
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: _HubCardShell(
          highlighted: showFocusBorder,
          highlightColor: focusColor,
          expandOnFocus: cardFocusExpansion,
          child: _buildCard(
            l10n,
            posterPath,
            title,
            typeLine,
            reporter,
            date,
            replyCount,
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    AppLocalizations l10n,
    String? posterPath,
    String title,
    String typeLine,
    String reporter,
    String date,
    int replyCount,
  ) {
    final scale = _uiScale();
    final onSurface = AppColorScheme.onSurface;

    return InkWell(
      onTap: widget.onTap,
      focusNode: _cardFocus,
      onFocusChange: setFocused,
      child: SizedBox(
        height: 140 * scale,
        child: Row(
          children: [
            SizedBox(
              width: 93 * scale,
              child: posterPath != null
                  ? CachedNetworkImage(
                      imageUrl: '$_tmdbPosterBase$posterPath',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      placeholder: (_, _) =>
                          ColoredBox(color: AppColorScheme.surfaceVariant),
                    )
                  : Container(
                      color: AppColorScheme.surfaceVariant,
                      child: Icon(
                        Icons.report_problem_outlined,
                        color: onSurface.withValues(alpha: 0.24),
                        size: 40 * scale,
                      ),
                    ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12 * scale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: onSurface,
                        fontSize: 15 * scale,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4 * scale),
                    Text(
                      typeLine,
                      style: TextStyle(
                        color: onSurface.withValues(alpha: 0.54),
                        fontSize: 11 * scale,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _IssueStatusChip(isOpen: issue.isOpen),
                        if (replyCount > 0) ...[
                          const SizedBox(width: 8),
                          Text(
                            l10n.commentsCount(replyCount),
                            style: TextStyle(
                              color: onSurface.withValues(alpha: 0.38),
                              fontSize: 11 * scale,
                            ),
                          ),
                        ],
                        const Spacer(),
                        if (date.isNotEmpty)
                          Text(
                            date,
                            style: TextStyle(
                              color: onSurface.withValues(alpha: 0.38),
                              fontSize: 11 * scale,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 4 * scale),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.reportedByName(reporter),
                            style: TextStyle(
                              color: onSurface.withValues(alpha: 0.54),
                              fontSize: 12 * scale,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (widget.isActioning)
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: onSurface,
                            ),
                          )
                        else if (widget.canResolve)
                          _CardActionButton(
                            label: issue.isOpen
                                ? l10n.resolveAction
                                : l10n.reopenAction,
                            icon: issue.isOpen
                                ? Icons.check_circle_outline
                                : Icons.refresh,
                            color: issue.isOpen
                                ? AppColorScheme.statusAvailable
                                : AppColorScheme.statusPending,
                            focusNode: _resolveFocus,
                            onPressed: widget.onResolve,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IssueStatusChip extends StatelessWidget {
  final bool isOpen;

  const _IssueStatusChip({required this.isOpen});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _StatusPill(
      label: isOpen ? l10n.openStatus : l10n.resolvedStatus,
      color: isOpen
          ? AppColorScheme.statusPending
          : AppColorScheme.statusAvailable,
    );
  }
}

class _IssueThreadDialog extends StatefulWidget {
  final SeerrIssuesViewModel vm;
  final int issueId;

  const _IssueThreadDialog({required this.vm, required this.issueId});

  @override
  State<_IssueThreadDialog> createState() => _IssueThreadDialogState();
}

class _IssueThreadDialogState extends State<_IssueThreadDialog> {
  final _commentController = TextEditingController();
  bool _sending = false;

  SeerrIssue? get _issue =>
      widget.vm.state.issues.where((i) => i.id == widget.issueId).firstOrNull;

  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_onChanged);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_onChanged);
    _commentController.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _sendComment() async {
    final message = _commentController.text.trim();
    if (message.isEmpty || _sending) return;
    setState(() => _sending = true);
    await widget.vm.addComment(widget.issueId, message);
    if (mounted) {
      _commentController.clear();
      setState(() => _sending = false);
    }
  }

  void _confirmDelete() {
    final l10n = AppLocalizations.of(context);
    final onSurface = AppColorScheme.onSurface;
    showFocusRestoringDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        backgroundColor: AppColorScheme.surface,
        title: Text(
          l10n.delete,
          style: TextStyle(color: onSurface),
        ),
        content: Text(
          l10n.deleteIssueConfirm,
          style: TextStyle(color: onSurface.withValues(alpha: 0.7)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
              widget.vm.deleteIssue(widget.issueId);
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColorScheme.statusError,
            ),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final issue = _issue;
    if (issue == null) {
      return const SizedBox(
        height: 120,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final vm = widget.vm;
    final onSurface = AppColorScheme.onSurface;
    final scope = _issueScopeLabel(l10n, issue);
    final isActioning = vm.state.actioningIssueId == issue.id;
    final resolveColor = issue.isOpen
        ? AppColorScheme.statusAvailable
        : AppColorScheme.statusPending;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _IssueStatusChip(isOpen: issue.isOpen),
              const SizedBox(width: 8),
              Text(
                scope.isEmpty
                    ? _issueTypeLabel(l10n, issue.issueType)
                    : '${_issueTypeLabel(l10n, issue.issueType)} · $scope',
                style: TextStyle(
                  color: onSurface.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 260),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final (index, comment) in issue.comments.indexed)
                    _CommentBubble(
                      // The first comment is the description, written by
                      // whoever reported the issue.
                      author: comment.user?.bestName ??
                          (index == 0 ? issue.createdBy?.bestName : null) ??
                          l10n.unknown,
                      message: comment.message ?? '',
                    ),
                ],
              ),
            ),
          ),
          if (vm.canComment(issue)) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: SeerrTextField(
                    controller: _commentController,
                    hint: l10n.addComment,
                    onSubmitted: (_) => _sendComment(),
                  ),
                ),
                const SizedBox(width: 8),
                FocusableWrapper(
                  onSelect: _sending ? null : _sendComment,
                  borderRadius: 8,
                  disableScale: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: _sending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            Icons.send,
                            color: onSurface.withValues(alpha: 0.7),
                          ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          Row(
            children: [
              if (vm.canResolve(issue))
                Expanded(
                  child: SeerrDialogButton(
                    primary: true,
                    primaryColor: resolveColor,
                    foreground: _onStatusColor(resolveColor),
                    icon: issue.isOpen ? Icons.check : Icons.refresh,
                    label: issue.isOpen ? l10n.resolveAction : l10n.reopenAction,
                    onPressed: isActioning
                        ? null
                        : () => issue.isOpen
                              ? vm.resolveIssue(issue.id)
                              : vm.reopenIssue(issue.id),
                  ),
                ),
              if (vm.canDelete(issue)) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: SeerrDialogButton(
                    label: l10n.delete,
                    foreground: AppColorScheme.statusError,
                    onPressed: isActioning ? null : _confirmDelete,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Focusable so long threads can be scrolled with the D-pad.
class _CommentBubble extends StatefulWidget {
  final String author;
  final String message;

  const _CommentBubble({required this.author, required this.message});

  @override
  State<_CommentBubble> createState() => _CommentBubbleState();
}

class _CommentBubbleState extends State<_CommentBubble> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return Focus(
      onFocusChange: (focused) {
        setFocused(focused);
        if (focused) {
          Scrollable.ensureVisible(
            context,
            alignment: 0.5,
            duration: const Duration(milliseconds: 150),
          );
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: onSurface.withValues(alpha: showFocusBorder ? 0.12 : 0.06),
          borderRadius: AppRadius.circular(8),
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.chipBorder.copyWith(
              color: showFocusBorder ? focusColor : Colors.transparent,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.author,
              style: TextStyle(
                color: onSurface,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.message,
              style: TextStyle(
                color: onSurface.withValues(alpha: 0.7),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
