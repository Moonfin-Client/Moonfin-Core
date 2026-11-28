package org.moonfin.nativevideo

import kotlin.math.abs

/**
 * One component's reshaping curve as a profile 8.1 RPU carries it: absolute
 * base layer pivots and, per piece, `c0, c1, c2` of
 * `out = c0 + c1 * x + c2 * x^2` with input and output normalized to [0, 1].
 *
 * The FEL curve fold recovers the enhancement layer's brightness per tone and
 * none of its local detail, and it never evaluates the stream's mapping on a
 * pixel. The platform's Dolby Vision decoder applies the curve.
 *
 * Ported from AetherEngine, LGPL-3.0, copyright 2026 Vincent Herbst.
 */
class FelCurve(val pivots: IntArray, val coefs: DoubleArray) {

    /** The curve's output at a normalized input. */
    fun value(x: Double): Double {
        val code = x * 1023
        val piece = (1 until pivots.size).firstOrNull { code < pivots[it] }?.minus(1) ?: (pivots.size - 2)
        return coefs[3 * piece] + coefs[3 * piece + 1] * x + coefs[3 * piece + 2] * x * x
    }

    /** This curve plus [delta] coefficient by coefficient, null unless both have the same pivots. */
    fun adding(delta: FelCurve): FelCurve? {
        if (!pivots.contentEquals(delta.pivots) || coefs.size != delta.coefs.size) return null
        return FelCurve(pivots, DoubleArray(coefs.size) { coefs[it] + delta.coefs[it] })
    }

    override fun equals(other: Any?): Boolean =
        other is FelCurve && pivots.contentEquals(other.pivots) && coefs.contentEquals(other.coefs)

    override fun hashCode(): Int = 31 * pivots.contentHashCode() + coefs.contentHashCode()
}

/** The linear dead zone inverse quantizer of one component, its residual in VDR codes. */
internal data class FelNlq(
    val offset: Int,
    val scale: Long,
    val threshold: Long,
    val vdrInMax: Long,
    val shift: Int,
) {
    fun residual(elCode: Int): Int {
        val r = elCode.toLong() - offset
        if (r == 0L) return 0
        var mag = ((2 * abs(r) - 1) * scale + 2 * threshold) shr (shift + 1)
        if (vdrInMax > 0 && mag > vdrInMax) mag = vdrInMax
        if (mag < 0) mag = 0
        return (if (r < 0) -mag else mag).toInt()
    }

    fun table(elBits: Int): IntArray = IntArray(1 shl elBits) { residual(it) }
}

/** What the fold reads from one profile 7 RPU before it is converted. */
internal class FelRpuInfo(
    /** The stream's luma curve when it is a polynomial, the fold adds the residual to it. */
    val luma: FelCurve?,
    /** Per component inverse quantizers, null when the RPU carries no usable residual. */
    val nlq: List<FelNlq>?,
    /** The enhancement layer is a full one, which is what decides that a stream gets folded. */
    val isFel: Boolean,
    val sceneRefresh: Boolean,
    val vdrBits: Int,
    val elBits: Int,
    /** "FEL", "MEL", "no residual", or "unknown" for an RPU that reuses an earlier mapping. */
    val enhancementLayer: String,
) {
    val carriesResidual: Boolean get() = nlq != null

    companion object {
        /**
         * Reads an RPU the guard accepted, given unescaped from its NAL
         * header on. Mirrors libdovi 3.4's read order. Null for anything that
         * isn't a profile 7 RPU with fixed point coefficients, with the reason
         * handed to [refused].
         */
        fun read(u: ByteArray, refused: (String) -> Unit = {}): FelRpuInfo? {
            fun no(why: String): FelRpuInfo? {
                refused(why)
                return null
            }
            val r = RpuBits(u, u.size * 8, 3 * 8)
            if (r.bits(6) != 2L) return no("its rpu_type isn't 2")
            val format = r.bits(11)
            if (format == OUT_OF_BITS) return no(ENDS_EARLY)
            if ((format and 0x700L) != 0L) return no("an unknown rpu_format $format")
            if (r.bits(4) == OUT_OF_BITS || r.bits(4) == OUT_OF_BITS) return no(ENDS_EARLY)
            if (r.bit() != 1L || r.bit() == OUT_OF_BITS) return no("it has no sequence info")
            if (r.bits(2) != 0L) return no("floating point coefficients")
            val denom = r.ue()
            if (denom == OUT_OF_BITS) return no(ENDS_EARLY)
            if (denom <= 0 || denom > 32) return no("a coefficient precision of $denom bits")
            if (r.bits(2) == OUT_OF_BITS || r.bit() == OUT_OF_BITS) return no(ENDS_EARLY)
            val blDepth = r.ue()
            val elRaw = r.ue()
            val vdrDepth = r.ue()
            if (blDepth == OUT_OF_BITS || elRaw == OUT_OF_BITS || vdrDepth == OUT_OF_BITS) return no(ENDS_EARLY)
            if (r.bit() == OUT_OF_BITS || r.bits(3) == OUT_OF_BITS || r.bit() == OUT_OF_BITS) return no(ENDS_EARLY)
            val disableResidual = r.bit()
            val dmPresent = r.bit()
            val usePrev = r.bit()
            if (disableResidual == OUT_OF_BITS || dmPresent == OUT_OF_BITS || usePrev == OUT_OF_BITS) return no(ENDS_EARLY)
            val blBits = blDepth.toInt() + 8
            val elBits = (elRaw and 0xFFL).toInt() + 8
            val vdrBits = vdrDepth.toInt() + 8
            val denomBits = denom.toInt()
            val residualOn = disableResidual == 0L

            var luma: FelCurve? = null
            var nlq: List<FelNlq>? = null
            var isFel = false
            if (usePrev == 1L) {
                // The mapping comes from an earlier RPU, so this one has none of its own.
                if (r.ue() == OUT_OF_BITS) return no(ENDS_EARLY)
            } else {
                if (r.ue() == OUT_OF_BITS || r.ue() == OUT_OF_BITS || r.ue() == OUT_OF_BITS) return no(ENDS_EARLY)
                val pivots = arrayOfNulls<LongArray>(3)
                for (c in 0 until 3) {
                    val n = r.ue()
                    if (n == OUT_OF_BITS) return no(ENDS_EARLY)
                    if (n > 64) return no("more than 64 pivots")
                    pivots[c] = LongArray(n.toInt() + 2) { r.bits(blBits) }
                    if (pivots[c]!!.any { it == OUT_OF_BITS }) return no(ENDS_EARLY)
                }
                if (residualOn) {
                    // libdovi only knows the linear dead zone method and refuses the rest.
                    if (r.bits(3) != 0L) return no("a quantizer method other than linear dead zone")
                    if (r.bits(blBits) == OUT_OF_BITS || r.bits(blBits) == OUT_OF_BITS) return no(ENDS_EARLY)
                }
                if (r.ue() == OUT_OF_BITS || r.ue() == OUT_OF_BITS) return no(ENDS_EARLY)
                for (c in 0 until 3) {
                    val curve = readCurve(r, pivots[c]!!, denomBits) ?: return no("a mapping piece it can't read")
                    if (c == 0) luma = curve.polynomial
                }
                if (residualOn) {
                    val raw = Array(3) { LongArray(7) }
                    for (c in 0 until 3) {
                        raw[c][0] = r.bits(elBits)
                        for (k in 0 until 3) {
                            raw[c][1 + 2 * k] = r.ue()
                            raw[c][2 + 2 * k] = r.bits(denomBits)
                        }
                        if (raw[c].any { it == OUT_OF_BITS }) return no(ENDS_EARLY)
                    }
                    // libdovi's MEL test: zero offset, vdr_in_max of exactly 1 and no dead zone.
                    val isMel = raw.all {
                        it[0] == 0L && it[1] == 1L && it[2] == 0L &&
                            it[3] == 0L && it[4] == 0L && it[5] == 0L && it[6] == 0L
                    }
                    isFel = !isMel
                    if (isFel && denom >= vdrBits && elBits <= 12) {
                        val shift = denomBits - vdrBits
                        fun fixed(int: Long, frac: Long) = (int shl denomBits) + frac
                        val params = raw.map {
                            FelNlq(
                                offset = it[0].toInt(),
                                vdrInMax = fixed(it[1], it[2]) shr shift,
                                scale = fixed(it[3], it[4]),
                                threshold = fixed(it[5], it[6]),
                                shift = shift,
                            )
                        }
                        if (params.all { it.scale > 0 }) nlq = params
                    }
                }
            }

            var sceneRefresh = false
            if (dmPresent == 1L && r.ue() != OUT_OF_BITS && r.ue() != OUT_OF_BITS) {
                val flag = r.ue()
                sceneRefresh = flag != OUT_OF_BITS && flag != 0L
            }
            val enhancementLayer = when {
                usePrev == 1L -> "unknown"
                !residualOn -> "no residual"
                isFel -> "FEL"
                else -> "MEL"
            }
            return FelRpuInfo(luma, nlq, isFel, sceneRefresh, vdrBits, elBits, enhancementLayer)
        }

        private const val ENDS_EARLY = "it ends early"

        private class Curve(val polynomial: FelCurve?)

        /**
         * Reads one component's pieces. The polynomial comes back only when
         * every piece is one, of order 1 or 2 without linear interpolation,
         * on pivots that stay inside 10 bits and strictly increase.
         */
        private fun readCurve(r: RpuBits, rawPivots: LongArray, denomBits: Int): Curve? {
            val pieces = rawPivots.size - 1
            val scale = (1L shl denomBits).toDouble()
            val coefs = DoubleArray(3 * pieces)
            var polynomial = true
            for (p in 0 until pieces) {
                when (r.ue()) {
                    0L -> {
                        val orderMinus1 = r.ue()
                        if (orderMinus1 == OUT_OF_BITS || orderMinus1 > 1) return null
                        if (orderMinus1 == 0L && r.bit() != 0L) return null
                        for (j in 0..orderMinus1.toInt() + 1) {
                            val int = se(r.ue())
                            val frac = r.bits(denomBits)
                            if (int == null || frac == OUT_OF_BITS) return null
                            coefs[3 * p + j] = int + frac / scale
                        }
                    }
                    1L -> {
                        polynomial = false
                        val order = r.bits(2)
                        if (order == OUT_OF_BITS || order > 2) return null
                        repeat(1 + (order.toInt() + 1) * 7) {
                            if (!r.skipSE() || r.bits(denomBits) == OUT_OF_BITS) return null
                        }
                    }
                    else -> return null
                }
            }
            if (!polynomial) return Curve(null)
            val absolute = IntArray(rawPivots.size)
            var running = 0L
            for (i in rawPivots.indices) {
                running += rawPivots[i]
                if (running > 1023) return Curve(null)
                absolute[i] = running.toInt()
                if (i > 0 && absolute[i] <= absolute[i - 1]) return Curve(null)
            }
            return Curve(FelCurve(absolute, coefs))
        }

        private fun se(k: Long): Long? = when {
            k == OUT_OF_BITS -> null
            (k and 1L) == 1L -> (k + 1) / 2
            else -> -(k / 2)
        }
    }
}
