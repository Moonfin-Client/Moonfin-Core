package org.moonfin.nativevideo

import android.graphics.Bitmap
import android.graphics.Color
import android.graphics.Rect
import io.github.peerless2012.ass.AssFrame
import io.github.peerless2012.ass.AssTex
import io.github.peerless2012.ass.media.AssHandler
import io.github.peerless2012.ass.media.type.AssRenderType
import java.util.concurrent.AbstractExecutorService
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean
import org.robolectric.RuntimeEnvironment

internal class MoonfinAssOverlayTestHarness(
    val handler: AssHandler = AssHandler(AssRenderType.OVERLAY_CANVAS),
) {
    val dialogue = AssDialogueQueue()
    val overlay = MoonfinAssOverlayView(RuntimeEnvironment.getApplication(), handler, dialogue)

    private fun field(name: String) = overlay.javaClass.getDeclaredField(name)
        .apply { isAccessible = true }

    private val generationField = field("primaryTrackGeneration")
    private val lastPresentationField = field("lastPresentationTimeUs")
    private val pendingTimeField = field("pendingTimeUs")
    private fun method(name: String) = overlay.javaClass.declaredMethods
        .single { it.name == name }
        .apply { isAccessible = true }

    private val flatten = method("flattenFrame")
    private val publish = method("publishFrame")
    private val retainUnconfirmed = method("retainUnconfirmedFrame")
    private val visible = method("visibleCachedFrame")

    val generation: Int get() = generationField.getInt(overlay)
    val lastPresentationTimeUs: Long get() = lastPresentationField.get(overlay) as Long
    var pendingTimeUs: Long
        get() = pendingTimeField.getLong(overlay)
        set(value) = pendingTimeField.setLong(overlay, value)

    val renderScheduled: AtomicBoolean
        get() = field("renderScheduled").get(overlay) as AtomicBoolean
    val renderPending: AtomicBoolean
        get() = field("renderPending").get(overlay) as AtomicBoolean
    val renderTask: Runnable
        get() = field("renderTask").get(overlay) as Runnable

    fun useExecutor(executor: AbstractExecutorService) {
        field("executor").set(overlay, executor)
    }

    fun publishFrame(
        frame: AssFrame?,
        generation: Int = this.generation,
        active: Boolean = true,
    ) {
        publish.invoke(overlay, frame, flatten.invoke(overlay, frame), generation, active)
    }

    // A frame whose track changed while it was flattened outside the lock.
    fun retainUnconfirmedFrame(track: Any?, frame: AssFrame?) {
        retainUnconfirmed.invoke(overlay, track, frame, flatten.invoke(overlay, frame))
    }

    fun frame(x: Int, y: Int, changed: Int = 1): AssFrame {
        val bitmap = Bitmap.createBitmap(2, 2, Bitmap.Config.ARGB_8888)
        return AssFrame(arrayOf(AssTex(x, y, 2, 2, 0, bitmap)), changed = changed)
    }

    fun cachedFrame(): AssFrame? = frameOf(field("cachedFrame").get(overlay))

    fun visibleFrame(): AssFrame? = frameOf(visible.invoke(overlay))

    private fun frameOf(cached: Any?): AssFrame? = cached?.let {
        it.javaClass.getDeclaredField("frame").apply { isAccessible = true }.get(it) as AssFrame
    }

    val buffers: AssCompositeBuffers
        get() = field("buffers").get(overlay) as AssCompositeBuffers

    class Piece(val x: Int, val y: Int, val w: Int, val h: Int, val assColor: Int)

    /** A frame shaped like ass-kt's BITMAP_ALPHA output. */
    fun alphaFrame(vararg pieces: Piece, changed: Int = 2): AssFrame =
        AssFrame(
            pieces.map { piece ->
                val mask = Bitmap.createBitmap(piece.w, piece.h, Bitmap.Config.ALPHA_8)
                mask.eraseColor(Color.BLACK)
                AssTex(piece.x, piece.y, piece.w, piece.h, piece.assColor, mask)
            }.toTypedArray(),
            changed = changed,
        )

    class CachedComposite(val bitmap: Bitmap, val left: Int, val top: Int, val ink: List<Rect>)

    fun cachedComposite(): CachedComposite? {
        val cached = field("cachedFrame").get(overlay) ?: return null
        val composite = cached.javaClass.getDeclaredField("composite")
            .apply { isAccessible = true }.get(cached) ?: return null
        fun <T> read(name: String): T {
            @Suppress("UNCHECKED_CAST")
            return composite.javaClass.getDeclaredField(name)
                .apply { isAccessible = true }.get(composite) as T
        }
        return CachedComposite(read("bitmap"), read("left"), read("top"), read("ink"))
    }
}

internal class RecordingExecutor : AbstractExecutorService() {
    val requests = mutableListOf<Runnable>()

    override fun execute(command: Runnable) {
        requests.add(command)
    }

    override fun shutdown() = Unit
    override fun shutdownNow(): MutableList<Runnable> = mutableListOf()
    override fun isShutdown() = false
    override fun isTerminated() = false
    override fun awaitTermination(timeout: Long, unit: TimeUnit) = true
}
