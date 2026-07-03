import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/cast/cast_service.dart';
import '../../../data/services/cast/cast_target.dart';
import '../../../util/platform_detection.dart';
import 'audiobook_focus_ring.dart';
import 'audiobook_glass.dart';

class AudiobookHeader extends StatelessWidget {
  const AudiobookHeader({
    super.key,
    required this.item,
    required this.castService,
    required this.isTv,
    required this.onClose,
    required this.onCast,
    required this.onCastSettings,
    required this.onToggleDrawer,
    required this.drawerOpen,
    required this.tvFocusIndex,
  });

  final AggregatedItem? item;
  final CastService castService;
  final bool isTv;
  final VoidCallback onClose;
  final VoidCallback? onCast;
  final VoidCallback onCastSettings;
  final VoidCallback onToggleDrawer;
  final bool drawerOpen;
  final int tvFocusIndex;

  @override
  Widget build(BuildContext context) {
    final apple = PlatformDetection.isApple;
    final onSurface = AppColorScheme.onSurface;

    Widget iconButton({
      required IconData icon,
      required VoidCallback onPressed,
      Color? color,
      double size = 24,
    }) {
      if (apple) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: const Size.square(kAudiobookButtonSize),
          onPressed: onPressed,
          child: Icon(icon, size: size, color: color ?? onSurface),
        );
      }
      return IconButton(
        icon: Icon(icon, size: size, color: color),
        onPressed: onPressed,
      );
    }

    final Widget backButton;
    if (isTv) {
      backButton = AudiobookFocusRing(
        focused: tvFocusIndex == 0,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, size: 26),
          onPressed: onClose,
        ),
      );
    } else {
      backButton = iconButton(
        icon: apple ? CupertinoIcons.chevron_down : Icons.keyboard_arrow_down,
        size: apple ? 22 : 28,
        onPressed: onClose,
      );
    }

    final eyebrow = Text(
      item?.album ?? item?.seriesName ?? '',
      textAlign: apple ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        color: onSurface.withValues(alpha: 0.85),
        fontSize: 12,
        letterSpacing: 1.2,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    Widget? castButton;
    if (!isTv && item != null && onCast != null) {
      castButton = ValueListenableBuilder<CastTargetKind?>(
        valueListenable: castService.activeKindNotifier,
        builder: (context, kind, _) {
          final active = kind != null;
          return iconButton(
            icon: apple
                ? CupertinoIcons.antenna_radiowaves_left_right
                : (active ? Icons.cast_connected : Icons.cast),
            color: active ? AppColorScheme.accent : null,
            onPressed: active ? onCastSettings : onCast!,
          );
        },
      );
    }

    final drawerButton = iconButton(
      icon: drawerOpen
          ? (apple ? CupertinoIcons.xmark : Icons.close)
          : (apple ? CupertinoIcons.list_bullet : Icons.menu_open),
      onPressed: onToggleDrawer,
    );

    final Widget rightButton;
    if (isTv) {
      rightButton = AudiobookFocusRing(
        focused: tvFocusIndex == 1,
        child: drawerButton,
      );
    } else {
      rightButton = drawerButton;
    }

    final row = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: apple ? AppSpacing.spaceXs : AppSpacing.spaceSm,
        vertical: AppSpacing.spaceXs,
      ),
      child: Row(
        children: [
          backButton,
          const SizedBox(width: AppSpacing.spaceSm),
          Expanded(child: eyebrow),
          // ignore: use_null_aware_elements
          if (castButton != null) castButton,
          rightButton,
        ],
      ),
    );

    if (isTv) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceSm),
        child: row,
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.spaceSm,
        AppSpacing.spaceXs,
        AppSpacing.spaceSm,
        0,
      ),
      child: audiobookGlassOrSolid(
        cornerRadius: 16,
        blur: 18,
        fallbackColor: onSurface.withValues(alpha: 0.06),
        child: row,
      ),
    );
  }
}
