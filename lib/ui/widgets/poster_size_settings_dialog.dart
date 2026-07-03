import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../l10n/app_localizations.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';

class PosterSizeSettingsDialog extends StatefulWidget {
  final UserPreferences prefs;
  final VoidCallback? onChanged;
  final EnumPreference<ImageType>? imageTypePreference;
  final EnumPreference<PosterSize>? posterSizePreference;

  const PosterSizeSettingsDialog({
    super.key,
    required this.prefs,
    this.onChanged,
    this.imageTypePreference,
    this.posterSizePreference,
  });

  @override
  State<PosterSizeSettingsDialog> createState() =>
      _PosterSizeSettingsDialogState();
}

class _PosterSizeSettingsDialogState extends State<PosterSizeSettingsDialog> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final posterSizePreference =
        widget.posterSizePreference ?? UserPreferences.posterSize;
    final currentSize = widget.prefs.get(posterSizePreference);
    final currentImageType = widget.imageTypePreference != null
        ? widget.prefs.get(widget.imageTypePreference!)
        : null;
    final onSurface = AppColorScheme.onSurface;
    final sectionColor = onSurface.withValues(alpha: 0.72);
    final dividerColor = onSurface.withValues(alpha: 0.12);
    return Dialog(
      backgroundColor: AppColorScheme.surface.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(20),
        side: ThemeRegistry.active.borders.chipBorder.copyWith(
          color: onSurface.withValues(alpha: 0.18),
        ),
      ),
      child: SizedBox(
        width: 340,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                l10n.posterDisplayTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
            ),
            Divider(color: dividerColor),
            if (currentImageType != null) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
                child: Text(
                  l10n.posterImageType,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: sectionColor,
                  ),
                ),
              ),
              for (final type in ImageType.values)
                _imageTypeTile(type, currentImageType == type),
              Divider(color: dividerColor),
            ],
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
              child: Text(
                l10n.posterSize,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: sectionColor,
                ),
              ),
            ),
            for (final size in PosterSize.values)
              _posterSizeTile(size, currentSize == size),
          ],
        ),
      ),
    );
  }

  Widget _imageTypeTile(ImageType type, bool selected) {
    final l10n = AppLocalizations.of(context);
    final onSurface = AppColorScheme.onSurface;
    final label = switch (type) {
      ImageType.poster => l10n.imageTypePoster,
      ImageType.thumb => l10n.imageTypeThumbnail,
      ImageType.banner => l10n.imageTypeBanner,
    };
    return InkWell(
      onTap: () {
        final preference = widget.imageTypePreference;
        if (preference == null) return;
        widget.prefs.set(preference, type);
        widget.onChanged?.call();
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            _radioCircle(selected),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: selected
                    ? onSurface
                    : onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _posterSizeTile(PosterSize size, bool selected) {
    final onSurface = AppColorScheme.onSurface;
    final posterSizePreference =
        widget.posterSizePreference ?? UserPreferences.posterSize;
    final label = switch (size) {
      PosterSize.small => 'Small',
      PosterSize.medium => 'Medium',
      PosterSize.large => 'Large',
      PosterSize.extraLarge => 'Extra Large',
    };
    return InkWell(
      onTap: () {
        widget.prefs.set(posterSizePreference, size);
        widget.onChanged?.call();
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            _radioCircle(selected),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: selected
                    ? onSurface
                    : onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioCircle(bool selected) {
    final onSurface = AppColorScheme.onSurface;
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: selected ? AppColorScheme.accent : onSurface.withValues(alpha: 0.5),
            width: 2,
          ),
        ),
        color: selected ? AppColorScheme.accent : Colors.transparent,
      ),
      child: selected
          ? Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onSurface,
                ),
              ),
            )
          : null,
    );
  }
}
