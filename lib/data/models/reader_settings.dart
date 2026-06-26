import 'dart:convert';

import 'package:flutter/material.dart';

enum ReaderPageTheme { original, paper, quiet, calm, night }

enum ReaderFontFamily { system, serif, sans, mono }

enum ReaderLineSpacing { tight, normal, relaxed }

enum ReaderMargin { narrow, normal, wide }

@immutable
class ReaderThemeColors {
  final Color background;
  final Color foreground;
  final Color link;
  final bool isDark;

  const ReaderThemeColors({
    required this.background,
    required this.foreground,
    required this.link,
    required this.isDark,
  });

  String get backgroundCss => _hex(background);
  String get foregroundCss => _hex(foreground);
  String get linkCss => _hex(link);

  static String _hex(Color c) =>
      '#${(c.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';
}

@immutable
class ReaderSettings {
  final ReaderPageTheme pageTheme;
  final ReaderFontFamily fontFamily;

  final double fontScale;
  final ReaderLineSpacing lineSpacing;
  final ReaderMargin margin;
  final bool justify;
  final bool bold;

  final double brightness;

  final double warmth;

  const ReaderSettings({
    this.pageTheme = ReaderPageTheme.original,
    this.fontFamily = ReaderFontFamily.serif,
    this.fontScale = 1.0,
    this.lineSpacing = ReaderLineSpacing.normal,
    this.margin = ReaderMargin.normal,
    this.justify = false,
    this.bold = false,
    this.brightness = 1.0,
    this.warmth = 0.0,
  });

  static const ReaderSettings defaults = ReaderSettings();

  static const double minFontScale = 0.8;
  static const double maxFontScale = 1.8;
  static const double _baseFontSizePx = 18.0;

  ReaderSettings copyWith({
    ReaderPageTheme? pageTheme,
    ReaderFontFamily? fontFamily,
    double? fontScale,
    ReaderLineSpacing? lineSpacing,
    ReaderMargin? margin,
    bool? justify,
    bool? bold,
    double? brightness,
    double? warmth,
  }) {
    return ReaderSettings(
      pageTheme: pageTheme ?? this.pageTheme,
      fontFamily: fontFamily ?? this.fontFamily,
      fontScale: (fontScale ?? this.fontScale)
          .clamp(minFontScale, maxFontScale)
          .toDouble(),
      lineSpacing: lineSpacing ?? this.lineSpacing,
      margin: margin ?? this.margin,
      justify: justify ?? this.justify,
      bold: bold ?? this.bold,
      brightness: (brightness ?? this.brightness).clamp(0.3, 1.0).toDouble(),
      warmth: (warmth ?? this.warmth).clamp(0.0, 1.0).toDouble(),
    );
  }

  int get fontSizePx => (_baseFontSizePx * fontScale).round();

  double get lineHeight => switch (lineSpacing) {
    ReaderLineSpacing.tight => 1.4,
    ReaderLineSpacing.normal => 1.65,
    ReaderLineSpacing.relaxed => 1.95,
  };

  int get marginPx => switch (margin) {
    ReaderMargin.narrow => 12,
    ReaderMargin.normal => 22,
    ReaderMargin.wide => 40,
  };

  int get maxWidthPx => switch (margin) {
    ReaderMargin.narrow => 920,
    ReaderMargin.normal => 760,
    ReaderMargin.wide => 620,
  };

  String get fontFamilyCss => switch (fontFamily) {
    ReaderFontFamily.system =>
      "-apple-system, system-ui, 'Segoe UI', Roboto, sans-serif",
    ReaderFontFamily.serif => "Georgia, 'Times New Roman', serif",
    ReaderFontFamily.sans => "system-ui, 'Helvetica Neue', Arial, sans-serif",
    ReaderFontFamily.mono => "'SF Mono', Menlo, Consolas, monospace",
  };

  ReaderThemeColors resolveColors(Brightness platformBrightness) {
    switch (pageTheme) {
      case ReaderPageTheme.original:
        return platformBrightness == Brightness.dark
            ? const ReaderThemeColors(
                background: Color(0xFF121212),
                foreground: Color(0xFFE7E7E7),
                link: Color(0xFF8AB4F8),
                isDark: true,
              )
            : const ReaderThemeColors(
                background: Color(0xFFFAFAFA),
                foreground: Color(0xFF222222),
                link: Color(0xFF1B4F9C),
                isDark: false,
              );
      case ReaderPageTheme.paper:
        return const ReaderThemeColors(
          background: Color(0xFFF4ECD8),
          foreground: Color(0xFF3E3023),
          link: Color(0xFF6B4E2A),
          isDark: false,
        );
      case ReaderPageTheme.quiet:
        return const ReaderThemeColors(
          background: Color(0xFFE8E4DA),
          foreground: Color(0xFF413E37),
          link: Color(0xFF5A4B33),
          isDark: false,
        );
      case ReaderPageTheme.calm:
        return const ReaderThemeColors(
          background: Color(0xFF2A2C2E),
          foreground: Color(0xFFCBCED1),
          link: Color(0xFF8AB4F8),
          isDark: true,
        );
      case ReaderPageTheme.night:
        return const ReaderThemeColors(
          background: Color(0xFF000000),
          foreground: Color(0xFFB8B8B8),
          link: Color(0xFF6FA8FF),
          isDark: true,
        );
    }
  }

  Map<String, dynamic> toJson() => {
    'pageTheme': pageTheme.name,
    'fontFamily': fontFamily.name,
    'fontScale': fontScale,
    'lineSpacing': lineSpacing.name,
    'margin': margin.name,
    'justify': justify,
    'bold': bold,
    'brightness': brightness,
    'warmth': warmth,
  };

  String encode() => jsonEncode(toJson());

  factory ReaderSettings.fromJson(Map<String, dynamic> json) {
    T parseEnum<T>(List<T> values, Object? raw, T fallback) {
      final name = raw?.toString();
      for (final v in values) {
        if ((v as Enum).name == name) return v;
      }
      return fallback;
    }

    double parseDouble(Object? raw, double fallback) {
      if (raw is num) return raw.toDouble();
      return double.tryParse(raw?.toString() ?? '') ?? fallback;
    }

    return ReaderSettings(
      pageTheme: parseEnum(
        ReaderPageTheme.values,
        json['pageTheme'],
        ReaderPageTheme.original,
      ),
      fontFamily: parseEnum(
        ReaderFontFamily.values,
        json['fontFamily'],
        ReaderFontFamily.serif,
      ),
      fontScale: parseDouble(json['fontScale'], 1.0),
      lineSpacing: parseEnum(
        ReaderLineSpacing.values,
        json['lineSpacing'],
        ReaderLineSpacing.normal,
      ),
      margin: parseEnum(
        ReaderMargin.values,
        json['margin'],
        ReaderMargin.normal,
      ),
      justify: json['justify'] == true,
      bold: json['bold'] == true,
      brightness: parseDouble(json['brightness'], 1.0),
      warmth: parseDouble(json['warmth'], 0.0),
    );
  }

  factory ReaderSettings.decode(String source) {
    try {
      final decoded = jsonDecode(source);
      if (decoded is Map<String, dynamic>) {
        return ReaderSettings.fromJson(decoded);
      }
    } catch (_) {}
    return defaults;
  }

  @override
  bool operator ==(Object other) =>
      other is ReaderSettings &&
      other.pageTheme == pageTheme &&
      other.fontFamily == fontFamily &&
      other.fontScale == fontScale &&
      other.lineSpacing == lineSpacing &&
      other.margin == margin &&
      other.justify == justify &&
      other.bold == bold &&
      other.brightness == brightness &&
      other.warmth == warmth;

  @override
  int get hashCode => Object.hash(
    pageTheme,
    fontFamily,
    fontScale,
    lineSpacing,
    margin,
    justify,
    bold,
    brightness,
    warmth,
  );

  String get epubStyleKey =>
      '${pageTheme.name}|${fontFamily.name}|$fontSizePx|${lineSpacing.name}|'
      '${margin.name}|$justify|$bold';
}
