package org.moonfin.nativevideo

import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import kotlin.concurrent.thread
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class SourceCodecGateTest {

    @Test
    fun `gate starts open`() {
        val gate = SourceCodecGate()

        assertFalse(gate.isBlocked)
        assertFalse(gate.open(sourceToken = 0))
    }

    @Test
    fun `matching source opens its blocked gate once`() {
        val gate = SourceCodecGate()
        gate.block(sourceToken = 12)

        assertTrue(gate.isBlocked)
        assertTrue(gate.open(sourceToken = 12))
        assertFalse(gate.isBlocked)
        assertFalse(gate.open(sourceToken = 12))
    }

    @Test
    fun `replacement source remains blocked when an old release arrives`() {
        val gate = SourceCodecGate()
        gate.block(sourceToken = 20)
        gate.block(sourceToken = 21)

        assertFalse(gate.open(sourceToken = 20))
        assertTrue(gate.isBlocked)
        assertTrue(gate.open(sourceToken = 21))
        assertFalse(gate.isBlocked)
    }

    @Test
    fun `old release cannot undo a newly closed gate`() {
        val gate = SourceCodecGate()
        gate.block(sourceToken = 30)
        assertTrue(gate.open(sourceToken = 30))

        gate.block(sourceToken = 31)

        assertFalse(gate.open(sourceToken = 30))
        assertTrue(gate.isBlocked)
    }

    @Test
    fun `future source token cannot open current gate`() {
        val gate = SourceCodecGate()
        gate.block(sourceToken = 40)

        assertFalse(gate.open(sourceToken = 41))
        assertTrue(gate.isBlocked)
        assertTrue(gate.open(sourceToken = 40))
    }

    @Test
    fun `only one concurrent release wins for a source`() {
        val gate = SourceCodecGate()
        gate.block(sourceToken = 50)
        val ready = CountDownLatch(2)
        val start = CountDownLatch(1)
        val results = arrayOfNulls<Boolean>(2)
        val workers = (0..1).map { index ->
            thread(start = true) {
                ready.countDown()
                if (start.await(5, TimeUnit.SECONDS)) {
                    results[index] = gate.open(sourceToken = 50)
                }
            }
        }

        val allReady = ready.await(5, TimeUnit.SECONDS)
        start.countDown()
        assertTrue(allReady)
        workers.forEach { it.join(5_000) }

        assertTrue(workers.all { !it.isAlive })
        assertEquals(1, results.count { it == true })
        assertFalse(gate.isBlocked)
    }
}
