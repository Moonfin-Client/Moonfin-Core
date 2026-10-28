package org.moonfin.nativevideo

import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.PorterDuff
import android.graphics.PorterDuffXfermode
import android.graphics.Rect
import android.os.Looper
import android.view.View
import androidx.media3.common.Format
import androidx.media3.common.MediaItem
import androidx.media3.common.MimeTypes
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
    // A newer time can arrive while that task is already rendering.
    private val renderPending = AtomicBoolean(false)

    // After a paused seek, embedded dialogue may arrive after the first
    // destination render. Keep requesting that position until playback resumes.
    @Volatile private var awaitingPausedSeekDialogue = false

    // libass reports differences from its last actual render, not from the
    // selected track. Retain that image and its owner across unrendered switches.
    private data class CachedFrame(
        val track: Any,
        val frame: AssFrame,
        val visible: Boolean = true,
    )

    @Volatile
    private var cachedFrame: CachedFrame? = null

    @Volatile
    private var primaryTrackGeneration = 0
    @Volatile
    private var primaryNativeTrack: Any? = null
    @Volatile
    private var primaryAssTrackActive = false

    @Volatile
    private var lastPresentationTimeUs: Long? = null

    // Hiding the cached image on Primary Off must not discard it: libass can
    // return changed=0 if the same subtitle is selected again while paused.
    @Volatile private var primaryVisible = true

    fun setPrimaryVisible(visible: Boolean) {
        if (primaryVisible == visible) return
        primaryVisible = visible
        invalidate()
    }

    // Called while holding the assHandler lock, both from its track listener
    // and before rendering. Off keeps the last native track identity so
    // reselecting it while paused can reuse an unchanged libass image.
    fun syncNativeAssTrack(track: Any?): Boolean {
        val wasActive = primaryAssTrackActive
        primaryAssTrackActive = track != null
        if (track == null) return false
        // Off retains the previous native identity, but re-enabling the same
        // track still needs a render at the current (possibly later) playhead.
        if (primaryNativeTrack === track) {
            if (wasActive) return false
            // An Off-time render may still be in flight. Invalidate its
            // generation without dropping this track's cached bitmap.
            primaryTrackGeneration++
            return true
        }
        primaryNativeTrack = track
        primaryTrackGeneration++
        // Hide the previous track immediately, but don't discard its bitmap:
        // A -> B -> A can complete without libass ever rendering B.
        if (Looper.myLooper() == Looper.getMainLooper()) {
            invalidate()
        } else {
            postInvalidate()
        }
        return true
    }

    fun redrawCurrentAssFrame() {
        lastPresentationTimeUs?.let(::requestRender)
    }

    fun rememberPlaybackPosition(positionMs: Long) {
        if (positionMs < 0L) return
        val presentationTimeUs = positionMs * 1000L
        lastPresentationTimeUs = presentationTimeUs
        pendingTimeUs = presentationTimeUs - timeOffsetUs
    }

    // Paused seeks may not produce a clock callback: ass-media forwards only
    // every third distinct timestamp. Render the destination explicitly.
    fun renderAtPlaybackPosition(positionMs: Long, waitForDialogue: Boolean = false) {
        if (positionMs < 0L) return
        awaitingPausedSeekDialogue = waitForDialogue
        requestRender(positionMs * 1000L)
    }

    // The MKV loader calls this after adding a dialogue chunk under the native
    // lock. A paused player may never produce another clock callback.
    fun onAssDialogueLoaded() {
        if (awaitingPausedSeekDialogue && primaryAssTrackActive && primaryVisible) {
            redrawCurrentAssFrame()
        }
    }

    fun stopAwaitingPausedSeekDialogue() {
        awaitingPausedSeekDialogue = false
    }

    private fun visibleFrame(): AssFrame? {
        if (!primaryVisible || !primaryAssTrackActive) return null
        val cached = cachedFrame ?: return null
        return cached.frame.takeIf { cached.visible && cached.track === primaryNativeTrack }
    }

    private val renderTask = Runnable {
        // Clear before sampling the time so a request arriving mid-render is
        // never mistaken for one already handled by this task.
        renderPending.set(false)
        var generation = -1
        try {
            val timeUs = pendingTimeUs
            synchronized(assHandler) {
                // Render and publish under the same lock as track activation.
                // Otherwise Off -> same-track can discard the new image and
                // libass's unchanged-frame retry can't reconstruct it.
                val track = assHandler.track
                syncNativeAssTrack(track)
                generation = primaryTrackGeneration
                val hasActiveTrack = track != null
                val frame = try {
                    if (released || !hasActiveTrack) {
                        null
                    } else {
                        assHandler.render?.renderFrame(timeUs / 1000, AssTexType.BITMAP_ALPHA)
                    }
                } catch (error: Throwable) {
                    // A dropped frame beats taking the process down.
                    null
                }
                publishFrame(frame, generation, hasActiveTrack)
            }
        } finally {
            renderScheduled.set(false)
            // A paused seek can change the time without changing the track.
            // Also retry any native track switch made during this render.
            val trackChanged = generation >= 0 &&
                generation != primaryTrackGeneration && primaryAssTrackActive
            if (!released && (renderPending.get() || trackChanged)) {
                scheduleRender()
            }
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
            // A rebuilt native renderer no longer owns the last bitmap.
            cachedFrame = null
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
        renderPending.set(false)
        awaitingPausedSeekDialogue = false
        cachedFrame = null
    }

    // Called on the ExoPlayer playback thread for every video frame, so it
    // stays off the lock and never blocks.
    private fun requestRender(presentationTimeUs: Long) {
        if (released) return
        lastPresentationTimeUs = presentationTimeUs
        pendingTimeUs = presentationTimeUs - timeOffsetUs
        // The renderer only exists once a track has been created, so this keeps
        // content without ASS from waking the render thread on every frame.
        if (assHandler.render == null) return
        renderPending.set(true)
        scheduleRender()
    }

    private fun scheduleRender() {
        if (released || !renderScheduled.compareAndSet(false, true)) return
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

    private fun publishFrame(frame: AssFrame?, generation: Int, hasActiveTrack: Boolean) {
        if (!hasActiveTrack || generation != primaryTrackGeneration) return
        val retained = cachedFrame
        if (frame?.changed == 0) {
            // Identical pixels may come from another track. The native render
            // confirms they are valid for the newly selected track as well.
            if (retained == null || (retained.visible && retained.track === primaryNativeTrack)) return
            cachedFrame = retained.copy(track = requireNotNull(primaryNativeTrack), visible = true)
        } else if (frame == null || frame.images.isNullOrEmpty()) {
            // No current cue (or no dialogue loaded yet): hide the image but
            // keep its pixels. An unchanged render can still need them later.
            if (retained == null || !retained.visible) return
            cachedFrame = retained.copy(visible = false)
        } else {
            frame.images?.forEach { it.bitmap?.prepareToDraw() }
            cachedFrame = CachedFrame(requireNotNull(primaryNativeTrack), frame)
        }
        postInvalidate()
    }

    // Where the primary was last drawn, so a secondary can keep clear of it.
    var onInkChanged: ((List<Rect>) -> Unit)? = null
    private var lastInk: List<Rect> = emptyList()

    private fun reportInk(frame: AssFrame?) {
        val ink = frame?.images.orEmpty().mapNotNull { image ->
            image.bitmap?.let { Rect(image.x, image.y, image.x + it.width, image.y + it.height) }
        }
        if (ink == lastInk) return
        lastInk = ink
        onInkChanged?.let { report -> post { report(ink) } }
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        val frame = visibleFrame()
        reportInk(frame)
        if (frame == null) return
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
 * Wraps ass-media's parser factory so every ASS parse holds the [assHandler]
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

    // create() reaches ass.createTrack() and ass.createRender() for an ASS
    // format. No other format touches libass, so those parse without the lock
    // and a long WebVTT file can't hold up the player callbacks waiting on it.
    override fun create(format: Format): SubtitleParser =
        if (format.sampleMimeType == MimeTypes.TEXT_SSA) {
            synchronized(assHandler) { MoonfinAssParser(delegate.create(format), assHandler) }
        } else {
            delegate.create(format)
        }
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
 * Those callbacks swap the track and resize the renderer from the main
 * thread, so they take the same lock the render itself takes.
 */
@UnstableApi
class MoonfinAssPlayerListener(
    private val assHandler: AssHandler,
    private val overlay: MoonfinAssOverlayView,
) : Player.Listener {

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        overlay.stopAwaitingPausedSeekDialogue()
        synchronized(assHandler) { assHandler.onMediaItemTransition(mediaItem, reason) }
    }

    override fun onTracksChanged(tracks: Tracks) {
        val changed = synchronized(assHandler) {
            assHandler.onTracksChanged(tracks)
            // Publish ownership before the render executor can read the new
            // libass track. An unchanged-frame retry has no bitmap to recover.
            overlay.syncNativeAssTrack(assHandler.track)
        }
        if (changed) overlay.redrawCurrentAssFrame()
    }

    override fun onSurfaceSizeChanged(width: Int, height: Int) {
        synchronized(assHandler) { assHandler.onSurfaceSizeChanged(width, height) }
    }

    override fun onVideoSizeChanged(videoSize: VideoSize) {
        synchronized(assHandler) { assHandler.onVideoSizeChanged(videoSize) }
    }
}
