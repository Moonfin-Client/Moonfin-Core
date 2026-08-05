import 'package:moonfin_design/moonfin_design.dart';

import '../../preference/preference_constants.dart';

/// Bridges the persisted [OledMode] enum to the design package's tuning
/// constants. Kept app-side because the design package must not depend on the
/// preference layer.
extension OledModeTuning on OledMode {
  OledTuning get tuning => switch (this) {
        OledMode.off => OledTuning.off,
        OledMode.subtle => OledTuning.subtle,
        OledMode.vivid => OledTuning.vivid,
      };
}
