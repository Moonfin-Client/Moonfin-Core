import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/focus/focusable_wrapper.dart';
import '../../../../widgets/offline_aware_image.dart';
import '../../../../widgets/overlay_sheet.dart';
import '../../item_detail_screen.dart';

class ImmersivePersonHero extends StatefulWidget {
  final AggregatedItem item;
  final ItemDetailViewModel viewModel;
  final ImageApi imageApi;
  final UserPreferences prefs;

  final FocusNode? initialFocusNode;

  final VoidCallback? onNavigateDown;
  final VoidCallback? onExternalFocusEntry;

  const ImmersivePersonHero({
    super.key,
    required this.item,
    required this.viewModel,
    required this.imageApi,
    required this.prefs,
    this.initialFocusNode,
    this.onNavigateDown,
    this.onExternalFocusEntry,
  });

  @override
  State<ImmersivePersonHero> createState() => ImmersivePersonHeroState();
}

class ImmersivePersonHeroState extends State<ImmersivePersonHero> {
  final FocusNode _localFavoriteFocusNode = FocusNode(
    debugLabel: 'immersivePersonFavorite',
  );

  final FocusNode _displayFocusNode = FocusNode(
    debugLabel: 'immersivePersonDisplay',
  );

  final FocusNode _overviewFocusNode = FocusNode(
    debugLabel: 'immersivePersonOverview',
  );

  bool _overviewFocusable = false;
  bool _heroFocusActive = false;

  FocusNode get _favoriteFocusNode =>
      widget.initialFocusNode ?? _localFavoriteFocusNode;

  bool get canFocusBottom {
    return [
      _favoriteFocusNode,
      _displayFocusNode,
    ].any((node) => node.canRequestFocus && node.context != null);
  }

  bool focusBottom() {
    if (!canFocusBottom) {
      return false;
    }

    final node =
        _favoriteFocusNode.canRequestFocus && _favoriteFocusNode.context != null
        ? _favoriteFocusNode
        : _displayFocusNode;

    node.requestFocus();

    return true;
  }

  bool _isCompact(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  bool _isCompactLandscape(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return _isCompact(context) && size.width > size.height;
  }

  void _handleOverviewFocusableChanged(bool focusable) {
    if (!mounted || _overviewFocusable == focusable) {
      return;
    }

    setState(() {
      _overviewFocusable = focusable;
    });
  }

  void _focusOverviewIfAvailable() {
    if (!_overviewFocusable ||
        !_overviewFocusNode.canRequestFocus ||
        _overviewFocusNode.context == null) {
      return;
    }

    _overviewFocusNode.requestFocus();
  }

  void _trackExternalFocusEntry() {
    final node = FocusManager.instance.primaryFocus;

    final inside =
        node?.context?.findAncestorStateOfType<ImmersivePersonHeroState>() ==
        this;

    if (inside && !_heroFocusActive && node == widget.initialFocusNode) {
      widget.onExternalFocusEntry?.call();
    }

    _heroFocusActive = inside;
  }

  @override
  void initState() {
    super.initState();

    FocusManager.instance.addListener(_trackExternalFocusEntry);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_trackExternalFocusEntry);

    _localFavoriteFocusNode.dispose();
    _displayFocusNode.dispose();
    _overviewFocusNode.dispose();

    super.dispose();
  }

  String? _profileImageUrl() {
    final tag = widget.item.primaryImageTag;

    if (tag != null && !widget.item.id.startsWith('tmdb:')) {
      return widget.imageApi.getPrimaryImageUrl(
        widget.item.id,
        maxHeight: 500,
        tag: tag,
      );
    }

    final profilePath = widget.item.rawData['ProfilePath'] as String?;

    if (profilePath != null && profilePath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }

    return null;
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.'
        '${date.month.toString().padLeft(2, '0')}.'
        '${date.year}';
  }

  int _ageAt(DateTime birth, DateTime end) {
    var age = end.year - birth.year;

    if (end.month < birth.month ||
        (end.month == birth.month && end.day < birth.day)) {
      age--;
    }

    return age;
  }

  List<String> _dateParts(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final birth = widget.item.premiereDate;

    final death = widget.item.endDate;

    final parts = <String>[];

    if (birth != null) {
      parts.add(l10n.born(_formatDate(birth)));
    }

    if (death != null) {
      parts.add(l10n.died(_formatDate(death)));
    } else if (birth != null) {
      final age = _ageAt(birth, DateTime.now());

      if (age > 0) {
        parts.add(l10n.age(age));
      }
    }

    return parts;
  }

  void _showDisplaySettings(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => PersonDisplaySettingsDialog(prefs: widget.prefs),
    );
  }

  Widget _buildAvatar({required String? imageUrl, required double size}) {
    final foreground = AppColorScheme.onSurface;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: foreground.withValues(alpha: 0.22), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.34),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipOval(
        child: ColoredBox(
          color: foreground.withValues(alpha: 0.06),
          child: imageUrl != null
              ? OfflineAwareImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) {
                    return Center(
                      child: Icon(
                        Icons.person_rounded,
                        size: size * 0.38,
                        color: foreground.withValues(alpha: 0.38),
                      ),
                    );
                  },
                )
              : Center(
                  child: Icon(
                    Icons.person_rounded,
                    size: size * 0.38,
                    color: foreground.withValues(alpha: 0.38),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildInfo(
    BuildContext context, {
    required bool compact,
    required bool compactLandscape,
    required String overview,
    required List<String> dateParts,
    required String location,
  }) {
    final theme = Theme.of(context);

    final foreground = AppColorScheme.onSurface;

    final l10n = AppLocalizations.of(context);

    final overviewStyle = theme.textTheme.bodyLarge?.copyWith(
      color: foreground.withValues(alpha: 0.76),
      height: compactLandscape ? 1.32 : 1.42,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.item.name,
          maxLines: compactLandscape ? 1 : 2,
          overflow: TextOverflow.ellipsis,
          style: compact
              ? theme.textTheme.headlineMedium?.copyWith(
                  color: foreground,
                  fontSize: compactLandscape ? 28 : 32,
                  fontWeight: FontWeight.w700,
                  height: 1.04,
                  letterSpacing: -0.6,
                )
              : theme.textTheme.displaySmall?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                  height: 1.03,
                  letterSpacing: -0.8,
                ),
        ),

        if (dateParts.isNotEmpty) ...[
          SizedBox(height: compactLandscape ? 7 : 10),
          Text(
            dateParts.join('  •  '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: foreground.withValues(alpha: 0.72),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],

        if (location.isNotEmpty) ...[
          SizedBox(height: compactLandscape ? 4 : 6),
          Text(
            location,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: foreground.withValues(alpha: 0.56),
            ),
          ),
        ],

        if (overview.isNotEmpty && overviewStyle != null) ...[
          SizedBox(height: compactLandscape ? 10 : 14),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: compact ? 620 : 680),
            child: _ImmersivePersonOverview(
              text: overview,
              maxLines: compactLandscape ? 2 : (compact ? 4 : 3),
              style: overviewStyle,
              focusNode: _overviewFocusNode,
              onFocusableChanged: _handleOverviewFocusableChanged,
              onNavigateDown: () {
                if (_favoriteFocusNode.canRequestFocus) {
                  _favoriteFocusNode.requestFocus();
                }
              },
            ),
          ),
        ],

        SizedBox(height: compactLandscape ? 14 : (compact ? 20 : 24)),

        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            _PersonHeroAction(
              focusNode: _favoriteFocusNode,
              icon: Icons.favorite_rounded,
              label: widget.item.isFavorite ? l10n.favorited : l10n.favorite,
              isActive: widget.item.isFavorite,
              activeColor: const Color(0xFFFF4757),
              compact: compact,
              compactLandscape: compactLandscape,
              onPressed: widget.viewModel.toggleFavorite,
              onNavigateUp: _overviewFocusable
                  ? _focusOverviewIfAvailable
                  : null,
              onNavigateRight: () {
                _displayFocusNode.requestFocus();
              },
              onNavigateDown: widget.onNavigateDown,
            ),

            _PersonHeroAction(
              focusNode: _displayFocusNode,
              icon: Icons.tune_rounded,
              label: l10n.display,
              compact: compact,
              compactLandscape: compactLandscape,
              onPressed: () {
                _showDisplaySettings(context);
              },
              onNavigateUp: _overviewFocusable
                  ? _focusOverviewIfAvailable
                  : null,
              onNavigateLeft: () {
                _favoriteFocusNode.requestFocus();
              },
              onNavigateRight: () {},
              onNavigateDown: widget.onNavigateDown,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _profileImageUrl();

    final overview = widget.item.overview?.trim() ?? '';

    final dateParts = _dateParts(context);

    final location = widget.item.productionLocations.isNotEmpty
        ? widget.item.productionLocations.first.trim()
        : '';

    final compact = _isCompact(context);

    final compactLandscape = _isCompactLandscape(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final stacked = compact && !compactLandscape && availableWidth < 620;

        final avatarSize = switch ((compact, compactLandscape, stacked)) {
          (true, true, _) => 104.0,
          (true, false, true) => 116.0,
          (true, false, false) => 120.0,
          _ => 152.0,
        };

        final maxWidth = compact ? double.infinity : 940.0;

        return Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              minHeight: compact ? 0 : 360,
            ),
            child: stacked
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAvatar(imageUrl: imageUrl, size: avatarSize),

                      const SizedBox(height: 20),

                      _buildInfo(
                        context,
                        compact: true,
                        compactLandscape: false,
                        overview: overview,
                        dateParts: dateParts,
                        location: location,
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildAvatar(imageUrl: imageUrl, size: avatarSize),

                      SizedBox(
                        width: compactLandscape
                            ? 20
                            : compact
                            ? 24
                            : 32,
                      ),

                      Expanded(
                        child: _buildInfo(
                          context,
                          compact: compact,
                          compactLandscape: compactLandscape,
                          overview: overview,
                          dateParts: dateParts,
                          location: location,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _PersonHeroAction extends StatefulWidget {
  final FocusNode focusNode;

  final IconData icon;
  final String label;

  final bool isActive;
  final Color? activeColor;

  final bool compact;
  final bool compactLandscape;

  final VoidCallback onPressed;

  final VoidCallback? onNavigateLeft;
  final VoidCallback? onNavigateRight;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;

  const _PersonHeroAction({
    required this.focusNode,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
    this.activeColor,
    this.compact = false,
    this.compactLandscape = false,
    this.onNavigateLeft,
    this.onNavigateRight,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  State<_PersonHeroAction> createState() => _PersonHeroActionState();
}

class _PersonHeroActionState extends State<_PersonHeroAction> {
  static const Duration _motionDuration = Duration(milliseconds: 180);

  bool _hovered = false;

  bool get _focused => widget.focusNode.hasFocus;

  bool get _active => _focused || _hovered;

  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant _PersonHeroAction oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode.removeListener(_onFocusChanged);

      widget.focusNode.addListener(_onFocusChanged);
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);

    super.dispose();
  }

  void _onFocusChanged() {
    if (!mounted) {
      return;
    }

    setState(() {});
  }

  void _setHovered(bool hovered) {
    if (!mounted || hovered == _hovered) {
      return;
    }

    setState(() {
      _hovered = hovered;
    });

    if (hovered && widget.focusNode.canRequestFocus) {
      widget.focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final foreground = AppColorScheme.onSurface;

    final activeColor = widget.activeColor ?? AppColorScheme.accent;

    final iconColor = widget.isActive ? activeColor : foreground;

    final height = widget.compactLandscape
        ? 42.0
        : widget.compact
        ? 46.0
        : 50.0;

    final horizontalPadding = widget.compactLandscape
        ? 14.0
        : widget.compact
        ? 16.0
        : 18.0;

    final iconSize = widget.compactLandscape
        ? 19.0
        : widget.compact
        ? 20.0
        : 21.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        _setHovered(true);
      },
      onExit: (_) {
        _setHovered(false);
      },
      child: FocusableWrapper(
        focusNode: widget.focusNode,
        borderRadius: 999,
        suppressFocusGlow: true,
        onSelect: widget.onPressed,
        onNavigateLeft: widget.onNavigateLeft,
        onNavigateRight: widget.onNavigateRight,
        onNavigateUp: widget.onNavigateUp,
        onNavigateDown: widget.onNavigateDown,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: _motionDuration,
            curve: Curves.easeOutCubic,
            height: height,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            decoration: BoxDecoration(
              color: _active
                  ? foreground.withValues(alpha: 0.16)
                  : foreground.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: _focused
                    ? foreground.withValues(alpha: 0.90)
                    : foreground.withValues(alpha: 0.12),
                width: _focused ? 1.5 : 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, size: iconSize, color: iconColor),

                const SizedBox(width: 8),

                Text(
                  widget.label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImmersivePersonOverview extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final FocusNode focusNode;

  final ValueChanged<bool> onFocusableChanged;

  final VoidCallback? onNavigateDown;

  const _ImmersivePersonOverview({
    required this.text,
    required this.maxLines,
    required this.style,
    required this.focusNode,
    required this.onFocusableChanged,
    this.onNavigateDown,
  });

  @override
  State<_ImmersivePersonOverview> createState() =>
      _ImmersivePersonOverviewState();
}

class _ImmersivePersonOverviewState extends State<_ImmersivePersonOverview> {
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

            if (key == LogicalKeyboardKey.arrowDown) {
              final callback = widget.onNavigateDown;

              if (callback != null) {
                callback();

                return KeyEventResult.handled;
              }

              return KeyEventResult.ignored;
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
