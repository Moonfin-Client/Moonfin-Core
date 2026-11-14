import 'package:flutter/cupertino.dart' show CupertinoSlider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../playback/subtitle_fonts.dart';
import '../../../playback/subtitle_style.dart';
import '../../../preference/user_preferences.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_preview_scope.dart';
import '../../widgets/settings/settings_section_header.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

class SubtitleCustomizationScreen extends StatefulWidget {
  const SubtitleCustomizationScreen({super.key});

  @override
  State<SubtitleCustomizationScreen> createState() =>
      _SubtitleCustomizationScreenState();
}

class _SubtitleCustomizationScreenState
    extends State<SubtitleCustomizationScreen> {
  late final PreferenceBinding<double> _sizeBind;
  late final PreferenceBinding<double> _offsetBind;
  late final PreferenceBinding<double> _hdrSizeBind;
  late final PreferenceBinding<double> _hdrOffsetBind;
  late final FocusNode _sizeOuterNode;
  late final FocusNode _sizeInnerNode;
  late final FocusNode _offsetOuterNode;
  late final FocusNode _offsetInnerNode;
  late final FocusNode _hdrSizeOuterNode;
  late final FocusNode _hdrSizeInnerNode;
  late final FocusNode _hdrOffsetOuterNode;
  late final FocusNode _hdrOffsetInnerNode;
  bool _sizeFocused = false;
  bool _offsetFocused = false;
  bool _hdrSizeFocused = false;
  bool _hdrOffsetFocused = false;

  @override
  void initState() {
    super.initState();
    final store = GetIt.instance<PreferenceStore>();
    _sizeBind = PreferenceBinding(store, UserPreferences.subtitlesTextSize);
    _offsetBind = PreferenceBinding(
      store,
      UserPreferences.subtitlesOffsetPosition,
    );
    _sizeOuterNode = FocusNode(debugLabel: 'SubtitleSizeOuter');
    _sizeInnerNode = FocusNode(
      debugLabel: 'SubtitleSizeInner',
      canRequestFocus: false,
      skipTraversal: true,
    );
    _offsetOuterNode = FocusNode(debugLabel: 'SubtitleOffsetOuter');
    _offsetInnerNode = FocusNode(
      debugLabel: 'SubtitleOffsetInner',
      canRequestFocus: false,
      skipTraversal: true,
    );
    _hdrSizeBind = PreferenceBinding(
      store,
      UserPreferences.subtitlesHdrTextSize,
    );
    _hdrOffsetBind = PreferenceBinding(
      store,
      UserPreferences.subtitlesHdrOffsetPosition,
    );
    _hdrSizeOuterNode = FocusNode(debugLabel: 'SubtitleHdrSizeOuter');
    _hdrSizeInnerNode = FocusNode(
      debugLabel: 'SubtitleHdrSizeInner',
      canRequestFocus: false,
      skipTraversal: true,
    );
    _hdrOffsetOuterNode = FocusNode(debugLabel: 'SubtitleHdrOffsetOuter');
    _hdrOffsetInnerNode = FocusNode(
      debugLabel: 'SubtitleHdrOffsetInner',
      canRequestFocus: false,
      skipTraversal: true,
    );
  }

  KeyEventResult _sliderKeyHandler({
    required FocusNode node,
    required KeyEvent event,
    required PreferenceBinding<double> binding,
    required double min,
    required double max,
    required double step,
    bool swallowDown = false,
    bool normalizeStepGrid = false,
  }) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowUp) {
      final moved = node.previousFocus();
      if (!moved) {
        node.requestFocus();
      }
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      if (swallowDown) {
        return KeyEventResult.handled;
      }
      final moved = node.nextFocus();
      if (!moved) {
        node.requestFocus();
      }
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.arrowRight) {
      final delta = key == LogicalKeyboardKey.arrowLeft ? -step : step;
      final proposed = binding.value + delta;
      final next = normalizeStepGrid
          ? normalizeSteppedSubtitleOffsetChange(
              storedValue: binding.value,
              proposedValue: proposed,
              min: min,
              max: max,
              step: step,
            )
          : proposed.clamp(min, max).toDouble();
      if (next != binding.value) binding.value = next;
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  void dispose() {
    _sizeOuterNode.dispose();
    _sizeInnerNode.dispose();
    _offsetOuterNode.dispose();
    _offsetInnerNode.dispose();
    _hdrSizeOuterNode.dispose();
    _hdrSizeInnerNode.dispose();
    _hdrOffsetOuterNode.dispose();
    _hdrOffsetInnerNode.dispose();
    _sizeBind.dispose();
    _offsetBind.dispose();
    _hdrSizeBind.dispose();
    _hdrOffsetBind.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = _buildContent(context);
    if (PlatformDetection.isTV) {
      return RequestInitialFocus(child: content);
    }
    return content;
  }

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.subtitleCustomization)),
        body: ListView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 16,
          ),
          children: [
            _ColorPickerTile(
              title: l10n.textFillColor,
              icon: Icons.format_color_text,
              preference: UserPreferences.subtitlesTextColor,
              allowTransparent: false,
            ),
            _ColorPickerTile(
              title: l10n.textStrokeColor,
              icon: Icons.border_color,
              preference: UserPreferences.subtitleTextStrokeColor,
            ),
            IntPickerPreferenceTile(
              preference: UserPreferences.subtitlesStrokeWidth,
              title: l10n.subtitleStrokeWidth,
              icon: Icons.line_weight,
              options: {
                100: l10n.defaultLabel,
                150: l10n.medium,
                200: l10n.large,
              },
            ),
            _ColorPickerTile(
              title: l10n.backgroundColor,
              icon: Icons.format_color_fill,
              preference: UserPreferences.subtitlesBackgroundColor,
            ),
            _BoldTile(
              title: l10n.subtitleBold,
              preference: UserPreferences.subtitlesTextWeight,
            ),
            _sliderTile(
              context: context,
              icon: Icons.format_size,
              label: l10n.subtitleSize,
              binding: _sizeBind,
              previewKey: UserPreferences.subtitlesTextSize.key,
              outerNode: _sizeOuterNode,
              innerNode: _sizeInnerNode,
              focused: _sizeFocused,
              onFocusChange: (f) {
                if (_sizeFocused != f && mounted) {
                  setState(() => _sizeFocused = f);
                }
              },
              min: 12,
              max: 48,
              divisions: 18,
              step: 2,
              labelBuilder: (v) => l10n.pixelValue(v.round()),
            ),
            _sliderTile(
              context: context,
              icon: Icons.vertical_align_bottom,
              label: l10n.verticalOffset,
              binding: _offsetBind,
              previewKey: UserPreferences.subtitlesOffsetPosition.key,
              outerNode: _offsetOuterNode,
              innerNode: _offsetInnerNode,
              focused: _offsetFocused,
              onFocusChange: (f) {
                if (_offsetFocused != f && mounted) {
                  setState(() => _offsetFocused = f);
                }
              },
              min: 0.0,
              max: primarySubtitleMaxOffset,
              divisions: 18,
              step: 0.02,
              normalizeStepGrid: true,
              labelBuilder: (v) => l10n.percentValue((v * 100).round()),
            ),
            const _FontTile(),
            SwitchPreferenceTile(
              preference: UserPreferences.subtitlesShadow,
              title: l10n.subtitleShadow,
              icon: Icons.flip_to_back,
            ),
            ListenableBuilder(
              listenable: GetIt.instance<UserPreferences>(),
              builder: (context, _) =>
                  GetIt.instance<UserPreferences>().get(
                    UserPreferences.subtitlesShadow,
                  )
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SliderPreferenceTile(
                          preference: UserPreferences.subtitlesShadowIntensity,
                          title: l10n.subtitleShadowIntensity,
                          icon: Icons.opacity,
                          min: 10,
                          max: 100,
                          divisions: 9,
                          labelOf: l10n.percentValue,
                        ),
                        SliderPreferenceTile(
                          preference: UserPreferences.subtitlesShadowOffset,
                          title: l10n.subtitleShadowOffset,
                          icon: Icons.south_east,
                          min: 0,
                          max: 8,
                          divisions: 8,
                          labelOf: (v) => '$v',
                        ),
                        SliderPreferenceTile(
                          preference: UserPreferences.subtitlesShadowBlur,
                          title: l10n.subtitleShadowBlur,
                          icon: Icons.blur_on,
                          min: 0,
                          max: 8,
                          divisions: 8,
                          labelOf: (v) => '$v',
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            SettingsSectionHeader(l10n.hdr),
            SwitchPreferenceTile(
              preference: UserPreferences.subtitlesHdrSeparate,
              title: l10n.subtitleHdrSeparate,
              subtitle: l10n.subtitleHdrSeparateSubtitle,
              icon: Icons.hdr_on,
            ),
            ListenableBuilder(
              listenable: GetIt.instance<UserPreferences>(),
              builder: (context, _) => GetIt.instance<UserPreferences>().get(
                UserPreferences.subtitlesHdrSeparate,
              )
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _ColorPickerTile(
                          title: l10n.textFillColor,
                          icon: Icons.format_color_text,
                          preference: UserPreferences.subtitlesHdrTextColor,
                          allowTransparent: false,
                        ),
                        _ColorPickerTile(
                          title: l10n.textStrokeColor,
                          icon: Icons.border_color,
                          preference:
                              UserPreferences.subtitlesHdrTextStrokeColor,
                        ),
                        _ColorPickerTile(
                          title: l10n.backgroundColor,
                          icon: Icons.format_color_fill,
                          preference:
                              UserPreferences.subtitlesHdrBackgroundColor,
                        ),
                        _BoldTile(
                          title: l10n.subtitleBold,
                          preference: UserPreferences.subtitlesHdrTextWeight,
                        ),
                        _sliderTile(
                          context: context,
                          icon: Icons.format_size,
                          label: l10n.subtitleSize,
                          binding: _hdrSizeBind,
                          previewKey: UserPreferences.subtitlesHdrTextSize.key,
                          outerNode: _hdrSizeOuterNode,
                          innerNode: _hdrSizeInnerNode,
                          focused: _hdrSizeFocused,
                          onFocusChange: (f) {
                            if (_hdrSizeFocused != f && mounted) {
                              setState(() => _hdrSizeFocused = f);
                            }
                          },
                          min: 12,
                          max: 48,
                          divisions: 18,
                          step: 2,
                          labelBuilder: (v) => l10n.pixelValue(v.round()),
                        ),
                        _sliderTile(
                          context: context,
                          icon: Icons.vertical_align_bottom,
                          label: l10n.verticalOffset,
                          binding: _hdrOffsetBind,
                          previewKey:
                              UserPreferences.subtitlesHdrOffsetPosition.key,
                          outerNode: _hdrOffsetOuterNode,
                          innerNode: _hdrOffsetInnerNode,
                          focused: _hdrOffsetFocused,
                          onFocusChange: (f) {
                            if (_hdrOffsetFocused != f && mounted) {
                              setState(() => _hdrOffsetFocused = f);
                            }
                          },
                          min: 0.0,
                          max: primarySubtitleMaxOffset,
                          divisions: 18,
                          step: 0.02,
                          swallowDown: true,
                          normalizeStepGrid: true,
                          labelBuilder: (v) =>
                              l10n.percentValue((v * 100).round()),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sliderTile({
    required BuildContext context,
    required IconData icon,
    required String label,
    required PreferenceBinding<double> binding,
    required String previewKey,
    required FocusNode outerNode,
    required FocusNode innerNode,
    required bool focused,
    required ValueChanged<bool> onFocusChange,
    required double min,
    required double max,
    required int divisions,
    required double step,
    bool swallowDown = false,
    bool normalizeStepGrid = false,
    required String Function(double) labelBuilder,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final useTvFocusStyling = PlatformDetection.isTV;
    final activeFocusStyling = useTvFocusStyling && focused;
    final tile = ValueListenableBuilder<double>(
      valueListenable: binding,
      builder: (context, value, _) => Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
        child: Focus(
          focusNode: outerNode,
          onFocusChange: onFocusChange,
          onKeyEvent: (node, event) => _sliderKeyHandler(
            node: node,
            event: event,
            binding: binding,
            min: min,
            max: max,
            step: step,
            swallowDown: swallowDown,
            normalizeStepGrid: normalizeStepGrid,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: activeFocusStyling
                  ? AppColorScheme.onSurface
                  : colorScheme.surfaceContainerLow,
              borderRadius: AppRadius.circular(12),
              border: Border.fromBorderSide(
                (activeFocusStyling
                        ? ThemeRegistry.active.borders.focusBorder
                        : ThemeRegistry.active.borders.cardBorder)
                    .copyWith(width: 1),
              ),
              boxShadow: activeFocusStyling
                  ? ThemeRegistry.active.borders.focusGlow
                  : null,
            ),
            child: ListTileTheme.merge(
              textColor: activeFocusStyling
                  ? AppColors.black.withValues(alpha: 0.87)
                  : AppColorScheme.onSurface,
              iconColor: activeFocusStyling
                  ? AppColors.black.withValues(alpha: 0.54)
                  : AppColorScheme.onSurface.withValues(alpha: 0.7),
              child: ListTile(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                leading: Icon(icon),
                title: Text(label),
                subtitle: AppUiIdiomResolver.isApple
                    ? CupertinoSlider(
                        value: value.clamp(min, max),
                        min: min,
                        max: max,
                        divisions: divisions,
                        onChanged: (v) => binding.value = normalizeStepGrid
                            ? normalizeSteppedSubtitleOffsetChange(
                                storedValue: binding.value,
                                proposedValue: v,
                                min: min,
                                max: max,
                                step: step,
                              )
                            : v,
                      )
                    : Slider(
                        focusNode: innerNode,
                        value: value.clamp(min, max),
                        min: min,
                        max: max,
                        divisions: divisions,
                        label: labelBuilder(value.clamp(min, max).toDouble()),
                        onChanged: (v) => binding.value = normalizeStepGrid
                            ? normalizeSteppedSubtitleOffsetChange(
                                storedValue: binding.value,
                                proposedValue: v,
                                min: min,
                                max: max,
                                step: step,
                              )
                            : v,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
    return SettingsPreviewReporter(
      describe: () => SettingsPreviewEntry(prefKey: previewKey, title: label),
      child: tile,
    );
  }
}

class _ColorPickerTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final Preference<int> preference;
  final bool allowTransparent;

  const _ColorPickerTile({
    required this.title,
    required this.icon,
    required this.preference,
    this.allowTransparent = true,
  });

  @override
  State<_ColorPickerTile> createState() => _ColorPickerTileState();
}

/// Keyed by slug rather than by English display text, so a translated label
/// cannot fall out of step with the color it names.
const subtitlePresetColors = <String, int>{
  'white': 0xFFFFFFFF,
  'light_gray': 0xFFCCCCCC,
  'gray': 0xFF808080,
  'dark_gray': 0xFF404040,
  'black': 0xFF000000,
  'yellow': 0xFFFFFF00,
  'green': 0xFF00FF00,
  'cyan': 0xFF00FFFF,
  'blue': 0xFF0000FF,
  'magenta': 0xFFFF00FF,
  'red': 0xFFFF0000,
  'navy': 0xFF000080,
  'transparent': 0x00000000,
  'semi_transparent_black': 0x80000000,
  'semi_transparent_white': 0x80FFFFFF,
};

/// Null for a key with no translation, so a missing one shows up rather than
/// reading back as the slug.
String? subtitleColorLabel(String key, AppLocalizations l10n) {
  return switch (key) {
    'white' => l10n.white,
    'light_gray' => l10n.lightGray,
    'gray' => l10n.gray,
    'dark_gray' => l10n.darkGray,
    'black' => l10n.black,
    'yellow' => l10n.yellow,
    'green' => l10n.green,
    'cyan' => l10n.cyan,
    'blue' => l10n.blue,
    'magenta' => l10n.magenta,
    'red' => l10n.red,
    'navy' => l10n.navy,
    'transparent' => l10n.transparent,
    'semi_transparent_black' => l10n.semiTransparentBlack,
    'semi_transparent_white' => l10n.semiTransparentWhite,
    _ => null,
  };
}

class _ColorPickerTileState extends State<_ColorPickerTile> {
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
    return SettingsPreviewReporter(
      describe: () => SettingsPreviewEntry(
        prefKey: widget.preference.key,
        title: widget.title,
      ),
      child: _buildTile(context),
    );
  }

  Widget _buildTile(BuildContext context) {
    return TvFocusHighlight(
      builder: (context, _) => ValueListenableBuilder<int>(
        valueListenable: _binding,
        builder: (context, value, _) => ListTile(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          leading: Icon(widget.icon),
          title: Text(widget.title),
          trailing: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Color(value),
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                ThemeRegistry.active.borders.chipBorder,
              ),
            ),
          ),
          onTap: () => _showPicker(context),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final l10n = AppLocalizations.of(context);
    final current = _binding.value;
    final preview = SettingsPreviewScope.maybeOf(context);
    final key = widget.preference.key;
    final entries = widget.allowTransparent
        ? subtitlePresetColors.entries
        : subtitlePresetColors.entries.where((e) => Color(e.value).a > 0);
    final names = {for (final e in entries) e.value: e.key};
    final result = await showSettingsPicker<int>(
      context,
      title: widget.title,
      values: names.keys.toList(),
      current: current,
      labelOf: (v) {
        final name = names[v]!;
        return subtitleColorLabel(name, l10n) ?? name;
      },
      leadingOf: (v) => Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Color(v),
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.chipBorder,
          ),
        ),
      ),
      onTry: preview == null ? null : (v, _) => preview.tryValue(key, v),
    );
    preview?.clearTry(key);
    if (!mounted) return;
    _pickerOpen = false;
    if (result == null || result == _binding.value) return;
    _binding.value = result;
  }
}

/// Bold as a switch over the stored weight, which the players read as bold
/// from 600 up.
class _BoldTile extends StatefulWidget {
  final String title;
  final Preference<int> preference;

  const _BoldTile({required this.title, required this.preference});

  @override
  State<_BoldTile> createState() => _BoldTileState();
}

class _BoldTileState extends State<_BoldTile> {
  late final PreferenceBinding<int> _binding;

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
    return SettingsPreviewReporter(
      describe: () => SettingsPreviewEntry(
        prefKey: widget.preference.key,
        title: widget.title,
      ),
      child: TvFocusHighlight(
        builder: (context, _) => ValueListenableBuilder<int>(
          valueListenable: _binding,
          builder: (context, weight, _) => SwitchListTile.adaptive(
            secondary: const Icon(Icons.format_bold),
            title: Text(widget.title),
            value: weight >= 600,
            onChanged: (bold) => _binding.value = bold ? 700 : 400,
          ),
        ),
      ),
    );
  }
}

/// Picks a subtitle font, downloading it first when it isn't on the device.
/// The choice is only saved once the files are here, so a failed download
/// leaves the old font in place.
class _FontTile extends StatefulWidget {
  const _FontTile();

  @override
  State<_FontTile> createState() => _FontTileState();
}

class _FontTileState extends State<_FontTile> {
  late final PreferenceBinding<String> _binding;
  String? _downloading;
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.subtitlesFont,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SettingsPreviewReporter(
      describe: () => SettingsPreviewEntry(
        prefKey: UserPreferences.subtitlesFont.key,
        title: l10n.subtitleFont,
        description: l10n.subtitleFontDescription,
      ),
      child: TvFocusHighlight(
        builder: (context, focused) => ValueListenableBuilder<String>(
          valueListenable: _binding,
          builder: (context, family, _) => ListTile(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            leading: const Icon(Icons.font_download_outlined),
            title: Text(l10n.subtitleFont),
            subtitle: Text(l10n.subtitleFontDescription),
            trailing: buildSettingsSelectionBubble(
              context,
              _downloading != null
                  ? l10n.downloadingStatus
                  : family.isEmpty
                  ? l10n.defaultLabel
                  : family,
              focused,
            ),
            onTap: () => _pick(context, family),
          ),
        ),
      ),
    );
  }

  Future<void> _pick(BuildContext context, String current) async {
    if (_pickerOpen || _downloading != null) return;
    _pickerOpen = true;
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.maybeOf(context);
    final fonts = SubtitleFonts.instance;
    final picked = await showSettingsPicker<String>(
      context,
      title: l10n.subtitleFont,
      values: ['', for (final font in subtitleFonts) font.family],
      current: current,
      labelOf: (family) => family.isEmpty ? l10n.defaultLabel : family,
      subtitleOf: (family) =>
          family.isEmpty || fonts.isDownloaded(family) ? null : l10n.download,
    );
    _pickerOpen = false;
    if (!mounted || picked == null || picked == current) return;
    if (picked.isNotEmpty) {
      setState(() => _downloading = picked);
      final loaded = await fonts.load(picked);
      if (!mounted) return;
      setState(() => _downloading = null);
      if (!loaded) {
        messenger?.showSnackBar(
          SnackBar(content: Text(l10n.subtitleFontDownloadFailed(picked))),
        );
        return;
      }
    }
    _binding.value = picked;
  }
}
