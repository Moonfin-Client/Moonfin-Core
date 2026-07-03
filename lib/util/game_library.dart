import 'package:flutter/material.dart';

import '../ui/navigation/destinations.dart';

/// Shared helpers for recognizing and navigating to retro-game (ROM) libraries so every
/// entry point (home tiles, sidebar, bottom nav) treats them consistently.
///
/// Games live in a "Mixed Content" Jellyfin library; the client recognizes one by name
/// (matching the Moonbase plugin's auto-detect) since ROMs are not a Jellyfin media type.
final RegExp _gameLibraryName = RegExp('game|rom|emulat', caseSensitive: false);

bool isGameLibrary(String? collectionType, String? name) {
  if (name == null || name.isEmpty) return false;
  final ct = (collectionType ?? '').toLowerCase();
  // Mixed Content libraries report an empty/unknown/mixed collection type.
  if (ct.isNotEmpty && ct != 'mixed' && ct != 'unknown') return false;
  return _gameLibraryName.hasMatch(name);
}

/// The route a library tile should open: the games browser for game libraries,
/// otherwise the normal library view.
String gameOrLibraryRoute(String id, String? collectionType, String name) {
  if (isGameLibrary(collectionType, name)) {
    return '${Destinations.gamesLibrary(id)}?title=${Uri.encodeQueryComponent(name)}';
  }
  return Destinations.library(id);
}

const IconData gameLibraryIcon = Icons.sports_esports;

/// EmulatorJS core name -> libretro thumbnail platform folder. Used to build keyless box-art
/// URLs from the libretro thumbnail server (no API key or account needed).
const Map<String, String> _libretroPlatform = {
  'nes': 'Nintendo - Nintendo Entertainment System',
  'snes': 'Nintendo - Super Nintendo Entertainment System',
  'gb': 'Nintendo - Game Boy',
  'gba': 'Nintendo - Game Boy Advance',
  'n64': 'Nintendo - Nintendo 64',
  'nds': 'Nintendo - Nintendo DS',
  'vb': 'Nintendo - Virtual Boy',
  'segaMD': 'Sega - Mega Drive - Genesis',
  'segaMS': 'Sega - Master System - Mark III',
  'segaGG': 'Sega - Game Gear',
  'atari2600': 'Atari - 2600',
  'atari7800': 'Atari - 7800',
  'lynx': 'Atari - Lynx',
  'ws': 'Bandai - WonderSwan',
  'ngp': 'SNK - Neo Geo Pocket',
  'pce': 'NEC - PC Engine - TurboGrafx 16',
  'psx': 'Sony - PlayStation',
  'psp': 'Sony - PlayStation Portable',
};

/// Builds a libretro thumbnail URL for [folder] (Named_Boxarts / Named_Snaps /
/// Named_Titles), or null if the core has no known platform. Thumbnails are keyed on the
/// No-Intro game name, so they only resolve when the title matches; callers should fall
/// back when the image 404s.
String? _libretroThumbUrl(String? core, String? title, String folder) {
  if (core == null || title == null || title.isEmpty) return null;
  final platform = _libretroPlatform[core];
  if (platform == null) return null;
  // libretro replaces these characters with '_' in thumbnail filenames.
  final sanitized = title.replaceAll(RegExp(r'[&*/:`<>?\\|"]'), '_');
  return 'https://thumbnails.libretro.com/'
      '${Uri.encodeComponent(platform)}/$folder/'
      '${Uri.encodeComponent(sanitized)}.png';
}

/// Box art (cover) for a game, used as the poster.
String? libretroBoxartUrl(String? core, String? title) =>
    _libretroThumbUrl(core, title, 'Named_Boxarts');

/// In-game screenshot, used as the cinematic backdrop.
String? libretroSnapUrl(String? core, String? title) =>
    _libretroThumbUrl(core, title, 'Named_Snaps');

/// Title screen, used as a backdrop fallback when no snapshot exists.
String? libretroTitleUrl(String? core, String? title) =>
    _libretroThumbUrl(core, title, 'Named_Titles');

/// The No-Intro name libretro thumbnails are keyed on is the ROM filename (with its
/// region/revision tags), not the cleaned display title. Strip the extension only.
String thumbName(String fileName) {
  final dot = fileName.lastIndexOf('.');
  return dot > 0 ? fileName.substring(0, dot) : fileName;
}

/// A safe display title for a game. Some ROM folder names carry characters the app font
/// cannot render (they arrive as the replacement char) or control bytes; strip those and,
/// when nothing legible remains, fall back to the filename without its extension.
String gameDisplayTitle(String title, String fileName) {
  final cleaned = title
      .replaceAll('�', '')
      .replaceAll(RegExp(r'[\x00-\x1F\x7F]'), '')
      .trim();
  return cleaned.isEmpty ? thumbName(fileName) : cleaned;
}

/// A stable, pleasant fallback color for poster/backdrop placeholders when no thumbnail
/// resolves. Derived from [seed] so a given game keeps the same color across sessions.
Color gameFallbackColor(String seed) {
  var hash = 0;
  for (final unit in seed.codeUnits) {
    hash = (hash * 31 + unit) & 0x7fffffff;
  }
  final hue = (hash % 360).toDouble();
  return HSLColor.fromAHSL(1, hue, 0.45, 0.32).toColor();
}
