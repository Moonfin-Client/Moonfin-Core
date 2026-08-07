import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/platform_detection.dart';

/// The search box a library screen puts in its header.
///
/// TV needs [CustomTVTextField] so the remote can reach it and the on screen
/// keyboard opens on select. Everywhere else a plain field with a clear button
/// does the job.
class LocalSearchField extends StatefulWidget {
  const LocalSearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.tvFieldKey,
    this.onChanged,
    this.onTvKeyEvent,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final GlobalKey<CustomTVTextFieldState>? tvFieldKey;
  final ValueChanged<String>? onChanged;
  final FocusOnKeyEventCallback? onTvKeyEvent;

  @override
  State<LocalSearchField> createState() => _LocalSearchFieldState();
}

class _LocalSearchFieldState extends State<LocalSearchField> {
  final GlobalKey<CustomTVTextFieldState> _fallbackTvFieldKey = GlobalKey();
  late final UserPreferences _prefs = GetIt.instance<UserPreferences>();
  late String _lastReportedText = widget.controller.text;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleControllerChanged);
    if (PlatformDetection.isTV) {
      widget.focusNode.addListener(_handleFocusChanged);
    }
  }

  @override
  void didUpdateWidget(LocalSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_handleControllerChanged);
      widget.controller.addListener(_handleControllerChanged);
    }
    if (oldWidget.focusNode != widget.focusNode && PlatformDetection.isTV) {
      oldWidget.focusNode.removeListener(_handleFocusChanged);
      widget.focusNode.addListener(_handleFocusChanged);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChanged);
    widget.focusNode.removeListener(_handleFocusChanged);
    super.dispose();
  }

  void _handleControllerChanged() {
    final text = widget.controller.text;
    if (text == _lastReportedText) return;
    _lastReportedText = text;
    widget.onChanged?.call(text);
  }

  void _handleFocusChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final effectiveHint = l10n.searchThisLibrary;
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);

    final fillColor = AppColorScheme.surface.withValues(alpha: 0.72);
    final foreground = AppColorScheme.onSurface;

    if (PlatformDetection.isTV) {
      final effectiveTvKey = widget.tvFieldKey ?? _fallbackTvFieldKey;
      final hasFocus = widget.focusNode.hasFocus;
      return Focus(
        focusNode: widget.focusNode,
        onKeyEvent: (node, event) {
          if (event.isActionable && event.logicalKey.isSelectKey) {
            if (!node.hasFocus) node.requestFocus();
            effectiveTvKey.currentState?.openKeyboard();
            return KeyEventResult.handled;
          }
          if (widget.onTvKeyEvent != null) {
            return widget.onTvKeyEvent!(node, event);
          }
          return KeyEventResult.ignored;
        },
        child: CustomTVTextField(
          key: effectiveTvKey,
          controller: widget.controller,
          isFocused: hasFocus,
          inputPurpose: InputPurpose.search,
          preferSystemIme: _prefs.get(UserPreferences.preferSystemImeKeyboard),
          popParentOnKeyboardClose: false,
          hint: effectiveHint,
          prefixIcon: Icon(Icons.search, color: foreground),
          textStyle: TextStyle(color: foreground, fontSize: 17),
          hintStyle: TextStyle(
            color: foreground.withValues(alpha: 0.62),
            fontSize: 17,
          ),
          filled: true,
          fillColor: fillColor,
          borderRadius: 24,
          borderColor: Colors.transparent,
          focusedBorderColor: focusColor,
          borderWidth: 2,
          focusedBorderWidth: 2,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 11,
          ),
        ),
      );
    }

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller,
      builder: (context, value, _) {
        return TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: TextStyle(color: foreground, fontSize: 17),
          decoration: InputDecoration(
            hintText: effectiveHint,
            hintStyle: TextStyle(color: foreground.withValues(alpha: 0.62)),
            prefixIcon: Icon(Icons.search, color: foreground),
            suffixIcon: value.text.isEmpty
                ? null
                : IconButton(
                    tooltip: l10n.clear,
                    onPressed: widget.controller.clear,
                    icon: Icon(Icons.close, color: foreground),
                  ),
            filled: true,
            fillColor: fillColor,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(color: Colors.transparent, width: 2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(color: Colors.transparent, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(color: focusColor, width: 2),
            ),
          ),
        );
      },
    );
  }
}
