package org.moonfin.nativevideo

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class FelCurveTest {

    private val nlq = FelNlq(offset = 512, scale = 2048, threshold = 0, vdrInMax = 512, shift = 11)

    private fun info(sceneRefresh: Boolean = false, residual: Boolean = true) = FelRpuInfo(
        luma = identityCurve(uniformPivots(8)),
        nlq = if (residual) List(3) { nlq } else null,
        isFel = true,
        sceneRefresh = sceneRefresh,
        vdrBits = 12,
        elBits = 10,
        enhancementLayer = "FEL",
    )

    /** Samples across the whole range whose residual is [residual] everywhere. */
    private fun constantSamples(residual: Float, count: Int = 20_000): FelCurveSamples {
        var state = 1L
        val base = FloatArray(count)
        for (i in 0 until count) {
            state = state * 6364136223846793005L + 1L
            base[i] = (64 + (state ushr 33).toInt() % 880).toFloat()
        }
        return FelCurveSamples(base, FloatArray(count) { residual })
    }

    private fun read(hexString: String): FelRpuInfo = read(hex(hexString))

    private fun read(nal: ByteArray): FelRpuInfo {
        val unescaped = DoviRpuGuard.safeUnescaped(nal, 0, nal.size)
        assertNotNull("the guard should accept it", unescaped)
        return FelRpuInfo.read(unescaped!!)!!
    }

    @Test
    fun inverseQuantizerResiduals() {
        assertEquals(0, nlq.residual(512))
        assertEquals(0, nlq.residual(513))
        assertEquals(1, nlq.residual(514))
        assertEquals(87, nlq.residual(600))
        assertEquals(-87, nlq.residual(424))
        assertEquals(510, nlq.residual(1023))
        val ceiling = FelNlq(offset = 512, scale = 4096, threshold = 0, vdrInMax = 100, shift = 11)
        assertEquals(100, ceiling.residual(1000))
        assertEquals(-100, ceiling.residual(20))
    }

    @Test
    fun constantResidualLiftsTheLumaCurveByThatAmount() {
        val stream = identityCurve(uniformPivots(8))
        val residual = FelCurveFit.lumaResidual(constantSamples(40f), stream.pivots)
        val luma = stream.adding(residual)!!
        assertArrayEquals(stream.pivots, luma.pivots)
        var x = 0.1
        while (x <= 0.9 + 1e-9) {
            assertEquals(x + 40.0 / 4095, luma.value(x), 1e-6)
            x += 0.05
        }
    }

    @Test
    fun withoutSamplesTheResidualIsZero() {
        val stream = FelCurve(intArrayOf(0, 512, 1023), doubleArrayOf(0.01, 0.9, 0.05, -0.02, 1.0, 0.0))
        val residual = FelCurveFit.lumaResidual(FelCurveSamples(FloatArray(0), FloatArray(0)), stream.pivots)
        assertArrayEquals(DoubleArray(6), residual.coefs, 0.0)
        assertEquals(stream, stream.adding(residual))
    }

    @Test
    fun curvesWithOtherPivotsAreNotAdded() {
        assertNull(identityCurve(intArrayOf(0, 512, 1023)).adding(identityCurve(intArrayOf(0, 256, 1023))))
    }

    @Test
    fun samplesBunchedInPartOfAPieceGetAConstant() {
        val base = FloatArray(3_000) { (300 + it % 3).toFloat() }
        val residual = FloatArray(3_000) { (it % 7 - 3 + 12).toFloat() }
        val curve = FelCurveFit.lumaResidual(FelCurveSamples(base, residual), uniformPivots(8))
        assertEquals(12.0 / 4095, curve.coefs[6], 1e-6)
        assertEquals(0.0, curve.coefs[7], 0.0)
        assertEquals(0.0, curve.coefs[8], 0.0)
    }

    @Test
    fun readerTakesWhatLibdoviReadsFromARealFelRpu() {
        // libdovi 3.4.0 read the same RPU as FEL, denom 23, 12-bit VDR, an
        // identity luma polynomial on uniform 8-piece pivots, MMR chroma and
        // NLQ offset 512, vdr_in_max 2^20 and slope 2048 on every component.
        val info = read(FEL_RPU_HEX)
        assertTrue(info.isFel)
        assertTrue(info.carriesResidual)
        assertEquals(List(3) { nlq }, info.nlq)
        assertEquals(12, info.vdrBits)
        assertEquals(10, info.elBits)
        assertEquals(identityCurve(uniformPivots(8)), info.luma)
        assertFalse(info.sceneRefresh)
    }

    @Test
    fun readerTakesTheCurveLibdoviWrote() {
        val info = read(FOLDED_RPU_HEX)
        assertFalse(info.isFel)
        assertNull(info.nlq)
        val luma = info.luma!!
        assertArrayEquals(uniformPivots(8), luma.pivots)
        for (piece in 0 until 8) {
            assertEquals(0.001 * piece, luma.coefs[3 * piece], 1e-6)
            assertEquals(1.02, luma.coefs[3 * piece + 1], 1e-6)
            assertEquals(-0.01, luma.coefs[3 * piece + 2], 1e-6)
        }
    }

    @Test
    fun readerOnCraftedRpus() {
        val felNal = craft(listOf(listOf(Piece.POLYNOMIAL), listOf(Piece.MMR), listOf(Piece.MMR)), Residual.FEL)
        val fel = read(felNal)
        assertTrue(fel.isFel)
        assertEquals("FEL", fel.enhancementLayer)
        assertEquals(
            List(3) { c ->
                FelNlq(offset = 40 + 8 * c, scale = 3L shl 18, threshold = 1L shl 19, vdrInMax = 512, shift = 11)
            },
            fel.nlq,
        )
        assertEquals(FelCurve(intArrayOf(0, 1023), doubleArrayOf(0.0, 1.0, 0.0)), fel.luma)

        val melNal = craft(listOf(listOf(Piece.POLYNOMIAL), listOf(Piece.MMR), listOf(Piece.MMR)), Residual.MEL)
        val mel = read(melNal)
        assertFalse(mel.isFel)
        assertEquals("MEL", mel.enhancementLayer)
        assertNull(mel.nlq)

        val p8 = read(craftOnePiece())
        assertFalse(p8.isFel)
        assertEquals("no residual", p8.enhancementLayer)
        assertNotNull(p8.luma)

        assertNull(read(craftOnePiece(mmrOn = 0)).luma)
    }

    @Test
    fun readerTakesTheSceneFlagEvenWithoutAMapping() {
        val nal = craftUsePrev(Block(10, 8), sceneRefresh = 1)
        val info = read(nal)
        assertTrue(info.sceneRefresh)
        assertNull(info.luma)
        assertEquals("unknown", info.enhancementLayer)
        assertFalse(read(craftUsePrev(Block(10, 8))).sceneRefresh)
    }

    @Test
    fun readerSaysWhyItRefusesAnRpu() {
        val nal = craft(listOf(listOf(Piece.POLYNOMIAL), listOf(Piece.MMR), listOf(Piece.MMR)), Residual.FEL)
        val unescaped = DoviRpuGuard.safeUnescaped(nal, 0, nal.size)!!
        // Bit 52 is the low bit of coefficient_data_type, which makes it floating point.
        unescaped[6] = (unescaped[6].toInt() or 0x08).toByte()
        var reason: String? = null
        assertNull(FelRpuInfo.read(unescaped) { reason = it })
        assertEquals("floating point coefficients", reason)
    }

    private class Plane(override val width: Int, override val height: Int, val f: (Int, Int) -> Int) : FelLumaPlane {
        override fun luma(x: Int, y: Int): Int {
            require(x in 0 until width && y in 0 until height)
            return f(x, y)
        }
    }

    @Test
    fun samplerPairsEachEnhancementPixelWithTheBaseBlockItCovers() {
        val el = Plane(8, 4) { _, _ -> 600 }
        val bl = Plane(16, 8) { x, y -> x + 16 * y }
        val enhancement = FelCurveSampler.enhancement(el, nlq, elBits = 10, count = 1_000)!!
        val samples = FelCurveSampler.withBase(enhancement, bl)!!
        assertEquals(1_000, samples.base.size)
        for (i in samples.base.indices) {
            assertEquals(87f, samples.residual[i])
            val x = enhancement.xs[i]
            val y = enhancement.ys[i]
            assertEquals((2 * x + 0.5f) + 16 * (2 * y + 0.5f), samples.base[i], 1e-3f)
        }
    }

    @Test
    fun samplerRefusesABaseThatIsNotAWholeMultiple() {
        val enhancement = FelCurveSampler.enhancement(Plane(8, 4) { _, _ -> 600 }, nlq, elBits = 10, count = 10)!!
        assertNull(FelCurveSampler.withBase(enhancement, Plane(15, 8) { _, _ -> 0 }))
        assertNull(FelCurveSampler.withBase(enhancement, Plane(4, 2) { _, _ -> 0 }))
    }

    @Test
    fun scenesNotTriedAreCountedAsSkipped() {
        val folds = FelSceneFolds()
        val result = folds.assign(listOf(FelSceneFolds.Frame(0, info()))) { null }
        assertNull(result[0])
        assertEquals(1, folds.scenesSkipped)
        assertEquals(0, folds.scenesFailed)
    }

    /** Fits each wanted index to the residual [residuals] names for it. */
    private fun sampler(residuals: Map<Int, Float>, asked: MutableList<List<Int>>): (List<Int>) -> Map<Int, FelCurveSamples> =
        { wanted ->
            asked += wanted
            wanted.mapNotNull { index -> residuals[index]?.let { index to constantSamples(it) } }.toMap()
        }

    private fun lift(fold: FelSceneFolds.SceneFold?): Double? =
        fold?.let { (it.luma(identityCurve(uniformPivots(8))).value(0.5) - 0.5) * 4095 }

    @Test
    fun scenesStartAtTheFirstFrameShownAndAtEverySceneFlag() {
        val folds = FelSceneFolds()
        val asked = mutableListOf<List<Int>>()
        // Decode order with a reordered frame: pts 0, 3, 1, 2, a scene flag on pts 2.
        val gop = listOf(
            FelSceneFolds.Frame(0, info()),
            FelSceneFolds.Frame(3, info()),
            FelSceneFolds.Frame(1, info()),
            FelSceneFolds.Frame(2, info(sceneRefresh = true)),
        )
        val result = folds.assign(gop, sampler(mapOf(0 to 40f, 3 to 80f), asked))
        assertEquals(listOf(listOf(0, 3)), asked)
        assertEquals(40.0, lift(result[0])!!, 0.01)
        assertEquals(40.0, lift(result[2])!!, 0.01)
        assertEquals(80.0, lift(result[3])!!, 0.01)
        assertEquals(80.0, lift(result[1])!!, 0.01)
        assertEquals(2, folds.scenesFitted)
        assertEquals(80, folds.lastLiftCodes)

        // The scene carries into a GOP with no flag of its own, without a decode.
        val next = folds.assign(listOf(FelSceneFolds.Frame(4, info()), FelSceneFolds.Frame(5, info())), sampler(emptyMap(), asked))
        assertEquals(1, asked.size)
        assertEquals(80.0, lift(next[0])!!, 0.01)
        assertEquals(80.0, lift(next[1])!!, 0.01)
    }

    @Test
    fun aStreamWithoutSceneFlagsIsRefittedAtEveryKeyframe() {
        val folds = FelSceneFolds()
        val asked = mutableListOf<List<Int>>()
        folds.assign(listOf(FelSceneFolds.Frame(0, info()), FelSceneFolds.Frame(1, info())), sampler(mapOf(0 to 40f), asked))
        val second = folds.assign(
            listOf(FelSceneFolds.Frame(2, info()), FelSceneFolds.Frame(3, info())),
            sampler(mapOf(0 to 120f), asked),
        )
        assertEquals(listOf(listOf(0), listOf(0)), asked)
        assertEquals(120.0, lift(second[1])!!, 0.01)
    }

    @Test
    fun aSceneThatCantBeFittedKeepsTheStreamsMapping() {
        val folds = FelSceneFolds()
        val failed = folds.assign(listOf(FelSceneFolds.Frame(0, info())), sampler(emptyMap(), mutableListOf()))
        assertNull(failed[0])
        assertEquals(1, folds.scenesFailed)

        val withoutResidual = folds.assign(
            listOf(FelSceneFolds.Frame(1, info(sceneRefresh = true, residual = false))),
            sampler(mapOf(0 to 40f), mutableListOf()),
        )
        assertNull(withoutResidual[0])
        assertEquals(1, folds.scenesWithoutResidual)

        val unreadable = folds.assign(listOf(FelSceneFolds.Frame(2, null)), sampler(emptyMap(), mutableListOf()))
        assertNull(unreadable[0])
    }

    @Test
    fun resetStartsANewSceneAtTheNextFrameShown() {
        val folds = FelSceneFolds()
        val asked = mutableListOf<List<Int>>()
        folds.assign(listOf(FelSceneFolds.Frame(0, info(sceneRefresh = true))), sampler(mapOf(0 to 40f), asked))
        folds.reset()
        val after = folds.assign(listOf(FelSceneFolds.Frame(100, info())), sampler(mapOf(0 to 200f), asked))
        assertEquals(listOf(listOf(0), listOf(0)), asked)
        assertEquals(200.0, lift(after[0])!!, 0.01)
    }

    @Test
    fun parameterSetsComeOutOfAnAnnexBAccessUnit() {
        val vps = byteArrayOf(0x40, 0x01, 0x0C)
        val sps = byteArrayOf(0x42, 0x01, 0x01)
        val pps = byteArrayOf(0x44, 0x01, 0xC1.toByte())
        val slice = byteArrayOf(0x26, 0x01, 0xAF.toByte())
        val start4 = byteArrayOf(0, 0, 0, 1)
        val start3 = byteArrayOf(0, 0, 1)
        val unit = start4 + vps + start3 + sps + start4 + pps + start3 + slice
        assertArrayEquals(start4 + vps + start4 + sps + start4 + pps, FelGopFolder.parameterSets(unit))
        assertNull(FelGopFolder.parameterSets(start4 + vps + start3 + sps + start3 + slice))

        val seen = mutableListOf<ByteArray>()
        FelGopFolder.forEachNal(unit) { start, end -> seen += unit.copyOfRange(start, end) }
        assertEquals(4, seen.size)
        assertArrayEquals(sps, seen[1])
        assertArrayEquals(slice, seen[3])
    }
}
