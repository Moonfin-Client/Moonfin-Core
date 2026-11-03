/// Time conversions between Silo and the Jellyfin shapes Moonfin reads.
///
/// Jellyfin and Emby count time in ticks of 100 nanoseconds
/// (`RunTimeTicks`, `PlaybackPositionTicks`, chapter `StartPositionTicks`).
/// Silo uses plain units, and not the same one everywhere:
///
/// - **seconds** for most fields (`versions[].duration`, marker
///   `start_seconds`, playback `position_seconds`)
/// - **minutes** for an item's `runtime`
/// - **milliseconds** for a few (`position_ms` in progress sync)
///
/// So each conversion names its unit, and there's no "Silo time" helper that
/// guesses.
library;

/// Ticks in one second.
const int ticksPerSecond = 10000000;

/// Ticks in one millisecond.
const int ticksPerMillisecond = 10000;

/// Seconds to ticks, rounded to the nearest tick.
int secondsToTicks(num seconds) => (seconds * ticksPerSecond).round();

/// Minutes to ticks (an item's `runtime`).
int minutesToTicks(num minutes) => secondsToTicks(minutes * 60);

/// Milliseconds to ticks.
int millisecondsToTicks(num milliseconds) =>
    (milliseconds * ticksPerMillisecond).round();

/// Ticks to seconds, keeping the fraction.
double ticksToSeconds(int ticks) => ticks / ticksPerSecond;

/// Ticks to whole milliseconds, rounded.
int ticksToMilliseconds(int ticks) => (ticks / ticksPerMillisecond).round();

/// [value] in seconds as ticks, or null when it isn't a number. For JSON
/// fields that may be missing or null.
int? secondsToTicksOrNull(Object? value) =>
    value is num ? secondsToTicks(value) : null;

/// [value] in minutes as ticks, or null when it isn't a positive number.
/// Silo sends `runtime: 0` when it doesn't know, which Jellyfin expresses by
/// leaving `RunTimeTicks` out.
int? minutesToTicksOrNull(Object? value) =>
    value is num && value > 0 ? minutesToTicks(value) : null;
