import 'package:flutter/material.dart';

@immutable
class ThemeColorTokens {
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color scrim;
  final Color accent;
  final Color onAccent;
  final Color buttonNormal;
  final Color buttonFocused;
  final Color buttonDisabled;
  final Color buttonActive;
  final Color onButtonNormal;
  final Color onButtonFocused;
  final Color onButtonDisabled;
  final Color inputBackground;
  final Color inputFocused;
  final Color inputBorder;
  final Color inputBorderFocused;
  final Color rangeTrack;
  final Color rangeProgress;
  final Color rangeThumb;
  final Color seekbarBuffered;
  final Color badgeBackground;
  final Color onBadge;
  final Color badgeUnplayed;
  final Color badgeWatched;
  final Color recordingActive;
  final Color recordingScheduled;

  const ThemeColorTokens({
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.scrim,
    required this.accent,
    required this.onAccent,
    required this.buttonNormal,
    required this.buttonFocused,
    required this.buttonDisabled,
    required this.buttonActive,
    required this.onButtonNormal,
    required this.onButtonFocused,
    required this.onButtonDisabled,
    required this.inputBackground,
    required this.inputFocused,
    required this.inputBorder,
    required this.inputBorderFocused,
    required this.rangeTrack,
    required this.rangeProgress,
    required this.rangeThumb,
    required this.seekbarBuffered,
    required this.badgeBackground,
    required this.onBadge,
    required this.badgeUnplayed,
    required this.badgeWatched,
    required this.recordingActive,
    required this.recordingScheduled,
  });

  factory ThemeColorTokens.fromJson(Map<String, dynamic> json) {
    Color c(String key) => _parseColor(json[key], key);
    return ThemeColorTokens(
      background: c('background'),
      onBackground: c('onBackground'),
      surface: c('surface'),
      onSurface: c('onSurface'),
      surfaceVariant: c('surfaceVariant'),
      scrim: c('scrim'),
      accent: c('accent'),
      onAccent: c('onAccent'),
      buttonNormal: c('buttonNormal'),
      buttonFocused: c('buttonFocused'),
      buttonDisabled: c('buttonDisabled'),
      buttonActive: c('buttonActive'),
      onButtonNormal: c('onButtonNormal'),
      onButtonFocused: c('onButtonFocused'),
      onButtonDisabled: c('onButtonDisabled'),
      inputBackground: c('inputBackground'),
      inputFocused: c('inputFocused'),
      inputBorder: c('inputBorder'),
      inputBorderFocused: c('inputBorderFocused'),
      rangeTrack: c('rangeTrack'),
      rangeProgress: c('rangeProgress'),
      rangeThumb: c('rangeThumb'),
      seekbarBuffered: c('seekbarBuffered'),
      badgeBackground: c('badgeBackground'),
      onBadge: c('onBadge'),
      badgeUnplayed: c('badgeUnplayed'),
      badgeWatched: c('badgeWatched'),
      recordingActive: c('recordingActive'),
      recordingScheduled: c('recordingScheduled'),
    );
  }

  Map<String, dynamic> toJson() => {
        'background': _encodeColor(background),
        'onBackground': _encodeColor(onBackground),
        'surface': _encodeColor(surface),
        'onSurface': _encodeColor(onSurface),
        'surfaceVariant': _encodeColor(surfaceVariant),
        'scrim': _encodeColor(scrim),
        'accent': _encodeColor(accent),
        'onAccent': _encodeColor(onAccent),
        'buttonNormal': _encodeColor(buttonNormal),
        'buttonFocused': _encodeColor(buttonFocused),
        'buttonDisabled': _encodeColor(buttonDisabled),
        'buttonActive': _encodeColor(buttonActive),
        'onButtonNormal': _encodeColor(onButtonNormal),
        'onButtonFocused': _encodeColor(onButtonFocused),
        'onButtonDisabled': _encodeColor(onButtonDisabled),
        'inputBackground': _encodeColor(inputBackground),
        'inputFocused': _encodeColor(inputFocused),
        'inputBorder': _encodeColor(inputBorder),
        'inputBorderFocused': _encodeColor(inputBorderFocused),
        'rangeTrack': _encodeColor(rangeTrack),
        'rangeProgress': _encodeColor(rangeProgress),
        'rangeThumb': _encodeColor(rangeThumb),
        'seekbarBuffered': _encodeColor(seekbarBuffered),
        'badgeBackground': _encodeColor(badgeBackground),
        'onBadge': _encodeColor(onBadge),
        'badgeUnplayed': _encodeColor(badgeUnplayed),
        'badgeWatched': _encodeColor(badgeWatched),
        'recordingActive': _encodeColor(recordingActive),
        'recordingScheduled': _encodeColor(recordingScheduled),
      };
}

@immutable
class ThemeBorderTokens {
  final BorderSide cardBorder;
  final BorderSide chipBorder;
  final BorderSide focusBorder;
  final BorderRadius cardRadius;
  final BorderRadius chipRadius;
  final Color chipBackground;
  final List<BoxShadow> focusGlow;

  /// Optional border drawn on the right edge of sidebars / navbars.
  /// `null` means no edge border (default for Moonfin).
  final BorderSide? navBorder;

  const ThemeBorderTokens({
    required this.cardBorder,
    required this.chipBorder,
    required this.focusBorder,
    required this.cardRadius,
    required this.chipRadius,
    required this.chipBackground,
    required this.focusGlow,
    this.navBorder,
  });

  factory ThemeBorderTokens.fromJson(Map<String, dynamic> json) {
    return ThemeBorderTokens(
      cardBorder: _parseBorderSide(json['cardBorder'], 'cardBorder'),
      chipBorder: _parseBorderSide(json['chipBorder'], 'chipBorder'),
      focusBorder: _parseBorderSide(json['focusBorder'], 'focusBorder'),
      cardRadius: _parseBorderRadius(json['cardRadius'], 'cardRadius'),
      chipRadius: _parseBorderRadius(json['chipRadius'], 'chipRadius'),
      chipBackground: _parseColor(json['chipBackground'], 'chipBackground'),
      focusGlow: _parseShadowList(json['focusGlow'], 'focusGlow'),
      navBorder: json.containsKey('navBorder')
          ? _parseBorderSide(json['navBorder'], 'navBorder')
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'cardBorder': _encodeBorderSide(cardBorder),
        'chipBorder': _encodeBorderSide(chipBorder),
        'focusBorder': _encodeBorderSide(focusBorder),
        'cardRadius': _encodeBorderRadius(cardRadius),
        'chipRadius': _encodeBorderRadius(chipRadius),
        'chipBackground': _encodeColor(chipBackground),
        'focusGlow': focusGlow.map(_encodeShadow).toList(),
        if (navBorder != null) 'navBorder': _encodeBorderSide(navBorder!),
      };
}

@immutable
class ThemeSemanticTokens {
  final Color statusAvailable;
  final Color statusRequested;
  final Color statusPending;
  final Color statusDownloading;
  final Color mediaTypeBadgeMovie;
  final Color mediaTypeBadgeShow;

  const ThemeSemanticTokens({
    required this.statusAvailable,
    required this.statusRequested,
    required this.statusPending,
    required this.statusDownloading,
    required this.mediaTypeBadgeMovie,
    required this.mediaTypeBadgeShow,
  });

  static const ThemeSemanticTokens defaults = ThemeSemanticTokens(
    statusAvailable: Color(0xFF22C55E),
    statusRequested: Color(0xFF9333EA),
    statusPending: Color(0xFFEAB308),
    statusDownloading: Color(0xFF6366F1),
    mediaTypeBadgeMovie: Color(0xFF3B82F6),
    mediaTypeBadgeShow: Color(0xFF8B5CF6),
  );

  factory ThemeSemanticTokens.fromJson(Map<String, dynamic> json) {
    return ThemeSemanticTokens(
      statusAvailable: _parseColor(
        json['statusAvailable'],
        'semantic.statusAvailable',
      ),
      statusRequested: _parseColor(
        json['statusRequested'],
        'semantic.statusRequested',
      ),
      statusPending: _parseColor(json['statusPending'], 'semantic.statusPending'),
      statusDownloading: _parseColor(
        json['statusDownloading'],
        'semantic.statusDownloading',
      ),
      mediaTypeBadgeMovie: _parseColor(
        json['mediaTypeBadgeMovie'],
        'semantic.mediaTypeBadgeMovie',
      ),
      mediaTypeBadgeShow: _parseColor(
        json['mediaTypeBadgeShow'],
        'semantic.mediaTypeBadgeShow',
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'statusAvailable': _encodeColor(statusAvailable),
        'statusRequested': _encodeColor(statusRequested),
        'statusPending': _encodeColor(statusPending),
        'statusDownloading': _encodeColor(statusDownloading),
        'mediaTypeBadgeMovie': _encodeColor(mediaTypeBadgeMovie),
        'mediaTypeBadgeShow': _encodeColor(mediaTypeBadgeShow),
      };
}

@immutable
class ThemeBookTokens {
  final Color background;
  final Color accent;
  final Color mutedText;
  final Color primaryText;
  final Color sectionTitle;
  final Color divider;
  final Color placeholder;
  final Color shadow;
  final Color gradientTop;
  final Color gradientBottom;
  final Color inactiveChip;
  final List<Color> placeholderPalette;

  const ThemeBookTokens({
    required this.background,
    required this.accent,
    required this.mutedText,
    required this.primaryText,
    required this.sectionTitle,
    required this.divider,
    required this.placeholder,
    required this.shadow,
    required this.gradientTop,
    required this.gradientBottom,
    required this.inactiveChip,
    required this.placeholderPalette,
  });

  static const ThemeBookTokens defaults = ThemeBookTokens(
    background: Color(0xFF0F182A),
    accent: Color(0xFF32B9E8),
    mutedText: Color(0xFF9EDBFF),
    primaryText: Color(0xFFDCEFFF),
    sectionTitle: Color(0xFFFFE6C3),
    divider: Color(0x223E5F82),
    placeholder: Color(0xFF2C77B7),
    shadow: Color(0x24000000),
    gradientTop: Color(0xFF18263D),
    gradientBottom: Color(0xFF0B1424),
    inactiveChip: Color(0x556388A8),
    placeholderPalette: <Color>[
      Color(0xFF1A5C9A),
      Color(0xFF2E7D32),
      Color(0xFF6A1B9A),
      Color(0xFF00695C),
      Color(0xFFC62828),
      Color(0xFF4527A0),
      Color(0xFF558B2F),
      Color(0xFF283593),
      Color(0xFF4E342E),
      Color(0xFF00838F),
    ],
  );

  factory ThemeBookTokens.fromJson(Map<String, dynamic> json) {
    List<Color> parsePalette(Object? value) {
      if (value == null) return defaults.placeholderPalette;
      if (value is! List) {
        throw const ThemeSpecParseException('"book.placeholderPalette" must be a list.');
      }
      if (value.isEmpty || value.length > 16) {
        throw const ThemeSpecParseException(
          '"book.placeholderPalette" must have 1 to 16 colors.',
        );
      }
      return value.indexed
          .map((entry) => _parseColor(entry.$2, 'book.placeholderPalette[${entry.$1}]'))
          .toList(growable: false);
    }

    return ThemeBookTokens(
      background: _parseColor(json['background'], 'book.background'),
      accent: _parseColor(json['accent'], 'book.accent'),
      mutedText: _parseColor(json['mutedText'], 'book.mutedText'),
      primaryText: _parseColor(json['primaryText'], 'book.primaryText'),
      sectionTitle: _parseColor(json['sectionTitle'], 'book.sectionTitle'),
      divider: _parseColor(json['divider'], 'book.divider'),
      placeholder: _parseColor(json['placeholder'], 'book.placeholder'),
      shadow: _parseColor(json['shadow'], 'book.shadow'),
      gradientTop: _parseColor(json['gradientTop'], 'book.gradientTop'),
      gradientBottom: _parseColor(json['gradientBottom'], 'book.gradientBottom'),
      inactiveChip: _parseColor(json['inactiveChip'], 'book.inactiveChip'),
      placeholderPalette: parsePalette(json['placeholderPalette']),
    );
  }

  Map<String, dynamic> toJson() => {
        'background': _encodeColor(background),
        'accent': _encodeColor(accent),
        'mutedText': _encodeColor(mutedText),
        'primaryText': _encodeColor(primaryText),
        'sectionTitle': _encodeColor(sectionTitle),
        'divider': _encodeColor(divider),
        'placeholder': _encodeColor(placeholder),
        'shadow': _encodeColor(shadow),
        'gradientTop': _encodeColor(gradientTop),
        'gradientBottom': _encodeColor(gradientBottom),
        'inactiveChip': _encodeColor(inactiveChip),
        'placeholderPalette': placeholderPalette.map(_encodeColor).toList(),
      };
}

@immutable
class ThemeSpec {
  /// Bumped when the JSON shape changes in a non-backwards-compatible way.
  static const int currentSchemaVersion = 1;

  final String id;
  final String displayName;

  /// Optional description shown under the theme name in the
  /// picker. `null` for built-in themes (they use localized subtitles).
  final String? description;

  final ThemeColorTokens colors;
  final ThemeBorderTokens borders;
  final ThemeSemanticTokens semantic;
  final ThemeBookTokens book;

  /// Optional font family name. Must already be available to Flutter
  /// (bundled in `pubspec.yaml`, a system font, or loaded at runtime via
  /// [FontLoader] before the theme is applied). `null` falls back to the
  /// platform default.
  final String? fontFamily;

  /// Text glow shadows applied to styled text elements (clock, labels, etc.).
  /// Empty list means no glow (default for Moonfin).
  final List<Shadow> textGlow;

  /// Ordered list of colors cycled through nav icon slots.
  /// Empty list means no colour cycling — icons use their inherited colour.
  final List<Color> navColorCycle;

  /// When `true`, the toolbar navbar pill uses a fully transparent background
  /// so the wallpaper / gradient shows through. When `false` (default) the
  /// overlay colour and opacity preference are applied.
  final bool transparentNavbarSurface;

  /// When `true`, surfaces render the Apple "Liquid Glass" treatment — a
  /// drifting gradient backdrop plus real frosted-material panels — instead of
  /// flat fills. Widgets check this via `AppColorScheme.isGlass`.
  final bool isGlass;

  /// When `true`, surfaces render retro pixel-art chrome (blocky bevels,
  /// stair-step / zero-radius corners, and hard offset drop-shadows) instead
  /// of smooth glass or flat fills. Widgets check this via
  /// `AppColorScheme.isPixel`. Mutually exclusive with [isGlass].
  final bool isPixel;

  const ThemeSpec({
    required this.id,
    required this.displayName,
    this.description,
    required this.colors,
    required this.borders,
    this.semantic = ThemeSemanticTokens.defaults,
    this.book = ThemeBookTokens.defaults,
    this.fontFamily,
    this.textGlow = const [],
    this.navColorCycle = const [],
    this.transparentNavbarSurface = false,
    this.isGlass = false,
    this.isPixel = false,
  });

  factory ThemeSpec.fromJson(Map<String, dynamic> json) {
    final version = (json['schemaVersion'] as num?)?.toInt() ?? 1;
    if (version > currentSchemaVersion) {
      throw ThemeSpecParseException(
        'Unsupported theme schemaVersion: $version. '
        'This client supports up to $currentSchemaVersion.',
      );
    }
    final id = json['id'];
    if (id is! String || id.isEmpty) {
      throw const ThemeSpecParseException('Theme "id" must be a non-empty string.');
    }
    final displayName = json['displayName'];
    if (displayName is! String || displayName.isEmpty) {
      throw const ThemeSpecParseException(
        'Theme "displayName" must be a non-empty string.',
      );
    }
    final colorsJson = json['colors'];
    final bordersJson = json['borders'];
    final semanticJson = json['semantic'];
    final bookJson = json['book'];
    if (colorsJson is! Map || bordersJson is! Map) {
      throw const ThemeSpecParseException(
        'Theme must contain "colors" and "borders" objects.',
      );
    }
    final fontRaw = json['fontFamily'];
    final font = (fontRaw is String && fontRaw.trim().isNotEmpty)
        ? fontRaw.trim()
        : null;
    final descRaw = json['description'];
    final description = (descRaw is String && descRaw.trim().isNotEmpty)
        ? descRaw.trim()
        : null;
    return ThemeSpec(
      id: id,
      displayName: displayName,
      description: description,
      colors: ThemeColorTokens.fromJson(colorsJson.cast<String, dynamic>()),
      borders: ThemeBorderTokens.fromJson(bordersJson.cast<String, dynamic>()),
      semantic: semanticJson is Map
          ? ThemeSemanticTokens.fromJson(semanticJson.cast<String, dynamic>())
          : ThemeSemanticTokens.defaults,
      book: bookJson is Map
          ? ThemeBookTokens.fromJson(bookJson.cast<String, dynamic>())
          : ThemeBookTokens.defaults,
      fontFamily: font,
      textGlow: _parseTextShadowList(json['textGlow']),
      navColorCycle: _parseColorList(json['navColorCycle']),
      transparentNavbarSurface: (json['transparentNavbarSurface'] as bool?) ?? false,
      isGlass: (json['isGlass'] as bool?) ?? false,
      isPixel: (json['isPixel'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'schemaVersion': currentSchemaVersion,
        'id': id,
        'displayName': displayName,
        if (description != null) 'description': description,
        if (fontFamily != null) 'fontFamily': fontFamily,
        if (textGlow.isNotEmpty)
          'textGlow': textGlow.map(_encodeTextShadow).toList(),
        if (navColorCycle.isNotEmpty)
          'navColorCycle': navColorCycle.map(_encodeColor).toList(),
        if (transparentNavbarSurface) 'transparentNavbarSurface': true,
        if (isGlass) 'isGlass': true,
        if (isPixel) 'isPixel': true,
        'colors': colors.toJson(),
        'borders': borders.toJson(),
        'semantic': semantic.toJson(),
        'book': book.toJson(),
      };
}

class ThemeSpecParseException implements Exception {
  final String message;
  const ThemeSpecParseException(this.message);
  @override
  String toString() => 'ThemeSpecParseException: $message';
}

// --- Internal parsing helpers -----------------------------------------------

Color _parseColor(Object? value, String field) {
  if (value is! String) {
    throw ThemeSpecParseException('Field "$field" must be a hex color string.');
  }
  var hex = value.trim();
  if (hex.startsWith('#')) hex = hex.substring(1);
  if (hex.length == 3) {
    hex = 'FF${hex[0]}${hex[0]}${hex[1]}${hex[1]}${hex[2]}${hex[2]}';
  } else if (hex.length == 6) {
    hex = 'FF$hex';
  }
  if (hex.length != 8) {
    throw ThemeSpecParseException(
      'Field "$field" has invalid color "$value" (expected #RGB, #RRGGBB or #AARRGGBB).',
    );
  }
  final intVal = int.tryParse(hex, radix: 16);
  if (intVal == null) {
    throw ThemeSpecParseException('Field "$field" has invalid color "$value".');
  }
  return Color(intVal);
}

String _encodeColor(Color c) {
  final a = (c.a * 255).round() & 0xFF;
  final r = (c.r * 255).round() & 0xFF;
  final g = (c.g * 255).round() & 0xFF;
  final b = (c.b * 255).round() & 0xFF;
  String h(int v) => v.toRadixString(16).padLeft(2, '0').toUpperCase();
  return '#${h(a)}${h(r)}${h(g)}${h(b)}';
}

BorderSide _parseBorderSide(Object? value, String field) {
  if (value == null) return BorderSide.none;
  if (value is! Map) {
    throw ThemeSpecParseException('Field "$field" must be an object.');
  }
  final map = value.cast<String, dynamic>();
  final colorRaw = map['color'];
  final color = colorRaw == null
      ? const Color(0x00000000)
      : _parseColor(colorRaw, '$field.color');
  final width = (map['width'] as num?)?.toDouble() ?? 1.0;
  if (width < 0 || width > 16) {
    throw ThemeSpecParseException('Field "$field.width" must be between 0 and 16.');
  }
  return BorderSide(color: color, width: width);
}

Map<String, dynamic> _encodeBorderSide(BorderSide s) => {
      'color': _encodeColor(s.color),
      'width': s.width,
    };

BorderRadius _parseBorderRadius(Object? value, String field) {
  if (value is num) {
    final r = value.toDouble();
    if (r < 0 || r > 9999) {
      throw ThemeSpecParseException('Field "$field" out of range.');
    }
    return BorderRadius.all(Radius.circular(r));
  }
  if (value is Map) {
    final map = value.cast<String, dynamic>();
    final tl = (map['topLeft'] as num?)?.toDouble() ?? 0;
    final tr = (map['topRight'] as num?)?.toDouble() ?? 0;
    final bl = (map['bottomLeft'] as num?)?.toDouble() ?? 0;
    final br = (map['bottomRight'] as num?)?.toDouble() ?? 0;
    return BorderRadius.only(
      topLeft: Radius.circular(tl),
      topRight: Radius.circular(tr),
      bottomLeft: Radius.circular(bl),
      bottomRight: Radius.circular(br),
    );
  }
  throw ThemeSpecParseException(
    'Field "$field" must be a number or an object with corner radii.',
  );
}

Object _encodeBorderRadius(BorderRadius r) {
  final tl = r.topLeft.x;
  if (tl == r.topRight.x && tl == r.bottomLeft.x && tl == r.bottomRight.x) {
    return tl;
  }
  return {
    'topLeft': r.topLeft.x,
    'topRight': r.topRight.x,
    'bottomLeft': r.bottomLeft.x,
    'bottomRight': r.bottomRight.x,
  };
}

List<BoxShadow> _parseShadowList(Object? value, String field) {
  if (value == null) return const [];
  if (value is! List) {
    throw ThemeSpecParseException('"$field" must be a list.');
  }
  if (value.length > 8) {
    throw ThemeSpecParseException('"$field" allows at most 8 shadows.');
  }
  return value.map((e) {
    if (e is! Map) {
      throw ThemeSpecParseException('Each "$field" entry must be an object.');
    }
    final map = e.cast<String, dynamic>();
    final color = _parseColor(map['color'], '$field.color');
    final blur = (map['blurRadius'] as num?)?.toDouble() ?? 0;
    final spread = (map['spreadRadius'] as num?)?.toDouble() ?? 0;
    final ox = (map['offsetX'] as num?)?.toDouble() ?? 0;
    final oy = (map['offsetY'] as num?)?.toDouble() ?? 0;
    if (blur < 0 || blur > 64 || spread < -32 || spread > 32) {
      throw ThemeSpecParseException('"$field" values out of range.');
    }
    return BoxShadow(
      color: color,
      blurRadius: blur,
      spreadRadius: spread,
      offset: Offset(ox, oy),
    );
  }).toList(growable: false);
}

Map<String, dynamic> _encodeShadow(BoxShadow s) => {
      'color': _encodeColor(s.color),
      'blurRadius': s.blurRadius,
      'spreadRadius': s.spreadRadius,
      'offsetX': s.offset.dx,
      'offsetY': s.offset.dy,
    };

List<Shadow> _parseTextShadowList(Object? value) {
  if (value == null) return const [];
  if (value is! List) {
    throw const ThemeSpecParseException('"textGlow" must be a list.');
  }
  if (value.length > 8) {
    throw const ThemeSpecParseException('"textGlow" allows at most 8 shadows.');
  }
  return value.map((e) {
    if (e is! Map) {
      throw const ThemeSpecParseException('Each "textGlow" entry must be an object.');
    }
    final map = e.cast<String, dynamic>();
    final color = _parseColor(map['color'], 'textGlow.color');
    final blur = (map['blurRadius'] as num?)?.toDouble() ?? 0;
    final ox = (map['offsetX'] as num?)?.toDouble() ?? 0;
    final oy = (map['offsetY'] as num?)?.toDouble() ?? 0;
    if (blur < 0 || blur > 64) {
      throw const ThemeSpecParseException('"textGlow.blurRadius" out of range.');
    }
    return Shadow(color: color, blurRadius: blur, offset: Offset(ox, oy));
  }).toList(growable: false);
}

Map<String, dynamic> _encodeTextShadow(Shadow s) => {
      'color': _encodeColor(s.color),
      'blurRadius': s.blurRadius,
      'offsetX': s.offset.dx,
      'offsetY': s.offset.dy,
    };

List<Color> _parseColorList(Object? value) {
  if (value == null) return const [];
  if (value is! List) {
    throw const ThemeSpecParseException('"navColorCycle" must be a list.');
  }
  if (value.length > 16) {
    throw const ThemeSpecParseException('"navColorCycle" allows at most 16 colours.');
  }
  return value.indexed.map((entry) {
    final (i, e) = entry;
    return _parseColor(e, 'navColorCycle[$i]');
  }).toList(growable: false);
}
