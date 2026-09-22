package org.moonfin.nativevideo

import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.audio.AudioSink
import androidx.media3.exoplayer.audio.ForwardingAudioSink
import java.nio.ByteBuffer

/**
 * Watches the sink for a bitstream track that went silent and asks the player
 * to rebuild it, and holds a bitstream track through an HDMI route flap so
 * the player never hands it to a decoder. The decisions live in
 * [PassthroughSilenceRecovery] and [RouteFlapHold], this wrapper only feeds
 * them what the renderer already does: every call is a straight delegate plus
 * a few field reads, and until a dead track has been proven the sink behaves
 * byte for byte like the one it wraps.
 *
 * The flap hold works on the delegate's own state. A dead track is flushed,
 * which releases the output and keeps the configuration, and the first write
 * after the route returns rebuilds the same passthrough output from it. The
 * platform pins the sink's capabilities to plain stereo on a dead track until
 * the next device event, so the delegate's own answer for the input format is
 * a reliable "the route is back" signal.
 *
 * [onRecoveryNeeded] fires on the playback thread and must hand off to the
 * player's own thread itself.
 */
@UnstableApi
class PassthroughRecoveryAudioSink(
    delegate: AudioSink,
    private val recovery: PassthroughSilenceRecovery,
    private val flap: RouteFlapHold,
    private val onRecoveryNeeded: (reason: String) -> Unit,
    private val clock: () -> Long = SystemClock::elapsedRealtime,
) : ForwardingAudioSink(delegate) {

    private var inputFormat: Format? = null
    private var pendingWriteError: AudioSink.WriteException? = null
    private var playbackHandler: Handler? = null
    private var deferredNotify: Runnable? = null

    override fun setListener(listener: AudioSink.Listener) {
        super.setListener(FilteringListener(listener))
    }

    override fun configure(
        inputFormat: Format,
        specifiedBufferSize: Int,
        outputChannels: IntArray?,
    ) {
        this.inputFormat = inputFormat
        // The delegate reports capability changes on the thread it was
        // configured from, so that is the thread a deferral must land on.
        if (playbackHandler == null) {
            playbackHandler = Looper.myLooper()?.let { Handler(it) }
        }
        // Only a real bitstream counts for the capability deferral. Compressed
        // music rides through the sink too when it is offloaded, and a dead
        // offload track has to keep reaching the player's own offload fallback.
        // Decoded PCM opts into the rebuild anyway: it dies in a route
        // renegotiation just like a bitstream track, and the write error it
        // would otherwise surface reads upstream as proof the device can only
        // open a stereo track.
        val bitstream = AudioPassthroughPolicy.codecKeyForMime(inputFormat.sampleMimeType) != null
        val decodedPcm = inputFormat.sampleMimeType == MimeTypes.AUDIO_RAW
        flap.onConfigure(
            bitstream = bitstream,
            rebuildOnDeadTrack = bitstream || decodedPcm,
        )
        recovery.onConfigure(
            passthrough = !decodedPcm,
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
        flap.onReset()
        pendingWriteError = null
        cancelDeferredNotify()
        super.reset()
    }

    override fun release() {
        cancelDeferredNotify()
        super.release()
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

        val decision = flap.writeDecision(inputSupportedByDelegate(), clock())
        when (decision) {
            RouteFlapHold.Write.HOLD -> return false
            RouteFlapHold.Write.RETHROW -> pendingWriteError?.let {
                // The route never came back, so the player gets the error it
                // would have had straight away and recovers as it always did.
                pendingWriteError = null
                throw it
            }
            RouteFlapHold.Write.WRITE, RouteFlapHold.Write.REBUILD -> Unit
        }

        return try {
            val handled = super.handleBuffer(buffer, presentationTimeUs, encodedAccessUnitCount)
            if (decision == RouteFlapHold.Write.REBUILD && handled) {
                flap.onRebuilt()
                pendingWriteError = null
            }
            handled
        } catch (e: AudioSink.InitializationException) {
            if (decision != RouteFlapHold.Write.REBUILD) throw e
            // The route says it is back but the link is still settling. The
            // flush clears the delegate's retry deadline so the next write
            // tries again instead of failing the session.
            flush()
            false
        } catch (e: AudioSink.WriteException) {
            if (!RouteFlapHold.isDeadObjectCode(e.errorCode) || !flap.onDeadTrack(clock())) {
                throw e
            }
            // The flush releases the dead output and keeps the configuration,
            // so the write that resumes after the route returns rebuilds the
            // same bitstream track. The renderer keeps this buffer and offers
            // it again on its next pass.
            pendingWriteError = e
            flush()
            false
        }
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

    /** The delegate's live answer, below any policy veto layered above. */
    private fun inputSupportedByDelegate(): Boolean {
        val format = inputFormat ?: return false
        return super.supportsFormat(format)
    }

    private fun onCapabilitiesChanged(listener: AudioSink.Listener) {
        when (flap.onCapabilitiesChanged(inputSupportedByDelegate(), clock())) {
            RouteFlapHold.Notify.FORWARD -> {
                cancelDeferredNotify()
                listener.onAudioCapabilitiesChanged()
            }
            RouteFlapHold.Notify.SWALLOW -> cancelDeferredNotify()
            RouteFlapHold.Notify.DEFER -> scheduleDeferredNotify(listener)
        }
    }

    private fun scheduleDeferredNotify(listener: AudioSink.Listener) {
        if (deferredNotify != null) return
        val handler = playbackHandler
        if (handler == null) {
            // Nothing to defer on, so the player hears it now as it used to.
            flap.onDeferredNotifyDue()
            listener.onAudioCapabilitiesChanged()
            return
        }
        val runnable = Runnable {
            deferredNotify = null
            if (flap.onDeferredNotifyDue()) {
                listener.onAudioCapabilitiesChanged()
            }
        }
        deferredNotify = runnable
        handler.postDelayed(runnable, flap.maxHoldMs)
    }

    private fun cancelDeferredNotify() {
        deferredNotify?.let { playbackHandler?.removeCallbacks(it) }
        deferredNotify = null
    }

    /**
     * Forwards everything the delegate reports to the renderer's listener,
     * except a capabilities change, which goes through the flap hold first.
     */
    private inner class FilteringListener(
        private val inner: AudioSink.Listener,
    ) : AudioSink.Listener {
        override fun onPositionDiscontinuity() = inner.onPositionDiscontinuity()

        override fun onPositionAdvancing(playoutStartSystemTimeMs: Long) =
            inner.onPositionAdvancing(playoutStartSystemTimeMs)

        override fun onUnderrun(bufferSize: Int, bufferSizeMs: Long, elapsedSinceLastFeedMs: Long) =
            inner.onUnderrun(bufferSize, bufferSizeMs, elapsedSinceLastFeedMs)

        override fun onSkipSilenceEnabledChanged(skipSilenceEnabled: Boolean) =
            inner.onSkipSilenceEnabledChanged(skipSilenceEnabled)

        override fun onOffloadBufferEmptying() = inner.onOffloadBufferEmptying()

        override fun onOffloadBufferFull() = inner.onOffloadBufferFull()

        override fun onAudioSinkError(audioSinkError: Exception) =
            inner.onAudioSinkError(audioSinkError)

        override fun onAudioCapabilitiesChanged() = onCapabilitiesChanged(inner)

        override fun onAudioTrackInitialized(audioTrackConfig: AudioSink.AudioTrackConfig) =
            inner.onAudioTrackInitialized(audioTrackConfig)

        override fun onAudioTrackReleased(audioTrackConfig: AudioSink.AudioTrackConfig) =
            inner.onAudioTrackReleased(audioTrackConfig)

        override fun onSilenceSkipped() = inner.onSilenceSkipped()

        override fun onAudioSessionIdChanged(audioSessionId: Int) =
            inner.onAudioSessionIdChanged(audioSessionId)
    }
}
