package org.moonfin.nativevideo

import io.github.peerless2012.ass.media.AssHandler
import java.util.concurrent.ConcurrentLinkedQueue

/**
 * Dialogue the MKV loader has extracted but libass hasn't read yet.
 *
 * In typeset scenes the overlay's render thread holds the libass lock almost
 * continuously. A loader that waits for it stops buffering video, so it queues
 * lines here instead and the render thread feeds them in before each render.
 */
class AssDialogueQueue {

    private class Line(
        val epoch: Int,
        val trackId: String?,
        val startMs: Long,
        val durationMs: Long,
        val data: ByteArray,
    )

    private val lines = ConcurrentLinkedQueue<Line>()

    /**
     * Advanced by [clear]. A track output reads it when its track is created
     * and passes it to [add], so lines from an outgoing media item's loader are
     * dropped rather than fed into the next item's tracks, which reuse its ids.
     */
    @Volatile
    var epoch = 0
        private set

    /** Copies the line, since the extractor reuses [data]. */
    fun add(
        epoch: Int,
        trackId: String?,
        startMs: Long,
        durationMs: Long,
        data: ByteArray,
        offset: Int,
        length: Int,
    ) {
        if (epoch != this.epoch) return
        lines.add(Line(epoch, trackId, startMs, durationMs, data.copyOfRange(offset, offset + length)))
    }

    fun drainInto(assHandler: AssHandler) {
        synchronized(assHandler) { drain(assHandler::readTrackDialogue) }
    }

    internal fun drain(read: (trackId: String?, startMs: Long, durationMs: Long, data: ByteArray) -> Unit) {
        while (true) {
            val line = lines.poll() ?: return
            if (line.epoch == epoch) read(line.trackId, line.startMs, line.durationMs, line.data)
        }
    }

    /** Call when the handler drops its tracks for a new media item. */
    fun clear() {
        epoch++
        lines.clear()
    }
}
