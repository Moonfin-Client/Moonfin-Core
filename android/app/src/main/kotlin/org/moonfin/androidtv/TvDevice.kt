package org.moonfin.androidtv

import android.app.UiModeManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.content.res.Configuration
import java.io.File

/**
 * Whether this device is a TV, or null when the platform could not answer.
 *
 * Both signals are calls into system_server, which is contended enough right
 * after a boot or a wake to throw. Callers need to tell that apart from a real
 * "no", because answering "no" puts the phone UI on a TV for the whole session.
 */
fun isTelevisionOrNull(context: Context): Boolean? {
    // The leanback feature is a static property of the device, so it is the
    // signal to trust when both answer. Some uncertified boxes only report the
    // older television feature.
    val hasLeanback = runCatching {
        val pm = context.packageManager
        pm.hasSystemFeature(PackageManager.FEATURE_LEANBACK) ||
            pm.hasSystemFeature("android.hardware.type.television") ||
            pm.hasSystemFeature("amazon.hardware.fire_tv")
    }.getOrNull()
    if (hasLeanback == true) {
        rememberTv(context)
        return true
    }
    // A box seen as a TV before stays one when the checks above can't answer,
    // or the phone UI lands on it for the session.
    if (isKnownTv(context)) return true

    val uiModeType = runCatching {
        (context.getSystemService(Context.UI_MODE_SERVICE) as? UiModeManager)?.currentModeType
    }.getOrNull()
    // A handheld reporting the television ui mode on its own was enough to put
    // the leanback UI on a phone for the whole session, so this weaker signal
    // now only counts when nothing reports a touchscreen. A check that goes
    // unanswered is left alone so a real television cant land in the phone UI.
    if (uiModeType == Configuration.UI_MODE_TYPE_TELEVISION &&
        hasTouchscreenOrNull(context) != true
    ) {
        return true
    }

    return if (hasLeanback == false && uiModeType != null) false else null
}

private fun hasTouchscreenOrNull(context: Context): Boolean? = runCatching {
    context.packageManager.hasSystemFeature(PackageManager.FEATURE_TOUCHSCREEN)
}.getOrNull()

fun isTelevision(context: Context): Boolean = isTelevisionOrNull(context) == true

/** Whether the phone layout is usable, which takes a touchscreen on a device that isn't TV-only. */
fun supportsTouchLayoutOrNull(context: Context): Boolean? = runCatching {
    val pm = context.packageManager
    pm.hasSystemFeature(PackageManager.FEATURE_TOUCHSCREEN) &&
        !pm.hasSystemFeature(PackageManager.FEATURE_LEANBACK_ONLY)
}.getOrNull()

/**
 * Only a TV launcher starts the app through LEANBACK_LAUNCHER, which also
 * catches boxes that report no TV feature at all.
 */
fun rememberLeanbackLaunch(context: Context, intent: Intent?) {
    if (intent?.hasCategory(Intent.CATEGORY_LEANBACK_LAUNCHER) == true) rememberTv(context)
}

// Only the static signals are remembered, never the ui mode guess. The file
// sits outside backups so a TV's answer can't be restored onto a phone.
private fun knownTvMarker(context: Context) = File(context.noBackupFilesDir, "known_tv")

private fun rememberTv(context: Context) {
    runCatching { knownTvMarker(context).createNewFile() }
}

private fun isKnownTv(context: Context): Boolean =
    runCatching { knownTvMarker(context).exists() }.getOrDefault(false)
