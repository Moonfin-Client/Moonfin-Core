package org.moonfin.nativevideo

/**
 * Builds Dolby Vision RPUs bit by bit for the guard and fold tests, each with
 * a valid CRC.
 *
 * Ported from AetherEngine, LGPL-3.0, copyright 2026 Vincent Herbst.
 */

internal class BitWriter {
    val bits = ArrayList<Boolean>()

    fun put(v: Long, n: Int) {
        for (i in n - 1 downTo 0) bits.add(((v ushr i) and 1L) == 1L)
    }

    fun ue(v: Long) {
        val x = v + 1
        val len = 64 - java.lang.Long.numberOfLeadingZeros(x)
        put(0, len - 1)
        put(x, len)
    }

    fun se(v: Long) = ue(if (v > 0) 2 * v - 1 else -2 * v)

    /** An Exp-Golomb code with exactly [zeros] leading zeros, however large the value. */
    fun ueRaw(zeros: Int, rest: Long) {
        put(0, zeros)
        put(1, 1)
        put(rest, zeros)
    }

    fun align() {
        while (bits.size % 8 != 0) bits.add(false)
    }

    fun bytes(): ByteArray {
        val out = ByteArray((bits.size + 7) / 8)
        bits.forEachIndexed { i, b ->
            if (b) out[i shr 3] = (out[i shr 3].toInt() or (0x80 ushr (i and 7))).toByte()
        }
        return out
    }
}

internal enum class Piece { POLYNOMIAL, MMR, LINEAR }

internal enum class Residual { NONE, MEL, FEL }

internal data class Block(val length: Long, val level: Long)

/** Pivots every `1024 / pieces` codes, the last at 1023, the split profile 7 streams use for luma. */
internal fun uniformPivots(pieces: Int) = IntArray(pieces + 1) { minOf(1023, it * 1024 / pieces) }

internal fun identityCurve(pivots: IntArray) =
    FelCurve(pivots, DoubleArray(3 * (pivots.size - 1)) { if (it % 3 == 1) 1.0 else 0.0 })

internal fun crc(data: List<Byte>): Int {
    var c = -1
    for (byte in data) {
        c = c xor ((byte.toInt() and 0xFF) shl 24)
        repeat(8) { c = if (c < 0) (c shl 1) xor 0x04C11DB7 else c shl 1 }
    }
    return c
}

/** NAL header, emulation prevention and padding around 0x19, payload, CRC and final byte. */
internal fun escape(body: List<Byte>): ByteArray {
    val out = arrayListOf<Byte>(0x7C, 0x01)
    var zeros = 0
    for (b in body) {
        val v = b.toInt() and 0xFF
        if (zeros >= 2 && v <= 3) {
            out.add(3)
            zeros = 0
        }
        out.add(b)
        zeros = if (v == 0) zeros + 1 else 0
    }
    while (out.size < 26) out.add(0)
    return out.toByteArray()
}

internal fun seal(payload: ByteArray): ByteArray {
    val c = crc(payload.toList())
    val body = listOf<Byte>(0x19) + payload.toList() + listOf(
        (c ushr 24).toByte(),
        (c ushr 16).toByte(),
        (c ushr 8).toByte(),
        c.toByte(),
        0x80.toByte(),
    )
    return escape(body)
}

private fun BitWriter.bit(on: Boolean) = put(if (on) 1 else 0, 1)

/**
 * The header in order: rpu_type 2, rpu_format 18, profile 1, level 0, the
 * sequence info flag, no chroma filter, fixed point coefficients with denom
 * 23, normalized idc 0, limited range, 10-bit base and enhancement layers,
 * 12-bit VDR, no spatial resampling, then the reserved bits and the residual,
 * DM and use_prev flags.
 */
private fun BitWriter.header(reserved3: Long, residual: Boolean, dmPresent: Boolean, usePrev: Boolean) {
    put(2, 6)
    put(18, 11)
    put(1, 4)
    put(0, 4)
    bit(true)
    bit(false)
    put(0, 2)
    ue(23)
    put(0, 2)
    bit(false)
    ue(2)
    ue(2)
    ue(4)
    bit(false)
    put(reserved3, 3)
    bit(residual)
    bit(!residual)
    bit(dmPresent)
    bit(usePrev)
}

internal fun craft(
    pieces: List<List<Piece>>,
    residual: Residual = Residual.NONE,
    pivotCount: Long? = null,
    vdrRpuId: ((BitWriter) -> Unit)? = null,
): ByteArray {
    val w = BitWriter()
    w.header(reserved3 = 0, residual = residual != Residual.NONE, dmPresent = false, usePrev = false)
    if (vdrRpuId != null) vdrRpuId(w) else w.ue(0)
    w.ue(0)
    w.ue(0)
    pieces.forEachIndexed { c, curve ->
        w.ue(if (c == 0 && pivotCount != null) pivotCount else curve.size - 1L)
        for (k in 0..curve.size) w.put(k * 1023L / curve.size, 10)
    }
    if (residual != Residual.NONE) {
        w.put(0, 3)
        w.put(0, 10)
        w.put(1023, 10)
    }
    w.ue(0)
    w.ue(0)
    fun coef(int: Long) {
        w.se(int)
        w.put(0, 23)
    }
    for (piece in pieces.flatten()) {
        when (piece) {
            Piece.MMR -> {
                w.ue(1)
                w.put(0, 2)
                repeat(8) { coef(0) }
            }
            Piece.LINEAR -> {
                w.ue(0)
                w.ue(0)
                w.bit(true)
            }
            Piece.POLYNOMIAL -> {
                w.ue(0)
                w.ue(0)
                w.bit(false)
                coef(0)
                coef(1)
            }
        }
    }
    if (residual != Residual.NONE) {
        val fel = residual == Residual.FEL
        for (c in 0 until 3) {
            w.put(if (fel) 40L + 8 * c else 0, 10)
            w.ue(if (fel) 0 else 1)
            w.put(if (fel) 1L shl 20 else 0, 23)
            w.ue(0)
            w.put(if (fel) 3L shl 18 else 0, 23)
            w.ue(0)
            w.put(if (fel) 1L shl 19 else 0, 23)
        }
    }
    w.align()
    return seal(w.bytes())
}

internal fun craftOnePiece(linearOn: Int? = null, mmrOn: Int? = null): ByteArray =
    craft(
        (0 until 3).map { c ->
            listOf(
                when (c) {
                    linearOn -> Piece.LINEAR
                    mmrOn -> Piece.MMR
                    else -> Piece.POLYNOMIAL
                },
            )
        },
    )

/** A profile 8 shaped RPU with use_prev_vdr_rpu set, so only the DM payload follows the header. */
internal fun craftUsePrev(
    cmv40Block: Block?,
    cmv29Count: Long = 0,
    cmv29Block: Block? = null,
    compressed: Boolean = true,
    sceneRefresh: Long = 0,
): ByteArray {
    val w = BitWriter()
    w.header(reserved3 = if (compressed) 1 else 0, residual = false, dmPresent = true, usePrev = true)
    w.ue(0)
    w.ue(0)
    w.ue(0)
    w.ue(sceneRefresh)
    if (!compressed) {
        repeat(18) { w.put(0, 16) }
        repeat(3) { w.put(0, 32) }
        w.put(65535, 16)
        w.put(0, 32)
        w.put(0, 32)
        w.put(10, 5)
        w.put(0, 6)
        w.put(0, 24)
        w.put(0, 10)
    }
    if (cmv29Block != null) {
        w.ue(1)
        w.align()
        w.ue(cmv29Block.length)
        w.put(cmv29Block.level, 8)
        repeat(cmv29Block.length.toInt()) { w.put(0, 8) }
    } else {
        w.ue(cmv29Count)
        w.align()
    }
    if (cmv40Block != null) {
        w.ue(2)
        w.align()
        w.ue(cmv40Block.length)
        w.put(cmv40Block.level, 8)
        repeat(cmv40Block.length.toInt()) { w.put(0, 8) }
        w.ue(2)
        w.put(254, 8)
        w.put(0, 16)
    } else {
        w.ue(0)
    }
    w.align()
    return seal(w.bytes())
}

/** [nal] with one bit of its stored CRC or of its payload flipped, the CRC left as it was. */
internal fun withBadCrc(nal: ByteArray, crcByte: Int? = null, payloadByte: Int? = null): ByteArray {
    val body = DoviRpuGuard.verifiedUnescaped(nal, 0, nal.size)!!.drop(2).toMutableList()
    if (crcByte != null) {
        val i = body.size - 5 + crcByte
        body[i] = (body[i].toInt() xor 0x01).toByte()
    }
    if (payloadByte != null) {
        val i = 1 + payloadByte
        body[i] = (body[i].toInt() xor 0x10).toByte()
    }
    return escape(body)
}

internal fun hex(s: String) = ByteArray(s.length / 2) { s.substring(it * 2, it * 2 + 2).toInt(16).toByte() }

/** A real profile 7 FEL RPU with its NAL header. */
internal const val FEL_RPU_HEX =
    "7c011908090840613650ae20002008020080200802007f801ffc00ffc001fffa0000030100000300d000000800000680" +
        "0000400000340000030200000301a000001000000d0000030080000068000004000003034000002000000a8000008000" +
        "00e18618800000800000800000800000800000800000b0c30c8000008000008000008000008000008000009861868000" +
        "00800000800000800000800000540000040000040000070c30c400000400000400000400000400000400000586186400" +
        "0004000004000004000004000004000004c30c3400000400000400000400000401200001001001000003010048000040" +
        "0400400000401200001001001000001c95980000d7a8959be7f3ac709599132800000400000300200000030020000003" +
        "0070d8890c06182978c238145000000698f96bfffc00000300000300000300018081f73805463008015faa4900c02821" +
        "83180081872b94210002020000030008050000030002261140120c1f4000641f2e1276ffb6cfda80"

/**
 * [FEL_RPU_HEX] after libdovi 3.4.0 with LibDovi's patch ran mode 1, mode 2
 * and set every luma piece to the stream's own curve plus
 * `[0.001 * piece, 0.02, -0.01]`.
 */
internal const val FOLDED_RPU_HEX =
    "7c0119080908406136506e20002008020080200802007f801ffc00fffa80000040a3d71feb852a8020c540a3d71feb85" +
        "2a80418940a3d71feb852a80624e40a3d71feb852a80831240a3d71feb852a80a3d740a3d71feb852a80c49c40a3d71f" +
        "eb852a80e56040a3d71feb852540000040000070c30c4000004000004000004000004000004000005861864000004000" +
        "004000004000004000004000004c30c34000004000004000004000004000002a00000302000003020000030386186200" +
        "0003020000030200000302000003020000030200000302c30c3200000302000003020000030200000302000003020000" +
        "030261861a0000030200000302000003020000030392b300001af512b37cfe758e12b322650000030080000004000003" +
        "0004000003000e1b112180c3052f1847028a00000300d31f2d7fff800000030000030000030030103ee700a8c0300801" +
        "5faa4900c0282183180081872b94210002020000030008050000030002261140120c1f4000641f2e12766c96094580"
