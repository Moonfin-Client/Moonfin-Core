import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Dialog frame for a short list of choices: a fixed title above rows that
/// scroll when they don't fit.
class ChoiceDialogShell extends StatefulWidget {
  final String title;

  final String? subtitle;

  final double maxWidth;

  /// Maximum height as a fraction of the screen height; null leaves only the
  /// dialog's default insets as the limit.
  final double? maxHeightFactor;

  /// Slightly see-through by default; pass 1 for small, dense text.
  final double surfaceOpacity;
  final List<Widget> children;

  const ChoiceDialogShell({
    super.key,
    required this.title,
    required this.maxWidth,
    required this.children,
    this.subtitle,
    this.maxHeightFactor,
    this.surfaceOpacity = 0.92,
  });

  @override
  State<ChoiceDialogShell> createState() => _ChoiceDialogShellState();
}

class _ChoiceDialogShellState extends State<ChoiceDialogShell> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final size = MediaQuery.sizeOf(context);
    final titleText = Text(
      widget.title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
    );

    return Dialog(
      backgroundColor: AppColorScheme.surface.withValues(
        alpha: widget.surfaceOpacity,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(20),
        side: ThemeRegistry.active.borders.chipBorder.copyWith(
          color: onSurface.withValues(alpha: 0.18),
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: (size.width - 32).clamp(280.0, widget.maxWidth),
          maxWidth: (size.width - 32).clamp(280.0, widget.maxWidth),
          maxHeight: widget.maxHeightFactor == null
              ? double.infinity
              : size.height * widget.maxHeightFactor!,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: widget.subtitle == null
                    ? titleText
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText,
                          const SizedBox(height: 4),
                          Text(
                            widget.subtitle!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
              ),
              Divider(color: onSurface.withValues(alpha: 0.12)),
              Flexible(
                // Always visible: on a touch screen nothing else shows that
                // the list continues.
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  child: ListView(
                    controller: _scrollController,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: widget.children,
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
