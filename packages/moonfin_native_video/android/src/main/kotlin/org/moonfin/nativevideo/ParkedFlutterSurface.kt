package org.moonfin.nativevideo

import android.view.SurfaceHolder
import android.view.View
import io.flutter.embedding.android.FlutterImageView
import io.flutter.embedding.android.FlutterSurfaceView
import io.flutter.embedding.android.FlutterView
import java.lang.ref.WeakReference

/**
 * Empties the surface Flutter parks under a platform view.
 *
 * While a platform view is on screen, hybrid composition draws Flutter through
 * an image view and only pauses its own SurfaceView, which keeps showing the
 * last frame drawn before the switch. That surface sits under the video. It's
 * normally covered, but a panel that upscales the UI plane, like a Shield at
 * 4K, softens the edge of the hole the video shows through, and the old frame
 * leaks out along the picture as a strip of stale UI.
 *
 * Hiding the paused surface for a moment destroys its buffer. A paused
 * FlutterSurfaceView ignores that destroy and the create after it, and nothing
 * draws into the new surface until Flutter takes it back, so all that's left
 * under the video is black.
 */
internal object ParkedFlutterSurface {
    private const val RESTORE_DELAY_MS = 500L

    // Flutter builds a new image view every time it parks its surface, so the
    // one we last cleared under says whether the parked frame is still the
    // empty one we left.
    private var clearedUnder = WeakReference<View>(null)

    fun clear(platformView: View) {
        val flutterView = platformView.flutterViewAncestor() ?: return
        val children = (0 until flutterView.childCount).map(flutterView::getChildAt)
        // Overlays are image views too. Only the background one means Flutter
        // has paused its own surface, and hiding it any other time would take
        // away the surface Flutter is drawing into.
        val imageView = children.firstOrNull { it.javaClass == FlutterImageView::class.java } ?: return
        if (clearedUnder.get() === imageView) return
        val surfaceView = children.firstNotNullOfOrNull { it as? FlutterSurfaceView } ?: return
        if (surfaceView.visibility != View.VISIBLE) return
        val holder = surfaceView.holder
        if (!holder.surface.isValid) return

        clearedUnder = WeakReference(imageView)
        val callback = object : SurfaceHolder.Callback {
            override fun surfaceCreated(holder: SurfaceHolder) = Unit

            override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) = Unit

            override fun surfaceDestroyed(holder: SurfaceHolder) {
                holder.removeCallback(this)
                surfaceView.post { surfaceView.visibility = View.VISIBLE }
            }
        }
        holder.addCallback(callback)
        surfaceView.visibility = View.INVISIBLE
        // Flutter needs its surface back when it stops parking it, so it comes
        // back even if the destroy never arrives.
        surfaceView.postDelayed({
            holder.removeCallback(callback)
            surfaceView.visibility = View.VISIBLE
        }, RESTORE_DELAY_MS)
    }

    private fun View.flutterViewAncestor(): FlutterView? {
        var ancestor = parent
        while (ancestor != null) {
            if (ancestor is FlutterView) return ancestor
            ancestor = ancestor.parent
        }
        return null
    }
}
