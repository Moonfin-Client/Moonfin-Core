import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:server_core/server_core.dart';

void main() {
  RecommendationSystemSource source(
    RecommendationSystemSource setting, {
    ServerType serverType = ServerType.silo,
    bool kidsMode = false,
  }) => similarItemsSource(
    setting: setting,
    kidsMode: kidsMode,
    serverType: serverType,
  );

  group('similarItemsSource', () {
    test('Moonfin Recommends (the default) asks Silo\'s engine on Silo', () {
      expect(
        source(RecommendationSystemSource.local),
        RecommendationSystemSource.server,
      );
    });

    test('Jellyfin and Emby keep the setting', () {
      for (final type in [ServerType.jellyfin, ServerType.emby]) {
        for (final setting in RecommendationSystemSource.values) {
          expect(source(setting, serverType: type), setting);
        }
      }
    });

    test('TMDb Similarity stays TMDb on Silo', () {
      expect(
        source(RecommendationSystemSource.online),
        RecommendationSystemSource.online,
      );
    });

    test('kids mode keeps the local algorithm everywhere', () {
      for (final type in ServerType.values) {
        expect(
          source(
            RecommendationSystemSource.server,
            serverType: type,
            kidsMode: true,
          ),
          RecommendationSystemSource.local,
        );
      }
    });
  });
}
