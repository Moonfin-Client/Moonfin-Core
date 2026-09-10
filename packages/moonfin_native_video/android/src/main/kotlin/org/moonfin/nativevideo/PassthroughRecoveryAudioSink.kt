package org.moonfin.nativevideo

import android.os.SystemClock
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.audio.AudioSink
import androidx.media3.exoplayer.audio.ForwardingAudioSink
import java.nio.ByteBuffer

/**
 * Watches the sink for a bitstream track that went silent and asks the player
 * to rebuild it. The decisions live in [PassthroughSilenceRecovery], this
 * wrapper only feeds it what the renderer already does: every call is a
 * straight delegate plus a few field reads, and until a dead track has been
 * proven the sink behaves byte for byte like the one it wraps.
 *
 * [onRecoveryNeeded] fires on the playback thread and must hand off to the
 * player's own thread itself.
 */
@UnstableApi
class PassthroughRecoveryAudioSink(
    delegate: AudioSink,
    private val recovery: PassthroughSilenceRecovery,
    private val onRecoveryNeeded: (reason: String) -> Unit,
    private val clock: () -> Long = SystemClock::elapsedRealtime,
) : ForwardingAudioSink(delegate) {

    override fun configure(
        inputFormat: Format,
        specifiedBufferSize: Int,
        outputChannels: IntArray?,
    ) {
        recovery.onConfigure(
            passthrough = inputFormat.sampleMimeType != MimeTypes.AUDIO_RAW,
            nowMs = clock(),
        )
        super.configure(inputFormat, specifiedBufferSize, outputChannels)
    }

    override fun play() {
        if (recovery.onPlay(clock())) {
            onRecoveryNeeded("resume on a route that already lost one track")
        }
        super.play()
    }

    override fun pause() {
        recovery.onPause()
        super.pause()
    }

    override fun flush() {
        recovery.onFlush(clock())
        super.flush()
    }

    override fun reset() {
        recovery.onReset(clock())
        super.reset()
    }

    override fun handleBuffer(
        buffer: ByteBuffer,
        presentationTimeUs: Long,
        encodedAccessUnitCount: Int,
    ): Boolean {
        // Refusing the write is ordinary sink backpressure to the renderer.
        // It only happens right after a recovery flush, so the old track gets
        // released before the first write here opens its replacement.
        if (recovery.shouldHoldWrites(clock())) return false
        return super.handleBuffer(buffer, presentationTimeUs, encodedAccessUnitCount)
    }

    override fun getCurrentPositionUs(sourceEnded: Boolean): Long {
        val positionUs = super.getCurrentPositionUs(sourceEnded)
        if (!sourceEnded &&
            recovery.onPosition(positionUs, hasPendingData(), clock())
        ) {
            onRecoveryNeeded("position frozen with data waiting")
        }
        return positionUs
    }
}
