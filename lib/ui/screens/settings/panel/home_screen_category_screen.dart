part of '../settings_side_panel.dart';

class _HomeScreenCategoryScreen extends StatefulWidget {
  const _HomeScreenCategoryScreen();

  @override
  State<_HomeScreenCategoryScreen> createState() =>
      _HomeScreenCategoryScreenState();
}

class _HomeScreenCategoryScreenState extends State<_HomeScreenCategoryScreen> {
  final _prefs = GetIt.instance<UserPreferences>();

  String _rowsStyleLabel(AppLocalizations l10n, HomeRowsStyle style) =>
      switch (style) {
        HomeRowsStyle.v1 => l10n.homeRowsStyleClassic,
        HomeRowsStyle.v2 => l10n.homeRowsStyleModern,
      };

  void _reloadHomeRows() {
    if (!GetIt.instance.isRegistered<HomeViewModel>()) return;
    GetIt.instance<HomeViewModel>().load(preserveExisting: true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rowsStyle = _prefs.get(UserPreferences.homeRowsStyle);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.homeScreen)),
      body: ListView(
        children: [
          _SectionHeader(l10n.homeRowDisplay),
          adaptiveListSection(
            children: [
              EnumPreferenceTile<HomeRowsStyle>(
                preference: UserPreferences.homeRowsStyle,
                title: l10n.rowsType,
                description: l10n.rowsTypeDescription,
                icon: Icons.view_carousel,
                labelOf: (style) => _rowsStyleLabel(l10n, style),
                onChanged: () {
                  _pushPersonalizationSync();
                  _reloadHomeRows();
                  if (!mounted) return;
                  setState(() {});
                },
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.mergeContinueWatchingNextUp,
                title: l10n.mergeContinueWatchingAndNextUp,
                subtitle: l10n.combineBothRows,
                icon: Icons.merge_type,
                onChanged: _pushPersonalizationSync,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.seriesThumbnailsEnabled,
                title: l10n.seriesThumbnails,
                subtitle: l10n.seriesThumbnailsDescription,
                icon: Icons.image_aspect_ratio,
                onChanged: _pushPersonalizationSync,
              ),
              if (!PlatformDetection.useMobileUi)
                SwitchPreferenceTile(
                  preference: UserPreferences.fullScreenRows,
                  title: l10n.fullScreenRows,
                  subtitle: l10n.fullScreenRowsDescription,
                  icon: Icons.image_aspect_ratio,
                  onChanged: _pushPersonalizationSync,
                ),
              EnumPreferenceTile<PosterSize>(
                preference: UserPreferences.posterSize,
                title: l10n.cardSize,
                icon: Icons.photo_size_select_large,
                labelOf: (v) => switch (v) {
                  PosterSize.small => l10n.small,
                  PosterSize.medium => l10n.medium,
                  PosterSize.large => l10n.large,
                  PosterSize.extraLarge => l10n.extraLarge,
                },
                onChanged: _pushPersonalizationSync,
              ),
              if (rowsStyle == HomeRowsStyle.v1)
                SwitchPreferenceTile(
                  preference: UserPreferences.homeRowInfoOverlay,
                  title: l10n.homeRowInfoOverlay,
                  subtitle: l10n.showTitleMetadataOnHomeRows,
                  icon: Icons.info_outline,
                ),
            ],
          ),

          _SectionHeader(l10n.homeRowSections),
          adaptiveListSection(
            children: [
              _TvSettingsListTile(
                autofocus: true,
                leading: const Icon(Icons.list),
                title: Text(l10n.homeSections),
                subtitle: Text(l10n.reorderToggleHomeRows),
                onTap: () => context.pushSettingsScreen(
                  const HomeSectionsScreen(showGeneralOptions: false),
                ),
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.tune),
                title: Text(l10n.homeRowToggles),
                subtitle: Text(l10n.homeRowTogglesSubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const HomeRowTogglesScreen()),
              ),
            ],
          ),

          _SectionHeader(l10n.audio),
          adaptiveListSection(
            children: [
              SwitchPreferenceTile(
                preference: UserPreferences.themeMusicOnHomeRows,
                title: l10n.themeMusicOnHomeRows,
                subtitle: l10n.playWhenBrowsingHomeScreen,
                icon: Icons.queue_music,
                onChanged: _pushPersonalizationSync,
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
