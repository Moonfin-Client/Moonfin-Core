package org.moonfin.nativevideo

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.view.Surface
import android.view.SurfaceHolder
import android.view.SurfaceView
import android.view.View
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import java.lang.reflect.Method

class NativeVideoView(
    context: Context,
    messenger: BinaryMessenger,
    viewId: Int,
) : PlatformView, SurfaceHolder.Callback, MethodChannel.MethodCallHandler {

    private val surfaceView = SurfaceView(context)
    private val channel = MethodChannel(messenger, "moonfin/native_video_$viewId")
    private val mainHandler = Handler(Looper.getMainLooper())

    private var surfaceRef: Long = 0L
    internal var leaveCensus: (() -> Unit)? = null
    private var pendingReleaseRef: Long = 0L
    private var releaseRunnable: Runnable? = null

    companion object {
        private var methodNewGlobalObjectRef: Method? = null
        private var methodDeleteGlobalObjectRef: Method? = null

        init {
            try {
                val cls = Class.forName("com.alexmercerind.mediakitandroidhelper.MediaKitAndroidHelper")
                methodNewGlobalObjectRef = cls.getDeclaredMethod("newGlobalObjectRef", Any::class.java).also { it.isAccessible = true }
                methodDeleteGlobalObjectRef = cls.getDeclaredMethod("deleteGlobalObjectRef", java.lang.Long.TYPE).also { it.isAccessible = true }
            } catch (_: Throwable) {}
        }

        fun newGlobalObjectRef(surface: Surface): Long {
            return try {
                (methodNewGlobalObjectRef?.invoke(null, surface) as? Long) ?: 0L
            } catch (_: Throwable) {
                0L
            }
        }

        fun deleteGlobalObjectRef(ref: Long) {
            if (ref == 0L) return
            try {
                methodDeleteGlobalObjectRef?.invoke(null, ref)
            } catch (_: Throwable) {}
        }
    }

    init {
        surfaceView.setZOrderMediaOverlay(true)
        // Hold the screen awake while the video surface is attached so the OS
        // screensaver cannot interrupt playback if the wakelock lapses.
        surfaceView.keepScreenOn = true
        surfaceView.holder.addCallback(this)
        channel.setMethodCallHandler(this)
    }

    override fun getView(): View = surfaceView

    override fun surfaceCreated(holder: SurfaceHolder) {
        surfaceRef = newGlobalObjectRef(holder.surface)
    }

    override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) {
        val ref = surfaceRef
        if (ref == 0L) return
        channel.invokeMethod(
            "onSurfaceReady",
            mapOf("wid" to ref, "width" to width, "height" to height),
        )
    }

    override fun surfaceDestroyed(holder: SurfaceHolder) {
        val ref = surfaceRef
        surfaceRef = 0L

        channel.invokeMethod("onSurfaceDestroyed", null)

        if (ref != 0L) {
            scheduleDeferredRelease(ref)
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "releaseRef" -> {
                cancelDeferredRelease()
                val ref = (call.arguments as? Number)?.toLong() ?: 0L
                deleteGlobalObjectRef(ref)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    override fun dispose() {
        leaveCensus?.invoke()
        channel.setMethodCallHandler(null)
        surfaceView.holder.removeCallback(this)

        cancelDeferredRelease()

        val ref = surfaceRef
        surfaceRef = 0L
        deleteGlobalObjectRef(ref)
    }

    private fun scheduleDeferredRelease(ref: Long) {
        cancelDeferredRelease()
        pendingReleaseRef = ref
        val r = Runnable {
            releaseRunnable = null
            val pending = pendingReleaseRef
            pendingReleaseRef = 0L
            deleteGlobalObjectRef(pending)
        }
        releaseRunnable = r
        mainHandler.postDelayed(r, 500L)
    }

    private fun cancelDeferredRelease() {
        releaseRunnable?.let { mainHandler.removeCallbacks(it) }
        releaseRunnable = null
        pendingReleaseRef = 0L
    }
}
