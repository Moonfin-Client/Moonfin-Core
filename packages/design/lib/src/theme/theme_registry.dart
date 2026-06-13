import 'theme_spec.dart';
import 'themes/glass_theme_spec.dart';
import 'themes/moonfin_theme_spec.dart';
import 'themes/neon_pulse_theme_spec.dart';

class ThemeRegistry {
  const ThemeRegistry._();

  static const String moonfinId = 'moonfin';
  static const String neonPulseId = 'neon_pulse';
  static const String glassId = 'glass';

  /// IDs that are bundled with the app and cannot be removed.
  static const Set<String> builtInIds = {moonfinId, neonPulseId, glassId};

  static const Map<String, ThemeSpec> _builtIns = {
    moonfinId: moonfinThemeSpec,
    neonPulseId: neonPulseThemeSpec,
    glassId: glassThemeSpec,
  };

  static final Map<String, ThemeSpec> _custom = {};

  /// All themes (built-in + plugin-supplied) keyed by id.
  static Map<String, ThemeSpec> get availableThemes => {
        ..._builtIns,
        ..._custom,
      };

  static ThemeSpec _active = moonfinThemeSpec;
  static ThemeSpec get active => _active;

  static void setActiveById(String id) {
    _active = availableThemes[id] ?? moonfinThemeSpec;
  }

  static ThemeSpec resolveById(String id) {
    return availableThemes[id] ?? moonfinThemeSpec;
  }

  /// Register or replace a plugin-supplied theme. Built-in IDs are reserved
  /// and will be rejected to prevent shadowing.
  static void registerCustom(ThemeSpec spec) {
    if (builtInIds.contains(spec.id)) {
      throw ArgumentError(
        'Cannot register custom theme with reserved id "${spec.id}".',
      );
    }
    _custom[spec.id] = spec;
  }

  /// Replace the entire set of custom themes (e.g. after fetching from the
  /// admin plugin). Built-ins are untouched.
  static void replaceCustomThemes(Iterable<ThemeSpec> specs) {
    _custom
      ..clear()
      ..addEntries(specs
          .where((s) => !builtInIds.contains(s.id))
          .map((s) => MapEntry(s.id, s)));
  }

  static void removeCustom(String id) {
    _custom.remove(id);
  }

  static List<ThemeSpec> get customThemes => List.unmodifiable(_custom.values);
}
