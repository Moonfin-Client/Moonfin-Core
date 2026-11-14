package org.moonfin.androidtv

import android.app.Application
import android.content.Context
import android.content.pm.PackageManager
import android.opengl.EGL14
import android.opengl.EGLConfig
import android.opengl.GLES20
import android.os.Build
import android.os.Process
import android.util.Log
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterJNI
import io.flutter.embedding.engine.loader.FlutterLoader
import java.util.concurrent.Executors

class MoonfinApplication : Application() {
    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        // The activity, the audio service, the workers and plugin receivers can
        // each start the first engine, and the first start fixes the renderer
        // for the whole process, so the choice has to sit in the shared loader
        // rather than in one activity's shell args.
        FlutterInjector.setInstance(
            FlutterInjector.Builder().setFlutterLoader(RendererLoader()).build(),
        )
    }

    companion object {
        /** Which renderer this process asked for and why, for the diagnostic report. */
        internal var rendererSummary: String? = null
    }
}

/** Whether a TV box gets Impeller instead of the manifest's Skia. */
internal object ImpellerPolicy {
    /** Vulkan 1.1, in the encoding of FEATURE_VULKAN_HARDWARE_VERSION. */
    const val VULKAN_1_1 = 0x401000

    private val powerVrOnVulkan = listOf("BXE", "BXM", "BXS", "BXT", "CXT", "DXT")
    private val adrenoModel = Regex("""Adreno \(TM\) (\d+)""")

    fun deviceQualifies(
        sdkInt: Int,
        manufacturer: String,
        is64Bit: Boolean,
        vulkan11: Boolean,
    ): Boolean =
        sdkInt >= Build.VERSION_CODES.S &&
            is64Bit &&
            vulkan11 &&
            !manufacturer.equals("NVIDIA", ignoreCase = true) &&
            !manufacturer.equals("Amazon", ignoreCase = true)

    /**
     * Whether Impeller keeps this GPU on Vulkan. The engine moves PowerVR
     * before the B-Series and Adreno 650 and older onto OpenGL ES, which is
     * the backend that stutters on TV boxes, so only GPUs known to stay on
     * Vulkan qualify and anything unfamiliar keeps Skia.
     */
    fun gpuStaysOnVulkan(glRenderer: String?): Boolean {
        val name = glRenderer ?: return false
        if (name.startsWith("Mali-G")) return true
        if (name.contains("PowerVR")) return powerVrOnVulkan.any { name.contains(it) }
        val adreno = adrenoModel.find(name)?.groupValues?.get(1)?.toIntOrNull()
        return adreno != null && adreno > 650
    }
}

// The no-argument constructors read FlutterInjector.instance(), which would
// lock it before this loader could be installed.
private class RendererLoader :
    FlutterLoader(FlutterJNI(), Executors.newCachedThreadPool()) {
    override fun ensureInitializationComplete(
        applicationContext: Context,
        args: Array<String>?,
    ) {
        val flag = if (initialized()) null else impellerFlag(applicationContext)
        // Runtime args land after the manifest's, and the engine keeps the
        // last value of a flag.
        super.ensureInitializationComplete(
            applicationContext,
            if (flag == null) args else (args ?: emptyArray()) + flag,
        )
    }

    /** The --enable-impeller arg to add, or null to keep the manifest's. */
    private fun impellerFlag(context: Context): String? {
        val rendererMode = context
            .getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            .getString(RENDERER_MODE_KEY, null)
        if (rendererMode == "skia") {
            report("Skia (set in settings)")
            return "--enable-impeller=false"
        }
        // An unanswered check falls through to the TV box rules. A phone missing
        // Impeller costs less than a box landing on the GLES path.
        if (isTelevisionOrNull(context) == false) {
            report("Impeller (not a TV)")
            return "--enable-impeller=true"
        }
        val qualifies = ImpellerPolicy.deviceQualifies(
            sdkInt = Build.VERSION.SDK_INT,
            manufacturer = Build.MANUFACTURER,
            is64Bit = Process.is64Bit(),
            vulkan11 = context.packageManager.hasSystemFeature(
                PackageManager.FEATURE_VULKAN_HARDWARE_VERSION,
                ImpellerPolicy.VULKAN_1_1,
            ),
        )
        val renderer = if (qualifies) runCatching { glRenderer() }.getOrNull() else null
        val allowed = ImpellerPolicy.gpuStaysOnVulkan(renderer)
        val reason = if (qualifies) "GPU ${renderer ?: "unknown"}" else "device doesn't qualify"
        report("${if (allowed) "Impeller" else "Skia"} (auto, $reason)")
        return if (allowed) "--enable-impeller=true" else null
    }

    private fun report(summary: String) {
        MoonfinApplication.rendererSummary = summary
        Log.i(TAG, summary)
    }

    // The display is left initialized, since Flutter is about to use it.
    private fun glRenderer(): String? {
        val display = EGL14.eglGetDisplay(EGL14.EGL_DEFAULT_DISPLAY)
        val version = IntArray(2)
        if (display == EGL14.EGL_NO_DISPLAY ||
            !EGL14.eglInitialize(display, version, 0, version, 1)
        ) {
            return null
        }
        val configs = arrayOfNulls<EGLConfig>(1)
        val count = IntArray(1)
        val configAttributes = intArrayOf(
            EGL14.EGL_RENDERABLE_TYPE, EGL14.EGL_OPENGL_ES2_BIT,
            EGL14.EGL_SURFACE_TYPE, EGL14.EGL_PBUFFER_BIT,
            EGL14.EGL_NONE,
        )
        if (!EGL14.eglChooseConfig(display, configAttributes, 0, configs, 0, 1, count, 0) ||
            count[0] == 0
        ) {
            return null
        }
        val config = configs[0]
        val context = EGL14.eglCreateContext(
            display,
            config,
            EGL14.EGL_NO_CONTEXT,
            intArrayOf(EGL14.EGL_CONTEXT_CLIENT_VERSION, 2, EGL14.EGL_NONE),
            0,
        )
        if (context == EGL14.EGL_NO_CONTEXT) return null
        val surface = EGL14.eglCreatePbufferSurface(
            display,
            config,
            intArrayOf(EGL14.EGL_WIDTH, 1, EGL14.EGL_HEIGHT, 1, EGL14.EGL_NONE),
            0,
        )
        try {
            if (surface == EGL14.EGL_NO_SURFACE ||
                !EGL14.eglMakeCurrent(display, surface, surface, context)
            ) {
                return null
            }
            return GLES20.glGetString(GLES20.GL_RENDERER)
        } finally {
            EGL14.eglMakeCurrent(
                display,
                EGL14.EGL_NO_SURFACE,
                EGL14.EGL_NO_SURFACE,
                EGL14.EGL_NO_CONTEXT,
            )
            if (surface != EGL14.EGL_NO_SURFACE) EGL14.eglDestroySurface(display, surface)
            EGL14.eglDestroyContext(display, context)
        }
    }

    companion object {
        private const val TAG = "MoonfinRenderer"

        // UserPreferences.rendererMode, which shared_preferences stores under
        // the flutter. prefix.
        private const val RENDERER_MODE_KEY = "flutter.pref_renderer"
    }
}
