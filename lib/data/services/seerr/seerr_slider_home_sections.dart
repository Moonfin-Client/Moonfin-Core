import '../../../preference/home_section_config.dart';
import 'seerr_slider_catalog.dart';

/// pluginDynamic identity for one Seerr custom Discover slider on Home.
abstract final class SeerrHomeSliderSection {
  static const serverId = 'seerr';
  static const pluginSection = 'slider';
}

/// Upserts a disabled home section per custom slider. Existing enable/order
/// flags stay. Sliders that left the server are dropped.
List<HomeSectionConfig> mergeSeerrCustomSliderHomeSections(
  List<HomeSectionConfig> current,
  Iterable<(SeerrDiscoverSlider, SeerrSliderCatalog)> sliders,
) {
  final byId = <int, (SeerrDiscoverSlider, SeerrSliderCatalog)>{
    for (final pair in sliders) pair.$1.id: pair,
  };
  final kept = <HomeSectionConfig>[];
  final seen = <int>{};

  for (final config in current) {
    if (!config.isSeerrCustomSlider) {
      kept.add(config);
      continue;
    }
    final id = int.tryParse(config.pluginAdditionalData ?? '');
    final pair = id == null ? null : byId[id];
    if (id == null || pair == null || !seen.add(id)) continue;
    final title = pair.$2.title;
    kept.add(
      config.pluginDisplayText == title
          ? config
          : config.copyWith(pluginDisplayText: title),
    );
  }

  var order = kept.fold<int>(-1, (m, c) => c.order > m ? c.order : m) + 1;
  for (final (slider, catalog) in sliders) {
    if (seen.contains(slider.id)) continue;
    kept.add(
      HomeSectionConfig.pluginDynamic(
        serverId: SeerrHomeSliderSection.serverId,
        pluginSection: SeerrHomeSliderSection.pluginSection,
        pluginAdditionalData: '${slider.id}',
        pluginDisplayText: catalog.title,
        pluginSource: HomeSectionPluginSource.seerr,
        enabled: false,
        order: order++,
      ),
    );
  }
  return kept;
}

int? seerrCustomSliderIdFromStableId(String id) {
  const prefix = 'pluginDynamic:seerr:seerr:slider:';
  if (!id.startsWith(prefix)) return null;
  return int.tryParse(id.substring(prefix.length));
}
