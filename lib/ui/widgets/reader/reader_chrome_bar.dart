import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/reader_settings.dart';
import '../../../util/platform_detection.dart';

class _ChromePalette {
  final Color icon;
  final Color mutedText;
  final Color barSurface;
  final Color divider;
  final bool isDark;

  const _ChromePalette({
    required this.icon,
    required this.mutedText,
    required this.barSurface,
    required this.divider,
    required this.isDark,
  });

  factory _ChromePalette.from(ReaderThemeColors page) {
    final isDark = page.isDark;
    return _ChromePalette(
      icon: page.foreground,
      mutedText: page.foreground.withValues(alpha: 0.6),
      barSurface: isDark
          ? Color.alphaBlend(
              Colors.white.withValues(alpha: 0.08),
              page.background,
            )
          : Color.alphaBlend(
              Colors.black.withValues(alpha: 0.04),
              page.background,
            ),
      divider: page.foreground.withValues(alpha: 0.12),
      isDark: isDark,
    );
  }
}

Widget _glassOrSolid({
  required Widget child,
  required _ChromePalette palette,
  required bool top,
}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: palette.barSurface,
      border: Border(
        top: top ? BorderSide.none : BorderSide(color: palette.divider),
        bottom: top ? BorderSide(color: palette.divider) : BorderSide.none,
      ),
    ),
    child: child,
  );
}

class _ChromeIconButton extends StatelessWidget {
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;
  final Color color;

  const _ChromeIconButton({
    required this.icon,
    required this.color,
    this.tooltip,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: SizedBox(
        width: _kChromeButtonSize,
        height: _kChromeButtonSize,
        child: Center(
          child: Icon(
            icon,
            size: 24,
            color: onPressed == null ? color.withValues(alpha: 0.35) : color,
          ),
        ),
      ),
    );
    if (tooltip == null) return button;
    return Tooltip(message: tooltip!, child: button);
  }
}

const double _kChromeButtonSize = 46;

class ReaderTopBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final ReaderThemeColors pageColors;
  final VoidCallback onBack;
  final VoidCallback? onContents;
  final VoidCallback onSettings;
  final VoidCallback onBookmark;
  final bool hasBookmarks;

  final VoidCallback? onSearch;

  final bool showSettings;

  const ReaderTopBar({
    super.key,
    required this.title,
    required this.pageColors,
    required this.onBack,
    required this.onSettings,
    required this.onBookmark,
    this.subtitle,
    this.onContents,
    this.hasBookmarks = false,
    this.onSearch,
    this.showSettings = true,
  });

  @override
  Widget build(BuildContext context) {
    final palette = _ChromePalette.from(pageColors);
    final apple = PlatformDetection.isApple;

    final backIcon = apple ? CupertinoIcons.back : Icons.arrow_back;
    final contentsIcon = apple ? CupertinoIcons.list_bullet : Icons.menu;
    final searchIcon = apple ? CupertinoIcons.search : Icons.search;
    final bookmarkIcon = hasBookmarks
        ? (apple ? CupertinoIcons.bookmark_fill : Icons.bookmark)
        : (apple ? CupertinoIcons.bookmark : Icons.bookmark_border);

    final actions = <Widget>[
      if (onContents != null)
        _ChromeIconButton(
          icon: contentsIcon,
          color: palette.icon,
          tooltip: 'Contents',
          onPressed: onContents,
        ),
      if (onSearch != null)
        _ChromeIconButton(
          icon: searchIcon,
          color: palette.icon,
          tooltip: 'Search',
          onPressed: onSearch,
        ),
      if (showSettings) _AaButton(color: palette.icon, onPressed: onSettings),
      _ChromeIconButton(
        icon: bookmarkIcon,
        color: palette.icon,
        tooltip: 'Bookmark',
        onPressed: onBookmark,
      ),
    ];

    final titleBlock = _TitleBlock(
      title: title,
      subtitle: subtitle,
      color: palette.icon,
      mutedColor: palette.mutedText,
      center: apple,
    );

    return _glassOrSolid(
      palette: palette,
      top: true,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Row(
            children: [
              _ChromeIconButton(
                icon: backIcon,
                color: palette.icon,
                tooltip: 'Back',
                onPressed: onBack,
              ),
              if (apple) ...[
                Expanded(child: titleBlock),
                ...actions,
              ] else ...[
                const SizedBox(width: 4),
                Expanded(child: titleBlock),
                ...actions,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleBlock extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color color;
  final Color mutedColor;
  final bool center;

  const _TitleBlock({
    required this.title,
    required this.color,
    required this.mutedColor,
    required this.center,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: center ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: color,
            fontSize: center ? 14 : 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (subtitle != null && subtitle!.isNotEmpty)
          Text(
            subtitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: TextStyle(color: mutedColor, fontSize: 11),
          ),
      ],
    );
  }
}

class _AaButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const _AaButton({required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Reading settings',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: SizedBox(
          width: _kChromeButtonSize,
          height: _kChromeButtonSize,
          child: Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'A',
                    style: TextStyle(
                      color: color,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'a',
                    style: TextStyle(
                      color: color,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReaderBottomBar extends StatelessWidget {
  final ReaderThemeColors pageColors;
  final Color accent;
  final String leftLabel;
  final String? rightLabel;
  final String? captionLabel;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final ValueChanged<double>? onChanged;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  const ReaderBottomBar({
    super.key,
    required this.pageColors,
    required this.accent,
    required this.leftLabel,
    required this.value,
    required this.min,
    required this.max,
    this.rightLabel,
    this.captionLabel,
    this.divisions,
    this.onChanged,
    this.onPrev,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final palette = _ChromePalette.from(pageColors);
    final apple = PlatformDetection.isApple;

    final labels = Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftLabel,
            style: TextStyle(color: palette.mutedText, fontSize: 11),
          ),
          if (rightLabel != null)
            Text(
              rightLabel!,
              style: TextStyle(color: palette.mutedText, fontSize: 11),
            ),
        ],
      ),
    );

    final Widget scrubber;
    if (apple) {
      scrubber = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: CupertinoSlider(
          value: value.clamp(min, max),
          min: min,
          max: max,
          divisions: (divisions != null && divisions! > 0) ? divisions : null,
          activeColor: accent,
          onChanged: onChanged,
        ),
      );
    } else {
      scrubber = Row(
        children: [
          IconButton(
            onPressed: onPrev,
            color: palette.icon,
            disabledColor: palette.icon.withValues(alpha: 0.3),
            icon: const Icon(Icons.chevron_left),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                activeTrackColor: accent,
                inactiveTrackColor: palette.icon.withValues(alpha: 0.25),
                thumbColor: accent,
                overlayColor: accent.withValues(alpha: 0.18),
                trackHeight: 3,
              ),
              child: Slider(
                value: value.clamp(min, max),
                min: min,
                max: max,
                divisions: (divisions != null && divisions! > 0)
                    ? divisions
                    : null,
                onChanged: onChanged,
              ),
            ),
          ),
          IconButton(
            onPressed: onNext,
            color: palette.icon,
            disabledColor: palette.icon.withValues(alpha: 0.3),
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      );
    }

    return _glassOrSolid(
      palette: palette,
      top: false,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            labels,
            scrubber,
            if (captionLabel != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Text(
                  captionLabel!,
                  style: TextStyle(color: palette.mutedText, fontSize: 11),
                ),
              )
            else
              const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
