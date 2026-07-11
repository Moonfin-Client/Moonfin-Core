import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';

/// Text input for seerr dialogs that uses the TV keyboard (honoring the
/// system IME preference) on TV and a plain TextField elsewhere.
class SeerrTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final ValueChanged<String>? onSubmitted;

  const SeerrTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.onSubmitted,
  });

  @override
  State<SeerrTextField> createState() => _SeerrTextFieldState();
}

class _SeerrTextFieldState extends State<SeerrTextField> {
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _focusNode = FocusNode(debugLabel: 'seerr-text-field');

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    if (!PlatformDetection.isTV) {
      return TextField(
        controller: widget.controller,
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
    return Focus(
      focusNode: _focusNode,
      child: ListenableBuilder(
        listenable: _focusNode,
        builder: (_, _) => CustomTVTextField(
          key: _tvFieldKey,
          controller: widget.controller,
          isFocused: _focusNode.hasFocus,
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
    );
  }
}
