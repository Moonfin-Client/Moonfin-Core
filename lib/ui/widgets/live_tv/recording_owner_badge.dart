import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/user_repository.dart';
import '../../../data/services/recording_owners_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../user_avatar_image.dart';

/// The URL of an owner's picture, or null when no server client is available.
String? recordingOwnerImageUrl(RecordingOwner owner) {
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<MediaServerClient>()) return null;
  try {
    return getIt<MediaServerClient>().imageApi.getUserImageUrl(owner.userId);
  } catch (_) {
    return null;
  }
}

/// The id of the signed in user, or null.
String? recordingCurrentUserId() {
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<UserRepository>()) return null;
  return getIt<UserRepository>().currentUser?.id;
}

/// The ring that marks the current user's picture. A fixed colour from the
/// standard Moonfin palette rather than the focus colour, so it never reads as
/// focus: Moonfin cyan, or 8-bit gold when the user's focus colour is cyan.
Color _currentUserRingColor() {
  final cyan = Color(AppTheme.moonfinCyan.colorValue);
  final gold = Color(AppTheme.eightBitGold.colorValue);
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<UserPreferences>()) return cyan;
  final focus = getIt<UserPreferences>().get(UserPreferences.focusColor);
  return focus == AppTheme.moonfinCyan ? gold : cyan;
}

/// A picture, or the owner's initial on a colour picked from a stable hash of
/// their id. [size] square, clipped to a circle.
class RecordingOwnerAvatar extends StatelessWidget {
  const RecordingOwnerAvatar({
    super.key,
    required this.owner,
    required this.size,
    this.ring,
  });

  final RecordingOwner owner;
  final double size;
  final Color? ring;

  /// The active theme's navigation colour cycle, or a fixed set of Moonfin
  /// focus colours that read well under light initials.
  static List<Color> get _palette {
    final cycle = AppColorScheme.navColorCycle;
    if (cycle.isNotEmpty) return cycle;
    return [
      for (final theme in const [
        AppTheme.moonfinCyan,
        AppTheme.purple,
        AppTheme.teal,
        AppTheme.darkRed,
        AppTheme.darkGreen,
        AppTheme.indigo,
        AppTheme.slate,
      ])
        Color(theme.colorValue),
    ];
  }

  /// FNV-1a over the id, so the colour is the same on every run and device.
  static Color colorFor(String userId) {
    var hash = 0x811c9dc5;
    for (final unit in userId.codeUnits) {
      hash = ((hash ^ unit) * 0x01000193) & 0xFFFFFFFF;
    }
    final palette = _palette;
    return palette[hash % palette.length];
  }

  @override
  Widget build(BuildContext context) {
    final initial = owner.name.isNotEmpty
        ? owner.name.characters.first.toUpperCase()
        : '?';
    final fullWidth = (size * 0.08).clamp(1.0, 3.0);
    // Other users get a thin soft outline, half the ring's width, so a dark
    // picture still reads on dark artwork.
    final ringWidth = ring == null ? fullWidth / 2 : fullWidth;
    final borderColor =
        ring ?? AppColorScheme.onBackground.withValues(alpha: 0.5);
    final inner = size - ringWidth * 2;
    final fallback = Container(
      width: inner,
      height: inner,
      color: colorFor(owner.userId),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: TextStyle(
          color: AppColorScheme.onAccent,
          fontSize: inner * 0.5,
          fontWeight: FontWeight.w700,
          height: 1,
          decoration: TextDecoration.none,
        ),
      ),
    );
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: ringWidth),
      ),
      child: ClipOval(
        child: UserAvatarImage(
          url: recordingOwnerImageUrl(owner),
          size: inner,
          fallback: fallback,
        ),
      ),
    );
  }
}

/// Overlapping pictures of the users who own a recording, for a card corner.
///
/// The diameter is one fifth of [cardWidth], so it scales with the card on
/// every screen size. Shows at most two pictures, then a "+N" chip. Renders
/// nothing for an empty list. Purely visual: it takes no focus.
class RecordingOwnerBadge extends StatelessWidget {
  const RecordingOwnerBadge({
    super.key,
    required this.owners,
    required this.cardWidth,
    this.highlightCurrentUser = false,
  });

  final List<RecordingOwner> owners;
  final double cardWidth;
  final bool highlightCurrentUser;

  static const _maxPictures = 2;

  static String _normalizeId(String id) => id.replaceAll('-', '').toLowerCase();

  @override
  Widget build(BuildContext context) {
    if (owners.isEmpty || cardWidth <= 0) return const SizedBox.shrink();
    final diameter = cardWidth / 5;
    final meId = highlightCurrentUser ? recordingCurrentUserId() : null;
    final me = meId == null ? null : _normalizeId(meId);
    // The current user goes first so their ring never hides behind "+N".
    final ordered = me == null
        ? owners
        : [
            ...owners.where((o) => _normalizeId(o.userId) == me),
            ...owners.where((o) => _normalizeId(o.userId) != me),
          ];
    final shown = ordered.take(_maxPictures).toList();
    final extra = owners.length - shown.length;
    final ring = me == null ? null : _currentUserRingColor();
    final step = diameter * 0.7;
    final slots = shown.length + (extra > 0 ? 1 : 0);
    final width = diameter + step * (slots - 1);

    final children = <Widget>[
      for (var i = 0; i < shown.length; i++)
        Positioned(
          left: step * i,
          top: 0,
          child: _shadowed(
            RecordingOwnerAvatar(
              owner: shown[i],
              size: diameter,
              ring: _normalizeId(shown[i].userId) == me ? ring : null,
            ),
          ),
        ),
      if (extra > 0)
        Positioned(
          left: step * shown.length,
          top: 0,
          child: _shadowed(
            Container(
              width: diameter,
              height: diameter,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColorScheme.badgeBackground,
              ),
              child: Text(
                '+$extra',
                style: TextStyle(
                  color: AppColorScheme.onBadge,
                  fontSize: diameter * 0.4,
                  fontWeight: FontWeight.w700,
                  height: 1,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
    ];

    return ExcludeSemantics(
      child: SizedBox(
        width: width,
        height: diameter,
        child: Stack(clipBehavior: Clip.none, children: children),
      ),
    );
  }

  /// A soft shadow keeps overlapping circles apart on any artwork.
  Widget _shadowed(Widget child) => DecoratedBox(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: AppColorScheme.scrim.withValues(alpha: 0.7),
          blurRadius: 4,
          spreadRadius: 0.5,
        ),
      ],
    ),
    child: child,
  );
}
