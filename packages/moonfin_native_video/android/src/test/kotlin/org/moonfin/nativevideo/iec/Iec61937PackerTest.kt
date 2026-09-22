package org.moonfin.nativevideo.iec

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Byte-exact checks against golden vectors produced by FFmpeg's spdif muxer,
 * the reference implementation of this framing. Regenerate with
 * `ffmpeg -f <codec> -i in.bin -c copy -f spdif out.spdif`, adding
 * `-strict -2` to encode dts/truehd inputs and `-dtshd_rate 768000` for the
 * dtshd vector (the rate that matches the 8-channel 192 kHz carrier).
 */
class Iec61937PackerTest {

    @Test fun ac3_48k_matchesGolden() {
        val elementary = resource("ac3.bin")
        val packer = Iec61937Packer.create(IecCodec.AC3, 48000)!!
        packer.writeAccessUnits(elementary, 0, elementary.size)
        // AC3 emits one 6144-byte burst per frame with no accumulation.
        assertBurstStreamMatches(resource("ac3.spdif"), packer.packedSnapshot(), maxTailBytes = 0)
    }

    @Test fun ac3_44k_usesRateAdjustedFrameSize() {
        val elementary = resource("ac3_44k.bin")
        val packer = Iec61937Packer.create(IecCodec.AC3, 44100)!!
        packer.writeAccessUnits(elementary, 0, elementary.size)
        assertBurstStreamMatches(resource("ac3_44k.spdif"), packer.packedSnapshot(), maxTailBytes = 0)
    }

    @Test fun eac3_accumulatesUntilBurstFull() {
        val elementary = resource("eac3.bin")
        val packer = Iec61937Packer.create(IecCodec.EAC3, 48000)!!
        packer.writeAccessUnits(elementary, 0, elementary.size)
        // A trailing partial group is held until endOfStream, like the muxer.
        assertBurstStreamMatches(resource("eac3.spdif"), packer.packedSnapshot(), maxTailBytes = 24576)
    }

    @Test fun dts_core_matchesGolden() {
        val elementary = resource("dts.bin")
        val packer = Iec61937Packer.create(IecCodec.DTS, 48000)!!
        packer.writeAccessUnits(elementary, 0, elementary.size)
        assertBurstStreamMatches(resource("dts.spdif"), packer.packedSnapshot(), maxTailBytes = 8192)
    }

    @Test fun dtsHd_typeIvEnvelope_matchesGolden() {
        val elementary = resource("dts.bin")
        val packer = Iec61937Packer.create(IecCodec.DTS_HD, 48000)!!
        packer.writeAccessUnits(elementary, 0, elementary.size)
        // Core-only input inside the HD envelope, which still exercises the
        // type IV framing byte for byte.
        assertBurstStreamMatches(resource("dtshd.spdif"), packer.packedSnapshot(), maxTailBytes = 32768)
    }

    @Test fun truehd_matFraming_matchesGolden() {
        val elementary = resource("truehd.bin")
        val packer = Iec61937Packer.create(IecCodec.TRUEHD, 48000)!!
        packer.writeAccessUnits(elementary, 0, elementary.size)
        // A partial MAT frame is held until it fills, so tolerate one period.
        assertBurstStreamMatches(resource("truehd.spdif"), packer.packedSnapshot(), maxTailBytes = 61440)
    }

    @Test fun feedingAccessUnitsSeparatelyMatchesOneShot_ac3() {
        val elementary = resource("ac3.bin")
        val oneShot = Iec61937Packer.create(IecCodec.AC3, 48000)!!
        oneShot.writeAccessUnits(elementary, 0, elementary.size)

        val perAu = Iec61937Packer.create(IecCodec.AC3, 48000)!!
        var pos = 0
        while (pos < elementary.size) {
            val size = Ac3Iec61937Packer.parseFrameSizeBytes(elementary, pos)
            perAu.writeAccessUnits(elementary, pos, size)
            pos += size
        }
        assertArrayEqualsPrefix(oneShot.packedSnapshot(), perAu.packedSnapshot())
    }

    @Test fun truehd_splitMidStreamMatchesOneShot() {
        val elementary = resource("truehd.bin")
        val oneShot = Iec61937Packer.create(IecCodec.TRUEHD, 48000)!!
        oneShot.writeAccessUnits(elementary, 0, elementary.size)

        // Split at an access-unit boundary partway through and feed in two
        // calls: MAT accumulation must carry across the call boundary.
        val split = auBoundaryNear(elementary, elementary.size / 2)
        val twoCalls = Iec61937Packer.create(IecCodec.TRUEHD, 48000)!!
        twoCalls.writeAccessUnits(elementary, 0, split)
        twoCalls.writeAccessUnits(elementary, split, elementary.size - split)
        assertArrayEqualsPrefix(oneShot.packedSnapshot(), twoCalls.packedSnapshot())
    }

    @Test fun resetClearsPackerState() {
        val elementary = resource("ac3.bin")
        val packer = Iec61937Packer.create(IecCodec.AC3, 48000)!!
        packer.writeAccessUnits(elementary, 0, elementary.size)
        packer.reset()
        assertEquals(0, packer.availableBytes)

        packer.writeAccessUnits(elementary, 0, elementary.size)
        assertBurstStreamMatches(resource("ac3.spdif"), packer.packedSnapshot(), maxTailBytes = 0)
    }

    @Test fun carrierSpecMapsCodecsToTiers() {
        assertEquals(IecCarrierTier.LOW, Iec61937CarrierSpec.forCodec(IecCodec.AC3, 48000)!!.tier)
        assertEquals(IecCarrierTier.MID, Iec61937CarrierSpec.forCodec(IecCodec.EAC3, 48000)!!.tier)
        val hbr = Iec61937CarrierSpec.forCodec(IecCodec.TRUEHD, 48000)!!
        assertEquals(IecCarrierTier.HBR, hbr.tier)
        assertEquals(192000, hbr.sampleRate)
        assertEquals(8, hbr.channelCount)
        // The EAC3 carrier runs at 4x the stream rate.
        assertEquals(192000, Iec61937CarrierSpec.forCodec(IecCodec.EAC3, 48000)!!.sampleRate)
    }

    private fun auBoundaryNear(data: ByteArray, target: Int): Int {
        var pos = 0
        while (pos < target) {
            val words = data.rb16(pos) and 0x0FFF
            pos += words * 2
        }
        return pos
    }

    /**
     * The packed stream must equal the golden stream on their common prefix,
     * and their lengths may differ only by a trailing partial group either
     * side still holds (never more than one burst period).
     */
    private fun assertBurstStreamMatches(golden: ByteArray, mine: ByteArray, maxTailBytes: Int) {
        val common = minOf(golden.size, mine.size)
        assertArrayEqualsPrefix(golden.copyOf(common), mine.copyOf(common))
        val diff = Math.abs(golden.size - mine.size)
        assertTrue(
            "length diff $diff exceeds one burst period $maxTailBytes " +
                "(golden=${golden.size} mine=${mine.size})",
            diff <= maxTailBytes,
        )
        assertTrue("packed nothing", mine.isNotEmpty())
    }

    private fun assertArrayEqualsPrefix(expected: ByteArray, actual: ByteArray) {
        val n = minOf(expected.size, actual.size)
        for (i in 0 until n) {
            if (expected[i] != actual[i]) {
                fail(expected, actual, i)
            }
        }
        assertEquals("length mismatch", expected.size, actual.size)
    }

    private fun fail(expected: ByteArray, actual: ByteArray, i: Int): Nothing {
        val from = maxOf(0, i - 4)
        throw AssertionError(
            "byte mismatch at $i: expected 0x%02x got 0x%02x, context exp=%s act=%s".format(
                expected[i], actual[i],
                expected.copyOfRange(from, minOf(expected.size, i + 4)).joinToString(" ") { "%02x".format(it) },
                actual.copyOfRange(from, minOf(actual.size, i + 4)).joinToString(" ") { "%02x".format(it) },
            ),
        )
    }

    private fun resource(name: String): ByteArray =
        javaClass.getResourceAsStream("/iec/$name")!!.readBytes()
}
