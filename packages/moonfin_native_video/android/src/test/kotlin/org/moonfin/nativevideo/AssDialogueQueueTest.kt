package org.moonfin.nativevideo

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Test

class AssDialogueQueueTest {

    private val queue = AssDialogueQueue()

    private fun drained(): List<Pair<String?, String>> {
        val lines = mutableListOf<Pair<String?, String>>()
        queue.drain { trackId, _, _, data -> lines.add(trackId to data.decodeToString()) }
        return lines
    }

    @Test
    fun drainsLinesInArrivalOrderWithTheirTiming() {
        var timing: Pair<Long, Long>? = null
        queue.add(queue.epoch, "3", 1_000, 2_500, "xxDialogue".encodeToByteArray(), offset = 2, length = 8)
        queue.drain { _, start, duration, data ->
            timing = start to duration
            assertArrayEquals("Dialogue".encodeToByteArray(), data)
        }
        assertEquals(1_000L to 2_500L, timing)

        queue.add(queue.epoch, "3", 0, 0, "a".encodeToByteArray(), 0, 1)
        queue.add(queue.epoch, "4", 0, 0, "b".encodeToByteArray(), 0, 1)
        assertEquals(listOf<Pair<String?, String>>("3" to "a", "4" to "b"), drained())
        assertEquals(emptyList<Pair<String?, String>>(), drained())
    }

    @Test
    fun copiesTheLineSinceTheExtractorReusesItsBuffer() {
        val buffer = "first".encodeToByteArray()
        queue.add(queue.epoch, "3", 0, 0, buffer, 0, buffer.size)
        "later".encodeToByteArray().copyInto(buffer)
        assertEquals(listOf<Pair<String?, String>>("3" to "first"), drained())
    }

    @Test
    fun clearDropsQueuedLinesAndLateLinesFromTheOutgoingItem() {
        val outgoing = queue.epoch
        queue.add(outgoing, "3", 0, 0, "queued".encodeToByteArray(), 0, 6)
        queue.clear()
        // The outgoing item's loader can still extract a line after the transition.
        queue.add(outgoing, "3", 0, 0, "late".encodeToByteArray(), 0, 4)
        queue.add(queue.epoch, "3", 0, 0, "next".encodeToByteArray(), 0, 4)
        assertEquals(listOf<Pair<String?, String>>("3" to "next"), drained())
    }
}
