package org.moonfin.nativevideo

import androidx.media3.common.Player
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.moonfin.nativevideo.Media3SlotPolicy.AttachAction
import org.moonfin.nativevideo.Media3SlotPolicy.Slot
import org.moonfin.nativevideo.Media3SlotPolicy.SourceRoute

class Media3SlotPolicyTest {

    private fun route(
        isPreview: Boolean = false,
        isAudio: Boolean = false,
        slot: Slot = Slot.NONE,
        reattachable: Boolean = true,
        playerLive: Boolean = true,
        hasLiveSource: Boolean = false,
        hasMountedMain: Boolean = false,
    ): SourceRoute = Media3SlotPolicy.routeSource(
        isPreview = isPreview,
        isAudio = isAudio,
        slot = slot,
        slotReattachable = reattachable,
        slotPlayerLive = playerLive,
        slotHasLiveSource = hasLiveSource,
        hasMountedMain = hasMountedMain,
    )

    @Test
    fun `audio goes to the host whatever holds the slot`() {
        for (slot in Slot.values()) {
            for (live in listOf(true, false)) {
                assertEquals(
                    "slot $slot live $live",
                    SourceRoute.TO_HOST,
                    route(isAudio = true, slot = slot, hasLiveSource = live, playerLive = live),
                )
            }
        }
    }

    @Test
    fun `video with the host in the slot reattaches a mounted view`() {
        assertEquals(
            SourceRoute.REATTACH_MOUNTED,
            route(slot = Slot.HOST, hasLiveSource = true, hasMountedMain = true),
        )
    }

    @Test
    fun `video with the host in the slot and no view mounted queues for the next view`() {
        assertEquals(
            SourceRoute.QUEUE,
            route(slot = Slot.HOST, hasLiveSource = false, hasMountedMain = false),
        )
    }

    @Test
    fun `video with no slot owner queues for the next view`() {
        assertEquals(SourceRoute.QUEUE, route(slot = Slot.NONE, hasMountedMain = true))
    }

    @Test
    fun `video goes to a live main view`() {
        assertEquals(SourceRoute.TO_ACTIVE, route(slot = Slot.MAIN, reattachable = true))
    }

    @Test
    fun `video never lands on a view Flutter disposed`() {
        assertEquals(
            SourceRoute.QUEUE,
            route(slot = Slot.MAIN, reattachable = false, playerLive = false),
        )
    }

    @Test
    fun `video while a trailer owns the slot queues for the player view`() {
        assertEquals(SourceRoute.QUEUE, route(slot = Slot.PREVIEW))
    }

    @Test
    fun `a trailer never interrupts a live main player`() {
        assertEquals(SourceRoute.DROP, route(isPreview = true, slot = Slot.MAIN, playerLive = true))
    }

    @Test
    fun `a trailer can load into a main view that's no longer live`() {
        assertEquals(
            SourceRoute.TO_ACTIVE,
            route(isPreview = true, slot = Slot.MAIN, playerLive = false),
        )
    }

    @Test
    fun `a trailer never interrupts music`() {
        assertEquals(
            SourceRoute.DROP,
            route(isPreview = true, slot = Slot.HOST, hasLiveSource = true),
        )
    }

    @Test
    fun `a trailer queues for its own view when the host is idle`() {
        assertEquals(
            SourceRoute.QUEUE,
            route(isPreview = true, slot = Slot.HOST, hasLiveSource = false),
        )
    }

    @Test
    fun `a trailer replaces another trailer`() {
        assertEquals(SourceRoute.TO_ACTIVE, route(isPreview = true, slot = Slot.PREVIEW))
    }

    @Test
    fun `an audio trailer is still a trailer`() {
        assertEquals(
            SourceRoute.DROP,
            route(isPreview = true, isAudio = true, slot = Slot.MAIN, playerLive = true),
        )
    }

    private fun attach(
        incomingIsPreview: Boolean = false,
        slot: Slot,
        playerLive: Boolean = true,
        hasLiveSource: Boolean = false,
    ): AttachAction = Media3SlotPolicy.attach(
        incomingIsPreview = incomingIsPreview,
        slot = slot,
        slotPlayerLive = playerLive,
        slotHasLiveSource = hasLiveSource,
    )

    @Test
    fun `a main view declines while music plays and takes an idle host's slot`() {
        assertEquals(AttachAction.DECLINE, attach(slot = Slot.HOST, hasLiveSource = true))
        assertEquals(AttachAction.TAKE, attach(slot = Slot.HOST, hasLiveSource = false))
    }

    @Test
    fun `a preview declines while music plays and takes an idle host's slot`() {
        assertEquals(
            AttachAction.DECLINE,
            attach(incomingIsPreview = true, slot = Slot.HOST, hasLiveSource = true),
        )
        assertEquals(
            AttachAction.TAKE,
            attach(incomingIsPreview = true, slot = Slot.HOST, hasLiveSource = false),
        )
    }

    @Test
    fun `a main view carries a live source across a main view swap`() {
        assertEquals(AttachAction.TAKE_CARRY, attach(slot = Slot.MAIN, hasLiveSource = true))
        assertEquals(AttachAction.TAKE, attach(slot = Slot.MAIN, hasLiveSource = false))
    }

    @Test
    fun `a preview never takes the slot from a live main view`() {
        assertEquals(
            AttachAction.DECLINE,
            attach(incomingIsPreview = true, slot = Slot.MAIN, playerLive = true),
        )
        assertEquals(
            AttachAction.TAKE,
            attach(incomingIsPreview = true, slot = Slot.MAIN, playerLive = false),
        )
    }

    @Test
    fun `an empty or trailer slot is always taken`() {
        for (preview in listOf(true, false)) {
            assertEquals(AttachAction.TAKE, attach(incomingIsPreview = preview, slot = Slot.NONE))
            assertEquals(AttachAction.TAKE, attach(incomingIsPreview = preview, slot = Slot.PREVIEW))
        }
    }

    @Test
    fun `the host ticks only while playing or about to`() {
        assertTrue(Media3SlotPolicy.shouldTick(true, Player.STATE_READY))
        assertTrue(Media3SlotPolicy.shouldTick(true, Player.STATE_BUFFERING))
        assertFalse(Media3SlotPolicy.shouldTick(false, Player.STATE_READY))
        assertFalse(Media3SlotPolicy.shouldTick(false, Player.STATE_BUFFERING))
        assertFalse(Media3SlotPolicy.shouldTick(true, Player.STATE_IDLE))
        assertFalse(Media3SlotPolicy.shouldTick(true, Player.STATE_ENDED))
    }
}
