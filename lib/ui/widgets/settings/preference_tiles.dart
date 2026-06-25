import 'package:flutter/cupertino.dart' show CupertinoSlider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../util/idiom/app_ui_idiom.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/dpad_keys.dart';
import '../adaptive/adaptive_icons.dart';
import '../adaptive/sf_symbol.dart';
import '../overlay_sheet.dart';
import 'preference_binding.dart';

Widget withBackClose(BuildContext dialogContext, Widget child) {
  final closeDialog = createDialogBackCloseHandler(dialogContext);

  return Shortcuts(
    shortcuts: const <ShortcutActivator, Intent>{
      SingleActivator(LogicalKeyboardKey.escape): DismissIntent(),
      SingleActivator(LogicalKeyboardKey.goBack): DismissIntent(),
      SingleActivator(LogicalKeyboardKey.browserBack): DismissIntent(),
      SingleActivator(LogicalKeyboardKey.gameButtonB): DismissIntent(),
    },
    child: Actions(
      actions: <Type, Action<Intent>>{
        DismissIntent: CallbackAction<DismissIntent>(
          onInvoke: (_) {
            closeDialog();
            return null;
          },
        ),
      },
      child: Focus(
        canRequestFocus: false,
        skipTraversal: true,
        onKeyEvent: (_, event) {
          if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
          if (event is KeyDownEvent || event is KeyUpEvent) {
            closeDialog();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: FocusScope(autofocus: true, child: child),
      ),
    ),
  );
}

const TextStyle _kSettingsTitleTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
);
const TextStyle _kSettingsSubtitleTextStyle = TextStyle(fontSize: 12);
const TextStyle _kSettingsDescriptionTextStyle = TextStyle(fontSize: 11);
const double _kSettingsTileRadius = 16;
const double _kSettingsIconShellSize = 44;
const EdgeInsets _kSettingsTileContentPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 8,
);

Widget buildSettingsLeadingIconShell(
  BuildContext context, {
  required Widget icon,
  required bool focused,
  required Color iconColor,
}) {
  if (AppUiIdiomResolver.isApple) {
    final glyph = icon is Icon ? icon.icon : null;
    final base = glyph != null
        ? appleSettingsIconColor(glyph)
        : AppColorScheme.accent;
    return Container(
      width: _kSettingsIconShellSize,
      height: _kSettingsIconShellSize,
      decoration: BoxDecoration(
        color: Color.lerp(base, const Color(0xFF1C1C1E), 0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: glyph != null
            ? SfSymbol(material: glyph, size: 18, color: Colors.white)
            : IconTheme(
                data: const IconThemeData(size: 18, color: Colors.white),
                child: icon,
              ),
      ),
    );
  }
  if (AppUiIdiomResolver.appleTvStyle) {
    final glyph = icon is Icon ? icon.icon : null;
    final tint = focused
        ? Colors.white
        : AppColorScheme.onSurface.withValues(alpha: 0.6);
    return SizedBox(
      width: _kSettingsIconShellSize,
      height: _kSettingsIconShellSize,
      child: Center(
        child: glyph != null
            ? SfSymbol(material: glyph, size: 24, color: tint)
            : IconTheme(
                data: IconThemeData(size: 24, color: tint),
                child: icon,
              ),
      ),
    );
  }
  final borderTokens = ThemeRegistry.active.borders;
  final glyph = icon is Icon ? icon.icon : null;
  final leadingChild = PlatformDetection.isAppleTV && glyph != null
      ? SfSymbol(material: glyph, size: 22, color: iconColor)
      : IconTheme(
          data: IconThemeData(size: 22, color: iconColor),
          child: icon,
        );
  return Container(
    width: _kSettingsIconShellSize,
    height: _kSettingsIconShellSize,
    decoration: BoxDecoration(
      color: AppColorScheme.accent.withValues(alpha: focused ? 0.22 : 0.14),
      borderRadius: BorderRadius.circular(14),
      border: Border.fromBorderSide(
        borderTokens.chipBorder.copyWith(
          color: AppColorScheme.accent.withValues(alpha: focused ? 0.64 : 0.42),
          width: 1,
        ),
      ),
    ),
    child: Center(child: leadingChild),
  );
}

Color settingsHeadlineColor() =>
    AppUiIdiomResolver.appleTvStyle && AppColorScheme.isNeonPulse
    ? AppColorScheme.accent
    : AppColorScheme.onSurface;

EdgeInsets _settingsTileOuterPadding(BuildContext context) {
  if (AppUiIdiomResolver.isApple) {
    return EdgeInsets.zero;
  }
  final inDialog =
      context.findAncestorWidgetOfExactType<SimpleDialog>() != null ||
      context.findAncestorWidgetOfExactType<AlertDialog>() != null;
  if (inDialog) {
    return const EdgeInsets.symmetric(vertical: 2);
  }
  return const EdgeInsets.fromLTRB(12, 4, 12, 4);
}

BoxDecoration _settingsTileDecoration(
  BuildContext context, {
  required bool focused,
}) {
  if (AppUiIdiomResolver.isApple) {
    if (!focused) return const BoxDecoration();
    return BoxDecoration(
      color: AppColorScheme.onSurface.withValues(alpha: 0.14),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: AppColorScheme.accent.withValues(alpha: 0.9),
        width: 1,
      ),
    );
  }
  if (AppUiIdiomResolver.appleTvStyle) {
    if (!focused) return const BoxDecoration();
    return BoxDecoration(
      color: AppColorScheme.isNeonPulse
          ? AppColorScheme.accent.withValues(alpha: 0.38)
          : AppColorScheme.surfaceVariant,
      borderRadius: BorderRadius.circular(12),
    );
  }
  final colorScheme = Theme.of(context).colorScheme;
  final borderTokens = ThemeRegistry.active.borders;
  final baseBorder = borderTokens.cardBorder.color;
  final unfocusedBorderColor = baseBorder.a == 0
      ? AppColorScheme.onSurface.withValues(alpha: 0.16)
      : baseBorder.withValues(alpha: 0.55);

  return BoxDecoration(
    color: focused
        ? AppColorScheme.onSurface
        : colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
    borderRadius: BorderRadius.circular(_kSettingsTileRadius),
    border: Border.fromBorderSide(
      (focused ? borderTokens.focusBorder : borderTokens.cardBorder).copyWith(
        color: focused
            ? AppColorScheme.accent.withValues(alpha: 0.72)
            : unfocusedBorderColor,
        width: 1.0,
      ),
    ),
    boxShadow: focused
        ? (borderTokens.focusGlow.isNotEmpty
              ? borderTokens.focusGlow
              : [
                  BoxShadow(
                    color: AppColorScheme.accent.withValues(alpha: 0.22),
                    blurRadius: 14,
                    spreadRadius: 0.5,
                  ),
                ])
        : null,
  );
}

Widget buildSettingsSelectionBubble(
  BuildContext context,
  String label,
  bool focused,
) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: focused
          ? AppColors.black.withValues(alpha: 0.12)
          : colorScheme.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: focused
            ? AppColors.black.withValues(alpha: 0.35)
            : colorScheme.primary.withValues(alpha: 0.35),
        width: 1,
      ),
    ),
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: theme.textTheme.labelMedium?.copyWith(
        color: focused
            ? AppColors.black.withValues(alpha: 0.87)
            : colorScheme.primary,
        fontWeight: FontWeight.w600,
        fontSize: 11,
      ),
    ),
  );
}

void _ensureFocusVisible(BuildContext context, {double alignment = 0.9}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted) return;
    Scrollable.ensureVisible(
      context,
      alignment: alignment,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
    );
  });
}

class SettingsListTypography extends StatelessWidget {
  final Widget child;

  const SettingsListTypography({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          tileColor: Colors.transparent,
          selectedTileColor: Colors.transparent,
          titleTextStyle:
              theme.textTheme.bodyMedium?.merge(_kSettingsTitleTextStyle) ??
              _kSettingsTitleTextStyle,
          subtitleTextStyle:
              theme.textTheme.bodySmall?.merge(_kSettingsSubtitleTextStyle) ??
              _kSettingsSubtitleTextStyle,
          contentPadding: _kSettingsTileContentPadding,
          minLeadingWidth: _kSettingsIconShellSize,
          horizontalTitleGap: 14,
        ),
        child: child,
      ),
    );
  }
}

class SwitchPreferenceTile extends StatefulWidget {
  final Preference<bool> preference;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget Function(double size, Color color)? iconBuilder;
  final VoidCallback? onChanged;

  final bool inverted;
  final bool enabled;
  final FocusNode? focusNode;

  const SwitchPreferenceTile({
    super.key,
    required this.preference,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconBuilder,
    this.onChanged,
    this.inverted = false,
    this.enabled = true,
    this.focusNode,
  });

  @override
  State<SwitchPreferenceTile> createState() => _SwitchPreferenceTileState();
}

class _SwitchPreferenceTileState extends State<SwitchPreferenceTile> {
  late final PreferenceBinding<bool> _binding;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      widget.preference,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TvFocusHighlight(
      enabled: widget.enabled,
      builder: (context, focused) {
        final iconColor = focused
            ? AppColors.black.withValues(alpha: 0.54)
            : (Theme.of(context).iconTheme.color ?? AppColorScheme.onSurface);
        final secondary = widget.iconBuilder != null
            ? buildSettingsLeadingIconShell(
                context,
                icon: widget.iconBuilder!(24, iconColor),
                focused: focused,
                iconColor: iconColor,
              )
            : widget.icon != null
            ? buildSettingsLeadingIconShell(
                context,
                icon: Icon(widget.icon),
                focused: focused,
                iconColor: iconColor,
              )
            : null;

        return ValueListenableBuilder<bool>(
          valueListenable: _binding,
          builder: (context, value, _) => SwitchListTile.adaptive(
            focusNode: widget.focusNode,
            secondary: secondary,
            title: Text(widget.title, style: _kSettingsTitleTextStyle),
            subtitle: widget.subtitle != null
                ? Text(widget.subtitle!, style: _kSettingsSubtitleTextStyle)
                : null,
            value: widget.inverted ? !value : value,
            onChanged: widget.enabled
                ? (v) {
                    _binding.value = widget.inverted ? !v : v;
                    widget.onChanged?.call();
                  }
                : null,
          ),
        );
      },
    );
  }
}

class EnumPreferenceTile<T extends Enum> extends StatefulWidget {
  final EnumPreference<T> preference;
  final String title;
  final String? description;
  final IconData? icon;
  final String Function(T value) labelOf;
  final String Function(T value)? dialogLabelOf;
  final String Function(T value)? dialogSubtitleOf;
  final VoidCallback? onChanged;
  final ValueChanged<T>? onChangedValue;
  final List<T>? values;

  const EnumPreferenceTile({
    super.key,
    required this.preference,
    required this.title,
    required this.labelOf,
    this.dialogLabelOf,
    this.dialogSubtitleOf,
    this.description,
    this.icon,
    this.onChanged,
    this.onChangedValue,
    this.values,
  });

  @override
  State<EnumPreferenceTile<T>> createState() => _EnumPreferenceTileState<T>();
}

class _EnumPreferenceTileState<T extends Enum>
    extends State<EnumPreferenceTile<T>> {
  late final PreferenceBinding<T> _binding;
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      widget.preference,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final values = widget.values ?? widget.preference.values.toList();
    return TvFocusHighlight(
      builder: (context, focused) => ValueListenableBuilder<T>(
        valueListenable: _binding,
        builder: (context, value, _) {
          final current = values.contains(value) ? value : values.first;
          final label = widget.labelOf(current);
          return ListTile(
            leading: widget.icon != null
                ? buildSettingsLeadingIconShell(
                    context,
                    icon: Icon(widget.icon),
                    focused: focused,
                    iconColor: focused
                        ? AppColors.black.withValues(alpha: 0.54)
                        : AppColorScheme.onSurface.withValues(alpha: 0.78),
                  )
                : null,
            title: Text(widget.title, style: _kSettingsTitleTextStyle),
            trailing: buildSettingsSelectionBubble(context, label, focused),
            subtitle: widget.description != null
                ? Text(
                    widget.description!,
                    style: _kSettingsDescriptionTextStyle,
                  )
                : null,
            isThreeLine: widget.description != null,
            onTap: () => _showPicker(context, current),
          );
        },
      ),
    );
  }

  void _showPicker(BuildContext context, T current) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final values = widget.values ?? widget.preference.values.toList();
    final selectedIndex = values.indexOf(current);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;
    var picked = false;
    final result = await showFocusRestoringDialog<T>(
      context: context,
      useRootNavigator: false,
      builder: (ctx) => withBackClose(
        ctx,
        SimpleDialog(
          title: Text(widget.title, style: _kSettingsTitleTextStyle),
          children: values.asMap().entries.map((entry) {
            final i = entry.key;
            final v = entry.value;
            final selected = v == current;
            return TvFocusHighlight(
              builder: (_, focused) => ListTile(
                autofocus: i == autofocusIndex,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                title: Text(
                  (widget.dialogLabelOf ?? widget.labelOf)(v),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: focused
                        ? AppColors.black.withValues(alpha: 0.87)
                        : AppColorScheme.onSurface,
                  ),
                ),
                subtitle: widget.dialogSubtitleOf != null
                    ? Text(
                        widget.dialogSubtitleOf!(v),
                        style: TextStyle(
                          fontSize: 12,
                          color: focused
                              ? AppColors.black.withValues(alpha: 0.54)
                              : AppColorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      )
                    : null,
                isThreeLine: widget.dialogSubtitleOf != null,
                trailing: selected
                    ? Icon(
                        Icons.check,
                        color: focused
                            ? AppColors.black.withValues(alpha: 0.54)
                            : (AppUiIdiomResolver.isApple
                                ? AppColorScheme.accent
                                : null),
                      )
                    : null,
                onTap: () {
                  if (picked) return;
                  picked = true;
                  Navigator.pop(ctx, v);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
    _pickerOpen = false;
    if (!mounted || result == null || result == _binding.value) return;
    _binding.value = result;
    widget.onChanged?.call();
    widget.onChangedValue?.call(result);
  }
}

class SliderPreferenceTile extends StatefulWidget {
  final Preference<int> preference;
  final String title;
  final IconData? icon;
  final double min;
  final double max;
  final int? divisions;
  final String Function(int value)? labelOf;
  final VoidCallback? onChangeEnd;

  const SliderPreferenceTile({
    super.key,
    required this.preference,
    required this.title,
    this.icon,
    required this.min,
    required this.max,
    this.divisions,
    this.labelOf,
    this.onChangeEnd,
  });

  @override
  State<SliderPreferenceTile> createState() => _SliderPreferenceTileState();
}

class _SliderPreferenceTileState extends State<SliderPreferenceTile> {
  late final PreferenceBinding<int> _binding;
  late final FocusNode _outerFocusNode;
  late final FocusNode _sliderInternalNode;
  bool _outerFocused = false;

  int get _step {
    if (widget.divisions != null && widget.divisions! > 0) {
      final s = ((widget.max - widget.min) / widget.divisions!).round();
      return s < 1 ? 1 : s;
    }
    return 1;
  }

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      widget.preference,
    );
    _outerFocusNode = FocusNode(debugLabel: 'SliderPrefTileOuter');
    _sliderInternalNode = FocusNode(
      debugLabel: 'SliderPrefTileInner',
      canRequestFocus: false,
      skipTraversal: true,
    );
  }

  @override
  void dispose() {
    _outerFocusNode.dispose();
    _sliderInternalNode.dispose();
    _binding.dispose();
    super.dispose();
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowUp) {
      node.previousFocus();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      node.nextFocus();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.arrowRight) {
      final delta = key == LogicalKeyboardKey.arrowLeft ? -_step : _step;
      final current = _binding.value;
      final next = (current + delta).clamp(
        widget.min.round(),
        widget.max.round(),
      );
      if (next != current) {
        _binding.value = next;
        widget.onChangeEnd?.call();
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _outerFocusNode,
      onKeyEvent: _onKeyEvent,
      onFocusChange: (focused) {
        if (focused) {
          _ensureFocusVisible(context);
        }
        if (_outerFocused != focused && mounted) {
          setState(() => _outerFocused = focused);
        }
      },
      child: Padding(
        padding: _settingsTileOuterPadding(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          curve: Curves.easeOut,
          decoration: _settingsTileDecoration(context, focused: _outerFocused),
          child: ListTileTheme.merge(
            textColor: _outerFocused && !AppUiIdiomResolver.appleTvStyle
                ? AppColors.black.withValues(alpha: 0.87)
                : AppColorScheme.onSurface,
            iconColor: _outerFocused && !AppUiIdiomResolver.appleTvStyle
                ? AppColors.black.withValues(alpha: 0.54)
                : AppColorScheme.onSurface.withValues(alpha: 0.7),
            titleTextStyle: _kSettingsTitleTextStyle,
            subtitleTextStyle: _kSettingsSubtitleTextStyle,
            child: ValueListenableBuilder<int>(
              valueListenable: _binding,
              builder: (context, value, _) => ListTile(
                leading: widget.icon != null
                    ? buildSettingsLeadingIconShell(
                        context,
                        icon: Icon(widget.icon),
                        focused: _outerFocused,
                        iconColor: _outerFocused
                            ? AppColors.black.withValues(alpha: 0.54)
                            : AppColorScheme.onSurface.withValues(alpha: 0.78),
                      )
                    : null,
                title: Text(widget.title, style: _kSettingsTitleTextStyle),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.labelOf != null)
                      Text(
                        widget.labelOf!(value),
                        style: TextStyle(
                          fontSize: _kSettingsSubtitleTextStyle.fontSize,
                          color: _outerFocused
                              ? AppColors.black.withValues(alpha: 0.54)
                              : AppColorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    AppUiIdiomResolver.isApple
                        ? CupertinoSlider(
                            value: value.toDouble().clamp(
                              widget.min,
                              widget.max,
                            ),
                            min: widget.min,
                            max: widget.max,
                            divisions: widget.divisions,
                            onChanged: (v) => _binding.value = v.round(),
                            onChangeEnd: (_) => widget.onChangeEnd?.call(),
                          )
                        : Slider(
                            focusNode: _sliderInternalNode,
                            value: value.toDouble().clamp(
                              widget.min,
                              widget.max,
                            ),
                            min: widget.min,
                            max: widget.max,
                            divisions: widget.divisions,
                            label:
                                widget.labelOf?.call(value) ?? value.toString(),
                            onChanged: (v) => _binding.value = v.round(),
                            onChangeEnd: (_) => widget.onChangeEnd?.call(),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StringPickerPreferenceTile extends StatefulWidget {
  final Preference<String> preference;
  final String title;
  final String? description;
  final IconData? icon;
  final Map<String, String> options;
  final VoidCallback? onChanged;

  const StringPickerPreferenceTile({
    super.key,
    required this.preference,
    required this.title,
    this.description,
    this.icon,
    required this.options,
    this.onChanged,
  });

  @override
  State<StringPickerPreferenceTile> createState() =>
      _StringPickerPreferenceTileState();
}

class _StringPickerPreferenceTileState
    extends State<StringPickerPreferenceTile> {
  late final PreferenceBinding<String> _binding;
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      widget.preference,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TvFocusHighlight(
      builder: (context, focused) => ValueListenableBuilder<String>(
        valueListenable: _binding,
        builder: (context, value, _) {
          final label = widget.options[value] ?? value;
          return ListTile(
            leading: widget.icon != null
                ? buildSettingsLeadingIconShell(
                    context,
                    icon: Icon(widget.icon),
                    focused: focused,
                    iconColor: focused
                        ? AppColors.black.withValues(alpha: 0.54)
                        : AppColorScheme.onSurface.withValues(alpha: 0.78),
                  )
                : null,
            title: Text(widget.title, style: _kSettingsTitleTextStyle),
            trailing: buildSettingsSelectionBubble(context, label, focused),
            subtitle: widget.description != null
                ? Text(
                    widget.description!,
                    style: _kSettingsDescriptionTextStyle,
                  )
                : null,
            isThreeLine: widget.description != null,
            onTap: () => _showPicker(context, value),
          );
        },
      ),
    );
  }

  void _showPicker(BuildContext context, String current) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final entries = widget.options.entries.toList();
    final selectedIndex = entries.indexWhere((e) => e.key == current);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;
    var picked = false;
    final result = await showFocusRestoringDialog<String>(
      context: context,
      useRootNavigator: false,
      builder: (ctx) => withBackClose(
        ctx,
        SimpleDialog(
          title: Text(widget.title, style: _kSettingsTitleTextStyle),
          children: entries.asMap().entries.map((entry) {
            final i = entry.key;
            final e = entry.value;
            final selected = e.key == current;
            return TvFocusHighlight(
              builder: (_, _) => ListTile(
                autofocus: i == autofocusIndex,
                title: Text(e.value, style: _kSettingsTitleTextStyle),
                trailing: selected ? const Icon(Icons.check) : null,
                onTap: () {
                  if (picked) return;
                  picked = true;
                  Navigator.pop(ctx, e.key);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
    _pickerOpen = false;
    if (!mounted || result == null) return;
    if (result != _binding.value) {
      _binding.value = result;
      widget.onChanged?.call();
    }
  }
}

class IntPickerPreferenceTile extends StatefulWidget {
  final Preference<int> preference;
  final String title;
  final String? description;
  final IconData? icon;
  final Map<int, String> options;
  final VoidCallback? onChanged;

  const IntPickerPreferenceTile({
    super.key,
    required this.preference,
    required this.title,
    required this.options,
    this.description,
    this.icon,
    this.onChanged,
  });

  @override
  State<IntPickerPreferenceTile> createState() =>
      _IntPickerPreferenceTileState();
}

class _IntPickerPreferenceTileState extends State<IntPickerPreferenceTile> {
  late final PreferenceBinding<int> _binding;
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      widget.preference,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TvFocusHighlight(
      builder: (context, focused) => ValueListenableBuilder<int>(
        valueListenable: _binding,
        builder: (context, value, _) {
          final label = widget.options[value] ?? value.toString();
          return ListTile(
            leading: widget.icon != null
                ? buildSettingsLeadingIconShell(
                    context,
                    icon: Icon(widget.icon),
                    focused: focused,
                    iconColor: focused
                        ? AppColors.black.withValues(alpha: 0.54)
                        : AppColorScheme.onSurface.withValues(alpha: 0.78),
                  )
                : null,
            title: Text(widget.title, style: _kSettingsTitleTextStyle),
            trailing: buildSettingsSelectionBubble(context, label, focused),
            subtitle: widget.description != null
                ? Text(
                    widget.description!,
                    style: _kSettingsDescriptionTextStyle,
                  )
                : null,
            isThreeLine: widget.description != null,
            onTap: () => _showPicker(context, value),
          );
        },
      ),
    );
  }

  void _showPicker(BuildContext context, int current) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final entries = widget.options.entries.toList();
    final selectedIndex = entries.indexWhere((e) => e.key == current);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;
    var picked = false;
    final result = await showFocusRestoringDialog<int>(
      context: context,
      useRootNavigator: false,
      builder: (ctx) => withBackClose(
        ctx,
        SimpleDialog(
          title: Text(widget.title, style: _kSettingsTitleTextStyle),
          children: entries.asMap().entries.map((entry) {
            final i = entry.key;
            final e = entry.value;
            final selected = e.key == current;
            return TvFocusHighlight(
              builder: (_, _) => ListTile(
                autofocus: i == autofocusIndex,
                title: Text(e.value, style: _kSettingsTitleTextStyle),
                trailing: selected ? const Icon(Icons.check) : null,
                onTap: () {
                  if (picked) return;
                  picked = true;
                  Navigator.pop(ctx, e.key);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
    _pickerOpen = false;
    if (!mounted || result == null) return;
    if (result != _binding.value) {
      _binding.value = result;
      widget.onChanged?.call();
    }
  }
}

class TvFocusHighlight extends StatefulWidget {
  final Widget Function(BuildContext context, bool focused) builder;
  final bool enabled;
  final FocusNode? focusNode;

  const TvFocusHighlight({
    super.key,
    required this.builder,
    this.enabled = true,
    this.focusNode,
  });

  @override
  State<TvFocusHighlight> createState() => _TvFocusHighlightState();
}

class _TvFocusHighlightState extends State<TvFocusHighlight> {
  FocusNode? _internalFocusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ??
      (_internalFocusNode ??= FocusNode(debugLabel: 'TvFocusHighlightScope'));
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focused = _effectiveFocusNode.hasFocus;
  }

  @override
  void dispose() {
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _onFocusChange(bool focused) {
    setState(() => _focused = focused);
    if (focused) {
      _ensureFocusVisible(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final highlighted =
        _focused &&
        !AppUiIdiomResolver.isApple &&
        !AppUiIdiomResolver.appleTvStyle;
    return Focus(
      focusNode: _effectiveFocusNode,
      canRequestFocus: false,
      skipTraversal: true,
      descendantsAreFocusable: widget.enabled,
      onFocusChange: _onFocusChange,
      child: Padding(
        padding: _settingsTileOuterPadding(context),
        child: Opacity(
          opacity: widget.enabled ? 1.0 : 0.45,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            curve: Curves.easeOut,
            decoration: _settingsTileDecoration(context, focused: _focused),
            child: ListTileTheme.merge(
              textColor: highlighted
                  ? AppColors.black.withValues(alpha: 0.87)
                  : settingsHeadlineColor(),
              iconColor: highlighted
                  ? AppColors.black.withValues(alpha: 0.54)
                  : AppColorScheme.onSurface.withValues(alpha: 0.7),
              titleTextStyle: _kSettingsTitleTextStyle,
              subtitleTextStyle: _kSettingsSubtitleTextStyle,
              child: Builder(builder: (ctx) => widget.builder(ctx, _focused)),
            ),
          ),
        ),
      ),
    );
  }
}
