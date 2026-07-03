import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';

class AppThemeController extends ChangeNotifier {
  ThemeSpec _activeSpec;
  VisualThemeId _activeThemeId;
  String _activeCustomId;

  AppThemeController(this._activeSpec, this._activeThemeId, this._activeCustomId) {
    ThemeRegistry.setActiveById(_activeSpec.id);
  }

  ThemeSpec get activeSpec => _activeSpec;
  VisualThemeId get activeThemeId => _activeThemeId;

  /// Empty string when no plugin-supplied theme is active.
  String get activeCustomId => _activeCustomId;

  static String builtInThemeIdFor(VisualThemeId id) {
    return switch (id) {
      VisualThemeId.moonfin => ThemeRegistry.moonfinId,
      VisualThemeId.neonPulse => ThemeRegistry.neonPulseId,
      VisualThemeId.glass => ThemeRegistry.glassId,
      VisualThemeId.eightbitHero => ThemeRegistry.eightbitHeroId,
    };
  }

  static VisualThemeId? _builtInThemeForId(String id) {
    return switch (id) {
      ThemeRegistry.moonfinId => VisualThemeId.moonfin,
      ThemeRegistry.neonPulseId => VisualThemeId.neonPulse,
      ThemeRegistry.glassId => VisualThemeId.glass,
      ThemeRegistry.eightbitHeroId => VisualThemeId.eightbitHero,
      _ => null,
    };
  }

  static AppTheme _defaultFocusColorForTheme(VisualThemeId themeId) {
    return switch (themeId) {
      VisualThemeId.moonfin => AppTheme.moonfinCyan,
      VisualThemeId.neonPulse => AppTheme.neonPulseMagenta,
      VisualThemeId.glass => AppTheme.white,
      VisualThemeId.eightbitHero => AppTheme.eightBitGold,
    };
  }

  /// Re-resolve the active spec from the current preferences. Call this after
  /// the custom theme registry has been updated (e.g. plugin sync) or when
  /// either preference changes.
  void refreshFromPreferences(UserPreferences prefs) {
    final builtIn = prefs.get(UserPreferences.visualTheme);
    final customId = prefs.get(UserPreferences.customThemeId);
    _apply(builtIn, customId);
  }

  void setByThemeId(VisualThemeId themeId) {
    _apply(themeId, _activeCustomId);
  }

  void _apply(VisualThemeId builtIn, String customId) {
    ThemeSpec resolved;
    final hasCustom =
        customId.isNotEmpty &&
        !ThemeRegistry.builtInIds.contains(customId) &&
        ThemeRegistry.availableThemes.containsKey(customId);
    if (hasCustom) {
      resolved = ThemeRegistry.resolveById(customId);
    } else {
      resolved = ThemeRegistry.resolveById(builtInThemeIdFor(builtIn));
    }

    if (resolved.id == _activeSpec.id &&
        builtIn == _activeThemeId &&
        customId == _activeCustomId) {
      return;
    }
    _activeThemeId = builtIn;
    _activeCustomId = hasCustom ? customId : '';
    _activeSpec = resolved;
    ThemeRegistry.setActiveById(_activeSpec.id);
    notifyListeners();
  }

  Future<void> applyThemeSelection(
    UserPreferences prefs,
    VisualThemeId themeId,
  ) async {
    await prefs.set(UserPreferences.visualTheme, themeId);
    await prefs.set(UserPreferences.customThemeId, '');
    await prefs.set(UserPreferences.focusColor, _defaultFocusColorForTheme(themeId));
    _apply(themeId, '');
  }

  /// Applies a theme by registry id. Built-in IDs map to [visualTheme], while
  /// non-built-in IDs are stored as [customThemeId].
  Future<void> applyThemeById(UserPreferences prefs, String themeId) async {
    final builtIn = _builtInThemeForId(themeId);
    if (builtIn != null) {
      await applyThemeSelection(prefs, builtIn);
      return;
    }
    if (!ThemeRegistry.availableThemes.containsKey(themeId)) {
      await applyThemeSelection(prefs, VisualThemeId.moonfin);
      return;
    }
    await applyCustomTheme(prefs, themeId);
  }

  /// Switch to a plugin-supplied theme by its string id. Pass an empty string
  /// to clear the custom override and fall back to [visualTheme].
  Future<void> applyCustomTheme(UserPreferences prefs, String customId) async {
    if (customId.isEmpty) {
      await prefs.set(UserPreferences.customThemeId, '');
      _apply(prefs.get(UserPreferences.visualTheme), '');
      return;
    }
    if (ThemeRegistry.builtInIds.contains(customId)) {
      final builtIn = _builtInThemeForId(customId);
      if (builtIn != null) {
        await applyThemeSelection(prefs, builtIn);
        return;
      }
    }
    if (!ThemeRegistry.availableThemes.containsKey(customId)) {
      await prefs.set(UserPreferences.customThemeId, '');
      _apply(prefs.get(UserPreferences.visualTheme), '');
      return;
    }
    await prefs.set(UserPreferences.customThemeId, customId);
    _apply(prefs.get(UserPreferences.visualTheme), customId);
  }

  static AppThemeController fromPreferences(UserPreferences prefs) {
    final prefTheme = prefs.get(UserPreferences.visualTheme);
    final customId = prefs.get(UserPreferences.customThemeId);
    final hasCustom =
      customId.isNotEmpty &&
      !ThemeRegistry.builtInIds.contains(customId) &&
      ThemeRegistry.availableThemes.containsKey(customId);
    final initial = hasCustom
        ? ThemeRegistry.resolveById(customId)
      : ThemeRegistry.resolveById(builtInThemeIdFor(prefTheme));
    return AppThemeController(initial, prefTheme, hasCustom ? customId : '');
  }
}

class AppThemeScope extends InheritedNotifier<AppThemeController> {
  const AppThemeScope({
    super.key,
    required AppThemeController controller,
    required super.child,
  }) : super(notifier: controller);

  static AppThemeController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppThemeScope>();
    assert(scope != null, 'No AppThemeScope found in context');
    return scope!.notifier!;
  }
}
