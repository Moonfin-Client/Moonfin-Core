import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../util/focus/dpad_keys.dart';
import '../overlay_sheet.dart';
import 'preference_binding.dart';

Widget _withBackClose(BuildContext dialogContext, Widget child) {
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
  final borderTokens = ThemeRegistry.active.borders;
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
    child: Center(
      child: IconTheme(
        data: IconThemeData(size: 22, color: iconColor),
        child: icon,
      ),
    ),
  );
}

EdgeInsets _settingsTileOuterPadding(BuildContext context) {
  final inDialog =
      context.findAncestorWidgetOfExactType<SimpleDialog>() != null;
  if (inDialog) {
    return const EdgeInsets.symmetric(vertical: 2);
  }
  return const EdgeInsets.fromLTRB(12, 4, 12, 4);
}

BoxDecoration _settingsTileDecoration(
  BuildContext context, {
  required bool focused,
}) {
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

Widget _buildSubtitle(String value, String? description) {
  if (description == null) {
    return Text(value, style: _kSettingsSubtitleTextStyle);
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(value, style: _kSettingsSubtitleTextStyle),
      const SizedBox(height: 2),
      Text(description, style: _kSettingsDescriptionTextStyle),
    ],
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
    return ListTileTheme(
      data: ListTileTheme.of(context).copyWith(
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

  const SwitchPreferenceTile({
    super.key,
    required this.preference,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconBuilder,
    this.onChanged,
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
          builder: (context, value, _) => SwitchListTile(
            secondary: secondary,
            title: Text(widget.title, style: _kSettingsTitleTextStyle),
            subtitle: widget.subtitle != null
                ? Text(widget.subtitle!, style: _kSettingsSubtitleTextStyle)
                : null,
            value: value,
            onChanged: (v) {
              _binding.value = v;
              widget.onChanged?.call();
            },
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
  final VoidCallback? onChanged;
  final List<T>? values;

  const EnumPreferenceTile({
    super.key,
    required this.preference,
    required this.title,
    required this.labelOf,
    this.description,
    this.icon,
    this.onChanged,
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
          return ListTile(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
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
            subtitle: _buildSubtitle(widget.labelOf(current), widget.description),
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
      builder: (ctx) => _withBackClose(
        ctx,
        SimpleDialog(
          title: Text(widget.title, style: _kSettingsTitleTextStyle),
          children: values.asMap().entries.map((entry) {
            final i = entry.key;
            final v = entry.value;
            final selected = v == current;
            return TvFocusHighlight(
              builder: (_, _) => ListTile(
                autofocus: i == autofocusIndex,
                title: Text(widget.labelOf(v), style: _kSettingsTitleTextStyle),
                trailing: selected ? const Icon(Icons.check) : null,
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
            textColor: _outerFocused
                ? AppColors.black.withValues(alpha: 0.87)
                : AppColorScheme.onSurface,
            iconColor: _outerFocused
                ? AppColors.black.withValues(alpha: 0.54)
                : AppColorScheme.onSurface.withValues(alpha: 0.7),
            titleTextStyle: _kSettingsTitleTextStyle,
            subtitleTextStyle: _kSettingsSubtitleTextStyle,
            child: ValueListenableBuilder<int>(
              valueListenable: _binding,
              builder: (context, value, _) => ListTile(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
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
                    Slider(
                      focusNode: _sliderInternalNode,
                      value: value.toDouble().clamp(widget.min, widget.max),
                      min: widget.min,
                      max: widget.max,
                      divisions: widget.divisions,
                      label: widget.labelOf?.call(value) ?? value.toString(),
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
        builder: (context, value, _) => ListTile(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
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
          subtitle: _buildSubtitle(
            widget.options[value] ?? value,
            widget.description,
          ),
          isThreeLine: widget.description != null,
          onTap: () => _showPicker(context, value),
        ),
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
      builder: (ctx) => _withBackClose(
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
        builder: (context, value, _) => ListTile(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
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
          subtitle: _buildSubtitle(
            widget.options[value] ?? value.toString(),
            widget.description,
          ),
          isThreeLine: widget.description != null,
          onTap: () => _showPicker(context, value),
        ),
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
      builder: (ctx) => _withBackClose(
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

  const TvFocusHighlight({super.key, required this.builder});

  @override
  State<TvFocusHighlight> createState() => _TvFocusHighlightState();
}

class _TvFocusHighlightState extends State<TvFocusHighlight> {
  late final FocusNode _focusNode;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(debugLabel: 'TvFocusHighlightScope');
  }

  @override
  void dispose() {
    _focusNode.dispose();
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
    return Focus(
      focusNode: _focusNode,
      canRequestFocus: true,
      skipTraversal: true,
      descendantsAreFocusable: true,
      onFocusChange: _onFocusChange,
      child: Padding(
        padding: _settingsTileOuterPadding(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          curve: Curves.easeOut,
          decoration: _settingsTileDecoration(context, focused: _focused),
          child: ListTileTheme.merge(
            textColor: _focused
                ? AppColors.black.withValues(alpha: 0.87)
                : AppColorScheme.onSurface,
            iconColor: _focused
                ? AppColors.black.withValues(alpha: 0.54)
                : AppColorScheme.onSurface.withValues(alpha: 0.7),
            titleTextStyle: _kSettingsTitleTextStyle,
            subtitleTextStyle: _kSettingsSubtitleTextStyle,
            child: Builder(builder: (ctx) => widget.builder(ctx, _focused)),
          ),
        ),
      ),
    );
  }
}
