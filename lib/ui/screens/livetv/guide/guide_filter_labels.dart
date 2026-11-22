import '../../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../../l10n/app_localizations.dart';

/// Localize guide filters in the UI, not in the data model.
String guideFilterLabel(GuideFilter filter, AppLocalizations l10n) =>
    switch (filter) {
      GuideFilter.all => l10n.all,
      GuideFilter.movies => l10n.movies,
      GuideFilter.series => l10n.series,
      GuideFilter.sports => l10n.sports,
      GuideFilter.news => l10n.news,
      GuideFilter.kids => l10n.kids,
      GuideFilter.premiere => l10n.premiere,
      GuideFilter.favorites => l10n.favorites,
    };
