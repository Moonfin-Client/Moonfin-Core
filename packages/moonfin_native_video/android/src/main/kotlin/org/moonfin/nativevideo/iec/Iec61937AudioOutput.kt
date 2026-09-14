package org.moonfin.nativevideo.iec

import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.audio.AudioOutput
import androidx.media3.exoplayer.audio.AudioOutputProvider.FormatConfig
import androidx.media3.exoplayer.audio.AudioOutputProvider.OutputConfig
import androidx.media3.exoplayer.audio.ForwardingAudioOutput
import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * Wraps the real IEC61937 AudioTrack output and converts incoming compressed
 * access units into IEC 61937 bursts on the way through.
 *
 * The write contract is all-or-nothing per DefaultAudioSink's checkStates: a
 * call either consumes the whole input buffer (packing it into [staging]) and
 * returns true, or leaves the input untouched and returns false while the
 * previous bursts drain. Staging therefore never holds more than roughly one
 * input buffer's worth of bursts.
 *
 * Position comes from the carrier clock unchanged. IEC packing is
 * time-neutral (stuffing preserves real time), so carrier time equals media
 * time. [getSampleRate] reports the media rate because the sink compares
 * durationUsToSampleCount(positionUs, sampleRate) against media frames.
 */
@UnstableApi
internal class Iec61937AudioOutput(
    private val delegate: AudioOutput,
    private val packer: Iec61937Packer,
    private val mediaSampleRate: Int,
) : ForwardingAudioOutput(delegate) {

    private var staging: ByteBuffer =
        ByteBuffer.allocateDirect(INITIAL_STAGING_BYTES).order(ByteOrder.nativeOrder())
    private var inputScratch = ByteArray(INITIAL_SCRATCH_BYTES)
    private var transferScratch = ByteArray(INITIAL_SCRATCH_BYTES)

    init {
        staging.limit(0)
    }

    override fun write(
        buffer: ByteBuffer,
        encodedAccessUnitCount: Int,
        presentationTimeUs: Long,
    ): Boolean {
        // Earlier bursts must fully drain before new input is accepted, so a
        // refused input buffer comes back identical on the retry.
        if (staging.hasRemaining()) {
            delegate.write(staging, 1, presentationTimeUs)
            if (staging.hasRemaining()) return false
        }

        val length = buffer.remaining()
        if (length == 0) return true
        if (inputScratch.size < length) {
            inputScratch = ByteArray(maxOf(length, inputScratch.size * 2))
        }
        buffer.get(inputScratch, 0, length)
        try {
            packer.writeAccessUnits(inputScratch, 0, length)
        } catch (_: Iec61937Exception) {
            // Malformed input the packer can't carry. Surfacing it as a write
            // failure routes into the player's audio retry ladder, which
            // disables IEC for the session and re-prepares.
            throw AudioOutput.WriteException(ERROR_CODE_IEC_PACKER, /* isRecoverable= */ false)
        }

        refillStaging()
        if (staging.hasRemaining()) {
            delegate.write(staging, encodedAccessUnitCount, presentationTimeUs)
        }
        // The input is consumed regardless of how much of the packed result
        // the track accepted. The remainder drains at the head of later calls.
        return true
    }

    override fun flush() {
        packer.reset()
        staging.position(0)
        staging.limit(0)
        delegate.flush()
    }

    override fun stop() {
        // Pad out the in-flight burst so the receiver ends on a frame
        // boundary, then hand the track whatever it will still take. Anything
        // it refuses is under one burst period of tail audio.
        try {
            packer.endOfStream()
            refillStaging()
            if (staging.hasRemaining()) {
                delegate.write(staging, 1, LAST_WRITE_TIME_UNSET)
            }
        } catch (_: Exception) {
            // Best effort: never let EOS padding turn into a playback error.
        }
        delegate.stop()
    }

    override fun setVolume(volume: Float) {
        // Volume scaling corrupts burst framing, so the track stays at unity.
        // On TV the remote drives the system volume anyway.
    }

    override fun getSampleRate(): Int = mediaSampleRate

    override fun canReuseAudioOutput(
        currentConfig: OutputConfig,
        newFormat: FormatConfig,
        newConfig: OutputConfig,
    ): Boolean = false

    /** Moves packed bytes from the packer into the staging buffer. */
    private fun refillStaging() {
        val available = packer.availableBytes
        if (available == 0) return
        // write() only packs after a full drain, so pending bytes exist only
        // on the rare stop() path.
        val pending = staging.remaining()
        val carried = if (pending > 0) ByteArray(pending).also { staging.get(it) } else null
        val total = pending + available
        if (staging.capacity() < total) {
            staging = ByteBuffer.allocateDirect(maxOf(total, staging.capacity() * 2))
                .order(ByteOrder.nativeOrder())
        }
        if (transferScratch.size < available) {
            transferScratch = ByteArray(maxOf(available, transferScratch.size * 2))
        }
        staging.clear()
        if (carried != null) staging.put(carried)
        val read = packer.readInto(transferScratch, 0, available)
        staging.put(transferScratch, 0, read)
        staging.flip()
    }

    private companion object {
        const val INITIAL_STAGING_BYTES = 128 * 1024
        const val INITIAL_SCRATCH_BYTES = 32 * 1024

        /** stop() has no meaningful PTS for the padding tail. */
        const val LAST_WRITE_TIME_UNSET = 0L

        /** Distinctive error code marking a packer-side write failure. */
        const val ERROR_CODE_IEC_PACKER = -32601
    }
}
