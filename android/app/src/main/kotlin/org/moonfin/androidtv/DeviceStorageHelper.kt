package org.moonfin.androidtv

import android.os.StatFs
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/** Answers Dart's free-space question for the volume holding a path. */
class DeviceStorageHelper : MethodChannel.MethodCallHandler {

    companion object {
        const val CHANNEL = "com.moonfin/device_storage"
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "freeBytes" -> {
                val path = call.argument<String>("path")
                if (path.isNullOrEmpty()) {
                    result.success(null)
                    return
                }
                result.success(runCatching { StatFs(path).availableBytes }.getOrNull())
            }
            else -> result.notImplemented()
        }
    }
}
