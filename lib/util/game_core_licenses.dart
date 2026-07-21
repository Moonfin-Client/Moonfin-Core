import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import 'game_cores.dart';
import 'platform_detection.dart';

/// The attribution name shown on the licenses screen for each libretro core,
/// keyed by core id. Snes9x and Genesis Plus GX are non-commercial licenses
/// that require this attribution. The rest are credited in the same place.
const Map<String, String> _coreLicenseNames = {
  'fceumm': 'fceumm (NES core)',
  'snes9x': 'Snes9x (SNES core)',
  'gambatte': 'Gambatte (Game Boy core)',
  'mgba': 'mGBA (Game Boy Advance core)',
  'genesis_plus_gx': 'Genesis Plus GX (Sega core)',
  'pcsx_rearmed': 'PCSX ReARMed (PlayStation core)',
  'mupen64plus_next': 'Mupen64Plus-Next (Nintendo 64 core)',
  'ppsspp': 'PPSSPP (PSP core)',
  'melonds': 'melonDS (Nintendo DS core)',
  'stella': 'Stella (Atari 2600 core)',
  'prosystem': 'ProSystem (Atari 7800 core)',
  'handy': 'Handy (Atari Lynx core)',
  'mednafen_pce_fast': 'Mednafen PCE Fast (PC Engine core)',
  'mednafen_wswan': 'Mednafen (WonderSwan core)',
  'mednafen_ngp': 'Mednafen (Neo Geo Pocket core)',
  'mednafen_vb': 'Mednafen (Virtual Boy core)',
};

/// Adds the emulator cores present on this device to LicenseRegistry so they
/// appear on the licenses screen: the bundled set on tvOS and macOS, the
/// downloaded set elsewhere. Cores without a bundled license file are skipped.
void registerGameCoreLicenses() {
  LicenseRegistry.addLicense(() async* {
    for (final coreId in _presentCoreIds()) {
      final name = _coreLicenseNames[coreId];
      if (name == null) continue;
      final text = await _tryLoadLicense(coreId);
      if (text == null) continue;
      yield LicenseEntryWithLineBreaks([name], text);
    }
  });
}

/// The core ids whose binaries are on this device.
Set<String> _presentCoreIds() {
  if (PlatformDetection.isAppleTV || PlatformDetection.isIOS) {
    return appleBundledCores;
  }
  // macOS ships every downloadable core inside the app bundle.
  if (bundlesGameCores) {
    return downloadableCores.map((core) => core.coreId).toSet();
  }
  if (!GetIt.instance.isRegistered<PreferenceStore>()) return const {};
  final installed = GetIt.instance<PreferenceStore>()
      .getStringList(installedCoresPreferenceKey);
  return installed?.toSet() ?? const {};
}

Future<String?> _tryLoadLicense(String coreId) async {
  try {
    return await rootBundle.loadString('assets/licenses/cores/$coreId.txt');
  } catch (_) {
    return null;
  }
}
