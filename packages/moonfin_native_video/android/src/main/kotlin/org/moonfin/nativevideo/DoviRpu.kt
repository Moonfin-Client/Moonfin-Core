package org.moonfin.nativevideo

/**
 * Bridge to libdovi for rewriting a Dolby Vision profile 7 RPU NAL unit into
 * its profile 8.1 equivalent.
 *
 * The JNI shim always ships and dlopens libdovi.so at runtime, so a build
 * without the library still runs and [convertP7NalToP8] just returns null,
 * which the extractor chain treats as a downgrade to stripping.
 */
object DoviRpu {
    // Kept in step with the status codes in dovi_jni.c.
    private const val STATUS_READY = 0
    private const val STATUS_UNRESOLVED = 1
    private const val STATUS_NOT_FOUND = 2
    private const val STATUS_MISSING_SYMBOLS = 3
    private const val STATUS_SHIM_MISSING = 4

    private val loadError: Throwable? = runCatching {
        System.loadLibrary("moonfin_dovi")
    }.exceptionOrNull()

    private val status: Int by lazy {
        if (loadError != null) {
            STATUS_SHIM_MISSING
        } else {
            runCatching { nativeStatus() }.getOrDefault(STATUS_UNRESOLVED)
        }
    }

    fun isAvailable(): Boolean = status == STATUS_READY

    /** Why conversion is or is not available, for the playback report. */
    fun statusText(): String = when (status) {
        STATUS_READY -> "ready"
        STATUS_NOT_FOUND -> "libdovi.so not bundled for this ABI"
        STATUS_MISSING_SYMBOLS -> "libdovi.so is missing the expected functions"
        STATUS_SHIM_MISSING ->
            "moonfin_dovi shim did not load (${loadError?.message ?: "no detail"})"
        else -> "libdovi status unknown"
    }

    /**
     * Converts one unspec62 NAL unit, given without its start code, and
     * returns the replacement NAL unit or null when conversion is not
     * possible.
     */
    fun convertP7NalToP8(data: ByteArray, offset: Int, length: Int): ByteArray? {
        if (!isAvailable() || length <= 0) return null
        return runCatching { nativeConvert(data, offset, length) }.getOrNull()
    }

    private external fun nativeStatus(): Int

    private external fun nativeConvert(data: ByteArray, offset: Int, length: Int): ByteArray?
}
