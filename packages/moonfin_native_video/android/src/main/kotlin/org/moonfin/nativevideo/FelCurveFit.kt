package org.moonfin.nativevideo

import kotlin.math.abs
import kotlin.math.max
import kotlin.math.roundToInt

/**
 * Base layer luma codes (10-bit) and the luma residual the enhancement layer
 * adds at the same place (VDR codes), one entry per sampled pixel.
 */
internal class FelCurveSamples(val base: FloatArray, val residual: FloatArray)

/**
 * The residual a scene's enhancement layer adds to luma, as a curve over base
 * layer luma that gets added to the stream's own luma polynomial. A least
 * squares fit with the pivots fixed to the stream's own. Chroma is left to the
 * stream's own mapping, which the platform decoder applies.
 *
 * Ported from AetherEngine, LGPL-3.0, copyright 2026 Vincent Herbst, along
 * with the sampler and scene assignment below.
 */
internal object FelCurveFit {
    private const val BASE_MAX = 1023.0
    private const val MINIMUM_SAMPLES_PER_PIECE = 30

    /**
     * Per piece, the second order polynomial in normalized base input that
     * best fits the normalized residual. Zero for a piece with too few samples
     * or a singular system.
     */
    fun lumaResidual(samples: FelCurveSamples, pivots: IntArray, vdrBits: Int = 12): FelCurve {
        val base = samples.base
        val residual = samples.residual
        val vdrMax = ((1 shl vdrBits) - 1).toDouble()
        val pieces = pivots.size - 1
        val sx = Array(pieces) { DoubleArray(5) }
        val sy = Array(pieces) { DoubleArray(3) }
        val n = IntArray(pieces)
        val lo = DoubleArray(pieces) { Double.POSITIVE_INFINITY }
        val hi = DoubleArray(pieces) { Double.NEGATIVE_INFINITY }
        for (i in 0 until minOf(base.size, residual.size)) {
            val code = base[i]
            var piece = pieces - 1
            for (p in 0 until pieces - 1) {
                if (code < pivots[p + 1]) {
                    piece = p
                    break
                }
            }
            val x = code / BASE_MAX
            val y = residual[i] / vdrMax
            val x2 = x * x
            sx[piece][0] += 1.0
            sx[piece][1] += x
            sx[piece][2] += x2
            sx[piece][3] += x2 * x
            sx[piece][4] += x2 * x2
            sy[piece][0] += y
            sy[piece][1] += y * x
            sy[piece][2] += y * x2
            n[piece]++
            lo[piece] = minOf(lo[piece], x)
            hi[piece] = maxOf(hi[piece], x)
        }
        val out = DoubleArray(3 * pieces)
        for (p in 0 until pieces) {
            if (n[p] < MINIMUM_SAMPLES_PER_PIECE) continue
            // A parabola fitted to samples bunched in part of a piece is
            // unconstrained over the rest of it, where another frame of the
            // scene may well have pixels, so a narrow spread gets a lower order.
            val spread = (hi[p] - lo[p]) / ((pivots[p + 1] - pivots[p]) / BASE_MAX)
            val order = if (spread >= 0.5) 3 else if (spread >= 0.1) 2 else 1
            val w = solve(sx[p], sy[p], order) ?: continue
            w.copyInto(out, 3 * p)
        }
        return FelCurve(pivots, out)
    }

    /**
     * Solves the normal equations for up to [maxTerms] terms by Gaussian
     * elimination with partial pivoting, falling back to a line and then a
     * constant when a parabola is singular. Always three coefficients long.
     */
    private fun solve(s: DoubleArray, t: DoubleArray, maxTerms: Int): DoubleArray? {
        fun eliminate(size: Int): DoubleArray? {
            val a = Array(size) { r -> DoubleArray(size + 1) { c -> if (c < size) s[r + c] else t[r] } }
            for (col in 0 until size) {
                var pivot = col
                for (r in col + 1 until size) {
                    if (abs(a[r][col]) > abs(a[pivot][col])) pivot = r
                }
                if (abs(a[pivot][col]) <= 1e-12 * max(1.0, abs(s[0]))) return null
                val swap = a[col]
                a[col] = a[pivot]
                a[pivot] = swap
                for (r in 0 until size) {
                    if (r == col) continue
                    val f = a[r][col] / a[col][col]
                    for (k in col..size) a[r][k] -= f * a[col][k]
                }
            }
            val w = DoubleArray(3)
            for (i in 0 until size) w[i] = a[i][size] / a[i][i]
            return if (w.all { it.isFinite() }) w else null
        }
        if (maxTerms >= 3) eliminate(3)?.let { return it }
        if (maxTerms >= 2) eliminate(2)?.let { return it }
        return eliminate(1)
    }
}

/** Luma in 10-bit codes. */
internal interface FelLumaPlane {
    val width: Int
    val height: Int
    fun luma(x: Int, y: Int): Int
}

/**
 * Draws the fit's samples from one decoded picture pair. Positions are drawn
 * on the enhancement layer's luma grid, where its residual is coded, and the
 * base layer's luma is averaged over the block one enhancement pixel covers.
 * Every position counts, the darkest included, since a dark title's
 * enhancement layer does most of its work there.
 *
 * Split in two so the enhancement layer can be sampled and its picture
 * released before the base layer decodes, which keeps one side decoder alive
 * at a time.
 */
internal object FelCurveSampler {
    private const val DEFAULT_COUNT = 100_000
    private const val SEED = 0x5EEDL

    /** The enhancement layer half: sample positions and the residual at each. */
    class EnhancementSamples(val width: Int, val height: Int, val xs: IntArray, val ys: IntArray, val residual: FloatArray)

    fun enhancement(
        el: FelLumaPlane,
        nlq: FelNlq,
        elBits: Int,
        count: Int = DEFAULT_COUNT,
    ): EnhancementSamples? {
        if (el.width <= 1 || el.height <= 1) return null
        val table = nlq.table(elBits)
        val mask = (1 shl elBits) - 1
        val xs = IntArray(count)
        val ys = IntArray(count)
        val residual = FloatArray(count)
        var state = SEED
        fun next(): Int {
            state = state * 6364136223846793005L + 1442695040888963407L
            return (state ushr 33).toInt()
        }
        for (i in 0 until count) {
            xs[i] = next() % el.width
            ys[i] = next() % el.height
            residual[i] = table[el.luma(xs[i], ys[i]) and mask].toFloat()
        }
        return EnhancementSamples(el.width, el.height, xs, ys, residual)
    }

    /** The base layer half, null unless the base is a whole multiple of the enhancement grid. */
    fun withBase(el: EnhancementSamples, bl: FelLumaPlane): FelCurveSamples? {
        if (bl.width < el.width || bl.height < el.height) return null
        if (bl.width % el.width != 0 || bl.height % el.height != 0) return null
        val rx = bl.width / el.width
        val ry = bl.height / el.height
        val base = FloatArray(el.xs.size)
        for (i in base.indices) {
            var sum = 0
            for (dy in 0 until ry) {
                for (dx in 0 until rx) sum += bl.luma(el.xs[i] * rx + dx, el.ys[i] * ry + dy)
            }
            base[i] = sum.toFloat() / (rx * ry)
        }
        return FelCurveSamples(base, el.residual)
    }
}

/**
 * Which scene fold each frame of a GOP gets. A scene starts at a frame whose
 * RPU raises scene_refresh_flag, at the first frame shown, and, until the
 * stream has marked any scene at all, at every GOP's keyframe. A scene's fold
 * carries across GOPs.
 */
internal class FelSceneFolds {

    class Frame(val pts: Long, val info: FelRpuInfo?)

    /**
     * One scene's luma residual on the pivots of its first frame, and that
     * frame's luma with it added, which stands in for a frame whose own luma
     * has other pivots.
     */
    class SceneFold(val residual: FelCurve, val fallbackLuma: FelCurve) {
        fun luma(own: FelCurve?): FelCurve = own?.adding(residual) ?: fallbackLuma
    }

    private var carried: SceneFold? = null
    private var carriedValid = false
    private var streamMarksScenes = false

    var scenesFitted = 0
        private set
    var scenesWithoutResidual = 0
        private set
    var scenesFailed = 0
        private set
    var scenesSkipped = 0
        private set

    /** The largest change the last fitted scene made to luma, at the middle of a piece, in VDR codes. */
    var lastLiftCodes = 0
        private set

    /**
     * The fold of each frame, given in decode order, null keeping the
     * stream's mapping. [samplesFor] gets the decode indices of the scene
     * starts that need a picture and answers with the samples it managed, or
     * null when it didn't try.
     */
    fun assign(frames: List<Frame>, samplesFor: (List<Int>) -> Map<Int, FelCurveSamples>?): Array<SceneFold?> {
        if (frames.isEmpty()) return emptyArray()
        val display = frames.indices.sortedBy { frames[it].pts }
        val starts = display.filter { frames[it].info?.sceneRefresh == true }.toMutableList()
        if (starts.isNotEmpty()) streamMarksScenes = true
        if (!carriedValid && starts.firstOrNull() != display.first()) starts.add(0, display.first())
        if (!streamMarksScenes && 0 !in starts) starts.add(0)

        val need = starts.filter { frames[it].info?.let { info -> info.carriesResidual && info.luma != null } == true }
        val samples = if (need.isEmpty()) emptyMap() else samplesFor(need)
        val fitted = HashMap<Int, SceneFold?>()
        for (index in starts) {
            val info = frames[index].info
            if (info == null) {
                fitted[index] = null
                scenesFailed++
                continue
            }
            val luma = info.luma
            if (info.nlq == null || luma == null) {
                fitted[index] = null
                scenesWithoutResidual++
                continue
            }
            val picked = samples?.get(index)
            if (picked == null) {
                fitted[index] = null
                if (samples == null) scenesSkipped++ else scenesFailed++
                continue
            }
            val residual = FelCurveFit.lumaResidual(picked, luma.pivots, vdrBits = info.vdrBits)
            fitted[index] = luma.adding(residual)?.let { SceneFold(residual, it) }
            scenesFitted++
            val largest = (0 until residual.pivots.size - 1)
                .map { residual.value((residual.pivots[it] + residual.pivots[it + 1]) / 2046.0) }
                .maxBy { abs(it) }
            lastLiftCodes = (largest * ((1 shl info.vdrBits) - 1)).roundToInt()
        }

        val result = arrayOfNulls<SceneFold>(frames.size)
        var current = carried
        for (index in display) {
            if (fitted.containsKey(index)) current = fitted[index]
            result[index] = current
        }
        carried = current
        carriedValid = true
        return result
    }

    /** Drops the carried fold, for a source that has just been repositioned. */
    fun reset() {
        carried = null
        carriedValid = false
    }
}
