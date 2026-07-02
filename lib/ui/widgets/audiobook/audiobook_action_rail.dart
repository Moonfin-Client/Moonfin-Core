import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import 'audiobook_focus_ring.dart';
import 'audiobook_glass.dart';
import 'audiobook_time.dart';

class AudiobookActionRail extends StatelessWidget {
  const AudiobookActionRail({
    super.key,
    required this.speed,
    required this.sleepActive,
    required this.sleepRemaining,
    required this.isFavorite,
    required this.tvFocusIndex,
    required this.onOpenSpeed,
    required this.onOpenSleep,
    required this.onAddBookmark,
    required this.onAddNote,
    required this.onToggleFavorite,
  });

  final double speed;
  final bool sleepActive;
  final Duration sleepRemaining;
  final bool isFavorite;
  final int tvFocusIndex;
  final VoidCallback onOpenSpeed;
  final VoidCallback onOpenSleep;
  final VoidCallback? onAddBookmark;
  final VoidCallback? onAddNote;
  final VoidCallback? onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final apple = PlatformDetection.isApple;
    final l10n = AppLocalizations.of(context);

    final entries = <_RailEntry>[
      _RailEntry(
        icon: apple ? CupertinoIcons.speedometer : Icons.speed,
        label: l10n.audiobookPlaybackSpeed,
        subLabel: (speed - 1.0).abs() > 0.01
            ? '${speed.toStringAsFixed(speed == speed.toInt() ? 1 : 2)}x'
            : null,
        accent: (speed - 1.0).abs() > 0.01,
        onTap: onOpenSpeed,
      ),
      _RailEntry(
        icon: apple
            ? (sleepActive ? CupertinoIcons.moon_fill : CupertinoIcons.moon)
            : (sleepActive ? Icons.bedtime : Icons.bedtime_outlined),
        label: l10n.audiobookSleepTimer,
        subLabel: sleepActive ? formatAudiobookCompact(sleepRemaining) : null,
        accent: sleepActive,
        onTap: onOpenSleep,
      ),
      _RailEntry(
        icon: apple ? CupertinoIcons.bookmark : Icons.bookmark_add_outlined,
        label: l10n.audiobookAddBookmark,
        onTap: onAddBookmark,
      ),
      _RailEntry(
        icon: apple ? CupertinoIcons.pencil : Icons.edit_note,
        label: l10n.audiobookAddNote,
        onTap: onAddNote,
      ),
      _RailEntry(
        icon: isFavorite
            ? (apple ? CupertinoIcons.heart_fill : Icons.favorite)
            : (apple ? CupertinoIcons.heart : Icons.favorite_border),
        label: isFavorite ? l10n.favorited : l10n.favorite,
        accent: isFavorite,
        onTap: onToggleFavorite,
      ),
    ];

    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < entries.length; i++)
          entries[i].build(
            apple: apple,
            focused: tvFocusIndex == i,
          ),
      ],
    );

    return audiobookGlassOrSolid(
      cornerRadius: 18,
      fallbackColor: const Color(0x00000000),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: row,
      ),
    );
  }
}

class _RailEntry {
  _RailEntry({
    required this.icon,
    this.label,
    this.subLabel,
    this.accent = false,
    this.onTap,
  });

  final IconData icon;
  final String? label;
  final String? subLabel;
  final bool accent;
  final VoidCallback? onTap;

  Widget build({required bool apple, required bool focused}) {
    return _RailEntryWidget(
      icon: icon,
      label: label,
      subLabel: subLabel,
      accent: accent,
      onTap: onTap,
      apple: apple,
      forceFocused: focused,
    );
  }
}

class _RailEntryWidget extends StatefulWidget {
  const _RailEntryWidget({
    required this.icon,
    this.label,
    this.subLabel,
    this.accent,
    this.onTap,
    required this.apple,
    required this.forceFocused,
  });

  final IconData icon;
  final String? label;
  final String? subLabel;
  final bool? accent;
  final VoidCallback? onTap;
  final bool apple;
  final bool forceFocused;

  @override
  State<_RailEntryWidget> createState() => _RailEntryWidgetState();
}

class _RailEntryWidgetState extends State<_RailEntryWidget> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final isExpanded = widget.forceFocused || _isHovered || _isFocused;
    final color = (widget.accent ?? false)
        ? AppColorScheme.accent
        : AppColorScheme.onSurface.withValues(
            alpha: widget.onTap == null ? 0.4 : 0.85,
          );

    final height = 40.0;
    final totalHeight = 40.0;

    final Widget innerWidget;
    if (isExpanded && widget.label != null) {
      final Widget textChild;
      if (widget.subLabel != null) {
        textChild = RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: '${widget.label}: ',
                style: TextStyle(color: color),
              ),
              TextSpan(
                text: widget.subLabel!,
                style: TextStyle(color: AppColorScheme.onSurface),
              ),
            ],
          ),
        );
      } else {
        textChild = Text(
          widget.label!,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          softWrap: false,
        );
      }

      innerWidget = Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          color: Colors.white.withValues(alpha: 0.06),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, color: color, size: 20),
            const SizedBox(width: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: textChild,
            ),
          ],
        ),
      );
    } else {
      innerWidget = Container(
        width: height,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.06),
        ),
        child: Center(
          child: Icon(widget.icon, color: color, size: 20),
        ),
      );
    }

    final Widget buttonWidget;
    if (isExpanded) {
      buttonWidget = AudiobookFocusRing(
        focused: widget.forceFocused,
        borderRadius: BorderRadius.circular(height / 2),
        child: innerWidget,
      );
    } else if (widget.subLabel != null) {
      buttonWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          innerWidget,
          const SizedBox(width: 6),
          Text(
            widget.subLabel!,
            style: TextStyle(
              fontSize: 12,
              color: AppColorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            softWrap: false,
          ),
        ],
      );
    } else {
      buttonWidget = innerWidget;
    }

    final child = SizedBox(
      height: totalHeight,
      child: Center(child: buttonWidget),
    );

    if (widget.apple) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: widget.onTap,
        child: child,
      );
    }

    final inkWellRadius = BorderRadius.circular(20);

    return InkWell(
      borderRadius: inkWellRadius,
      onTap: widget.onTap,
      onHover: (h) => setState(() => _isHovered = h),
      onFocusChange: (f) => setState(() => _isFocused = f),
      child: child,
    );
  }
}
