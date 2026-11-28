package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class DoviRpuGuardTest {

    private fun crcValid(nal: ByteArray) = DoviRpuGuard.verifiedUnescaped(nal, 0, nal.size) != null

    private fun assertAccepted(nal: ByteArray, note: String = "") {
        assertTrue("CRC should verify $note", crcValid(nal))
        assertTrue("should be safe $note", DoviRpuGuard.isSafe(nal, 0, nal.size))
    }

    private fun assertRejected(nal: ByteArray, note: String = "") {
        assertTrue("CRC should verify $note", crcValid(nal))
        assertFalse("should be refused $note", DoviRpuGuard.isSafe(nal, 0, nal.size))
    }

    @Test
    fun realFelRpuIsAccepted() {
        assertAccepted(hex(FEL_RPU_HEX))
    }

    @Test
    fun rpuInsideALargerBufferIsReadAtItsOffset() {
        val nal = hex(FEL_RPU_HEX)
        val buffer = ByteArray(nal.size + 10) { 0x55 }
        System.arraycopy(nal, 0, buffer, 5, nal.size)
        assertTrue(DoviRpuGuard.isSafe(buffer, 5, nal.size))
    }

    @Test
    fun craftedBaselineIsAccepted() {
        assertAccepted(craftOnePiece())
    }

    @Test
    fun badCrcIsRefusedBeforeTheScan() {
        val good = craftOnePiece()
        for ((crcByte, payloadByte) in listOf(0 to null, 3 to null, null to 0, null to 10)) {
            val bad = withBadCrc(good, crcByte, payloadByte)
            assertNull(DoviRpuGuard.verifiedUnescaped(bad, 0, bad.size))
            assertFalse(DoviRpuGuard.isSafe(bad, 0, bad.size))
        }
    }

    @Test
    fun truncatedOrMislabeledInputIsRefused() {
        val good = craftOnePiece()
        assertFalse(DoviRpuGuard.isSafe(good, 0, 7))
        val noFinalByte = good.copyOf()
        val last = noFinalByte.indexOfLast { it != 0.toByte() }
        noFinalByte[last] = 0x81.toByte()
        assertFalse(DoviRpuGuard.isSafe(noFinalByte, 0, noFinalByte.size))
    }

    @Test
    fun mmrPiecesAreWalkedPast() {
        for (c in 0 until 3) assertAccepted(craftOnePiece(mmrOn = c), "MMR on component $c")
    }

    @Test
    fun linearInterpolationOnAnyComponentIsRefused() {
        for (c in 0 until 3) assertRejected(craftOnePiece(linearOn = c), "linear on component $c")
        assertRejected(craftOnePiece(linearOn = 2, mmrOn = 0), "linear after an MMR piece")
    }

    @Test
    fun curveMixingPolynomialAndMmrIsRefused() {
        for (residual in listOf(Residual.NONE, Residual.FEL)) {
            for (c in 0 until 3) {
                val pieces = (0 until 3).map {
                    if (it == c) listOf(Piece.POLYNOMIAL, Piece.MMR) else listOf(Piece.POLYNOMIAL)
                }
                assertRejected(craft(pieces, residual), "component $c, residual $residual")
            }
        }
    }

    @Test
    fun profile7NlqIsWalkedToTheEnd() {
        for (residual in listOf(Residual.MEL, Residual.FEL)) {
            assertAccepted(
                craft(listOf(listOf(Piece.POLYNOMIAL), listOf(Piece.MMR), listOf(Piece.MMR)), residual),
                "residual $residual",
            )
            assertAccepted(
                craft(listOf(listOf(Piece.POLYNOMIAL, Piece.POLYNOMIAL), listOf(Piece.MMR), listOf(Piece.MMR)), residual),
                "two luma pieces, residual $residual",
            )
        }
    }

    @Test
    fun pivotCountTooBigForThePayloadIsRefused() {
        for (count in listOf(1L shl 31, (1L shl 32) - 2)) {
            assertRejected(
                craft(List(3) { listOf(Piece.POLYNOMIAL) }, pivotCount = count),
                "pivot count $count",
            )
        }
    }

    @Test
    fun expGolombWithThirtyTwoOrMoreLeadingZerosIsRefused() {
        for (zeros in listOf(32, 33, 48)) {
            assertRejected(
                craft(List(3) { listOf(Piece.POLYNOMIAL) }, vdrRpuId = { it.ueRaw(zeros, 0) }),
                "$zeros leading zeros",
            )
        }
    }

    @Test
    fun level8LengthsOnlyTheDefinedOnesPass() {
        for (length in listOf(10L, 12L, 13L, 19L, 25L)) {
            assertAccepted(craftUsePrev(Block(length, 8)), "length $length")
        }
        for (length in listOf(0L, 11L, 14L, 20L, 24L, 26L)) {
            assertRejected(craftUsePrev(Block(length, 8)), "length $length")
        }
    }

    @Test
    fun level9And10LengthsOnlyTheDefinedOnesPass() {
        for ((length, level) in listOf(1L to 9L, 17L to 9L, 5L to 10L, 21L to 10L)) {
            assertAccepted(craftUsePrev(Block(length, level)), "level $level length $length")
        }
        for ((length, level) in listOf(0L to 9L, 2L to 9L, 16L to 9L, 18L to 9L, 0L to 10L, 4L to 10L, 6L to 10L, 20L to 10L)) {
            assertRejected(craftUsePrev(Block(length, level)), "level $level length $length")
        }
    }

    @Test
    fun uncompressedDmPayloadIsSkippedByItsFixedBits() {
        assertAccepted(craftUsePrev(Block(10, 8), compressed = false))
        assertRejected(craftUsePrev(Block(11, 8), compressed = false))
    }

    @Test
    fun cmv29BlocksAreWalkedToTheCmv40List() {
        assertAccepted(craftUsePrev(Block(10, 8), cmv29Block = Block(5, 1)))
        assertRejected(craftUsePrev(Block(11, 8), cmv29Block = Block(5, 1)))
        assertRejected(craftUsePrev(Block(11, 8), cmv29Block = Block(5, 1), compressed = false))
    }

    @Test
    fun oversizedDmBlockCountIsRefused() {
        assertRejected(craftUsePrev(cmv40Block = null, cmv29Count = 1L shl 30))
    }

    @Test
    fun verifiedUnescapedDropsEmulationPrevention() {
        val nal = hex(FEL_RPU_HEX)
        val unescaped = DoviRpuGuard.verifiedUnescaped(nal, 0, nal.size)
        assertNotNull(unescaped)
        assertEquals(0x19.toByte(), unescaped!![2])
        assertEquals(0x80.toByte(), unescaped.last())
        assertTrue(unescaped.size < nal.size)
    }
}
