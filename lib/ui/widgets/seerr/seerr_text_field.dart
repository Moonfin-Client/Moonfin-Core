import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';

/// Text input for seerr dialogs that uses the TV keyboard (honoring the
/// system IME preference) on TV and a plain TextField elsewhere.
class SeerrTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;

  const SeerrTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.onSubmitted,
    this.focusNode,
  });

  @override
  State<SeerrTextField> createState() => _SeerrTextFieldState();
}

class _SeerrTextFieldState extends State<SeerrTextField> {
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();
  FocusNode? _internalFocusNode;

  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_internalFocusNode ??= FocusNode(debugLabel: 'seerr-text-field'));

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(_onFocusChanged);
    CustomTVTextField.isKeyboardVisibleNotifier.addListener(_onKeyboardVisibilityChanged);
  }

  void _onKeyboardVisibilityChanged() {
    if (_effectiveFocusNode.hasFocus && CustomTVTextField.isKeyboardVisibleNotifier.value) {
      _scrollToVisible();
    }
  }

  void _onFocusChanged() {
    if (_effectiveFocusNode.hasFocus) {
      _scrollToVisible();
    }
  }

  void _scrollToVisible() {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (!mounted) return;
      try {
        Scrollable.ensureVisible(
          context,
          alignment: 0.5,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      } catch (_) {}
    });
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_onFocusChanged);
    CustomTVTextField.isKeyboardVisibleNotifier.removeListener(_onKeyboardVisibilityChanged);
    _internalFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    if (!PlatformDetection.isTV) {
      return TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        onSubmitted: widget.onSubmitted,
        style: TextStyle(color: onSurface),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: onSurface.withValues(alpha: 0.54)),
          filled: true,
          fillColor: AppColorScheme.inputBackground,
          border: OutlineInputBorder(
            borderRadius: AppRadius.circular(8),
            borderSide: ThemeRegistry.active.borders.chipBorder,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.circular(8),
            borderSide: ThemeRegistry.active.borders.chipBorder,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
      );
    }

    final prefs = GetIt.instance<UserPreferences>();
    final focusNode = _effectiveFocusNode;
    return Focus(
      focusNode: focusNode,
      onKeyEvent: (node, event) {
        if (event.logicalKey.isBackKey) {
          if (event is KeyDownEvent &&
              (_tvFieldKey.currentState?.isKeyboardVisible ?? false)) {
            _tvFieldKey.currentState?.closeKeyboard();
            node.requestFocus();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        }
        if (event.isActionable && event.logicalKey.isSelectKey) {
          if (!node.hasFocus) node.requestFocus();
          _tvFieldKey.currentState?.openKeyboard();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: () {
          if (!focusNode.hasFocus) focusNode.requestFocus();
          _tvFieldKey.currentState?.openKeyboard();
        },
        child: ListenableBuilder(
          listenable: focusNode,
          builder: (_, _) => CustomTVTextField(
            key: _tvFieldKey,
            controller: widget.controller,
            isFocused: focusNode.hasFocus,
            inputPurpose: InputPurpose.text,
            keyboardType: KeyboardType.alphabetic,
            preferSystemIme: prefs.get(UserPreferences.preferSystemImeKeyboard),
            hint: widget.hint,
            filled: true,
            fillColor: AppColorScheme.inputBackground,
            borderColor: ThemeRegistry.active.borders.chipBorder.color,
            focusedBorderColor: AppColorScheme.accent,
            hintStyle: TextStyle(color: onSurface.withValues(alpha: 0.54)),
            textStyle: TextStyle(color: onSurface),
            popParentOnKeyboardClose: false,
            onFieldSubmitted: (v) => widget.onSubmitted?.call(v),
          ),
        ),
      ),
    );
  }
}
