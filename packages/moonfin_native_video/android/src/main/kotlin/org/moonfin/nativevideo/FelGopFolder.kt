package org.moonfin.nativevideo

import android.os.SystemClock
import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.util.UnstableApi
import androidx.media3.container.NalUnitUtil

/**
 * Holds one GOP of a profile 7 FEL track at a time, so every scene that starts
 * in it can be fitted from its first picture before any of its frames goes
 * out, then releases the samples in order, each with the luma curve its RPU
 * should carry.
 *
 * Runs on the extractor's loading thread like the rest of the compat chain,
 * so a fold holds up loading for as long as it takes. [FelFoldPolicy] decides
 * when a GOP gets decoded and when folding stops, and from then on the stream
 * plays with its own mapping kept. One decoder per layer stays open while
 * folding runs, or one at a time on a box that can't hold both next to the
 * player's own.
 *
 * Based on AetherEngine's FEL lookahead, LGPL-3.0, copyright 2026 Vincent
 * Herbst.
 */
@UnstableApi
internal class FelGopFolder(
    private val baseFormat: Format,
    private val decoderReady: () -> Boolean,
    private val onRelease: (Held, FelCurve?) -> Unit,
) {

    /** One sample as the track output had it, minus its RPU and enhancement layer. */
    class Held(
        val timeUs: Long,
        val flags: Int,
        /** The base layer access unit, Annex B. */
        val base: ByteArray,
        /** The unspec62 NAL unit from its header on, as it arrived. */
        val rpu: ByteArray?,
        val info: FelRpuInfo?,
        /** The enhancement layer's own NAL units, Annex B. */
        val enhancement: ByteArray?,
        val wrapped: Boolean,
        /** Whatever followed the coded sample in a wrapped Matroska block. */
        val supplemental: ByteArray?,
    ) {
        val isKeyFrame: Boolean get() = (flags and C.BUFFER_FLAG_KEY_FRAME) != 0
        val bytes: Long
            get() = (base.size + (rpu?.size ?: 0) + (enhancement?.size ?: 0) + (supplemental?.size ?: 0)).toLong()
    }

    private val held = ArrayList<Held>()
    private var heldBytes = 0L
    private val scenes = FelSceneFolds()
    private val policy = FelFoldPolicy()
    private val enhancementDecoder = FelLayerDecoder()
    private val baseDecoder = FelLayerDecoder()
    private var oneDecoderAtATime = false
    private var enhancementParameterSets: ByteArray? = null

    /** Why folding stopped for this playback, null while it runs. */
    val stopReason: String? get() = policy.stopReason
    private var lastProblem: String? = null
    private var gopsFolded = 0
    private var gopsWaitingForPlayer = 0
    private var lastFoldMs = 0L
    private var timedFolds = 0
    private var totalFoldMs = 0L
    private var slowestFoldMs = 0L
    private val decoderNames = LinkedHashSet<String>()

    val scenesFitted: Int get() = scenes.scenesFitted

    private val baseCsd: ByteArray? by lazy {
        val parts = baseFormat.initializationData
        if (parts.isEmpty()) return@lazy null
        val out = ByteArray(parts.sumOf { it.size })
        var at = 0
        for (part in parts) {
            part.copyInto(out, at)
            at += part.size
        }
        out
    }

    fun add(sample: Held) {
        if (sample.isKeyFrame && held.isNotEmpty()) foldAndRelease(decode = true)
        held += sample
        heldBytes += sample.bytes
        if (held.size >= MAX_HELD_SAMPLES || heldBytes >= maxHeldBytes) {
            lastProblem = "a GOP ran past ${held.size} samples or ${heldBytes shr 20}MB"
            foldAndRelease(decode = false)
        }
    }

    /** Releases what is held with a fit where one can still be made, for the end of the source. */
    fun flush() {
        if (held.isNotEmpty()) foldAndRelease(decode = true)
    }

    /** Releases what is held with no new fit, for a track output about to stop folding. */
    fun drain() {
        if (held.isNotEmpty()) foldAndRelease(decode = false)
    }

    /** Drops what is held, for a source that has just been repositioned. */
    fun reset() {
        held.clear()
        heldBytes = 0
        scenes.reset()
        policy.seeked()
    }

    /** Closes the side decoders, for a folder that is done or a player that needs the hardware back. */
    fun release() {
        enhancementDecoder.release()
        baseDecoder.release()
    }

    fun summary(): String = buildString {
        append(if (stopReason == null) "on" else "stopped ($stopReason)")
        append(", scenes fitted ").append(scenes.scenesFitted)
        append(", without residual ").append(scenes.scenesWithoutResidual)
        append(", failed ").append(scenes.scenesFailed)
        if (scenes.scenesSkipped > 0) append(", skipped ").append(scenes.scenesSkipped)
        append(", GOPs folded ").append(gopsFolded)
        if (gopsWaitingForPlayer > 0) append(", waited for the player ").append(gopsWaitingForPlayer)
        if (scenes.scenesFitted > 0) append(", last scene's largest luma change ").append(scenes.lastLiftCodes).append(" codes")
        if (timedFolds > 0) {
            append(", fold time last ").append(lastFoldMs)
            append(" ms, average ").append(totalFoldMs / timedFolds)
            append(" ms, slowest ").append(slowestFoldMs).append(" ms")
            append(", ").append(policy.sharePercent).append("% of playback time")
        }
        if (oneDecoderAtATime) append(", one decoder at a time")
        if (decoderNames.isNotEmpty()) append(", decoders ").append(decoderNames.joinToString("+"))
        lastProblem?.let { append(", last problem: ").append(it) }
    }

    private fun foldAndRelease(decode: Boolean) {
        val frames = held.map { FelSceneFolds.Frame(it.timeUs, it.info) }
        val times = frames.map { it.pts }.sorted()
        val spacing = times.zipWithNext { a, b -> b - a }.filter { it > 0 }.minOrNull() ?: ONE_FRAME_US
        val fit = policy.takeFitTurn() && decode
        var decoded = false
        val started = SystemClock.elapsedRealtime()
        val folds = scenes.assign(frames) { wanted ->
            if (!fit) {
                null
            } else {
                samplesFor(wanted, spacing)?.also { decoded = true }
            }
        }
        if (decoded) {
            lastFoldMs = SystemClock.elapsedRealtime() - started
            timedFolds++
            totalFoldMs += lastFoldMs
            slowestFoldMs = maxOf(slowestFoldMs, lastFoldMs)
        }
        policy.gopReleased(times.last() - times.first() + spacing, if (decoded) lastFoldMs else null)
        if (policy.stopReason != null) release()
        held.forEachIndexed { i, sample -> onRelease(sample, folds[i]?.luma(sample.info?.luma)) }
        held.clear()
        heldBytes = 0
    }

    private fun failed(problem: String, severity: FelLayerDecoder.Severity = FelLayerDecoder.Severity.TRANSIENT): Map<Int, FelCurveSamples> {
        lastProblem = problem
        policy.failed(problem, severity)
        return emptyMap()
    }

    /**
     * Runs one layer's decode. A decoder that won't open next to the other
     * side decoder gets the hardware to itself, and from then on each one is
     * closed again after its turn.
     */
    private fun decodeLayer(
        decoder: FelLayerDecoder,
        other: FelLayerDecoder,
        block: FelLayerDecoder.() -> FelLayerDecoder.Outcome,
    ): FelLayerDecoder.Outcome {
        var outcome = decoder.block()
        if (outcome.openFailed && other.isOpen) {
            other.release()
            oneDecoderAtATime = true
            outcome = decoder.block()
        }
        if (oneDecoderAtATime) decoder.release()
        outcome.decoderName?.let { decoderNames += it }
        return outcome
    }

    /**
     * Decodes the enhancement layer, then the base layer, from the GOP's
     * keyframe up to the last scene start that needs a picture, and samples
     * each wanted pair.
     */
    private fun samplesFor(wanted: List<Int>, spacingUs: Long): Map<Int, FelCurveSamples>? {
        // A side decoder open while the player's own is starting up could take
        // the hardware slot the player needs, so both close until it's back.
        if (!decoderReady()) {
            release()
            gopsWaitingForPlayer++
            return null
        }
        val last = wanted.max()
        val tolerance = maxOf(1L, spacingUs * 45 / 100)
        val deadline = SystemClock.elapsedRealtime() + FelFoldPolicy.DECODE_BUDGET_MS
        val wantedByTime = wanted.associateBy { held[it].timeUs }

        val enhancementUnits = (0..last).mapNotNull { i ->
            held[i].enhancement?.let { FelLayerDecoder.AccessUnit(held[i].timeUs, it) }
        }
        if (enhancementUnits.isEmpty()) return failed("no enhancement layer arrived in band")
        parameterSets(enhancementUnits.first().data)?.let { enhancementParameterSets = it }
        val enhancementCsd = enhancementParameterSets
            ?: return failed("the enhancement layer carries no parameter sets")
        val (elWidth, elHeight) = spsSize(enhancementCsd)
            ?: return failed("the enhancement layer's SPS couldn't be read")

        val enhancement = HashMap<Int, FelCurveSampler.EnhancementSamples>()
        val elOutcome = decodeLayer(enhancementDecoder, baseDecoder) {
            decode(elWidth, elHeight, enhancementCsd, enhancementUnits, wantedByTime.keys, tolerance, deadline) { timeUs, plane ->
                val index = wantedByTime[timeUs] ?: return@decode
                val info = held[index].info ?: return@decode
                val nlq = info.nlq?.firstOrNull() ?: return@decode
                FelCurveSampler.enhancement(plane, nlq, info.elBits)?.let { enhancement[index] = it }
            }
        }
        if (enhancement.isEmpty()) {
            return failed("enhancement layer: ${elOutcome.failure ?: "no picture could be sampled"}", elOutcome.severity)
        }

        val baseUnits = (0..last).map { FelLayerDecoder.AccessUnit(held[it].timeUs, held[it].base) }
        val baseWanted = enhancement.keys.associateBy { held[it].timeUs }
        val samples = HashMap<Int, FelCurveSamples>()
        var gridMismatch = false
        val blOutcome = decodeLayer(baseDecoder, enhancementDecoder) {
            decode(baseFormat.width, baseFormat.height, baseCsd, baseUnits, baseWanted.keys, tolerance, deadline) { timeUs, plane ->
                val index = baseWanted[timeUs] ?: return@decode
                val el = enhancement[index] ?: return@decode
                val pair = FelCurveSampler.withBase(el, plane)
                if (pair != null) samples[index] = pair else gridMismatch = true
            }
        }
        if (samples.isEmpty()) {
            return if (gridMismatch) {
                failed(
                    "the base layer isn't a whole multiple of the ${elWidth}x$elHeight enhancement layer",
                    FelLayerDecoder.Severity.PLAYBACK,
                )
            } else {
                failed("base layer: ${blOutcome.failure ?: "no picture came out"}", blOutcome.severity)
            }
        }
        policy.succeeded()
        gopsFolded++
        (elOutcome.failure ?: blOutcome.failure)?.let { lastProblem = it }
        return samples
    }

    companion object {
        /** A GOP longer than this is released without a fit. */
        private const val MAX_HELD_SAMPLES = 1_200

        // An eighth of the heap, so a box allowed 192MB holds 24MB at most.
        private val maxHeldBytes = minOf(128L shl 20, Runtime.getRuntime().maxMemory() / 8)
        // A GOP of a single frame plays for one frame at 23.976 fps.
        private const val ONE_FRAME_US = 41_708L

        /** The VPS, SPS and PPS units at the head of an Annex B access unit, Annex B again. */
        fun parameterSets(accessUnit: ByteArray): ByteArray? {
            val out = java.io.ByteArrayOutputStream()
            var found = 0
            forEachNal(accessUnit) { start, end ->
                val type = (accessUnit[start].toInt() shr 1) and 0x3F
                if (type in 32..34) {
                    out.write(START_CODE)
                    out.write(accessUnit, start, end - start)
                    found = found or (1 shl (type - 32))
                }
            }
            return if (found == 0b111) out.toByteArray() else null
        }

        private fun spsSize(parameterSets: ByteArray): Pair<Int, Int>? {
            var size: Pair<Int, Int>? = null
            forEachNal(parameterSets) { start, end ->
                if (size == null && ((parameterSets[start].toInt() shr 1) and 0x3F) == 33) {
                    size = runCatching {
                        val sps = NalUnitUtil.parseH265SpsNalUnit(parameterSets, start, end, null)
                        sps.width to sps.height
                    }.getOrNull()?.takeIf { it.first > 0 && it.second > 0 }
                }
            }
            return size
        }

        /** Calls [block] with each NAL unit's header offset and end in Annex B [data]. */
        fun forEachNal(data: ByteArray, block: (start: Int, end: Int) -> Unit) {
            var start = -1
            var i = 0
            while (i + 3 <= data.size) {
                if (data[i] == ZERO && data[i + 1] == ZERO && data[i + 2] == ONE) {
                    if (start >= 0) {
                        var end = i
                        if (end > start && data[end - 1] == ZERO) end--
                        block(start, end)
                    }
                    start = i + 3
                    i += 3
                } else {
                    i++
                }
            }
            if (start in 0 until data.size) block(start, data.size)
        }

        val START_CODE = byteArrayOf(0, 0, 0, 1)
        private const val ZERO = 0.toByte()
        private const val ONE = 1.toByte()
    }
}
