import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/adaptive/adaptive_glass.dart';
import '../../../../widgets/focus/focusable_wrapper.dart';

/// Glass "Up Next" card: a small label badge on top, then a thumbnail with a
/// play overlay on the left and the episode title + short description on the
/// right, with a progress bar and remaining time pinned to the bottom. Purely
/// presentational and theme-tokenized.
class UpNextCard extends StatefulWidget {
  final String label;
  final String title;
  final String? description;
  final String? imageUrl;
  final double progress; // 0..1
  final String? remainingLabel;
  final VoidCallback onTap;
  final FocusNode? focusNode;
  final VoidCallback? onNavigateLeft;
  final VoidCallback? onNavigateDown;
  final double width;
  final bool minimal;

  const UpNextCard({
    super.key,
    required this.label,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.progress,
    required this.remainingLabel,
    required this.onTap,
    this.focusNode,
    this.onNavigateLeft,
    this.onNavigateDown,
    this.width = double.infinity,
    this.minimal = false,
  });

  @override
  State<UpNextCard> createState() => _UpNextCardState();
}

class _UpNextCardState extends State<UpNextCard> {
  late final FocusNode _effectiveNode;

  @override
  void initState() {
    super.initState();
    _effectiveNode = widget.focusNode ?? FocusNode();
    _effectiveNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _effectiveNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _effectiveNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final radius = JellyfinTokens.shapes.mediumRadius;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.7);
    final hasFocus = _effectiveNode.hasFocus;

    if (widget.minimal) {
      return FocusableWrapper(
        focusNode: _effectiveNode,
        onSelect: widget.onTap,
        onNavigateLeft: widget.onNavigateLeft,
        onNavigateDown: widget.onNavigateDown,
        borderRadius: radius.topLeft.x,
        suppressFocusGlow: true,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(radius.topLeft.x),
              border: Border.all(
                color: hasFocus
                    ? (ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                        ? const Color(0xFFFF2E92)
                        : AppColorScheme.accent)
                    : (ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                        ? const Color(0xFF00F0FF)
                        : Colors.white.withValues(alpha: 0.12)),
                width: 1.25,
              ),
            ),
            child: ClipRRect(
              borderRadius: AppRadius.circular(radius.topLeft.x - 1.25),
              child: adaptiveGlass(
                cornerRadius: radius.topLeft.x - 1.25,
                blur: 18,
                fallbackColor: AppColorScheme.surface.withValues(alpha: 0.42),
                tint: AppColorScheme.surface.withValues(alpha: 0.22),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.label,
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                          color: AppColorScheme.accent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Poster
                      AspectRatio(
                        aspectRatio: 2 / 3,
                        child: ClipRRect(
                          borderRadius: AppRadius.circular(radius.topLeft.x - 4),
                          child: _thumbnail(isMinimal: true),
                        ),
                      ),
                      if (widget.title.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return FocusableWrapper(
      focusNode: _effectiveNode,
      onSelect: widget.onTap,
      onNavigateLeft: widget.onNavigateLeft,
      onNavigateDown: widget.onNavigateDown,
      borderRadius: radius.topLeft.x,
      suppressFocusGlow: true,
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          width: widget.width,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(radius.topLeft.x),
              border: Border.all(
                color: hasFocus
                    ? Colors.transparent
                    : (ThemeRegistry.active.id == ThemeRegistry.neonPulseId
                        ? const Color(0xFF00F0FF)
                        : Colors.white.withValues(alpha: 0.12)),
                width: 1.25,
              ),
            ),
            child: ClipRRect(
              borderRadius: AppRadius.circular(radius.topLeft.x - 1.25),
              child: adaptiveGlass(
                cornerRadius: radius.topLeft.x - 1.25,
                blur: 18,
                fallbackColor: AppColorScheme.surface.withValues(alpha: 0.42),
                tint: AppColorScheme.surface.withValues(alpha: 0.22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: Text(
                        widget.label,
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                          color: AppColorScheme.accent,
                        ),
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (widget.description != null &&
                                      widget.description!.isNotEmpty) ...[
                                    Text(
                                      widget.description!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall
                                          ?.copyWith(color: muted),
                                    ),
                                  ],
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      if (widget.progress > 0)
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: AppRadius.circular(2),
                                            child: LinearProgressIndicator(
                                              value: widget.progress.clamp(0.0, 1.0),
                                              minHeight: 4,
                                              backgroundColor: AppColorScheme
                                                  .onSurface
                                                  .withValues(alpha: 0.20),
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      AppColorScheme.accent),
                                            ),
                                          ),
                                        )
                                      else
                                        const Spacer(),
                                      if (widget.remainingLabel != null) ...[
                                        const SizedBox(width: 12),
                                        Text(
                                          widget.remainingLabel!,
                                          style: textTheme.labelSmall
                                              ?.copyWith(color: muted),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _thumbnail(),
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
    );
  }

  Widget _thumbnail({bool isMinimal = false}) {
    return SizedBox(
      width: isMinimal ? null : 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty)
            CachedNetworkImage(
              imageUrl: widget.imageUrl!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const SizedBox.shrink(),
            )
          else
            ColoredBox(
              color: AppColorScheme.surface.withValues(alpha: 0.6),
            ),
          Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 40,
              color: AppColorScheme.onSurface.withValues(alpha: 0.95),
            ),
          ),
        ],
      ),
    );
  }
}
