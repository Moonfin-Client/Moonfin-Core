part of '../settings_side_panel.dart';

/// The search box at the top of the settings panel. On TV it is a single
/// d-pad stop whose keyboard only opens on select, elsewhere it is a plain
/// text field that never takes focus on its own, so opening settings never
/// pops a keyboard anywhere.
class _SettingsSearchField extends StatelessWidget {
  const _SettingsSearchField({
    required this.controller,
    required this.focusNode,
    required this.tvFieldKey,
    required this.hint,
    required this.onClear,
  });

  static const double _radius = 28;

  final TextEditingController controller;
  final FocusNode focusNode;
  final GlobalKey<CustomTVTextFieldState> tvFieldKey;
  final String hint;
  final VoidCallback onClear;

  KeyEventResult _onTvKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (event.logicalKey.isBackKey) {
      // The custom keyboard overlay consumes back itself, so this only fires
      // for the system IME path. With no keyboard up it bubbles onward and
      // the panel handles it.
      if (tvFieldKey.currentState?.isKeyboardVisible ?? false) {
        tvFieldKey.currentState?.closeKeyboard();
        node.requestFocus();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }
    if (event.logicalKey.isSelectKey) {
      if (!node.hasFocus) node.requestFocus();
      tvFieldKey.currentState?.openKeyboard();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: focusNode,
      builder: (context, _) {
        final focused = focusNode.hasFocus;
        final background = focused
            ? AppColorScheme.buttonFocused
            : AppColorScheme.surfaceVariant;
        final foreground = focused
            ? AppColorScheme.onButtonFocused
            : AppColorScheme.onSurface;
        final hintColor = foreground.withValues(alpha: 0.55);
        final iconColor = focused
            ? foreground
            : foreground.withValues(alpha: 0.7);

        if (!PlatformDetection.isTV) {
          // Watching the text as well, so the clear button comes and goes
          // with it.
          return ListenableBuilder(
            listenable: controller,
            builder: (context, _) => TextField(
              controller: controller,
              focusNode: focusNode,
              textInputAction: TextInputAction.search,
              style: TextStyle(color: foreground),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: hintColor),
                filled: true,
                fillColor: background,
                border: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                prefixIcon: Icon(Icons.search, color: iconColor, size: 22),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 46,
                  minHeight: 46,
                ),
                suffixIcon: controller.text.isEmpty
                    ? null
                    : IconButton(
                        icon: Icon(Icons.close, color: iconColor, size: 20),
                        onPressed: onClear,
                      ),
              ),
            ),
          );
        }

        final prefs = GetIt.instance<UserPreferences>();
        return Focus(
          focusNode: focusNode,
          onKeyEvent: _onTvKey,
          child: CustomTVTextField(
            key: tvFieldKey,
            controller: controller,
            isFocused: focused,
            inputPurpose: InputPurpose.search,
            keyboardType: KeyboardType.alphabetic,
            keyboardStyle: prefs.get(UserPreferences.keyboardStyle),
            hint: hint,
            prefixIcon: Icon(Icons.search, color: iconColor, size: 24),
            textStyle: TextStyle(color: foreground),
            hintStyle: TextStyle(color: hintColor),
            filled: true,
            fillColor: background,
            borderRadius: _radius,
            // A zero width border still paints a hairline, so the colors go
            // transparent as well to leave the pill clean.
            borderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            borderWidth: 0,
            focusedBorderWidth: 0,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            popParentOnKeyboardClose: false,
            onVisibilityChanged: (visible) {
              // Keeps focus from stranding when the keyboard goes away,
              // however it was closed.
              if (!visible) focusNode.requestFocus();
            },
          ),
        );
      },
    );
  }

  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_radius)),
    borderSide: BorderSide.none,
  );
}
