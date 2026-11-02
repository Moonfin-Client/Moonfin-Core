import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../offline_aware_image.dart';
import 'seerr_image_urls.dart';

/// The logos of the services streaming a title in the viewer's region. They
/// only say where it streams, so nothing here takes a tap or focus. A TV has
/// no hover for a tooltip, so it names each one under its logo.
class SeerrStreamingRow extends StatelessWidget {
  final List<SeerrWatchProvider> providers;

  const SeerrStreamingRow({super.key, required this.providers});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final named = PlatformDetection.isTV;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.seerrStreamingOn,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: named ? 16 : 8,
          runSpacing: 8,
          children: [for (final p in providers) _provider(p, named)],
        ),
      ],
    );
  }

  Widget _provider(SeerrWatchProvider provider, bool named) {
    final size = named ? 56.0 : 40.0;
    final logo = ClipRRect(
      borderRadius: AppRadius.circular(size / 4),
      child: SizedBox.square(
        dimension: size,
        child: provider.logoPath == null
            ? _nameTile(provider.name)
            : OfflineAwareImage(
                imageUrl: '$seerrLogoBase${provider.logoPath}',
                fit: BoxFit.cover,
                errorWidget: (_, _, _) => _nameTile(provider.name),
              ),
      ),
    );
    if (!named) return Tooltip(message: provider.name, child: logo);
    return SizedBox(
      width: size + 24,
      child: Column(
        children: [
          logo,
          const SizedBox(height: 6),
          Text(
            provider.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _nameTile(String name) => ColoredBox(
    color: Colors.white10,
    child: Center(
      child: Text(
        name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white70, fontSize: 9),
      ),
    ),
  );
}
