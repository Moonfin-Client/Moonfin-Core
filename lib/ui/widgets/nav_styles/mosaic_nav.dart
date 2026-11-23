import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../offline_aware_image.dart';
import 'nav_art.dart';
import 'nav_entry.dart';
import 'nav_focusable.dart';

const _kPanelColor = Color(0xFF0E0F12);
const _kTileColor = Color(0xFF1A1A1A);

/// The Mosaic sidebar. At rest it's a single menu button, and open it's a
/// solid panel of tiles where each library shows its own cover.
class MosaicNav extends StatelessWidget {
  const MosaicNav({
    super.key,
    required this.entries,
    required this.open,
    required this.phone,
    required this.onOpen,
    required this.onClose,
    required this.restFocus,
    required this.homeFocus,
    required this.profileFocus,
    required this.focusFor,
    required this.onProfile,
    required this.avatarBuilder,
    required this.userName,
    required this.openLabel,
    required this.liveLabel,
    required this.featuredLabel,
    this.featuredImageUrl,
    this.clock,
    this.onBack,
  });

  final List<NavEntry> entries;
  final bool open;
  final bool phone;
  final VoidCallback onOpen;
  final VoidCallback onClose;
  final FocusNode restFocus;
  final FocusNode homeFocus;
  final FocusNode profileFocus;
  final FocusNode Function(String id) focusFor;
  final VoidCallback onProfile;
  final Widget Function(double size) avatarBuilder;
  final String userName;
  final String openLabel;
  final String liveLabel;

  /// The caption under Home, or null when nothing is featured.
  final String? featuredLabel;
  final String? featuredImageUrl;
  final Widget? clock;

  /// Shown beside the phone menu button on pages that can go back.
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final s = phone ? 1.0 : (size.height / 720).clamp(0.75, 1.25);
    final top = MediaQuery.paddingOf(context).top;
    if (!open) {
      final button = NavFocusable(
        focusNode: restFocus,
        semanticLabel: openLabel,
        onPressed: onOpen,
        builder: (context, focused) => AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: (phone ? 40 : 44) * s,
          height: (phone ? 40 : 44) * s,
          decoration: BoxDecoration(
            color: focused
                ? Colors.white
                : (phone
                      ? Colors.black.withValues(alpha: 0.4)
                      : const Color(0xB814161A)),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
          ),
          child: Icon(
            Icons.apps_rounded,
            size: 22 * s,
            color: focused ? Colors.black : Colors.white,
          ),
        ),
      );
      return SizedBox(
        width: phone ? size.width : 72 * s,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              left: phone ? 8 : 20 * s,
              top: top + (phone ? 8 : 22 * s),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  button,
                  if (phone && onBack != null) navPhoneBackButton(onBack!),
                ],
              ),
            ),
          ],
        ),
      );
    }

    final panelWidth = phone ? size.width - 44 : 560 * s;
    final gap = (phone ? 10.0 : 12.0) * s;
    NavEntry? home;
    final libraries = <NavEntry>[];
    final liveTv = <NavEntry>[];
    final seerr = <NavEntry>[];
    final small = <NavEntry>[];
    for (final e in entries) {
      switch (e.kind) {
        case NavEntryKind.home:
          home = e;
        case NavEntryKind.library:
          libraries.add(e);
        case NavEntryKind.liveTv:
          liveTv.add(e);
        case NavEntryKind.seerr:
          seerr.add(e);
        case NavEntryKind.profile:
          break;
        case NavEntryKind.other:
          small.add(e);
      }
    }
    final big = [...libraries, ...liveTv, ...seerr];

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: onClose,
              child: ColoredBox(color: Colors.black.withValues(alpha: 0.55)),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: panelWidth,
            child: Container(
              decoration: BoxDecoration(
                color: _kPanelColor,
                borderRadius: phone
                    ? const BorderRadius.horizontal(right: Radius.circular(22))
                    : null,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x8C000000),
                    blurRadius: 60,
                    offset: Offset(30, 0),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  (phone ? 14 : 28) * s,
                  top + (phone ? 8 : 22) * s,
                  (phone ? 14 : 28) * s,
                  24 * s + MediaQuery.paddingOf(context).bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _header(s),
                    SizedBox(height: gap),
                    if (home != null) ...[
                      _homeTile(home, s),
                      SizedBox(height: gap),
                    ],
                    _grid(
                      [for (final e in big) _bigTile(e, s)],
                      columns: 2,
                      gap: gap,
                    ),
                    if (small.isNotEmpty) ...[
                      SizedBox(height: gap),
                      _grid(
                        [for (final e in small) _smallTile(e, s)],
                        columns: phone ? 3 : 6,
                        gap: (phone ? 8 : 10) * s,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(double s) {
    return SizedBox(
      height: 40 * s,
      child: Row(
        children: [
          NavFocusable(
            focusNode: profileFocus,
            semanticLabel: userName,
            onPressed: onProfile,
            builder: (context, focused) => AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: EdgeInsets.all(focused ? 2 : 0),
              decoration: BoxDecoration(
                color: focused ? Colors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: ClipOval(child: avatarBuilder(36 * s)),
            ),
          ),
          SizedBox(width: 12 * s),
          Expanded(
            child: Text(
              userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15 * s,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ?clock,
          if (phone) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onClose,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close_rounded,
                  size: 22,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _grid(
    List<Widget> tiles, {
    required int columns,
    required double gap,
  }) {
    final rows = <Widget>[];
    for (var i = 0; i < tiles.length; i += columns) {
      if (rows.isNotEmpty) rows.add(SizedBox(height: gap));
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var c = 0; c < columns; c++) ...[
              if (c > 0) SizedBox(width: gap),
              Expanded(
                child: i + c < tiles.length
                    ? tiles[i + c]
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      );
    }
    return Column(mainAxisSize: MainAxisSize.min, children: rows);
  }

  Widget _frame({
    required bool focused,
    required bool current,
    required double radius,
    required double height,
    required Widget child,
    Gradient? gradient,
  }) {
    return AnimatedScale(
      scale: focused ? 1.04 : 1,
      duration: const Duration(milliseconds: 150),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: _kTileColor,
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: focused
              ? const [
                  BoxShadow(color: Colors.white, spreadRadius: 3),
                  BoxShadow(
                    color: Color(0x99000000),
                    blurRadius: 28,
                    offset: Offset(0, 12),
                  ),
                ]
              : null,
        ),
        foregroundDecoration: current && !focused
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(color: AppColorScheme.accent, width: 2.5),
              )
            : null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: child,
        ),
      ),
    );
  }

  Widget _homeTile(NavEntry home, double s) {
    final url = featuredImageUrl;
    return NavFocusable(
      focusNode: homeFocus,
      semanticLabel: home.label,
      onPressed: home.onSelect,
      builder: (context, focused) => _frame(
        focused: focused,
        current: false,
        radius: 14 * s,
        height: (phone ? 100 : 96) * s,
        gradient: url == null
            ? const LinearGradient(
                colors: [Color(0xFF2A3140), Color(0xFF15181E)],
              )
            : null,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (url != null)
              OfflineAwareImage(
                imageUrl: url,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.1),
                errorWidget: (_, _, _) => const SizedBox.shrink(),
              ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xC7000000), Color(0x33000000)],
                  stops: [0, 0.75],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18 * s),
              child: Row(
                children: [
                  home.buildIcon(30 * s, Colors.white),
                  SizedBox(width: 12 * s),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          home.label,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20 * s,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (featuredLabel != null)
                          Text(
                            featuredLabel!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.75),
                              fontSize: 13 * s,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (home.current) ...[
                    SizedBox(width: 10 * s),
                    Container(
                      width: 9 * s,
                      height: 9 * s,
                      decoration: BoxDecoration(
                        color: AppColorScheme.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _labelRow(NavEntry e, double s, {double iconSize = 26}) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      e.buildIcon(iconSize * s, Colors.white),
      SizedBox(width: 10 * s),
      Flexible(
        child: Text(
          e.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17 * s,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ],
  );

  Widget _bigTile(NavEntry e, double s) {
    final height = (phone ? 80 : 96) * s;
    final radius = (phone ? 12 : 14) * s;
    return NavFocusable(
      focusNode: focusFor(e.id),
      semanticLabel: e.label,
      onPressed: e.onSelect,
      builder: (context, focused) {
        switch (e.kind) {
          case NavEntryKind.liveTv:
            return _frame(
              focused: focused,
              current: e.current,
              radius: radius,
              height: height,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF22314F), Color(0xFF121A2B)],
              ),
              child: Padding(
                padding: EdgeInsets.all(14 * s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 7 * s,
                          height: 7 * s,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF5A5A),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6 * s),
                        Text(
                          liveLabel,
                          style: TextStyle(
                            color: const Color(0xFFFFB4B4),
                            fontSize: 11 * s,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.9 * s,
                          ),
                        ),
                      ],
                    ),
                    _labelRow(e, s),
                  ],
                ),
              ),
            );
          case NavEntryKind.seerr:
            return _frame(
              focused: focused,
              current: e.current,
              radius: radius,
              height: height,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4B4FD1), Color(0xFF23245E)],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -18 * s,
                    top: -18 * s,
                    child: Opacity(
                      opacity: 0.35,
                      child: e.buildIcon(110 * s, Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 14 * s,
                    right: 14 * s,
                    bottom: 14 * s,
                    child: _labelRow(e, s),
                  ),
                ],
              ),
            );
          default:
            final lib = e.library;
            final url = lib == null ? null : navLibraryCoverUrl(lib);
            final fallback = Padding(
              padding: EdgeInsets.all(14 * s),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: _labelRow(e, s),
              ),
            );
            return _frame(
              focused: focused,
              current: e.current,
              radius: radius,
              height: height,
              gradient: url == null
                  ? const LinearGradient(
                      colors: [Color(0xFF2A2E36), Color(0xFF17191E)],
                    )
                  : null,
              child: url == null
                  ? fallback
                  : OfflineAwareImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: height,
                      errorWidget: (_, _, _) => fallback,
                    ),
            );
        }
      },
    );
  }

  Widget _smallTile(NavEntry e, double s) {
    return NavFocusable(
      focusNode: focusFor(e.id),
      semanticLabel: e.label,
      onPressed: e.onSelect,
      builder: (context, focused) {
        final fg = focused
            ? const Color(0xFF101010)
            : Colors.white.withValues(alpha: 0.8);
        return AnimatedScale(
          scale: focused ? 1.04 : 1,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: (phone ? 58 : 60) * s,
            padding: EdgeInsets.symmetric(horizontal: 4 * s),
            decoration: BoxDecoration(
              color: focused
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(12 * s),
              border: e.current && !focused
                  ? Border.all(color: AppColorScheme.accent, width: 2)
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    e.buildIcon(22 * s, fg),
                    if (e.badge > 0)
                      Positioned(
                        right: -3,
                        top: -2,
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE53935),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 5 * s),
                Text(
                  e.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: fg,
                    fontSize: (phone ? 11.5 : 11) * s,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
