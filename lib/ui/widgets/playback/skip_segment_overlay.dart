import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_segment.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../focus/focus_theme.dart';

class SkipSegmentOverlay extends StatelessWidget {
  final MediaSegment segment;
  final VoidCallback onSkip;
  final VoidCallback onDismiss;
  final FocusNode? focusNode;

  const SkipSegmentOverlay({
    super.key,
    required this.segment,
    required this.onSkip,
    required this.onDismiss,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDesktop = PlatformDetection.useDesktopUi;
    return Positioned(
      right: 24,
      bottom: 120,
      child: Material(
        color: Colors.transparent,
        child: Focus(
          focusNode: focusNode,
          onKeyEvent: (_, event) {
            if (focusNode == null) {
              return KeyEventResult.ignored;
            }
            if (event is KeyDownEvent &&
                (event.logicalKey == LogicalKeyboardKey.select ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              onSkip();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: Stack(
            children: [
              InkWell(
                onTap: onSkip,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 12, isDesktop ? 44 : 20, 12),
                  decoration: FocusTheme.focusDecoration(
                    isFocused: true,
                    radius: 8,
                    color: AppColorScheme.accent,
                    backgroundColor: AppColorScheme.surface.withValues(
                      alpha: 0.9,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.skipSegment(segment.type.displayName),
                        style: TextStyle(
                          color: AppColorScheme.onSurface,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.skip_next_rounded,
                        color: AppColorScheme.accent,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
              if (isDesktop)
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    onPressed: onDismiss,
                    tooltip: l10n.close,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints.tightFor(
                      width: 24,
                      height: 24,
                    ),
                    icon: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: AppColorScheme.onSurface,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
