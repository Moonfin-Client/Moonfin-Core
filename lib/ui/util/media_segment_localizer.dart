import '../../data/models/media_segment.dart';
import '../../l10n/app_localizations.dart';

String localizedMediaSegmentName(
  MediaSegmentType type,
  AppLocalizations l10n,
) => switch (type) {
  MediaSegmentType.intro => l10n.mediaSegmentIntro,
  MediaSegmentType.outro => l10n.mediaSegmentOutro,
  MediaSegmentType.preview => l10n.mediaSegmentPreview,
  MediaSegmentType.recap => l10n.mediaSegmentRecap,
  MediaSegmentType.commercial => l10n.mediaSegmentCommercial,
  MediaSegmentType.unknown => l10n.unknown,
};
