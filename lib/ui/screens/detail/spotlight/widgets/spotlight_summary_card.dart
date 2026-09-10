import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../util/focus/dpad_keys.dart';
import '../../../../mixins/focus_state_mixin.dart';
import '../../../../widgets/adaptive/sf_symbol.dart';
import '../../../../widgets/focus/focus_theme.dart';
import '../../../../widgets/offline_aware_image.dart';

/// A Spotlight summary card: landscape imagery with a gradient scrim, an icon
/// badge naming the card, the title and a counts subtitle, and a chevron that
/// says the card opens something. Selecting it opens the card's sectioned
/// grid modal.
class SpotlightSummaryCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final IconData icon;
  final FocusNode? focusNode;
  final VoidCallback onOpen;
  final VoidCallback? onNavigateUp;
  final bool compact;

  const SpotlightSummaryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.icon,
    required this.onOpen,
    this.focusNode,
    this.onNavigateUp,
    this.compact = false,
  });

  @override
  State<SpotlightSummaryCard> createState() => _SpotlightSummaryCardState();
}

class _SpotlightSummaryCardState extends State<SpotlightSummaryCard>
    with FocusStateMixin {
  /// Touch feedback: the card dips while a finger is down on it.
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value || !mounted) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    // The detail screens paint neon focus in the accent rather than the
    // theme's focus border colour the mixin returns.
    final accent = isNeon ? AppColorScheme.accent : focusColor;
    final active = showFocusBorder;
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    const duration = FocusTheme.animationDuration;
    const curve = Curves.easeOutCubic;
    final compact = widget.compact;
    final textTheme = Theme.of(context).textTheme;
    final borderColor = active ? accent : Colors.white.withValues(alpha: 0.12);
    final scale = _pressed
        ? 0.98
        : (cardFocusExpansion && active ? 1.03 : 1.0);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: setFocused,
        onKeyEvent: (_, event) {
          if (isActivateKey(event)) {
            widget.onOpen();
            return KeyEventResult.handled;
          }
          if (event.isActionable &&
              event.logicalKey.isUpKey &&
              widget.onNavigateUp != null) {
            widget.onNavigateUp!();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onOpen,
          onTapDown: (_) => _setPressed(true),
          onTapUp: (_) => _setPressed(false),
          onTapCancel: () => _setPressed(false),
          child: Semantics(
            button: true,
            label: '${widget.title}. ${widget.subtitle}',
            child: AnimatedScale(
              scale: scale,
              duration: duration,
              curve: curve,
              child: AnimatedContainer(
                duration: duration,
                curve: curve,
                decoration: BoxDecoration(
                  borderRadius: AppRadius.circular(14),
                  border: Border.fromBorderSide(
                    ThemeRegistry.active.borders.focusBorder.copyWith(
                      color: borderColor,
                      width: active ? 2.5 : 1.0,
                    ),
                  ),
                  boxShadow: active && !isNeon
                      ? [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.35),
                            blurRadius: 12,
                          ),
                        ]
                      : null,
                ),
                child: ClipRRect(
                  borderRadius: AppRadius.circular(13),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // A slow zoom on focus and hover when card focus expansion
                      // is enabled. Skipped when disabled or under reduce motion.
                      AnimatedScale(
                        scale: cardFocusExpansion && active && !reduceMotion
                            ? 1.06
                            : 1.0,
                        duration: const Duration(milliseconds: 400),
                        curve: curve,
                        child: widget.imageUrl != null
                            ? OfflineAwareImage(
                                imageUrl: widget.imageUrl!,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                errorWidget: (context, url, error) =>
                                    _fallback(context),
                              )
                            : _fallback(context),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.05),
                              Colors.black.withValues(alpha: 0.45),
                              Colors.black.withValues(alpha: 0.85),
                            ],
                            stops: const [0.35, 0.65, 1.0],
                          ),
                        ),
                      ),
                      Positioned(
                        left: compact ? 8 : 10,
                        top: compact ? 8 : 10,
                        child: _badge(compact),
                      ),
                      Positioned(
                        right: 12,
                        bottom: 12,
                        child: AnimatedSlide(
                          offset: active ? const Offset(0.15, 0) : Offset.zero,
                          duration: duration,
                          curve: curve,
                          child: AnimatedOpacity(
                            opacity: active ? 1.0 : 0.55,
                            duration: duration,
                            curve: curve,
                            child: const AdaptiveIcon(
                              Icons.arrow_forward_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        right: 40,
                        bottom: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  (compact
                                          ? textTheme.titleSmall
                                          : textTheme.titleMedium)
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.white.withValues(alpha: 0.75),
                              ),
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
        ),
      ),
    );
  }

  /// The always-on icon badge. A flat scrim rather than a blur, so the sheen
  /// stays cheap on Android TV.
  Widget _badge(bool compact) {
    final size = compact ? 24.0 : 28.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withValues(alpha: 0.45),
      ),
      child: Center(
        child: AdaptiveIcon(
          widget.icon,
          size: compact ? 14 : 16,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _fallback(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColorScheme.surfaceVariant,
            AppColorScheme.surface,
          ],
        ),
      ),
      child: Center(
        child: AdaptiveIcon(
          widget.icon,
          color: Colors.white24,
          size: widget.compact ? 32 : 44,
        ),
      ),
    );
  }
}
