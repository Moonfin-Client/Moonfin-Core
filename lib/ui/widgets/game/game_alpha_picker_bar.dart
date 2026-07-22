import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../mixins/focus_state_mixin.dart';

/// Games-scoped copy of Moonfin's standard alphabetical library filter.
///
/// Keeping this inside the games feature avoids changing the established media
/// library browser while preserving the same `All`, `#`, and A-Z interaction.
class GameAlphaPickerBar extends StatelessWidget {
  const GameAlphaPickerBar({
    super.key,
    required this.selected,
    required this.onChanged,
    this.letterFocusNodes,
    this.onNavigateUp,
  });

  final String selected;
  final ValueChanged<String> onChanged;
  final Map<String, FocusNode>? letterFocusNodes;

  /// Called when the user presses up from any letter, so the screen can move
  /// focus to the search field above instead of falling through to the grid.
  final VoidCallback? onNavigateUp;

  static const letters = [
    '',
    '#',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: letters.map((letter) {
          return _GameAlphaLetterButton(
            label: letter.isEmpty ? l10n.all : letter,
            isSelected: selected == letter,
            onTap: () => onChanged(letter),
            focusNode: letterFocusNodes?[letter],
            onNavigateUp: onNavigateUp,
          );
        }).toList(),
      ),
    );
  }
}

class _GameAlphaLetterButton extends StatefulWidget {
  const _GameAlphaLetterButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.focusNode,
    this.onNavigateUp,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final FocusNode? focusNode;
  final VoidCallback? onNavigateUp;

  @override
  State<_GameAlphaLetterButton> createState() => _GameAlphaLetterButtonState();
}

class _GameAlphaLetterButtonState extends State<_GameAlphaLetterButton>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    final desktopScale = prefs.get(UserPreferences.desktopUiScale).scaleFactor;
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final visualSize = 30 * desktopScale;
    final targetSize = PlatformDetection.useMobileUi ? 44.0 : visualSize;

    return Semantics(
      button: true,
      selected: widget.isSelected,
      label: widget.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: Focus(
          focusNode: widget.focusNode,
          onFocusChange: setFocused,
          onKeyEvent: (_, event) {
            // Up moves to the search field above rather than falling through to
            // the grid below, which would also scroll it back to the top.
            if (widget.onNavigateUp != null &&
                event.isActionable &&
                event.logicalKey.isUpKey) {
              widget.onNavigateUp!();
              return KeyEventResult.handled;
            }
            if (!event.logicalKey.isSelectKey) {
              return KeyEventResult.ignored;
            }
            // Consume release/repeat too so focus restoration cannot replay a
            // Select press on the newly focused control.
            if (event is KeyDownEvent) widget.onTap();
            return KeyEventResult.handled;
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: SizedBox(
              width: targetSize,
              height: targetSize,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  width: visualSize,
                  height: visualSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? AppColorScheme.onSurface.withAlpha(26)
                        : null,
                    borderRadius: AppRadius.circular(4),
                    border: showFocusBorder
                        ? Border.fromBorderSide(
                            ThemeRegistry.active.borders.focusBorder.copyWith(
                              color: focusColor,
                              width: 1.5,
                            ),
                          )
                        : null,
                  ),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 15 * desktopScale,
                      fontWeight: widget.isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: widget.isSelected
                          ? AppColorScheme.accent
                          : AppColorScheme.onSurface.withAlpha(140),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
