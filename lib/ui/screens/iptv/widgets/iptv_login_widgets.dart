import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../util/platform_detection.dart';
import '../../../widgets/credential_field.dart';

/// Filled input with a leading icon and an accent glow while focused. TV gets
/// the app's [CredentialField] instead, where select opens the on-screen
/// keyboard and [up] and [down] chain d-pad focus to the neighboring fields.
class GlassField extends StatefulWidget {
  const GlassField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.hint,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
    this.autofocus = false,
    this.focusNode,
    this.up,
    this.down,
    this.onTvKeyboardVisibility,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final FocusNode? focusNode;
  final FocusNode? up;
  final FocusNode? down;
  final ValueChanged<bool>? onTvKeyboardVisibility;

  @override
  State<GlassField> createState() => _GlassFieldState();
}

class _GlassFieldState extends State<GlassField> {
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus != _focused && mounted) {
      setState(() => _focused = _focusNode.hasFocus);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  InputPurpose get _tvInputPurpose {
    if (widget.obscureText) return InputPurpose.password;
    if (widget.keyboardType == TextInputType.url) return InputPurpose.url;
    if (widget.keyboardType == TextInputType.number) {
      return InputPurpose.numeric;
    }
    return InputPurpose.text;
  }

  @override
  Widget build(BuildContext context) {
    if (PlatformDetection.isTV) {
      return CredentialField(
        controller: widget.controller,
        focusNode: _focusNode,
        label: widget.label,
        isPassword: widget.obscureText,
        inputPurpose: _tvInputPurpose,
        validator: widget.validator,
        autofocus: widget.autofocus,
        up: widget.up,
        down: widget.down,
        onKeyboardVisibilityChanged: widget.onTvKeyboardVisibility,
      );
    }
    final c = ThemeRegistry.active.colors;
    final radius = ThemeRegistry.active.borders.cardRadius;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: _focused
            ? [
                BoxShadow(
                  color: c.accent.withValues(alpha: 0.28),
                  blurRadius: 16,
                ),
              ]
            : const [],
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        autofocus: widget.autofocus,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        autocorrect: false,
        enableSuggestions: false,
        style: TextStyle(color: c.onSurface, fontSize: 15),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          prefixIcon: Icon(widget.icon, size: 20),
          suffixIcon: widget.suffixIcon,
          filled: true,
          fillColor: c.inputBackground,
          enabledBorder: OutlineInputBorder(
            borderRadius: radius,
            borderSide: BorderSide(color: c.inputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: radius,
            borderSide: BorderSide(color: c.inputBorderFocused, width: 2),
          ),
        ),
      ),
    );
  }
}

/// The primary call to action. Apple gets a [CupertinoButton], Material an
/// accent gradient fill. Both are real focusable buttons so keyboard and d-pad
/// navigation can reach them.
class LoginPrimaryButton extends StatelessWidget {
  const LoginPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.apple = false,
    this.busy = false,
    this.focusNode,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool apple;
  final bool busy;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final accent = ThemeRegistry.active.colors.accent;
    final onAccent = ThemeRegistry.active.colors.onAccent;

    if (apple) {
      return SizedBox(
        width: double.infinity,
        child: CupertinoButton.filled(
          onPressed: busy ? null : onPressed,
          focusNode: focusNode,
          child: busy
              ? const CupertinoActivityIndicator()
              : Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
        ),
      );
    }

    final radius = ThemeRegistry.active.borders.cardRadius;
    return FilledButton(
      onPressed: busy ? null : onPressed,
      focusNode: focusNode,
      style:
          FilledButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: radius),
          ).copyWith(
            side: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.focused)
                  ? BorderSide(color: onAccent, width: 2)
                  : null,
            ),
          ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: LinearGradient(
            colors: [accent, Color.lerp(accent, Colors.black, 0.32)!],
          ),
        ),
        child: Container(
          height: 52,
          alignment: Alignment.center,
          child: busy
              ? SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    color: onAccent,
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                    color: onAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
