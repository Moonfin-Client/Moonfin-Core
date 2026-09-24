package org.moonfin.nativevideo

import androidx.media3.common.Player

/**
 * Decides who holds Media3Bridge's single player slot and where each source
 * goes.
 *
 * Video needs a Flutter platform view for its surface. Audio doesn't, and
 * playback started from Android Auto or the lock screen often has no view to
 * give it, since a car can boot the engine with no FlutterView and a
 * backgrounded app draws no frames. So audio always plays on a headless host
 * the bridge owns, and video keeps using the platform views.
 *
 * Pure so a JVM test can drive every case.
 */
object Media3SlotPolicy {
    /** What currently holds the slot. */
    enum class Slot { NONE, HOST, MAIN, PREVIEW }

    /** Where a setSource call goes. */
    enum class SourceRoute {
        /** The view holding the slot. */
        TO_ACTIVE,

        /** The headless audio host, created if needed. */
        TO_HOST,

        /** Drop the host and hand the slot back to a still-mounted main view. */
        REATTACH_MOUNTED,

        /** Drop the slot and queue for the view that mounts next. */
        QUEUE,

        /** Ignore the source and report success. */
        DROP,
    }

    /** What a platform view that just attached does with the slot. */
    enum class AttachAction { TAKE, TAKE_CARRY, DECLINE }

    /**
     * @param slotReattachable the slot's view hasn't been disposed by Flutter
     * @param slotPlayerLive the slot's player exists and its view is mounted
     * @param slotHasLiveSource the slot's player has something loaded
     * @param hasMountedMain a mounted main view other than the host exists
     */
    fun routeSource(
        isPreview: Boolean,
        isAudio: Boolean,
        slot: Slot,
        slotReattachable: Boolean,
        slotPlayerLive: Boolean,
        slotHasLiveSource: Boolean,
        hasMountedMain: Boolean,
    ): SourceRoute {
        if (!isPreview && isAudio) return SourceRoute.TO_HOST

        if (isPreview) {
            return when (slot) {
                // A trailer never interrupts real playback, music included.
                Slot.MAIN -> if (slotPlayerLive) SourceRoute.DROP else SourceRoute.TO_ACTIVE
                Slot.HOST -> if (slotHasLiveSource) SourceRoute.DROP else SourceRoute.QUEUE
                Slot.PREVIEW -> SourceRoute.TO_ACTIVE
                Slot.NONE -> SourceRoute.QUEUE
            }
        }

        return when (slot) {
            // Real playback starting while a trailer owns the slot.
            Slot.PREVIEW -> SourceRoute.QUEUE
            // A view Flutter disposed has no surface left to render into.
            Slot.MAIN -> if (slotReattachable) SourceRoute.TO_ACTIVE else SourceRoute.QUEUE
            // The host displaced a player view that's still mounted, so no new
            // view is coming to take a queued source.
            Slot.HOST -> if (hasMountedMain) SourceRoute.REATTACH_MOUNTED else SourceRoute.QUEUE
            Slot.NONE -> SourceRoute.QUEUE
        }
    }

    /**
     * @param incomingIsPreview the attaching view is an inline trailer
     * @param slotPlayerLive the slot's player exists and its view is mounted
     * @param slotHasLiveSource the slot's player has something loaded
     */
    fun attach(
        incomingIsPreview: Boolean,
        slot: Slot,
        slotPlayerLive: Boolean,
        slotHasLiveSource: Boolean,
    ): AttachAction = when (slot) {
        Slot.NONE, Slot.PREVIEW -> AttachAction.TAKE
        // Music keeps the slot while it has something loaded. A video view that
        // mounted early gets it when its own source arrives. The host's source
        // is never carried into a view.
        Slot.HOST -> if (slotHasLiveSource) AttachAction.DECLINE else AttachAction.TAKE
        Slot.MAIN -> when {
            incomingIsPreview && slotPlayerLive -> AttachAction.DECLINE
            slotHasLiveSource -> AttachAction.TAKE_CARRY
            else -> AttachAction.TAKE
        }
    }

    /**
     * Whether the host's state ticker runs. Only while it's playing or about
     * to, since a paused car session can sit for hours with the media service
     * keeping the process alive, and the player's listener already reports
     * every state change.
     */
    fun shouldTick(playWhenReady: Boolean, playbackState: Int): Boolean =
        playWhenReady &&
            (playbackState == Player.STATE_BUFFERING || playbackState == Player.STATE_READY)
}
