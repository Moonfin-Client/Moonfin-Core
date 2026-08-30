import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../navigation/destinations.dart';
import '../../../../widgets/offline_aware_image.dart';
import '../../../../widgets/seerr/seerr_image_urls.dart';
import '../shared/immersive_spacing.dart';

class ImmersivePeopleCard extends StatefulWidget {
  final Map<String, dynamic> person;
  final ImageApi imageApi;
  final String? serverId;
  final double width;
  final double avatarSize;
  final bool isFocused;

  const ImmersivePeopleCard({
    super.key,
    required this.person,
    required this.imageApi,
    required this.serverId,
    required this.width,
    required this.avatarSize,
    required this.isFocused,
  });

  static String? imageUrlFor(
    Map<String, dynamic> person,
    ImageApi imageApi, {
    int maxHeight = 360,
  }) {
    final personId = person['Id']?.toString();

    final tag = person['PrimaryImageTag'] as String?;

    if (personId != null &&
        personId.isNotEmpty &&
        tag != null &&
        tag.isNotEmpty) {
      return imageApi.getPrimaryImageUrl(
        personId,
        maxHeight: maxHeight,
        tag: tag,
      );
    }

    final profilePath = person['ProfilePath'] as String?;

    if (profilePath != null && profilePath.isNotEmpty) {
      return '$seerrProfileBase$profilePath';
    }

    return null;
  }

  static void openPerson(
    BuildContext context,
    Map<String, dynamic> person, {
    required String? serverId,
  }) {
    final personId = person['Id']?.toString();

    if (personId == null || personId.isEmpty) {
      return;
    }

    if (serverId == 'seerr') {
      context.push(Destinations.seerrPerson(personId));

      return;
    }

    context.push(Destinations.item(personId, serverId: serverId));
  }

  @override
  State<ImmersivePeopleCard> createState() => _ImmersivePeopleCardState();
}

class _ImmersivePeopleCardState extends State<ImmersivePeopleCard> {
  static const Duration _motionDuration = Duration(milliseconds: 180);

  bool _hovered = false;

  bool get _active => widget.isFocused || _hovered;

  bool get _canOpen {
    final id = widget.person['Id']?.toString();

    return id != null && id.isNotEmpty;
  }

  String get _name {
    final value = widget.person['Name']?.toString().trim();

    return value == null || value.isEmpty ? '' : value;
  }

  String? get _role {
    final value = widget.person['Role']?.toString().trim();

    if (value == null || value.isEmpty) {
      return null;
    }

    return value;
  }

  bool _isPhonePortrait(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return size.height > size.width && size.width < 600;
  }

  void _setHovered(bool hovered) {
    if (!mounted || _hovered == hovered) {
      return;
    }

    setState(() {
      _hovered = hovered;
    });
  }

  void _open(BuildContext context) {
    if (!_canOpen) {
      return;
    }

    ImmersivePeopleCard.openPerson(
      context,
      widget.person,
      serverId: widget.serverId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final foreground = AppColorScheme.onSurface;

    final phonePortrait = _isPhonePortrait(context);

    final imageUrl = ImmersivePeopleCard.imageUrlFor(
      widget.person,
      widget.imageApi,
      maxHeight: (widget.avatarSize * 2).round(),
    );

    return MouseRegion(
      cursor: _canOpen ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) {
        _setHovered(true);
      },
      onExit: (_) {
        _setHovered(false);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _canOpen
            ? () {
                _open(context);
              }
            : null,
        child: AnimatedScale(
          scale: phonePortrait ? 1.0 : (_active ? 1.025 : 1.0),
          duration: _motionDuration,
          curve: Curves.easeOutCubic,
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: widget.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: _motionDuration,
                  curve: Curves.easeOutCubic,
                  width: widget.avatarSize,
                  height: widget.avatarSize,
                  padding: EdgeInsets.all(phonePortrait ? 2 : 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.isFocused
                          ? foreground.withValues(alpha: 0.96)
                          : foreground.withValues(
                              alpha: phonePortrait ? 0.12 : 0.08,
                            ),
                      width: widget.isFocused ? 2 : 1,
                    ),
                    boxShadow: !phonePortrait && _active
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.30),
                              blurRadius: 22,
                              offset: const Offset(0, 7),
                            ),
                            BoxShadow(
                              color: foreground.withValues(
                                alpha: widget.isFocused ? 0.07 : 0.035,
                              ),
                              blurRadius: 14,
                              spreadRadius: 1,
                            ),
                          ]
                        : null,
                  ),
                  child: ClipOval(
                    child: ColoredBox(
                      color: foreground.withValues(alpha: 0.06),
                      child: imageUrl != null
                          ? OfflineAwareImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              errorWidget: (_, _, _) {
                                return Center(
                                  child: Icon(
                                    Icons.person_rounded,
                                    size: widget.avatarSize * 0.34,
                                    color: foreground.withValues(alpha: 0.38),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Icon(
                                Icons.person_rounded,
                                size: widget.avatarSize * 0.34,
                                color: foreground.withValues(alpha: 0.38),
                              ),
                            ),
                    ),
                  ),
                ),

                SizedBox(
                  height: phonePortrait
                      ? 10
                      : ImmersiveSpacing.peopleAvatarToName,
                ),

                AnimatedDefaultTextStyle(
                  duration: _motionDuration,
                  curve: Curves.easeOutCubic,
                  style: phonePortrait
                      ? theme.textTheme.bodyMedium?.copyWith(
                              color: foreground.withValues(alpha: 0.94),
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              height: 1.18,
                            ) ??
                            const TextStyle()
                      : theme.textTheme.bodyMedium?.copyWith(
                              color: foreground.withValues(
                                alpha: _active ? 1.0 : 0.88,
                              ),
                              fontWeight: _active
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                              height: 1.15,
                            ) ??
                            const TextStyle(),
                  child: Text(
                    _name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                if (_role != null) ...[
                  SizedBox(
                    height: phonePortrait
                        ? 4
                        : ImmersiveSpacing.peopleNameToRole,
                  ),

                  Text(
                    _role!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: phonePortrait
                        ? theme.textTheme.bodySmall?.copyWith(
                            color: foreground.withValues(alpha: 0.58),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          )
                        : theme.textTheme.bodySmall?.copyWith(
                            color: foreground.withValues(
                              alpha: _active ? 0.70 : 0.52,
                            ),
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
