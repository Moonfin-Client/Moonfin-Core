package org.moonfin.nativevideo

import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.PorterDuff
import android.graphics.PorterDuffXfermode
import android.view.View
import androidx.media3.common.Format
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.common.Tracks
import androidx.media3.common.VideoSize
import androidx.media3.common.util.Consumer
import androidx.media3.common.util.UnstableApi
import androidx.media3.extractor.text.CuesWithTiming
import androidx.media3.extractor.text.Subtitle
import androidx.media3.extractor.text.SubtitleParser
import io.github.peerless2012.ass.AssFrame
import io.github.peerless2012.ass.AssTexType
import io.github.peerless2012.ass.media.AssHandler
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.RejectedExecutionException
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean

/*
 * libass isn't thread safe. One ASS_Library, ASS_Renderer and ASS_Track may
 * only be touched by one thread at a time, and ass-media drives them from
 * three without a lock: the ExoPlayer loader thread feeds dialogue chunks and
 * attachment fonts, its own executor renders frames, and the playback thread
 * swaps tracks and frame sizes. A chunk that reallocs the event array while
 * the renderer walks it segfaults inside ass_render_frame.
 *
 * Everything here funnels those calls through one monitor, the AssHandler
 * instance. addFont and createTrack are already @Synchronized so that's their
 * monitor too, and monitors are reentrant, so nesting through library code
 * that takes it is safe.
 *
 * This replaces ass-media's own overlay views and executor rather than
 * wrapping them, because that executor is private, renders with no lock, and
 * gives no way to wait for an in-flight frame at shutdown.
 */

/**
 * Draws ASS subtitle bitmaps over the video, rendering off the playback thread
 * and holding the [assHandler] monitor for every libass call.
 */
@UnstableApi
class MoonfinAssOverlayView(
    context: Context,
    private val assHandler: AssHandler,
) : View(context) {

    private val paint = Paint().apply {
        xfermode = PorterDuffXfermode(PorterDuff.Mode.SRC_OVER)
    }

    private var executor: ExecutorService? = null

    // Retired for good. A plain detach only parks the render thread, since the
    // view comes back as-is when the host window reattaches.
    @Volatile
    private var released = false

    // The newest time the playback thread asked for. The task reads it when it
    // starts, so a queued render lands on the latest position, not a stale one.
    @Volatile
    private var pendingTimeUs = 0L

    // The subtitle delay for the track on screen. libass keeps event times
    // from the script itself, so a later cue means asking it for an earlier
    // moment of the script.
    @Volatile
    var timeOffsetUs = 0L

    // Bounds the executor queue to one task. Cleared by the task itself.
    private val renderScheduled = AtomicBoolean(false)

    @Volatile
    private var currentFrame: AssFrame? = null

    private val renderTask = Runnable {
        try {
            val timeUs = pendingTimeUs
            val frame = try {
                synchronized(assHandler) {
                    if (released) {
                        null
                    } else {
                        assHandler.render?.renderFrame(timeUs / 1000, AssTexType.BITMAP_ALPHA)
                    }
                }
            } catch (error: Throwable) {
                // A dropped frame beats taking the process down.
                null
            }
            publishFrame(frame)
        } finally {
            renderScheduled.set(false)
        }
    }

    init {
        setWillNotDraw(false)
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        if (released) return
        if (executor == null) {
            executor = Executors.newSingleThreadExecutor { runnable ->
                Thread(runnable, "moonfin-ass-render")
            }
        }
        assHandler.videoTimeCallback = ::requestRender
        // The renderer is rebuilt per media item, so the frames drawn from the
        // previous one have to go with it.
        assHandler.renderCallback = {
            currentFrame = null
            postInvalidate()
        }
    }

    override fun onDetachedFromWindow() {
        // Parked, not retired. The host container detaches and reattaches
        // around backgrounding while its player carries on.
        stopRendering()
        super.onDetachedFromWindow()
    }

    /**
     * Retires this overlay and waits for the in-flight frame to leave libass.
     *
     * Must run before the AssHandler and its native objects are dropped, or a
     * render already inside ass_render_frame outlives the library it reads.
     * Idempotent, and safe to call on a view that was never attached.
     */
    fun release() {
        released = true
        stopRendering()
    }

    private fun stopRendering() {
        assHandler.videoTimeCallback = null
        assHandler.renderCallback = null
        val executor = this.executor
        this.executor = null
        if (executor != null) {
            executor.shutdown()
            try {
                if (!executor.awaitTermination(SHUTDOWN_TIMEOUT_MS, TimeUnit.MILLISECONDS)) {
                    // The native call can't be interrupted, so this only stops
                    // anything still queued behind it.
                    executor.shutdownNow()
                }
            } catch (interrupted: InterruptedException) {
                Thread.currentThread().interrupt()
            }
        }
        renderScheduled.set(false)
        currentFrame = null
    }

    // Called on the ExoPlayer playback thread for every video frame, so it
    // stays off the lock and never blocks.
    private fun requestRender(presentationTimeUs: Long) {
        if (released) return
        // The renderer only exists once a track has been created, so this keeps
        // content without ASS from waking the render thread on every frame.
        if (assHandler.render == null) return
        pendingTimeUs = presentationTimeUs - timeOffsetUs
        if (!renderScheduled.compareAndSet(false, true)) return
        val executor = this.executor
        if (executor == null) {
            renderScheduled.set(false)
            return
        }
        try {
            executor.execute(renderTask)
        } catch (rejected: RejectedExecutionException) {
            renderScheduled.set(false)
        }
    }

    private fun publishFrame(frame: AssFrame?) {
        // changed == 0 means libass produced the same content again, so the
        // frame already on screen stands and redrawing it is wasted work.
        if (frame != null && frame.changed == 0) return
        if (frame == null && currentFrame == null) return
        frame?.images?.forEach { it.bitmap?.prepareToDraw() }
        currentFrame = frame
        postInvalidate()
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        val frame = currentFrame ?: return
        frame.images?.forEach { image ->
            val bitmap = image.bitmap ?: return@forEach
            // libass packs RGBA with an inverted alpha byte.
            val r = image.color shr 24 and 0xFF
            val g = image.color shr 16 and 0xFF
            val b = image.color shr 8 and 0xFF
            val a = 0xFF - image.color and 0xFF
            paint.color = (a shl 24) or (r shl 16) or (g shl 8) or b
            canvas.drawBitmap(bitmap, image.x.toFloat(), image.y.toFloat(), paint)
        }
    }

    private companion object {
        // Long enough for a frame already inside libass to land, short enough
        // that teardown never visibly stalls.
        const val SHUTDOWN_TIMEOUT_MS = 250L
    }
}

/**
 * Wraps ass-media's parser factory so every parse holds the [assHandler]
 * monitor. Track creation, header reads and dialogue reads all run on the
 * loading thread, concurrent with the overlay's render thread.
 */
@UnstableApi
class MoonfinAssParserFactory(
    private val delegate: SubtitleParser.Factory,
    private val assHandler: AssHandler,
) : SubtitleParser.Factory {

    override fun supportsFormat(format: Format): Boolean = delegate.supportsFormat(format)

    override fun getCueReplacementBehavior(format: Format): Int =
        delegate.getCueReplacementBehavior(format)

    // create() reaches ass.createTrack() and ass.createRender() for an ASS format.
    override fun create(format: Format): SubtitleParser =
        synchronized(assHandler) { MoonfinAssParser(delegate.create(format), assHandler) }
}

@UnstableApi
private class MoonfinAssParser(
    private val delegate: SubtitleParser,
    private val assHandler: AssHandler,
) : SubtitleParser {

    override fun getCueReplacementBehavior(): Int = delegate.cueReplacementBehavior

    override fun parse(
        data: ByteArray,
        offset: Int,
        length: Int,
        outputOptions: SubtitleParser.OutputOptions,
        output: Consumer<CuesWithTiming>,
    ) {
        synchronized(assHandler) { delegate.parse(data, offset, length, outputOptions, output) }
    }

    override fun parse(
        data: ByteArray,
        outputOptions: SubtitleParser.OutputOptions,
        output: Consumer<CuesWithTiming>,
    ) {
        synchronized(assHandler) { delegate.parse(data, outputOptions, output) }
    }

    override fun parseToLegacySubtitle(data: ByteArray, offset: Int, length: Int): Subtitle =
        synchronized(assHandler) { delegate.parseToLegacySubtitle(data, offset, length) }

    override fun reset() {
        synchronized(assHandler) { delegate.reset() }
    }
}

/**
 * Forwards the player callbacks AssHandler acts on under its own monitor.
 * Those callbacks swap the track and resize the renderer from the playback
 * thread, so they take the same lock the render itself takes.
 */
@UnstableApi
class MoonfinAssPlayerListener(private val assHandler: AssHandler) : Player.Listener {

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        synchronized(assHandler) { assHandler.onMediaItemTransition(mediaItem, reason) }
    }

    override fun onTracksChanged(tracks: Tracks) {
        synchronized(assHandler) { assHandler.onTracksChanged(tracks) }
    }

    override fun onSurfaceSizeChanged(width: Int, height: Int) {
        synchronized(assHandler) { assHandler.onSurfaceSizeChanged(width, height) }
    }

    override fun onVideoSizeChanged(videoSize: VideoSize) {
        synchronized(assHandler) { assHandler.onVideoSizeChanged(videoSize) }
    }
}
