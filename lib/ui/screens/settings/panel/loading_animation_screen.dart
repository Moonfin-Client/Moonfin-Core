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
    final currentSize = _prefs.get(UserPreferences.loadingAnimationSize);
    final currentPos = _prefs.get(UserPreferences.loadingAnimationPosition);
    final currentSpeed = _prefs.get(UserPreferences.loadingAnimationSpeed);
    final showText = _prefs.get(UserPreferences.showLoadingAnimationText);

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
          if (!isNone) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: _buildPreviewWindow(
                context,
                image: currentImage,
                size: currentSize,
                position: currentPos,
                speed: currentSpeed,
                showText: showText,
              ),
            ),
            adaptiveListSection(
              children: [
                EnumPreferenceTile<LoadingAnimationSize>(
                  preference: UserPreferences.loadingAnimationSize,
                  title: l10n.loadingAnimationSize,
                  icon: Icons.photo_size_select_actual_outlined,
                  onChanged: () => setState(() {}),
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
                  onChanged: () => setState(() {}),
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
                  onChanged: () => setState(() {}),
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
                  onChanged: () => setState(() {}),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPreviewWindow(
    BuildContext context, {
    required LoadingAnimationImage image,
    required LoadingAnimationSize size,
    required LoadingAnimationPosition position,
    required LoadingAnimationSpeed speed,
    required bool showText,
  }) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    // Scale down dimensions slightly so large fits nicely inside the 200px preview viewport
    final previewPixelSize = switch (size) {
      LoadingAnimationSize.thumbnail => 24.0,
      LoadingAnimationSize.small => 44.0,
      LoadingAnimationSize.medium => 72.0,
      LoadingAnimationSize.large => 104.0,
    };

    final previewSpacing = switch (size) {
      LoadingAnimationSize.thumbnail => 6.0,
      LoadingAnimationSize.small => 10.0,
      LoadingAnimationSize.medium => 14.0,
      LoadingAnimationSize.large => 20.0,
    };

    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(200),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: theme.colorScheme.outline.withAlpha(40),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(120),
            blurRadius: 16.0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            // Preview header badge
            Positioned(
              top: 10,
              left: 14,
              child: Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A4DC),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    l10n.loadingAnimationPreview.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: Colors.white.withAlpha(150),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned loading overlay
            if (position == LoadingAnimationPosition.bouncing)
              BouncingPositionWrapper(
                speed: speed,
                safePadding: const EdgeInsets.all(16.0),
                builder: (context, movingLeft) => PlayerLoadingOverlay(
                  label: 'Loading Stream...',
                  customImage: image,
                  customSize: previewPixelSize,
                  customPosition: position,
                  customSpeed: speed,
                  flipHorizontal: movingLeft,
                  labelSpacing: previewSpacing,
                  customShowText: showText,
                ),
              )
            else
              Align(
                alignment: position.alignment,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PlayerLoadingOverlay(
                    label: 'Loading Stream...',
                    customImage: image,
                    customSize: previewPixelSize,
                    customPosition: position,
                    customSpeed: speed,
                    labelSpacing: previewSpacing,
                    customShowText: showText,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
