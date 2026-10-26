package org.moonfin.nativevideo

import android.graphics.Bitmap
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
    val overlay = MoonfinAssOverlayView(RuntimeEnvironment.getApplication(), handler)

    private fun field(name: String) = overlay.javaClass.getDeclaredField(name)
        .apply { isAccessible = true }

    private val generationField = field("primaryTrackGeneration")
    private val lastPresentationField = field("lastPresentationTimeUs")
    private val pendingTimeField = field("pendingTimeUs")
    private val publish = overlay.javaClass.getDeclaredMethod(
        "publishFrame",
        AssFrame::class.java,
        Int::class.javaPrimitiveType!!,
        Boolean::class.javaPrimitiveType!!,
    ).apply { isAccessible = true }
    private val visible = overlay.javaClass.getDeclaredMethod("visibleFrame")
        .apply { isAccessible = true }

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
        publish.invoke(overlay, frame, generation, active)
    }

    fun frame(x: Int, y: Int, changed: Int = 1): AssFrame {
        val bitmap = Bitmap.createBitmap(2, 2, Bitmap.Config.ARGB_8888)
        return AssFrame(arrayOf(AssTex(x, y, 2, 2, 0, bitmap)), changed = changed)
    }

    fun cachedFrame(): AssFrame? {
        val cached = field("cachedFrame").get(overlay) ?: return null
        return cached.javaClass.getDeclaredField("frame")
            .apply { isAccessible = true }.get(cached) as AssFrame
    }

    fun visibleFrame(): AssFrame? = visible.invoke(overlay) as AssFrame?
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
