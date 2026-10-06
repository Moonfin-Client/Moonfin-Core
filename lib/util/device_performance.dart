import '../preference/preference_constants.dart';

/// What this device can afford to spend on decoded images and inline video.
enum DevicePerformanceTier { standard, reduced }

/// Below this much total RAM the device gets the reduced tier.
///
/// `totalMem` reports what the kernel can see, which is never more than the RAM
/// soldered on, so anything at or above 1 GiB already catches every 1 GB device
/// without guessing how much firmware reserved. The headroom above that is
/// small on purpose: a 1.5 GB panel would have to lose more than a quarter of
/// its RAM to carveouts before it lands here by mistake.
const lowMemoryCeilingBytes = 1181116006;

/// Whether a memory probe positively says this device is short on RAM.
///
/// Everything that is not a clear yes reads as no. A probe that never ran, that
/// answered with the wrong types, or that overflowed to a negative leaves the
/// device where it already was, since holding back a healthy one costs its
/// owner a feature for nothing.
bool deviceMemoryLooksLow(Map<String, dynamic> memory) {
  if (memory['lowRam'] == true) return true;

  final totalMem = memory['totalMem'];
  if (totalMem is! num) return false;
  final bytes = totalMem.toInt();
  return bytes > 0 && bytes < lowMemoryCeilingBytes;
}

DevicePerformanceTier resolveDevicePerformanceTierFor(
  DevicePerformanceMode mode,
  Map<String, dynamic> memory,
) => switch (mode) {
  DevicePerformanceMode.standard => DevicePerformanceTier.standard,
  DevicePerformanceMode.reduced => DevicePerformanceTier.reduced,
  DevicePerformanceMode.auto =>
    deviceMemoryLooksLow(memory)
        ? DevicePerformanceTier.reduced
        : DevicePerformanceTier.standard,
};

/// How many decoded images to hold, in bytes. Only the byte ceiling moves,
/// since that is what actually bounds the memory.
int imageCacheBytesFor(DevicePerformanceTier tier, int standardBytes) =>
    switch (tier) {
      DevicePerformanceTier.standard => standardBytes,
      DevicePerformanceTier.reduced => 32 << 20,
    };

const _pixelsAt1080p = 1920 * 1080;

/// The GPU cache budget Skia gets on a 1080p screen. The engine allows 12
/// frames of 4 byte pixels, so a 4K UI gets four times this.
const skiaCacheBytesAt1080p = _pixelsAt1080p * 12 * 4;

/// The Skia cache budget to set for a screen of [physicalPixels], or null to
/// keep the engine's own. Only a UI drawn above 1080p is held back, since the
/// bigger budget is what lets the screensaver claim hundreds of MB of GPU
/// memory.
int? skiaCacheCapFor(double physicalPixels) =>
    physicalPixels > _pixelsAt1080p ? skiaCacheBytesAt1080p : null;

/// Whether an inline trailer may play. Off on the reduced tier even when the
/// user asked for it, because the decoder is what takes these devices down.
bool inlinePreviewAllowed({
  required bool userEnabled,
  required DevicePerformanceTier tier,
}) => userEnabled && tier != DevicePerformanceTier.reduced;
