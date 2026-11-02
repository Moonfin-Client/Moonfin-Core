import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../preference/user_preferences.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/platform_detection.dart';

/// A sign-in field for an account's name, password or code. TVs get the TV
/// keyboard, with Up and Down moving between the fields.
class CredentialField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final bool enabled;
  final bool isPassword;
  final FocusNode? up;
  final FocusNode? down;
  final VoidCallback? onSubmitted;
  final ValueChanged<bool>? onKeyboardVisibilityChanged;

  const CredentialField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    this.enabled = true,
    this.isPassword = false,
    this.up,
    this.down,
    this.onSubmitted,
    this.onKeyboardVisibilityChanged,
  });

  @override
  State<CredentialField> createState() => _CredentialFieldState();
}

class _CredentialFieldState extends State<CredentialField> {
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();

  void _onKeyboardVisibilityChanged(bool visible) {
    widget.onKeyboardVisibilityChanged?.call(visible);
    if (!visible) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fieldContext = _tvFieldKey.currentContext;
      if (fieldContext == null || !mounted) return;
      Scrollable.ensureVisible(
        fieldContext,
        alignment: 0.12,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final onSubmitted = widget.onSubmitted;
    if (!PlatformDetection.isTV) {
      return TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        obscureText: widget.isPassword,
        textInputAction: onSubmitted != null
            ? TextInputAction.done
            : TextInputAction.next,
        onSubmitted: onSubmitted == null ? null : (_) => onSubmitted(),
        style: TextStyle(color: AppColorScheme.onSurface),
        decoration: _inputDecoration(),
      );
    }

    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey.isBackKey) {
          if (event is KeyDownEvent &&
              (_tvFieldKey.currentState?.isKeyboardVisible ?? false)) {
            _tvFieldKey.currentState?.closeKeyboard();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        }
        final up = widget.up;
        if (event.logicalKey == LogicalKeyboardKey.arrowUp && up != null) {
          up.requestFocus();
          return KeyEventResult.handled;
        }
        final down = widget.down;
        if (event.logicalKey == LogicalKeyboardKey.arrowDown && down != null) {
          down.requestFocus();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.select) {
          if (!widget.enabled) return KeyEventResult.handled;
          if (!widget.focusNode.hasFocus) widget.focusNode.requestFocus();
          _tvFieldKey.currentState?.openKeyboard();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: ListenableBuilder(
        listenable: widget.focusNode,
        builder: (_, _) {
          final focused = widget.focusNode.hasFocus;
          return CustomTVTextField(
            key: _tvFieldKey,
            controller: widget.controller,
            isFocused: focused,
            inputPurpose: widget.isPassword
                ? InputPurpose.password
                : InputPurpose.username,
            keyboardStyle: GetIt.instance<UserPreferences>().get(
              UserPreferences.keyboardStyle,
            ),
            hint: widget.label,
            filled: true,
            fillColor: focused
                ? AppColorScheme.buttonFocused
                : AppColorScheme.surfaceVariant.scaleAlpha(0.6),
            borderRadius: 12,
            borderColor: AppColorScheme.onSurface.withValues(alpha: 0.1),
            focusedBorderColor: AppColorScheme.buttonFocused,
            hintStyle: TextStyle(
              color: focused
                  ? AppColorScheme.onButtonFocused.withValues(alpha: 0.5)
                  : AppColorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textStyle: TextStyle(
              color: focused
                  ? AppColorScheme.onButtonFocused
                  : AppColorScheme.onSurface,
            ),
            textFieldType: widget.isPassword
                ? TextFieldType.password
                : TextFieldType.other,
            popParentOnKeyboardClose: false,
            onFieldSubmitted: onSubmitted == null || !widget.enabled
                ? null
                : (_) => onSubmitted(),
            onVisibilityChanged: _onKeyboardVisibilityChanged,
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration() {
    final border = OutlineInputBorder(
      borderRadius: AppRadius.circular(12),
      borderSide: BorderSide(
        color: AppColorScheme.onSurface.withValues(alpha: 0.1),
      ),
    );
    return InputDecoration(
      labelText: widget.label,
      labelStyle: TextStyle(
        color: AppColorScheme.onSurface.withValues(alpha: 0.5),
      ),
      filled: true,
      fillColor: AppColorScheme.surfaceVariant.scaleAlpha(0.6),
      border: border,
      enabledBorder: border,
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.circular(12),
        borderSide: BorderSide(color: AppColorScheme.accent, width: 2),
      ),
    );
  }
}
