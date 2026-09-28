import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/app_distribution.dart';

void main() {
  test(
    'custom build blocks upstream updates; standard build retains policy',
    () {
      if (AppDistribution.isCustomBuild) {
        expect(AppDistribution.supportsInAppUpdates, isFalse);
      } else if (AppDistribution.channel == DistributionChannel.windows) {
        expect(AppDistribution.supportsInAppUpdates, isTrue);
      } else {
        expect(AppDistribution.channel, DistributionChannel.unknown);
        expect(AppDistribution.supportsInAppUpdates, isFalse);
      }
    },
  );
}
