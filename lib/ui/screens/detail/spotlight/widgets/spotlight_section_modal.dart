import 'package:flutter/material.dart';

import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../util/focus/dpad_keys.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/adaptive/sf_symbol.dart';
import '../../../../widgets/overlay_sheet.dart';

/// One section inside a [SpotlightSectionModal]: an optional header plus a
/// grid (or list) built by [builder]. Only the first section of a modal
/// receives a [FocusNode] to claim initial d-pad focus. A known [count] shows
/// as a pill next to the title. Leave [title] off for content that stands on
/// its own, like the Seerr chips and stats.
class SpotlightModalSection {
  final String? title;
  final int? count;
  final Widget Function(BuildContext context, FocusNode? firstFocusNode)
  builder;

  const SpotlightModalSection({
    this.title,
    required this.builder,
    this.count,
  });
}

/// The live title, icon and sections of an open [SpotlightSectionModal].
typedef SpotlightModalContent = ({
  String title,
  IconData? icon,
  List<SpotlightModalSection> sections,
});

/// The Spotlight pop-up modal: a scrollable column of titled grid sections.
///
/// Opened as a dialog route so the app-level back pipeline and the TV route
/// focus grab apply. D-pad focus is trapped inside
/// ([TraversalEdgeBehavior.stop]); pressing back closes the modal and returns
/// focus to [returnFocus] (the summary card that opened it).
abstract final class SpotlightSectionModal {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<SpotlightModalSection> sections,
    IconData? icon,
    FocusNode? returnFocus,
    Listenable? refreshOn,
    SpotlightModalContent Function()? refresh,
    VoidCallback? onNearEnd,
  }) {
    FocusManager.instance.primaryFocus?.unfocus();
    final future = showGeneralDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierLabel: title,
      barrierColor: AppColorScheme.scrim.withValues(alpha: 0.54),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, anim, _) => _SpotlightModalShell(
        title: title,
        icon: icon,
        sections: sections,
        refreshOn: refreshOn,
        refresh: refresh,
        onNearEnd: onNearEnd,
      ),
      transitionBuilder: (context, anim, secondAnim, child) {
        final scale = Tween<double>(begin: 0.96, end: 1.0).animate(
          CurvedAnimation(parent: anim, curve: Curves.easeOutCubic),
        );
        return FadeTransition(
          opacity: anim,
          child: ScaleTransition(scale: scale, child: child),
        );
      },
    );
    return future.whenComplete(() {
      returnFocus?.requestFocus();
    });
  }
}

class _SpotlightModalShell extends StatefulWidget {
  final String title;
  final IconData? icon;
  final List<SpotlightModalSection> sections;

  /// Notifies, while the modal is open, that [refresh] may return new content.
  final Listenable? refreshOn;
  final SpotlightModalContent Function()? refresh;

  /// Called as the viewer nears the bottom, for content that pages.
  final VoidCallback? onNearEnd;

  const _SpotlightModalShell({
    required this.title,
    required this.icon,
    required this.sections,
    this.refreshOn,
    this.refresh,
    this.onNearEnd,
  });

  @override
  State<_SpotlightModalShell> createState() => _SpotlightModalShellState();
}

class _SpotlightModalShellState extends State<_SpotlightModalShell> {
  final _trapScope = FocusScopeNode(
    debugLabel: 'SpotlightModalTrap',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );
  final _firstCellFocusNode = FocusNode(debugLabel: 'SpotlightModalFirstCell');
  final _scrollController = ScrollController();
  bool _dismissed = false;

  late String _title = widget.title;
  late IconData? _icon = widget.icon;
  late List<SpotlightModalSection> _sections = widget.sections;

  /// Takes the latest content whenever the host notifies. Every cell carries
  /// a stable key, so a rebuild reuses the elements already on screen rather
  /// than moving focus around.
  void _onRefresh() {
    final refresh = widget.refresh;
    if (refresh == null || !mounted) return;
    final next = refresh();
    setState(() {
      _title = next.title;
      _icon = next.icon;
      _sections = next.sections;
    });
  }

  /// Asks for the next page once the viewer is within a screenful of the
  /// bottom. The host ignores the call while a page is already in flight or
  /// when there's nothing left.
  void _onScroll() {
    final onNearEnd = widget.onNearEnd;
    if (onNearEnd == null || !_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - position.viewportDimension) {
      onNearEnd();
    }
  }

  @override
  void initState() {
    super.initState();
    widget.refreshOn?.addListener(_onRefresh);
    if (widget.onNearEnd != null) _scrollController.addListener(_onScroll);
    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _firstCellFocusNode.hasFocus) return;
        if (_firstCellFocusNode.context != null) {
          _firstCellFocusNode.requestFocus();
        } else {
          // A section that manages its own focus nodes, like a track list,
          // never attached the handed-in node. Land on the first traversable
          // cell instead so the remote is never stranded.
          _trapScope.nextFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    widget.refreshOn?.removeListener(_onRefresh);
    _scrollController.removeListener(_onScroll);
    _trapScope.dispose();
    _firstCellFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Closes the modal exactly once. [fromKeyEvent] marks the dismissal for
  /// [DialogBackSuppressor] so Android's follow-up popRoute is swallowed
  /// instead of popping the detail screen underneath.
  void _dismiss({required bool fromKeyEvent}) {
    if (_dismissed || !mounted) return;
    _dismissed = true;
    if (fromKeyEvent) {
      DialogBackSuppressor.markDismissed();
    }
    Navigator.of(context, rootNavigator: true).pop();
  }

  Widget _sectionHeader(
    TextTheme textTheme,
    SpotlightModalSection section,
    String title,
  ) {
    final count = section.count;
    return Row(
      children: [
        Flexible(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColorScheme.onSurface,
            ),
          ),
        ),
        if (count != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: AppRadius.circular(999),
            ),
            child: Text(
              '$count',
              style: textTheme.labelMedium?.copyWith(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final compact = PlatformDetection.useMobileUi || size.width < 600;
    final glass = AppColorScheme.isGlass;
    final textTheme = Theme.of(context).textTheme;

    final scrollView = SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < _sections.length; i++) ...[
            if (i > 0) const SizedBox(height: 24),
            if (_sections[i].title case final title?)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _sectionHeader(textTheme, _sections[i], title),
              ),
            _sections[i].builder(
              context,
              i == 0 ? _firstCellFocusNode : null,
            ),
          ],
        ],
      ),
    );
    // Mouse users get a scrollbar; TV scrolls by focus and phones by touch.
    final showScrollbar = !PlatformDetection.isTV && !compact;

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 12, 12),
          child: Row(
            children: [
              if (_icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: AdaptiveIcon(
                    _icon!,
                    size: 22,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                ),
              Expanded(
                child: Text(
                  _title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColorScheme.onSurface,
                  ),
                ),
              ),
              if (!PlatformDetection.isTV)
                IconButton(
                  tooltip: MaterialLocalizations.of(
                    context,
                  ).closeButtonTooltip,
                  icon: const AdaptiveIcon(Icons.close),
                  onPressed: () => _dismiss(fromKeyEvent: false),
                ),
            ],
          ),
        ),
        Container(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        Expanded(
          child: showScrollbar
              ? Scrollbar(controller: _scrollController, child: scrollView)
              : scrollView,
        ),
      ],
    );

    final radius = AppRadius.circular(compact ? 0 : 20);
    final clippedBody = ClipRRect(
      borderRadius: radius,
      child: body,
    );

    final borderDecoration = compact
        ? null
        : BoxDecoration(
            borderRadius: radius,
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.chipBorder,
            ),
          );

    final decorated = glass
        ? GlassSurface(
            cornerRadius: compact ? 0 : 20,
            reinforced: true,
            fallbackColor: Colors.transparent,
            child: Container(
              foregroundDecoration: borderDecoration,
              child: clippedBody,
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: AppColorScheme.surface.withValues(
                alpha: compact ? 0.98 : 0.94,
              ),
              borderRadius: radius,
            ),
            foregroundDecoration: borderDecoration,
            child: clippedBody,
          );

    final panel = compact
        ? SizedBox.expand(child: SafeArea(child: decorated))
        : Center(
            child: SizedBox(
              width: (size.width * 0.82).clamp(0.0, 1100.0),
              height: size.height * 0.85,
              child: decorated,
            ),
          );

    return FocusScope(
      node: _trapScope,
      child: Focus(
        canRequestFocus: false,
        skipTraversal: true,
        onKeyEvent: (node, event) {
          if (!event.isActionable) return KeyEventResult.ignored;
          if (event.logicalKey.isBackKey) {
            _dismiss(fromKeyEvent: true);
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            _dismiss(fromKeyEvent: false);
          },
          child: Material(type: MaterialType.transparency, child: panel),
        ),
      ),
    );
  }
}
