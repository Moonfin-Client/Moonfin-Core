package org.moonfin.nativevideo

/**
 * Checks a Dolby Vision RPU before libdovi sees it. libdovi is built
 * panic=abort and parses before it checks the CRC, so a corrupt RPU that
 * reaches one of its `unimplemented!()` or `unreachable!()` branches kills the
 * app. Every RPU is CRC checked here first, and the CRC-valid ones that are
 * known to reach a panic are refused too.
 *
 * Ported from AetherEngine, LGPL-3.0, copyright 2026 Vincent Herbst.
 */
internal object DoviRpuGuard {

    private val crcTable = IntArray(256) { i ->
        var c = i shl 24
        repeat(8) { c = if (c < 0) (c shl 1) xor 0x04C11DB7 else c shl 1 }
        c
    }

    private val level8Lengths = setOf(10L, 12L, 13L, 19L, 25L)
    private val cmv29Levels = setOf(1L, 2L, 4L, 5L, 6L, 255L)

    /**
     * True when libdovi can parse this unspec62 NAL unit, given from its
     * 2-byte header on with emulation prevention still in place.
     */
    fun isSafe(nal: ByteArray, offset: Int, length: Int): Boolean =
        safeUnescaped(nal, offset, length) != null

    /** The unescaped RPU when libdovi can parse it, else null. */
    fun safeUnescaped(nal: ByteArray, offset: Int, length: Int): ByteArray? =
        verifiedUnescaped(nal, offset, length)?.takeUnless { reachesUnimplementedPath(it) }

    /**
     * The RPU without emulation prevention or trailing zeros, header(2) 0x19
     * payload crc32(4) 0x80, when its CRC32 is right, else null.
     */
    fun verifiedUnescaped(nal: ByteArray, offset: Int, length: Int): ByteArray? {
        if (length < 8) return null
        val u = ByteArray(length)
        var n = 0
        var zeros = 0
        for (i in offset until offset + length) {
            val b = nal[i].toInt() and 0xFF
            if (zeros >= 2 && b == 3) {
                zeros = 0
                continue
            }
            u[n++] = b.toByte()
            zeros = if (b == 0) zeros + 1 else 0
        }
        while (n > 0 && u[n - 1] == 0.toByte()) n--
        if (n < 8 || u[2] != 0x19.toByte() || u[n - 1] != 0x80.toByte()) return null
        val tailAt = n - 5
        var crc = -1
        for (i in 3 until tailAt) {
            crc = (crc shl 8) xor crcTable[(crc ushr 24) xor (u[i].toInt() and 0xFF)]
        }
        val stored = ((u[tailAt].toInt() and 0xFF) shl 24) or
            ((u[tailAt + 1].toInt() and 0xFF) shl 16) or
            ((u[tailAt + 2].toInt() and 0xFF) shl 8) or
            (u[tailAt + 3].toInt() and 0xFF)
        return if (crc == stored) u.copyOf(n) else null
    }

    /**
     * True when the RPU steers libdovi 3.4 into a panic. Mirrors its header,
     * mapping and DM parsers far enough to see a linear-interpolated
     * polynomial piece, a curve that mixes mapping methods, a pivot or block
     * count the payload can't hold, a level 8, 9 or 10 block of an undefined
     * length, and an Exp-Golomb code of 32 or more leading zeros. Every false
     * is on a path where libdovi returns an error before any panic.
     */
    private fun reachesUnimplementedPath(u: ByteArray): Boolean {
        // libdovi reads to the end of the trimmed data, CRC included, so the
        // bound is the whole array.
        val r = RpuBits(u, u.size * 8, 3 * 8)
        return scan(r) || r.hostile
    }

    private fun scan(r: RpuBits): Boolean {
        if (r.bits(6) != 2L) return false
        val format = r.bits(11)
        if (format == OUT_OF_BITS) return false
        if (r.bits(4) == OUT_OF_BITS || r.bits(4) == OUT_OF_BITS) return false
        if (r.bit() != 1L) return false
        if (r.bit() == OUT_OF_BITS) return false
        val dataType = r.bits(2)
        if (dataType == OUT_OF_BITS) return false
        var denom = 0L
        if (dataType == 0L) {
            denom = r.ue()
            if (denom == OUT_OF_BITS) return false
        }
        if (r.bits(2) == OUT_OF_BITS || r.bit() == OUT_OF_BITS) return false
        val hasElFields = (format and 0x700L) == 0L
        var blDepth = 0L
        var elDepth = 0L
        var reserved3 = 0L
        var disableResidual = false
        if (hasElFields) {
            val bl = r.ue()
            if (bl == OUT_OF_BITS) return false
            val el = r.ue()
            if (el == OUT_OF_BITS) return false
            if (r.ue() == OUT_OF_BITS || r.bit() == OUT_OF_BITS) return false
            val res = r.bits(3)
            if (res == OUT_OF_BITS || r.bit() == OUT_OF_BITS) return false
            val dr = r.bit()
            if (dr == OUT_OF_BITS) return false
            blDepth = bl
            elDepth = el and 0xFFL
            reserved3 = res
            disableResidual = dr == 1L
        }
        val coefLen = when (dataType) {
            0L -> if (denom > 32) return false else denom.toInt()
            1L -> 32
            else -> return false
        }
        // libdovi rejects anything but 10-bit base layers and denom above 23
        // before it reads the mapping.
        if (blDepth != 2L || denom > 23) return false
        val dmPresent = r.bit()
        val usePrev = r.bit()
        if (dmPresent == OUT_OF_BITS || usePrev == OUT_OF_BITS) return false
        if (usePrev == 1L) {
            // The mapping is skipped but the DM payload is still parsed.
            if (r.ue() == OUT_OF_BITS || dmPresent != 1L) return false
            return reachesInvalidDmBlock(r, compressed = reserved3 == 1L)
        }
        if (r.ue() == OUT_OF_BITS || r.ue() == OUT_OF_BITS || r.ue() == OUT_OF_BITS) return false
        val depth = blDepth.toInt() + 8
        val pieces = IntArray(3)
        for (c in 0 until 3) {
            val n = r.ue()
            if (n == OUT_OF_BITS) return false
            // libdovi sizes its vectors from this count before reading them.
            if (n > (r.end - r.pos).toLong() / depth) return true
            pieces[c] = n.toInt() + 1
            repeat(n.toInt() + 2) { if (r.bits(depth) == OUT_OF_BITS) return false }
        }
        if (hasElFields && !disableResidual) {
            if (r.bits(3) != 0L) return false
            repeat(2) { if (r.bits(depth) == OUT_OF_BITS) return false }
        }
        if (r.ue() == OUT_OF_BITS || r.ue() == OUT_OF_BITS) return false
        for (c in 0 until 3) {
            var curveIdc = OUT_OF_BITS
            repeat(pieces[c]) {
                val idc = r.ue()
                if (idc == OUT_OF_BITS) return false
                // The writer can't represent a curve that mixes methods.
                if (curveIdc != OUT_OF_BITS && idc <= 1 && idc != curveIdc) return true
                curveIdc = idc
                when (idc) {
                    0L -> {
                        val order = r.ue()
                        if (order == OUT_OF_BITS || order > 1) return false
                        if (order == 0L) {
                            val linear = r.bit()
                            if (linear == OUT_OF_BITS) return false
                            if (linear == 1L) return true
                        }
                        repeat(order.toInt() + 2) {
                            if (dataType == 0L && !r.skipSE()) return false
                            if (r.bits(coefLen) == OUT_OF_BITS) return false
                        }
                    }
                    1L -> {
                        val order = r.bits(2)
                        if (order == OUT_OF_BITS || order > 2) return false
                        if (dataType == 0L && !r.skipSE()) return false
                        if (r.bits(coefLen) == OUT_OF_BITS) return false
                        repeat((order.toInt() + 1) * 7) {
                            if (dataType == 0L && !r.skipSE()) return false
                            if (r.bits(coefLen) == OUT_OF_BITS) return false
                        }
                    }
                    else -> return false
                }
            }
        }
        if (hasElFields && !disableResidual) {
            if (elDepth != 2L) return false
            repeat(3) {
                if (r.bits(elDepth.toInt() + 8) == OUT_OF_BITS) return false
                repeat(3) {
                    if (dataType == 0L && !r.skipSE()) return false
                    if (r.bits(coefLen) == OUT_OF_BITS) return false
                }
            }
        }
        if (dmPresent != 1L) return false
        return reachesInvalidDmBlock(r, compressed = reserved3 == 1L)
    }

    /** Walks the CM v2.9 and CM v4.0 block lists far enough to see each level and length. */
    private fun reachesInvalidDmBlock(r: RpuBits, compressed: Boolean): Boolean {
        if (r.ue() == OUT_OF_BITS || r.ue() == OUT_OF_BITS || r.ue() == OUT_OF_BITS) return false
        if (!compressed) {
            if (r.pos + 509 > r.end) return false
            r.pos += 509
        }
        for (section in 0 until 2) {
            if (section == 1 && r.end - r.pos < 56) return false
            val count = r.ue()
            if (count == OUT_OF_BITS) return false
            if (count > (r.end - r.pos).toLong() / 9) return true
            while ((r.pos and 7) != 0) {
                if (r.bit() == OUT_OF_BITS) return false
            }
            repeat(count.toInt()) {
                val length = r.ue()
                val level = r.bits(8)
                if (length == OUT_OF_BITS || level == OUT_OF_BITS) return false
                if (section == 1) {
                    when (level) {
                        8L -> if (length !in level8Lengths) return true
                        9L -> if (length != 1L && length != 17L) return true
                        10L -> if (length != 5L && length != 21L) return true
                        3L, 11L, 254L -> Unit
                        else -> return false
                    }
                } else if (level !in cmv29Levels) {
                    return false
                }
                if (length >= (1L shl 20) || r.pos + length.toInt() * 8 > r.end) return false
                r.pos += length.toInt() * 8
            }
        }
        return false
    }
}

internal const val OUT_OF_BITS = -1L

/** MSB-first reader over an unescaped RPU, every read answers [OUT_OF_BITS] past the end. */
internal class RpuBits(val bytes: ByteArray, val end: Int, var pos: Int) {
    /**
     * Set by an Exp-Golomb code of 32 or more leading zeros. libdovi decodes
     * one but doesn't survive it, and no RPU field comes near that size.
     */
    var hostile = false

    fun bit(): Long {
        if (pos >= end) return OUT_OF_BITS
        val v = (bytes[pos shr 3].toInt() shr (7 - (pos and 7))) and 1
        pos++
        return v.toLong()
    }

    fun bits(n: Int): Long {
        if (n < 0 || n > 62 || pos + n > end) return OUT_OF_BITS
        var v = 0L
        repeat(n) {
            v = (v shl 1) or ((bytes[pos shr 3].toInt() shr (7 - (pos and 7))) and 1).toLong()
            pos++
        }
        return v
    }

    fun ue(): Long {
        var zeros = 0
        while (true) {
            val b = bit()
            if (b == OUT_OF_BITS) return OUT_OF_BITS
            if (b == 1L) break
            zeros++
            if (zeros >= 32) {
                hostile = true
                return OUT_OF_BITS
            }
        }
        val rest = bits(zeros)
        if (rest == OUT_OF_BITS) return OUT_OF_BITS
        return ((1L shl zeros) - 1) + rest
    }

    fun skipSE(): Boolean = ue() != OUT_OF_BITS
}
