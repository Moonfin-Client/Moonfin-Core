import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../settings/preference_tiles.dart';

/// A list tile with a visible keyboard/D-pad focus state and reliable select
/// activation on TV remotes.
class DpadListTile extends StatelessWidget {
  const DpadListTile({
    super.key,
    required this.title,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.leading,
    this.subtitle,
    this.trailing,
    this.contentPadding,
    this.outerPadding,
    this.useSettingsIconShell = false,
    this.onTap,
    this.onLongPress,
  });

  final FocusNode? focusNode;
  final bool autofocus;
  final bool enabled;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry? contentPadding;

  /// Overrides the TV focus highlight's outer margin (TV only). Panels that
  /// want edge-to-edge highlights pass a tighter EdgeInsets.
  final EdgeInsetsGeometry? outerPadding;

  /// Draws the row as a settings tile, with the bordered icon shell, on every
  /// platform so it matches the rest of the settings screens.
  final bool useSettingsIconShell;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  Widget _settingsTile() => TvFocusHighlight(
    enabled: enabled,
    outerPadding: outerPadding,
    builder: (context, focused) => ListTile(
      focusNode: focusNode,
      autofocus: autofocus,
      enabled: enabled,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      leading: leading != null && useSettingsIconShell
          ? buildSettingsLeadingIconShell(
              context,
              icon: leading!,
              focused: focused,
              iconColor: focused && settingsTileInvertsOnFocus
                  ? AppColors.black.withValues(alpha: 0.54)
                  : AppColorScheme.onSurface.withValues(alpha: 0.78),
            )
          : leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      contentPadding: contentPadding,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (PlatformDetection.isTV) {
      return Focus(
        canRequestFocus: false,
        skipTraversal: true,
        onKeyEvent: (_, event) {
          if (!event.logicalKey.isSelectKey || !enabled || onTap == null) {
            return KeyEventResult.ignored;
          }
          if (event is KeyDownEvent) onTap!();
          return KeyEventResult.handled;
        },
        child: _settingsTile(),
      );
    }

    if (useSettingsIconShell) return _settingsTile();

    return ListTile(
      enabled: enabled,
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      contentPadding: contentPadding,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
    );
  }
}

/// Switch variant of [DpadListTile]. Pressing the remote select key toggles
/// the value even on platforms that do not map D-pad center to an InkWell tap.
class DpadSwitchListTile extends StatelessWidget {
  const DpadSwitchListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.secondary,
    this.subtitle,
    this.useSettingsIconShell = false,
  });

  final FocusNode? focusNode;
  final bool autofocus;
  final bool enabled;
  final Widget? secondary;
  final Widget title;
  final Widget? subtitle;

  /// Draws the row as a settings tile, with the bordered icon shell, on every
  /// platform so it matches the rest of the settings screens.
  final bool useSettingsIconShell;
  final bool value;
  final ValueChanged<bool>? onChanged;

  Widget _settingsTile(bool canToggle) => TvFocusHighlight(
    enabled: enabled,
    builder: (context, focused) {
      final resolvedSecondary = secondary != null && useSettingsIconShell
          ? buildSettingsLeadingIconShell(
              context,
              icon: secondary!,
              focused: focused,
              iconColor: focused && settingsTileInvertsOnFocus
                  ? AppColors.black.withValues(alpha: 0.54)
                  : (Theme.of(context).iconTheme.color ??
                        AppColorScheme.onSurface),
            )
          : secondary;
      return SwitchListTile.adaptive(
        focusNode: focusNode,
        autofocus: autofocus,
        secondary: resolvedSecondary,
        title: title,
        subtitle: subtitle,
        value: value,
        onChanged: canToggle ? onChanged : null,
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    final canToggle = enabled && onChanged != null;
    if (PlatformDetection.isTV) {
      return Focus(
        canRequestFocus: false,
        skipTraversal: true,
        onKeyEvent: (_, event) {
          if (!event.logicalKey.isSelectKey || !canToggle) {
            return KeyEventResult.ignored;
          }
          if (event is KeyDownEvent) onChanged!(!value);
          return KeyEventResult.handled;
        },
        child: _settingsTile(canToggle),
      );
    }

    if (useSettingsIconShell) return _settingsTile(canToggle);

    return SwitchListTile.adaptive(
      secondary: secondary,
      title: title,
      subtitle: subtitle,
      value: value,
      onChanged: canToggle ? onChanged : null,
    );
  }
}

/// A radio group that retains Flutter's native arrow-to-select behavior off TV
/// and uses independently focusable settings rows on TV.
class DpadRadioGroup<T> extends StatelessWidget {
  const DpadRadioGroup({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.child,
  });

  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (PlatformDetection.isTV) {
      return _DpadRadioGroupScope<T>(
        groupValue: groupValue,
        onChanged: onChanged,
        child: Semantics(container: true, child: child),
      );
    }

    return RadioGroup<T>(
      groupValue: groupValue,
      onChanged: onChanged,
      child: child,
    );
  }
}

class _DpadRadioGroupScope<T> extends InheritedWidget {
  const _DpadRadioGroupScope({
    required this.groupValue,
    required this.onChanged,
    required super.child,
  });

  final T? groupValue;
  final ValueChanged<T?> onChanged;

  @override
  bool updateShouldNotify(_DpadRadioGroupScope<T> oldWidget) =>
      groupValue != oldWidget.groupValue || onChanged != oldWidget.onChanged;
}

/// Radio tile for use inside a [DpadRadioGroup]. On TV it follows the existing
/// settings-picker pattern: arrows move focus and Select commits the checked
/// row. Other platforms retain the native [RadioListTile].
class DpadRadioListTile<T> extends StatelessWidget {
  const DpadRadioListTile({
    super.key,
    required this.value,
    required this.title,
    this.subtitle,
    this.focusNode,
    this.autofocus = false,
  });

  final T value;
  final Widget title;
  final Widget? subtitle;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    if (PlatformDetection.isTV) {
      final group = context
          .dependOnInheritedWidgetOfExactType<_DpadRadioGroupScope<T>>();
      assert(group != null, 'DpadRadioListTile must be inside DpadRadioGroup.');
      final selected = group?.groupValue == value;
      return Semantics(
        checked: selected,
        inMutuallyExclusiveGroup: true,
        child: DpadListTile(
          focusNode: focusNode,
          autofocus: autofocus,
          title: title,
          subtitle: subtitle,
          trailing: selected ? const Icon(Icons.check) : null,
          onTap: () => group?.onChanged(value),
        ),
      );
    }

    return RadioListTile<T>(title: title, subtitle: subtitle, value: value);
  }
}
