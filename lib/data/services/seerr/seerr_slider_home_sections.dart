import '../../../preference/home_section_config.dart';
import 'seerr_slider_catalog.dart';

/// Upserts a home section per discover slider. Existing enable/order flags
/// stay. New sliders stay off. Sliders that left the server are dropped.
/// Refreshes [HomeSectionConfig.sliderType] and
/// [HomeSectionConfig.pluginDisplayText].
///
/// Unbound discover rows (sliderType set, no live id yet) bind to the live
/// slider of that type when `/settings/discover` has one.
///
/// The Moonfin shortcuts row is pinned: merge never drops it and appends it
/// disabled when missing.
List<HomeSectionConfig> mergeSeerrSliderHomeSections(
  List<HomeSectionConfig> current,
  Iterable<(SeerrDiscoverSlider, SeerrSliderCatalog)> sliders,
) {
  final byId = <int, (SeerrDiscoverSlider, SeerrSliderCatalog)>{
    for (final pair in sliders) pair.$1.id: pair,
  };
  final byType = <int, (SeerrDiscoverSlider, SeerrSliderCatalog)>{
    for (final pair in sliders) pair.$2.type: pair,
  };
  final kept = <HomeSectionConfig>[];
  final seen = <int>{};

  for (final config in current) {
    if (!config.isSeerrSlider) {
      kept.add(config);
      continue;
    }

    final live = _liveSliderForConfig(config, byId, byType);
    if (live != null) {
      final id = live.$1.id;
      if (!seen.add(id)) continue;
      final liveId = '$id';
      final remapped = config.sliderId == liveId
          ? config
          : config.copyWith(sliderId: liveId);
      kept.add(_withSliderCatalog(remapped, live.$2));
      continue;
    }

    if (config.isSeerrShortcutsSlider) {
      if (kept.any((c) => c.isSeerrShortcutsSlider)) continue;
      kept.add(config);
      continue;
    }

    if (config.seerrSliderId == null && config.sliderType != null) {
      kept.add(config);
    }
  }

  var order = kept.fold<int>(-1, (m, c) => c.order > m ? c.order : m) + 1;
  if (!kept.any((c) => c.isSeerrShortcutsSlider)) {
    kept.add(
      HomeSectionConfig.seerrSlider(
        sliderId: seerrShortcutsSliderId,
        pluginDisplayText: 'Seerr Browse',
        enabled: false,
        order: order++,
      ),
    );
  }
  for (final (slider, catalog) in sliders) {
    if (seen.contains(slider.id)) continue;
    kept.add(
      HomeSectionConfig.seerrSlider(
        sliderId: '${slider.id}',
        sliderType: catalog.type,
        pluginDisplayText: _displayTextForCatalog(catalog),
        enabled: false,
        order: order++,
      ),
    );
  }
  return kept;
}

(SeerrDiscoverSlider, SeerrSliderCatalog)? _liveSliderForConfig(
  HomeSectionConfig config,
  Map<int, (SeerrDiscoverSlider, SeerrSliderCatalog)> byId,
  Map<int, (SeerrDiscoverSlider, SeerrSliderCatalog)> byType,
) {
  final id = config.seerrSliderId;
  if (id != null) return byId[id];
  if (config.isSeerrShortcutsSlider) return null;
  final type = config.sliderType;
  if (type == null) return null;
  return byType[type];
}

int? seerrSliderIdFromStableId(String id) {
  const prefix = 'seerrSlider:';
  if (id.startsWith(prefix)) {
    return int.tryParse(id.substring(prefix.length));
  }
  return null;
}

int? seerrSliderTypeFromStableId(String id) {
  const prefix = 'seerrSlider:type:';
  if (id.startsWith(prefix)) {
    return int.tryParse(id.substring(prefix.length));
  }
  return null;
}

HomeSectionConfig _withSliderCatalog(
  HomeSectionConfig config,
  SeerrSliderCatalog catalog,
) {
  final displayText = _displayTextForCatalog(catalog) ?? config.pluginDisplayText;
  if (config.sliderType == catalog.type &&
      config.pluginDisplayText == displayText) {
    return config;
  }
  return config.copyWith(
    sliderType: catalog.type,
    pluginDisplayText: displayText,
  );
}

String? _displayTextForCatalog(SeerrSliderCatalog catalog) {
  final title = catalog.title.trim();
  return title.isEmpty ? null : title;
}
