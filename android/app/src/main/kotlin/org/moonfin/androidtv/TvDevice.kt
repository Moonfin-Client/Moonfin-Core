package org.moonfin.androidtv

import android.app.UiModeManager
import android.content.Context
import android.content.pm.PackageManager
import android.content.res.Configuration

fun isTelevision(context: Context): Boolean {
    val uiModeManager = context.getSystemService(Context.UI_MODE_SERVICE) as? UiModeManager
    val pm = context.packageManager
    return uiModeManager?.currentModeType == Configuration.UI_MODE_TYPE_TELEVISION ||
        pm.hasSystemFeature(PackageManager.FEATURE_LEANBACK) ||
        pm.hasSystemFeature("amazon.hardware.fire_tv")
}
