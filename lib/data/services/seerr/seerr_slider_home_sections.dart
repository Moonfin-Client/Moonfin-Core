import '../../../preference/home_section_config.dart';
import 'seerr_slider_catalog.dart';

/// Upserts a disabled home section per discover slider. Existing enable/order
/// flags stay. Sliders that left the server are dropped. Refreshes
/// [HomeSectionConfig.sliderType] and [HomeSectionConfig.pluginDisplayText].
List<HomeSectionConfig> mergeSeerrSliderHomeSections(
  List<HomeSectionConfig> current,
  Iterable<(SeerrDiscoverSlider, SeerrSliderCatalog)> sliders,
) {
  final byId = <int, (SeerrDiscoverSlider, SeerrSliderCatalog)>{
    for (final pair in sliders) pair.$1.id: pair,
  };
  final kept = <HomeSectionConfig>[];
  final seen = <int>{};

  for (final config in current) {
    if (!config.isSeerrSlider) {
      kept.add(config);
      continue;
    }
    final id = config.seerrSliderId;
    final pair = id == null ? null : byId[id];
    if (id == null || pair == null || !seen.add(id)) continue;
    kept.add(_withSliderCatalog(config, pair.$2));
  }

  var order = kept.fold<int>(-1, (m, c) => c.order > m ? c.order : m) + 1;
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

int? seerrSliderIdFromStableId(String id) {
  const prefix = 'seerrSlider:';
  if (id.startsWith(prefix)) {
    return int.tryParse(id.substring(prefix.length));
  }
  const legacy = 'pluginDynamic:seerr:seerr:slider:';
  if (id.startsWith(legacy)) {
    return int.tryParse(id.substring(legacy.length));
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
