package org.moonfin.androidtv

import android.app.Activity
import android.content.Context
import android.hardware.display.DisplayManager
import android.os.Build
import android.view.Display
import androidx.annotation.RequiresApi

/**
 * Reports what the attached display says about HDR as a set of facts rather
 * than as a verdict.
 *
 * A box that boots before its TV or AVR is awake answers every HDR question
 * with nothing, which on its own is indistinguishable from a real SDR panel.
 * Telling those apart needs the surrounding facts: whether a display was there
 * at all, whether it was powered, whether the HDR query returned an array or
 * null, and whether the sink identified itself over EDID. The caller decides
 * what that adds up to, so a display that couldn't answer is never recorded
 * as one that answered "no HDR".
 */
object DisplayCapabilities {
    const val STATE_UNKNOWN = "unknown"
    const val STATE_OFF = "off"
    const val STATE_ON = "on"
    const val STATE_DOZE = "doze"

    fun query(activity: Activity, trigger: String): Map<String, Any?> {
        val facts = mutableMapOf<String, Any?>(
            "trigger" to trigger,
            "sdkInt" to Build.VERSION.SDK_INT,
            "present" to false,
            "valid" to false,
            "state" to STATE_UNKNOWN,
            "answered" to false,
            "types" to emptyList<String>(),
            "supportedModeCount" to 0,
            "sinkId" to null,
            "sinkConnection" to null,
            "modeTypes" to emptyList<String>(),
            "displayCount" to 0,
        )

        // Each fact is read on its own. An OEM that throws on one of these
        // should cost us that fact, not collapse the whole reply into a false
        // "this panel has no HDR".
        facts["displayCount"] = runCatching {
            (activity.getSystemService(Context.DISPLAY_SERVICE) as? DisplayManager)
                ?.displays
                ?.size
                ?: 0
        }.getOrDefault(0)

        val display = runCatching { resolveDisplay(activity) }.getOrNull() ?: return facts
        facts["present"] = true
        facts["valid"] = runCatching { display.isValid }.getOrDefault(false)
        facts["state"] = runCatching { displayStateName(display.state) }
            .getOrDefault(STATE_UNKNOWN)
        facts["supportedModeCount"] = runCatching { display.supportedModes?.size ?: 0 }
            .getOrDefault(0)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            // getHdrCapabilities is deprecated at API 34 in favor of the
            // per-mode list, but the replacement reports only what the mode
            // currently in use carries, so a Dolby Vision TV parked in an SDR
            // mode answers empty. That's the same false negative this whole
            // probe exists to avoid, so the display-wide list stays primary and
            // the per-mode list is collected as a diagnostic only.
            @Suppress("DEPRECATION")
            val capabilities = runCatching { display.hdrCapabilities }.getOrNull()
            @Suppress("DEPRECATION")
            val supported = runCatching { capabilities?.supportedHdrTypes }.getOrNull()
            if (supported != null) {
                facts["answered"] = true
                facts["types"] = hdrTypeNames(supported)
            }
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            facts["modeTypes"] = runCatching {
                hdrTypeNames(display.mode?.supportedHdrTypes)
            }.getOrDefault(emptyList())
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            // EDID identity. Hashed here so the TV's make and model never
            // crosses the channel, since the only thing the caller needs is
            // whether a sink identified itself and whether it changed.
            facts["sinkId"] = runCatching {
                display.deviceProductInfo?.let { info ->
                    stableHash(
                        listOf(
                            info.name.orEmpty(),
                            info.manufacturerPnpId.orEmpty(),
                            info.productId.orEmpty(),
                        ).joinToString("|"),
                    )
                }
            }.getOrNull()
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            facts["sinkConnection"] = runCatching {
                sinkConnectionName(display.deviceProductInfo?.connectionToSinkType)
            }.getOrNull()
        }

        return facts
    }

    /** The HDR types the display reports, in the names the Dart side uses. */
    fun hdrTypeNames(types: IntArray?): List<String> {
        if (types == null) return emptyList()
        return types.map { type ->
            when (type) {
                Display.HdrCapabilities.HDR_TYPE_DOLBY_VISION -> "DOLBY_VISION"
                Display.HdrCapabilities.HDR_TYPE_HDR10 -> "HDR10"
                Display.HdrCapabilities.HDR_TYPE_HDR10_PLUS -> "HDR10_PLUS"
                Display.HdrCapabilities.HDR_TYPE_HLG -> "HLG"
                else -> type.toString()
            }
        }
    }

    fun displayStateName(state: Int): String {
        return when (state) {
            Display.STATE_ON, Display.STATE_ON_SUSPEND, Display.STATE_VR -> STATE_ON
            Display.STATE_OFF -> STATE_OFF
            Display.STATE_DOZE, Display.STATE_DOZE_SUSPEND -> STATE_DOZE
            else -> STATE_UNKNOWN
        }
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    fun sinkConnectionName(connection: Int?): String? {
        if (connection == null) return null
        return when (connection) {
            android.hardware.display.DeviceProductInfo.CONNECTION_TO_SINK_BUILT_IN -> "builtIn"
            android.hardware.display.DeviceProductInfo.CONNECTION_TO_SINK_DIRECT -> "direct"
            android.hardware.display.DeviceProductInfo.CONNECTION_TO_SINK_TRANSITIVE -> "transitive"
            else -> STATE_UNKNOWN
        }
    }

    private fun resolveDisplay(activity: Activity): Display? {
        val fromActivity = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            // Throws rather than returning null when the activity is not
            // attached, which is why the caller wraps this.
            runCatching { activity.display }.getOrNull()
        } else {
            @Suppress("DEPRECATION")
            runCatching { activity.windowManager.defaultDisplay }.getOrNull()
        }
        if (fromActivity != null) return fromActivity
        return runCatching {
            (activity.getSystemService(Context.DISPLAY_SERVICE) as? DisplayManager)
                ?.getDisplay(Display.DEFAULT_DISPLAY)
        }.getOrNull()
    }

    private fun stableHash(value: String): String =
        Integer.toHexString(value.hashCode()).padStart(8, '0')
}
