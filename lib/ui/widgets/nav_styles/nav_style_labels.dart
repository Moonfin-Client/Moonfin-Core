import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';

String topNavbarStyleLabel(AppLocalizations l10n, TopNavbarStyle style) =>
    switch (style) {
      TopNavbarStyle.classic => l10n.topNavbarStyleClassic,
      TopNavbarStyle.tabline => l10n.topNavbarStyleTabline,
      TopNavbarStyle.atlas => l10n.topNavbarStyleAtlas,
    };

String topNavbarStyleHint(AppLocalizations l10n, TopNavbarStyle style) =>
    switch (style) {
      TopNavbarStyle.classic => l10n.topNavbarStyleClassicHint,
      TopNavbarStyle.tabline => l10n.topNavbarStyleTablineHint,
      TopNavbarStyle.atlas => l10n.topNavbarStyleAtlasHint,
    };

String sidebarStyleLabel(AppLocalizations l10n, SidebarStyle style) =>
    switch (style) {
      SidebarStyle.classic => l10n.sidebarStyleClassic,
      SidebarStyle.reel => l10n.sidebarStyleReel,
      SidebarStyle.mosaic => l10n.sidebarStyleMosaic,
    };

String sidebarStyleHint(AppLocalizations l10n, SidebarStyle style) =>
    switch (style) {
      SidebarStyle.classic => l10n.sidebarStyleClassicHint,
      SidebarStyle.reel => l10n.sidebarStyleReelHint,
      SidebarStyle.mosaic => l10n.sidebarStyleMosaicHint,
    };
