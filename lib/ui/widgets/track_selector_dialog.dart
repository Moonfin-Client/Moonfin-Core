import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import 'marquee_text.dart';
import 'overlay_sheet.dart';

Future<T?> showStyledPlayerDialog<T>(
  BuildContext context, {
  required String title,
  String? subtitle,
  required Widget Function(BuildContext ctx) builder,
  Widget? footer,
  bool showCancel = false,
  double maxWidth = 440,
  bool useRootNavigator = true,
}) {
  return showFocusRestoringDialog<T>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (dialogContext) {
      final mediaQuery = MediaQuery.of(dialogContext);
      final maxDialogHeight = mediaQuery.size.height -
          mediaQuery.padding.vertical -
          mediaQuery.viewInsets.vertical -
          24;
      final glass = AppColorScheme.isGlass;
      final inner = Container(
          constraints: BoxConstraints(
            minWidth: 340,
            maxWidth: maxWidth,
            maxHeight: maxDialogHeight,
          ),
          decoration: glass
              ? null
              : BoxDecoration(
                  color: AppColorScheme.surface.withValues(alpha: 0.9),
                  borderRadius: AppRadius.circular(20),
                  border: Border.fromBorderSide(
                    ThemeRegistry.active.borders.chipBorder,
                  ),
                ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, subtitle != null ? 4 : 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.54),
                      ),
                    ),
                  ),
                ),
              Container(height: 1, color: Colors.white.withValues(alpha: 0.08)),
              const SizedBox(height: 8),
              Flexible(child: builder(dialogContext)),
              if (footer != null) ...[const SizedBox(height: 4), footer],
              if (showCancel) ...[
                const SizedBox(height: 4),
                Container(height: 1, color: Colors.white.withValues(alpha: 0.08)),
                const SizedBox(height: 4),
                _TrackRow(
                  option: TrackOption(label: AppLocalizations.of(dialogContext).cancel),
                  isSelected: false,
                  onTap: () => Navigator.pop(dialogContext),
                  dimmed: true,
                ),
              ],
            ],
          ),
        );
      return Dialog(
        backgroundColor: Colors.transparent,
        child: glass
            ? GlassSurface(
                cornerRadius: 20,
                reinforced: true,
                fallbackColor: Colors.transparent,
                child: inner,
              )
            : inner,
      );
    },
  );
}

class TrackOption {
  final String label;
  final String? subtitle;
  final int? labelMaxLines;
  final bool scrollLabel;
  final bool scrollSubtitle;

  const TrackOption({
    required this.label,
    this.subtitle,
    this.labelMaxLines = 1,
    this.scrollLabel = false,
    this.scrollSubtitle = false,
  });
}

class TrackSelectorDialog {
  TrackSelectorDialog._();

  static Future<int?> show(
    BuildContext context, {
    required String title,
    required List<TrackOption> options,
    int? selectedIndex,
    Widget? footer,
    bool useRootNavigator = true,
  }) {
    return showStyledPlayerDialog<int>(
      context,
      title: title,
      footer: footer,
      showCancel: true,
      useRootNavigator: useRootNavigator,
      builder: (dialogCtx) => ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (_, i) => _TrackRow(
          option: options[i],
          isSelected: selectedIndex == i,
          autofocus: selectedIndex == i || (selectedIndex == null && i == 0),
          onTap: () => Navigator.pop(dialogCtx, i),
        ),
      ),
    );
  }
}

class _TrackRow extends StatefulWidget {
  final TrackOption option;
  final bool isSelected;
  final VoidCallback onTap;
  final bool autofocus;
  final bool dimmed;

  const _TrackRow({
    required this.option,
    required this.isSelected,
    required this.onTap,
    this.autofocus = false,
    this.dimmed = false,
  });

  @override
  State<_TrackRow> createState() => _TrackRowState();
}

class _TrackRowState extends State<_TrackRow> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() => _isFocused = _focusNode.hasFocus));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final labelColor = widget.dimmed
      ? Colors.white.withValues(alpha: 0.5)
      : Colors.white.withValues(alpha: _isFocused ? 0.95 : 0.8);
    final subtitleColor = widget.dimmed
      ? Colors.white.withValues(alpha: 0.35)
      : Colors.white.withValues(alpha: _isFocused ? 0.72 : 0.6);

    return Focus(
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onTap();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          color: _isFocused ? focusColor.withValues(alpha: 0.2) : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Row(
            children: [
              if (widget.isSelected)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(Icons.check_circle, color: AppColorScheme.accent, size: 20),
                )
              else
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.radio_button_unchecked, color: Colors.white38, size: 20),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.option.scrollLabel)
                      MarqueeText(
                        text: widget.option.label,
                        style: TextStyle(fontSize: 16, color: labelColor),
                      )
                    else
                      Text(
                        widget.option.label,
                        style: TextStyle(fontSize: 16, color: labelColor),
                        maxLines: widget.option.labelMaxLines,
                        overflow:
                            widget.option.labelMaxLines == 1
                                ? TextOverflow.ellipsis
                                : null,
                      ),
                    if (widget.option.subtitle != null)
                      (widget.option.scrollSubtitle
                          ? MarqueeText(
                              text: widget.option.subtitle!,
                              style: TextStyle(
                                fontSize: 12,
                                color: subtitleColor,
                              ),
                            )
                          : Text(
                              widget.option.subtitle!,
                              style: TextStyle(
                                fontSize: 12,
                                color: subtitleColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
