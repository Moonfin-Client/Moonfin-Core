import 'package:flutter/cupertino.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:flutter/material.dart';

import '../../../data/models/reader_settings.dart';
import '../../../util/platform_detection.dart';

Future<void> showReaderSettingsSheet({
  required BuildContext context,
  required ReaderSettings settings,
  required Color accent,
  required ReaderThemeColors pageColors,
  required ValueChanged<ReaderSettings> onChanged,
}) {
  final apple = PlatformDetection.isApple;
  final surface = pageColors.isDark
      ? Color.alphaBlend(
          Colors.white.withValues(alpha: 0.08),
          pageColors.background,
        )
      : Color.alphaBlend(
          Colors.white.withValues(alpha: 0.6),
          pageColors.background,
        );

  if (apple) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) => _ReaderSettingsBody(
        initial: settings,
        accent: accent,
        surface: surface,
        textColor: pageColors.foreground,
        onChanged: onChanged,
      ),
    );
  }

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (ctx) => _ReaderSettingsBody(
      initial: settings,
      accent: accent,
      surface: surface,
      textColor: pageColors.foreground,
      showGrabber: false,
      onChanged: onChanged,
    ),
  );
}

class _ReaderSettingsBody extends StatefulWidget {
  final ReaderSettings initial;
  final Color accent;
  final Color surface;
  final Color textColor;
  final bool showGrabber;
  final ValueChanged<ReaderSettings> onChanged;

  const _ReaderSettingsBody({
    required this.initial,
    required this.accent,
    required this.surface,
    required this.textColor,
    required this.onChanged,
    this.showGrabber = true,
  });

  @override
  State<_ReaderSettingsBody> createState() => _ReaderSettingsBodyState();
}

class _ReaderSettingsBodyState extends State<_ReaderSettingsBody> {
  late ReaderSettings _s = widget.initial;

  Color get _accent => widget.accent;
  Color get _text => widget.textColor;
  Color get _muted => widget.textColor.withValues(alpha: 0.6);
  Color get _fill => widget.textColor.withValues(alpha: 0.07);

  void _update(ReaderSettings next) {
    setState(() => _s = next);
    widget.onChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    final body = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.showGrabber)
          Center(
            child: Container(
              width: 36,
              height: 5,
              margin: const EdgeInsets.only(top: 10, bottom: 8),
              decoration: BoxDecoration(
                color: _muted.withValues(alpha: 0.4),
                borderRadius: AppRadius.circular(3),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _themeSwatches(),
              const SizedBox(height: 18),
              _fontSizeRow(),
              const SizedBox(height: 12),
              _fontFamilyRow(),
              const SizedBox(height: 12),
              _layoutRow(),
              const SizedBox(height: 18),
              _brightnessRow(),
            ],
          ),
        ),
      ],
    );

    return SafeArea(
      top: false,
      child: Material(
        color: widget.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        child: body,
      ),
    );
  }

  Widget _themeSwatches() {
    const labels = {
      ReaderPageTheme.original: 'Original',
      ReaderPageTheme.paper: 'Paper',
      ReaderPageTheme.quiet: 'Quiet',
      ReaderPageTheme.calm: 'Calm',
      ReaderPageTheme.night: 'Night',
    };
    final brightness = MediaQuery.platformBrightnessOf(context);
    return Row(
      children: [
        for (final theme in ReaderPageTheme.values)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _swatch(
                theme,
                labels[theme]!,
                _s.copyWith(pageTheme: theme).resolveColors(brightness),
              ),
            ),
          ),
      ],
    );
  }

  Widget _swatch(
    ReaderPageTheme theme,
    String label,
    ReaderThemeColors colors,
  ) {
    final selected = _s.pageTheme == theme;
    return GestureDetector(
      onTap: () => _update(_s.copyWith(pageTheme: theme)),
      child: Column(
        children: [
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: AppRadius.circular(12),
              border: Border.all(
                color: selected ? _accent : _muted.withValues(alpha: 0.25),
                width: selected ? 2.5 : 0.5,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'Aa',
              style: TextStyle(
                color: colors.foreground,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: selected ? _accent : _muted, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _fontSizeRow() {
    return Container(
      decoration: BoxDecoration(
        color: _fill,
        borderRadius: AppRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Text('A', style: TextStyle(color: _text, fontSize: 14)),
          Expanded(
            child: _adaptiveSlider(
              value: _s.fontScale,
              min: ReaderSettings.minFontScale,
              max: ReaderSettings.maxFontScale,
              divisions: 10,
              onChanged: (v) => _update(_s.copyWith(fontScale: v)),
            ),
          ),
          Text('A', style: TextStyle(color: _text, fontSize: 24)),
        ],
      ),
    );
  }

  Widget _fontFamilyRow() {
    const labels = {
      ReaderFontFamily.system: 'System',
      ReaderFontFamily.serif: 'Serif',
      ReaderFontFamily.sans: 'Sans',
      ReaderFontFamily.mono: 'Mono',
    };
    return Row(
      children: [
        for (final family in ReaderFontFamily.values)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: _pill(
                label: labels[family]!,
                selected: _s.fontFamily == family,
                onTap: () => _update(_s.copyWith(fontFamily: family)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _layoutRow() {
    return Column(
      children: [
        Row(
          children: [
            _iconChoice(
              Icons.density_small,
              _s.lineSpacing == ReaderLineSpacing.tight,
              () => _update(_s.copyWith(lineSpacing: ReaderLineSpacing.tight)),
            ),
            _iconChoice(
              Icons.density_medium,
              _s.lineSpacing == ReaderLineSpacing.normal,
              () => _update(_s.copyWith(lineSpacing: ReaderLineSpacing.normal)),
            ),
            _iconChoice(
              Icons.density_large,
              _s.lineSpacing == ReaderLineSpacing.relaxed,
              () =>
                  _update(_s.copyWith(lineSpacing: ReaderLineSpacing.relaxed)),
            ),
            const SizedBox(width: 10),
            _iconChoice(
              Icons.format_indent_decrease,
              _s.margin == ReaderMargin.narrow,
              () => _update(_s.copyWith(margin: ReaderMargin.narrow)),
            ),
            _iconChoice(
              Icons.crop_portrait,
              _s.margin == ReaderMargin.normal,
              () => _update(_s.copyWith(margin: ReaderMargin.normal)),
            ),
            _iconChoice(
              Icons.format_indent_increase,
              _s.margin == ReaderMargin.wide,
              () => _update(_s.copyWith(margin: ReaderMargin.wide)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _pill(
                label: 'Justify',
                icon: Icons.format_align_justify,
                selected: _s.justify,
                onTap: () => _update(_s.copyWith(justify: !_s.justify)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _pill(
                label: 'Bold',
                icon: Icons.format_bold,
                selected: _s.bold,
                onTap: () => _update(_s.copyWith(bold: !_s.bold)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _brightnessRow() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.brightness_low, color: _muted, size: 18),
            Expanded(
              child: _adaptiveSlider(
                value: _s.brightness,
                min: 0.3,
                max: 1.0,
                onChanged: (v) => _update(_s.copyWith(brightness: v)),
              ),
            ),
            Icon(Icons.brightness_high, color: _muted, size: 20),
          ],
        ),
        Row(
          children: [
            Icon(Icons.nightlight_outlined, color: _muted, size: 18),
            Expanded(
              child: _adaptiveSlider(
                value: _s.warmth,
                min: 0.0,
                max: 1.0,
                onChanged: (v) => _update(_s.copyWith(warmth: v)),
              ),
            ),
            Icon(Icons.wb_sunny_outlined, color: _muted, size: 18),
          ],
        ),
      ],
    );
  }

  Widget _adaptiveSlider({
    required double value,
    required double min,
    required double max,
    int? divisions,
    required ValueChanged<double> onChanged,
  }) {
    if (PlatformDetection.isApple) {
      return CupertinoSlider(
        value: value.clamp(min, max),
        min: min,
        max: max,
        divisions: divisions,
        activeColor: _accent,
        onChanged: onChanged,
      );
    }
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: _accent,
        inactiveTrackColor: _muted.withValues(alpha: 0.3),
        thumbColor: _accent,
        overlayColor: _accent.withValues(alpha: 0.18),
        trackHeight: 3,
      ),
      child: Slider(
        value: value.clamp(min, max),
        min: min,
        max: max,
        divisions: divisions,
        onChanged: onChanged,
      ),
    );
  }

  Widget _pill({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? _accent.withValues(alpha: 0.18) : _fill,
          borderRadius: AppRadius.circular(12),
          border: Border.all(
            color: selected ? _accent : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: selected ? _accent : _text),
              const SizedBox(width: 6),
            ],
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: selected ? _accent : _text,
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconChoice(IconData icon, bool selected, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: selected ? _accent.withValues(alpha: 0.18) : _fill,
            borderRadius: AppRadius.circular(12),
            border: Border.all(
              color: selected ? _accent : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Icon(icon, size: 18, color: selected ? _accent : _text),
        ),
      ),
    );
  }
}
