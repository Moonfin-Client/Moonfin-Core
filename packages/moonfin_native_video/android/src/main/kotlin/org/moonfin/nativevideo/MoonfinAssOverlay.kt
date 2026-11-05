package org.moonfin.nativevideo

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
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
import io.github.peerless2012.ass.AssTex
import io.github.peerless2012.ass.AssTexType
import io.github.peerless2012.ass.media.AssHandler
import io.github.peerless2012.ass.media.parser.AssNoOpSubtitleParser
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
    private val assDialogue: AssDialogueQueue,
) : View(context) {

    // Render thread only.
    private val compositePaint = Paint().apply {
        xfermode = PorterDuffXfermode(PorterDuff.Mode.SRC_OVER)
    }

    private val buffers = AssCompositeBuffers()
    private val renderSerial = Any()
    private val drawPaint = Paint()

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

    // [ink] keeps each image's own rect for the secondary to avoid.
    private class Composite(
        val bitmap: Bitmap,
        val left: Int,
        val top: Int,
        val ink: List<Rect>,
    )

    // libass reports differences from its last actual render, not from the
    // selected track. Retain that image and its owner across unrendered switches.
    // [frame]'s bitmaps are recycled once flattened, so draw [composite], which
    // is null when the frame had no pixels.
    private data class CachedFrame(
        val track: Any,
        val frame: AssFrame,
        val composite: Composite?,
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

    // The MKV loader calls this after queueing a dialogue line. A paused
    // player may never produce another clock callback.
    fun onAssDialogueLoaded() {
        if (awaitingPausedSeekDialogue && primaryAssTrackActive && primaryVisible) {
            redrawCurrentAssFrame()
        }
    }

    fun stopAwaitingPausedSeekDialogue() {
        awaitingPausedSeekDialogue = false
    }

    private fun visibleCachedFrame(): CachedFrame? {
        if (!primaryVisible || !primaryAssTrackActive) return null
        val cached = cachedFrame ?: return null
        return cached.takeIf { it.visible && it.track === primaryNativeTrack }
    }

    private val renderTask = Runnable {
        // Clear before sampling the time so a request arriving mid-render is
        // never mistaken for one already handled by this task.
        renderPending.set(false)
        var generation = -1
        try {
            // A render that outlived stopRendering's timeout may still be running
            // when a reattached view starts its next executor.
            generation = synchronized(renderSerial) { renderAndPublish() }
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

    // Returns the track generation the frame was rendered for.
    private fun renderAndPublish(): Int {
        var generation: Int
        val timeUs = pendingTimeUs
        var track: Any? = null
        var render: Any? = null
        var frame: AssFrame? = null
        synchronized(assHandler) {
            track = assHandler.track
            syncNativeAssTrack(track)
            generation = primaryTrackGeneration
            render = assHandler.render
            frame = try {
                assDialogue.drainInto(assHandler)
                if (released || track == null) {
                    null
                } else {
                    assHandler.render?.renderFrame(timeUs / 1000, AssTexType.BITMAP_ALPHA)
                }
            } catch (error: Throwable) {
                // A dropped frame beats taking the process down.
                null
            }
        }
        // The images are Java copies, so flattening doesn't need the lock.
        val flattened = flattenFrame(frame)
        synchronized(assHandler) {
            when {
                // A rebuilt renderer won't compare its next frame with this one.
                released || assHandler.render !== render -> Unit
                generation == primaryTrackGeneration ->
                    publishFrame(frame, flattened, generation, track != null)
                else -> retainUnconfirmedFrame(track, frame, flattened)
            }
        }
        return generation
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
        buffers.clear()
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

    private class Flattened(val composite: Composite?)

    // Null when the frame has no images. A failure leaves nothing to draw,
    // rather than letting a later unchanged render show older pixels.
    private fun flattenFrame(frame: AssFrame?): Flattened? {
        val images = frame?.images?.takeUnless { it.isEmpty() } ?: return null
        return try {
            Flattened(flatten(images))
        } catch (error: Throwable) {
            Flattened(null)
        }
    }

    private fun publishFrame(
        frame: AssFrame?,
        flattened: Flattened?,
        generation: Int,
        hasActiveTrack: Boolean,
    ) {
        if (!hasActiveTrack || generation != primaryTrackGeneration) return
        val retained = cachedFrame
        if (frame?.changed == 0) {
            // Identical pixels may come from another track. The native render
            // confirms they are valid for the newly selected track as well.
            if (retained == null || (retained.visible && retained.track === primaryNativeTrack)) return
            cachedFrame = retained.copy(track = requireNotNull(primaryNativeTrack), visible = true)
        } else if (frame == null || flattened == null) {
            // No current cue (or no dialogue loaded yet): hide the image but
            // keep its pixels. An unchanged render can still need them later.
            if (retained == null || !retained.visible) return
            cachedFrame = retained.copy(visible = false)
        } else {
            cachedFrame = CachedFrame(requireNotNull(primaryNativeTrack), frame, flattened.composite)
        }
        postInvalidate()
    }

    /*
     * The track changed while this frame was being flattened. libass has
     * already rendered it, so its next unchanged-frame report refers to these
     * pixels. Keep them as the cached image, hidden until a render for the
     * current selection confirms them.
     */
    private fun retainUnconfirmedFrame(track: Any?, frame: AssFrame?, flattened: Flattened?) {
        if (track == null || frame?.changed == 0) return
        cachedFrame = if (frame == null || flattened == null) {
            cachedFrame?.copy(visible = false)
        } else {
            CachedFrame(track, frame, flattened.composite, visible = false)
        }
        postInvalidate()
    }

    /*
     * ass-kt allocates a Bitmap per ASS_Image on every changed frame, over a
     * thousand in typeset scenes. Left to the GC, their native pixels outrun the
     * reference queue until the process is killed for memory. Nothing else
     * holds them, so recycle them as soon as they're drawn into the buffer.
     *
     * Null if no image has pixels.
     */
    private fun flatten(images: Array<AssTex>): Composite? {
        try {
            var left = Int.MAX_VALUE
            var top = Int.MAX_VALUE
            var right = Int.MIN_VALUE
            var bottom = Int.MIN_VALUE
            val ink = ArrayList<Rect>(images.size)
            for (image in images) {
                val bitmap = image.bitmap?.takeUnless { it.isRecycled } ?: continue
                val rect = Rect(image.x, image.y, image.x + bitmap.width, image.y + bitmap.height)
                if (rect.isEmpty) continue
                ink.add(rect)
                left = minOf(left, rect.left)
                top = minOf(top, rect.top)
                right = maxOf(right, rect.right)
                bottom = maxOf(bottom, rect.bottom)
            }
            if (ink.isEmpty()) return null

            val target = buffers.acquire(right - left, bottom - top, cachedFrame?.composite?.bitmap)
            val canvas = Canvas(target)
            for (image in images) {
                val bitmap = image.bitmap?.takeUnless { it.isRecycled } ?: continue
                // libass packs RGBA with an inverted alpha byte.
                val r = image.color shr 24 and 0xFF
                val g = image.color shr 16 and 0xFF
                val b = image.color shr 8 and 0xFF
                val a = 0xFF - image.color and 0xFF
                compositePaint.color = (a shl 24) or (r shl 16) or (g shl 8) or b
                canvas.drawBitmap(
                    bitmap,
                    (image.x - left).toFloat(),
                    (image.y - top).toFloat(),
                    compositePaint,
                )
            }
            return Composite(target, left, top, ink)
        } finally {
            images.forEach { it.bitmap?.recycle() }
        }
    }

    // Where the primary was last drawn, so a secondary can keep clear of it.
    var onInkChanged: ((List<Rect>) -> Unit)? = null
    private var lastInk: List<Rect> = emptyList()

    private fun reportInk(ink: List<Rect>) {
        if (ink == lastInk) return
        lastInk = ink
        onInkChanged?.let { report -> post { report(ink) } }
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        // One lock for both, so acquire() can't hand this buffer out in between.
        val composite = synchronized(buffers) {
            visibleCachedFrame()?.composite.also {
                // A software canvas is done with the pixels when onDraw returns.
                if (canvas.isHardwareAccelerated) buffers.markDrawn(it?.bitmap)
            }
        }
        reportInk(composite?.ink.orEmpty())
        if (composite == null) return
        canvas.drawBitmap(composite.bitmap, composite.left.toFloat(), composite.top.toFloat(), drawPaint)
    }

    private companion object {
        // Long enough for a frame already inside libass to land, short enough
        // that teardown never visibly stalls.
        const val SHUTDOWN_TIMEOUT_MS = 250L
    }
}

/**
 * Reusable buffers for [MoonfinAssOverlayView]'s flattened frames.
 *
 * A hardware display list points at a mutable bitmap's pixels instead of
 * copying them, and reads them again at every sync. A buffer is safe to
 * change once a recording without it has been synced, which is certain by the
 * second hardware draw after its last one. Buffers are never recycled, only
 * reused or dropped, so even a mistimed read can't hit freed pixels.
 *
 * [acquire] calls must not overlap. Only the overlay's render thread makes them.
 */
internal class AssCompositeBuffers {

    private class Buffer(val bitmap: Bitmap) {
        var lastDrawn = NEVER_DRAWN
    }

    private val buffers = ArrayList<Buffer>(MAX_BUFFERS)
    private var draws = 0L

    val size: Int @Synchronized get() = buffers.size

    /** Never returns [current], the bitmap on screen. */
    fun acquire(width: Int, height: Int, current: Bitmap?): Bitmap {
        val needed = width.toLong() * height * BYTES_PER_PIXEL
        // Clear and allocate outside the lock so onDraw isn't kept waiting.
        val reused = synchronized(this) {
            val free = buffers.filter { it.bitmap !== current && isFree(it) }
            val fit = free.firstOrNull { it.bitmap.allocationByteCount >= needed }
            if (fit != null) {
                fit.lastDrawn = NEVER_DRAWN
            } else if (buffers.size >= MAX_BUFFERS) {
                // Dropped rather than recycled: hwui may still be reading it.
                val evict = free.firstOrNull()
                    ?: buffers.filter { it.bitmap !== current }.minByOrNull { it.lastDrawn }
                if (evict != null) buffers.remove(evict)
            }
            fit
        }
        if (reused != null) {
            reused.bitmap.reconfigure(width, height, Bitmap.Config.ARGB_8888)
            reused.bitmap.eraseColor(Color.TRANSPARENT)
            return reused.bitmap
        }
        // Rounded up so a growing caption doesn't reallocate every frame.
        val bitmap = Bitmap.createBitmap(roundUp(width), roundUp(height), Bitmap.Config.ARGB_8888)
        bitmap.reconfigure(width, height, Bitmap.Config.ARGB_8888)
        synchronized(this) { buffers.add(Buffer(bitmap)) }
        return bitmap
    }

    /** Call once per hardware-accelerated onDraw, with null if nothing was drawn. */
    @Synchronized
    fun markDrawn(bitmap: Bitmap?) {
        draws++
        if (bitmap == null) return
        buffers.firstOrNull { it.bitmap === bitmap }?.lastDrawn = draws
    }

    @Synchronized
    fun clear() {
        buffers.clear()
    }

    private fun isFree(buffer: Buffer) =
        buffer.lastDrawn == NEVER_DRAWN || draws >= buffer.lastDrawn + DRAWS_UNTIL_FREE

    private fun roundUp(value: Int) = (value + SIZE_STEP - 1) / SIZE_STEP * SIZE_STEP

    private companion object {
        const val MAX_BUFFERS = 3
        const val DRAWS_UNTIL_FREE = 2
        const val NEVER_DRAWN = Long.MIN_VALUE
        const val BYTES_PER_PIXEL = 4
        const val SIZE_STEP = 64
    }
}

/**
 * Wraps ass-media's parser factory so ASS track creation and every parse that
 * reaches libass hold the [assHandler] monitor. They run on the loading
 * thread, concurrent with the overlay's render thread.
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
    // Nor does parse() on the no-op parser for embedded MKV dialogue, which
    // runs on the loader for every sample.
    override fun create(format: Format): SubtitleParser {
        if (format.sampleMimeType != MimeTypes.TEXT_SSA) return delegate.create(format)
        val parser = synchronized(assHandler) { delegate.create(format) }
        return if (parser is AssNoOpSubtitleParser) parser else MoonfinAssParser(parser, assHandler)
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
    private val assDialogue: AssDialogueQueue,
    private val overlay: MoonfinAssOverlayView,
) : Player.Listener {

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        overlay.stopAwaitingPausedSeekDialogue()
        synchronized(assHandler) {
            assHandler.onMediaItemTransition(mediaItem, reason)
            assDialogue.clear()
        }
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
