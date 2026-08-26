import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/models/trickplay_preview_layout.dart';
import '../../l10n/app_localizations.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import 'playback/trickplay.dart';

class TrickplaySettingsPreview extends StatefulWidget {
  const TrickplaySettingsPreview({super.key});

  @override
  State<TrickplaySettingsPreview> createState() =>
      _TrickplaySettingsPreviewState();
}

class _TrickplaySettingsPreviewState extends State<TrickplaySettingsPreview> {
  static const _fakeDurationMsInt = 3600000; // 60:00
  static const _fakeDurationMs = 3600000.0;
  static const _sliderInset = 8.0;

  static const _realSliderVisualHeight = 28.0;
  static const _realControlsRowExtent = 48.0;

  final UserPreferences _prefs = GetIt.instance<UserPreferences>();
  double _positionMs = _fakeDurationMs * 0.5;

  late final FocusNode _sliderOuterFocusNode;
  late final FocusNode _sliderInternalFocusNode;

  @override
  void initState() {
    super.initState();
    _prefs.addListener(_onPrefsChanged);
    _sliderOuterFocusNode = FocusNode(debugLabel: 'TrickplayPreviewSlider');
    _sliderInternalFocusNode = FocusNode(
      debugLabel: 'TrickplayPreviewSliderInner',
      canRequestFocus: false,
      skipTraversal: true,
    );
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPrefsChanged);
    _sliderOuterFocusNode.dispose();
    _sliderInternalFocusNode.dispose();
    super.dispose();
  }

  void _onPrefsChanged() {
    if (mounted) setState(() {});
  }

  int get _fakeStepMs =>
      math.max(_prefs.get(UserPreferences.skipForwardLength), 1);

  KeyEventResult _onSliderKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowUp:
        node.previousFocus();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowDown:
        node.nextFocus();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowLeft:
        setState(
          () => _positionMs = (_positionMs - _fakeStepMs).clamp(
            0.0,
            _fakeDurationMs,
          ),
        );
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowRight:
        setState(
          () => _positionMs = (_positionMs + _fakeStepMs).clamp(
            0.0,
            _fakeDurationMs,
          ),
        );
        return KeyEventResult.handled;
      default:
        return KeyEventResult.ignored;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mode = _prefs.get(UserPreferences.trickPlayMode);
    if (mode == TrickplayMode.disabled) return const SizedBox.shrink();
    final scalePercent = _prefs.get(
      UserPreferences.trickPlayPreviewScalePercent,
    );
    final verticalPositionPercent = _prefs.get(
      UserPreferences.trickPlayVerticalPositionPercent,
    );
    final followScrub = _prefs.get(
      UserPreferences.trickPlayFollowScrubPosition,
    );
    final position = Duration(milliseconds: _positionMs.round());

    final screenSize = MediaQuery.sizeOf(context);
    final longSide = math.max(screenSize.width, screenSize.height);
    final shortSide = math.min(screenSize.width, screenSize.height);
    final rawAspectRatio = shortSide > 0 ? longSide / shortSide : 16 / 9;
    final deviceAspectRatio = rawAspectRatio.clamp(16 / 9, 21 / 9);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: deviceAspectRatio,
            child: ClipRRect(
              borderRadius: AppRadius.circular(8),
              child: LayoutBuilder(
                builder: (context, videoConstraints) {
                  final videoWidth = videoConstraints.maxWidth;
                  final videoHeight = videoConstraints.maxHeight;
                  final trackWidth = math.max(
                    videoWidth - _sliderInset * 2,
                    0.0,
                  );
                  final previewScale = (trackWidth / screenSize.width).clamp(
                    0.2,
                    1.0,
                  );
                  final sliderReservedHeight = _realSliderVisualHeight;
                  final controlsRowGap = AppSpacing.spaceXs * previewScale;
                  final controlsRowExtent =
                      _realControlsRowExtent * previewScale;
                  final floorReserved =
                      sliderReservedHeight + controlsRowGap + controlsRowExtent;
                  final frameTopMargin =
                      TrickplayPreviewLayout.verticalTravelTopMargin *
                      previewScale;
                  final plan = TrickplayPreviewLayout.plan(
                    trackWidth: trackWidth,
                    scalePercent: scalePercent,
                    aspect: 9 / 16,
                    maxHeightBudget: math.max(
                      videoHeight - floorReserved - frameTopMargin,
                      32.0,
                    ),
                    positionMs: _positionMs,
                    durationMs: _fakeDurationMs,
                    followScrub: followScrub,
                    verticalPositionPercent: verticalPositionPercent,
                    isStrip: mode == TrickplayMode.strip,
                    spacing: AppSpacing.spaceXs,
                    overflowMargin: _sliderInset,
                    seekPosition: position,
                    totalDuration: const Duration(
                      milliseconds: _fakeDurationMsInt,
                    ),
                    stepMs: _fakeStepMs,
                  );
                  final previewHeight = plan.tileHeight;
                  final verticalTravel = plan.verticalTravel;
                  final leftOffset = plan.leftOffset;
                  final previewTile =
                      mode == TrickplayMode.strip ||
                          mode == TrickplayMode.single
                      ? Trickplay(
                          leftCount: plan.leftCount,
                          rightCount: plan.rightCount,
                          tileWidth: plan.tileWidth,
                          tileHeight: plan.tileHeight,
                          content: (slotIndex) {
                            final target =
                                plan.slotsByIndex[slotIndex]?.targetPosition;
                            return target == null
                                ? null
                                : _fakeTileContent(
                                    _fakeIndex(
                                      target.inMilliseconds.toDouble(),
                                    ),
                                  );
                          },
                        )
                      : null;

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        color: AppColorScheme.scrim,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white.withValues(alpha: 0.4),
                          size: 36,
                        ),
                      ),
                      if (mode == TrickplayMode.full)
                        Positioned.fill(
                          child: Trickplay(
                            fillFrame: true,
                            content: (_) => FittedBox(
                              fit: zoomModeToBoxFit(
                                _prefs.get(UserPreferences.playerZoomMode),
                              ),
                              child: SizedBox(
                                width: 160,
                                height: 90,
                                child: _fakeTileContent(
                                  _fakeIndex(_positionMs),
                                  large: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (previewTile != null)
                        Positioned(
                          left: _sliderInset,
                          bottom: floorReserved + verticalTravel,
                          height: previewHeight,
                          width: trackWidth,
                          child: OverflowBox(
                            minWidth: 0,
                            maxWidth: double.infinity,
                            alignment: Alignment.topLeft,
                            child: Transform.translate(
                              offset: Offset(leftOffset, 0),
                              child: previewTile,
                            ),
                          ),
                        ),
                      Positioned(
                        left: _sliderInset,
                        right: _sliderInset,
                        bottom: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Focus(
                              focusNode: _sliderOuterFocusNode,
                              onKeyEvent: _onSliderKeyEvent,
                              child: SliderTheme(
                                data: SliderThemeData(
                                  trackHeight: 4,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius:
                                        TrickplayPreviewLayout.seekThumbRadius,
                                  ),
                                  overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 14,
                                  ),
                                  activeTrackColor:
                                      AppColorScheme.rangeProgress,
                                  secondaryActiveTrackColor:
                                      AppColorScheme.rangeTrack.withValues(
                                        alpha: 0.8,
                                      ),
                                  inactiveTrackColor:
                                      AppColorScheme.rangeTrack,
                                  thumbColor: AppColorScheme.rangeThumb,
                                  overlayColor: AppColorScheme.rangeThumb
                                      .withValues(alpha: 0.2),
                                ),
                                child: Slider(
                                  focusNode: _sliderInternalFocusNode,
                                  value: _positionMs.clamp(
                                    0.0,
                                    _fakeDurationMs,
                                  ),
                                  max: _fakeDurationMs,
                                  onChanged: (v) =>
                                      setState(() => _positionMs = v),
                                ),
                              ),
                            ),
                            SizedBox(height: controlsRowGap),
                            SizedBox(height: controlsRowExtent),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.spaceXs),
          Text(
            AppLocalizations.of(context).trickplaySettingsPreviewHint,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              fontSize: AppTypography.fontSizeXs,
            ),
          ),
        ],
      ),
    );
  }

  int _fakeIndex(double ms) => (ms / _fakeStepMs).round();

  static const _shotLength = 3;

  static double _pseudoRandom(int seed) {
    var x = seed;
    x = ((x >> 16) ^ x) * 0x45d9f3b;
    x = ((x >> 16) ^ x) * 0x45d9f3b;
    x = (x >> 16) ^ x;
    return (x & 0xFFFFFF) / 0xFFFFFF;
  }

  Widget _fakeTileContent(int index, {bool large = false}) {
    final shot = index ~/ _shotLength;
    const wiggle = 0.08;
    final bounceX = ((_pseudoRandom(shot * 2 + 1) * 2 - 1) +
            math.sin(index * 2.7) * wiggle)
        .clamp(-1.0, 1.0);
    final bounceY = ((_pseudoRandom(shot * 2 + 2) * 2 - 1) +
            math.sin(index * 3.3 + 1.5) * wiggle)
        .clamp(-1.0, 1.0);
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final logoSize =
                  math.min(constraints.maxWidth, constraints.maxHeight) *
                  (large ? 0.6 : 0.7);
              return Align(
                alignment: Alignment(bounceX, bounceY),
                child: SizedBox(
                  width: logoSize,
                  height: logoSize,
                  child: SvgPicture.asset(
                    'assets/icons/moonfin_logo.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          Positioned(
            right: 3,
            bottom: 2,
            child: Text(
              '$index',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: large
                    ? AppTypography.fontSizeMd
                    : AppTypography.fontSizeXs,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
