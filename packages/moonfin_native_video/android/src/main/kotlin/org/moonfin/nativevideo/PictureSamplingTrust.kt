package org.moonfin.nativevideo

/** How long a picture may read black before an unproven surface is given up on. */
internal const val PICTURE_TRUST_TIMEOUT_MS = 4000L

/**
 * Whether a run of black readings means the pixels can't see the video rather
 * than the picture being black.
 *
 * Plenty of devices put video on a hardware overlay, where the surface the app
 * owns is never drawn into and reads black whatever is on screen. That looks
 * exactly like a tuner's black failover placeholder, so the one thing telling
 * them apart is whether these pixels have ever shown a picture. Until they
 * have, a long enough run of black is taken as a surface that can't be read,
 * long enough to sit through a channel that opens on a few black seconds.
 */
internal fun pictureSamplingCannotSeeSurface(
    samplingProven: Boolean,
    firstBlackAtMs: Long,
    nowMs: Long,
): Boolean {
    if (samplingProven || firstBlackAtMs == 0L) {
        return false
    }
    return nowMs - firstBlackAtMs >= PICTURE_TRUST_TIMEOUT_MS
}
