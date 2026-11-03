import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';

/// A hidden-text field for Silo's dialogs: a new password or a profile PIN.
///
/// On TV a remote has no way out of a plain text field, so the field is a
/// focusable box: select opens the keyboard, down moves to [down] and up to
/// [up]. Elsewhere it's an ordinary [TextField] whose keyboard action is
/// "done" when [down] is the dialog's button ([last]) and "next" otherwise.
class SiloSecretField extends StatelessWidget {
  const SiloSecretField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.tvKey,
    required this.label,
    required this.down,
    required this.onSubmitted,
    this.up,
    this.last = true,
    this.autofocus = false,
    this.enabled = true,
    this.autofillHints,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final GlobalKey<CustomTVTextFieldState> tvKey;
  final String label;
  final FocusNode down;
  final FocusNode? up;
  final ValueChanged<String> onSubmitted;
  final bool last;
  final bool autofocus;
  final bool enabled;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final fillColor = onSurface.withValues(alpha: 0.08);
    final hintStyle = TextStyle(color: onSurface.withValues(alpha: 0.4));

    if (PlatformDetection.isTV) {
      return Focus(
        focusNode: focusNode,
        autofocus: autofocus,
        onKeyEvent: (_, event) {
          if (!event.isActionable) return KeyEventResult.ignored;
          final key = event.logicalKey;
          final target = key.isDownKey
              ? down
              : key.isUpKey
              ? up
              : null;
          if (key.isSelectKey) {
            tvKey.currentState?.openKeyboard();
          } else if (target != null) {
            target.requestFocus();
          } else {
            return KeyEventResult.ignored;
          }
          return KeyEventResult.handled;
        },
        child: ListenableBuilder(
          listenable: focusNode,
          builder: (_, _) => CustomTVTextField(
            key: tvKey,
            controller: controller,
            isFocused: focusNode.hasFocus,
            inputPurpose: InputPurpose.password,
            textFieldType: TextFieldType.password,
            keyboardStyle: GetIt.instance<UserPreferences>().get(
              UserPreferences.keyboardStyle,
            ),
            hint: label,
            filled: true,
            fillColor: fillColor,
            hintStyle: hintStyle,
            textStyle: TextStyle(color: onSurface),
            popParentOnKeyboardClose: false,
            onFieldSubmitted: onSubmitted,
          ),
        ),
      );
    }

    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: true,
      enabled: enabled,
      autofillHints: autofillHints,
      textInputAction: last ? TextInputAction.done : TextInputAction.next,
      onSubmitted: onSubmitted,
      style: TextStyle(color: onSurface),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: hintStyle,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: AppRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
