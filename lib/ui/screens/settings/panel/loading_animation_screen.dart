part of '../settings_side_panel.dart';

class _LoadingAnimationScreen extends StatefulWidget {
  const _LoadingAnimationScreen();

  @override
  State<_LoadingAnimationScreen> createState() =>
      _LoadingAnimationScreenState();
}

class _LoadingAnimationScreenState extends State<_LoadingAnimationScreen> {
  final _prefs = GetIt.instance<UserPreferences>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentImage = _prefs.get(UserPreferences.loadingAnimationImage);
    final isNone = currentImage == LoadingAnimationImage.none;

    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.loadingAnimation)),
      body: ListView(
        children: [
          _SectionHeader(l10n.loadingAnimationConfiguration),
          adaptiveListSection(
            children: [
              EnumPreferenceTile<LoadingAnimationImage>(
                preference: UserPreferences.loadingAnimationImage,
                title: l10n.loadingAnimationImage,
                icon: Icons.movie_filter_outlined,
                onChanged: () => setState(() {}),
                labelOf: (value) => switch (value) {
                  LoadingAnimationImage.none => l10n.none,
                  LoadingAnimationImage.moonfinLogo =>
                    l10n.loadingAnimationImageMoonfinLogo,
                  LoadingAnimationImage.spinner =>
                    l10n.loadingAnimationImageSpinner,
                  LoadingAnimationImage.runner =>
                    l10n.loadingAnimationImageRunner,
                  LoadingAnimationImage.moonPhases =>
                    l10n.loadingAnimationImageMoonPhases,
                  LoadingAnimationImage.moonfinPhases =>
                    l10n.loadingAnimationImageMoonfinPhases,
                  LoadingAnimationImage.neonfinPhases =>
                    l10n.loadingAnimationImageNeonfinPhases,
                },
              ),
            ],
          ),
          if (!isNone)
            adaptiveListSection(
              children: [
                EnumPreferenceTile<LoadingAnimationSize>(
                  preference: UserPreferences.loadingAnimationSize,
                  title: l10n.loadingAnimationSize,
                  icon: Icons.photo_size_select_actual_outlined,
                  labelOf: (value) => switch (value) {
                    LoadingAnimationSize.thumbnail =>
                      l10n.loadingAnimationSizeThumbnail,
                    LoadingAnimationSize.small => l10n.loadingAnimationSizeSmall,
                    LoadingAnimationSize.medium =>
                      l10n.loadingAnimationSizeMedium,
                    LoadingAnimationSize.large => l10n.loadingAnimationSizeLarge,
                  },
                ),
                EnumPreferenceTile<LoadingAnimationPosition>(
                  preference: UserPreferences.loadingAnimationPosition,
                  title: l10n.loadingAnimationPosition,
                  icon: Icons.grid_view_rounded,
                  labelOf: (value) => switch (value) {
                    LoadingAnimationPosition.topLeft =>
                      l10n.loadingAnimationPositionTopLeft,
                    LoadingAnimationPosition.topCenter =>
                      l10n.loadingAnimationPositionTopCenter,
                    LoadingAnimationPosition.topRight =>
                      l10n.loadingAnimationPositionTopRight,
                    LoadingAnimationPosition.middleLeft =>
                      l10n.loadingAnimationPositionMiddleLeft,
                    LoadingAnimationPosition.middle =>
                      l10n.loadingAnimationPositionMiddle,
                    LoadingAnimationPosition.middleRight =>
                      l10n.loadingAnimationPositionMiddleRight,
                    LoadingAnimationPosition.bottomLeft =>
                      l10n.loadingAnimationPositionBottomLeft,
                    LoadingAnimationPosition.bottomCenter =>
                      l10n.loadingAnimationPositionBottomCenter,
                    LoadingAnimationPosition.bottomRight =>
                      l10n.loadingAnimationPositionBottomRight,
                    LoadingAnimationPosition.bouncing =>
                      l10n.loadingAnimationPositionBouncing,
                  },
                ),
                EnumPreferenceTile<LoadingAnimationSpeed>(
                  preference: UserPreferences.loadingAnimationSpeed,
                  title: l10n.loadingAnimationSpeed,
                  icon: Icons.speed_rounded,
                  labelOf: (value) => switch (value) {
                    LoadingAnimationSpeed.slow =>
                      l10n.loadingAnimationSpeedSlow,
                    LoadingAnimationSpeed.moderate =>
                      l10n.loadingAnimationSpeedModerate,
                    LoadingAnimationSpeed.fast =>
                      l10n.loadingAnimationSpeedFast,
                    LoadingAnimationSpeed.ultra =>
                      l10n.loadingAnimationSpeedUltra,
                  },
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.showLoadingAnimationText,
                  title: l10n.showLoadingAnimationText,
                  icon: Icons.text_fields,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
