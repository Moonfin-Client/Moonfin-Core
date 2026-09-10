package org.moonfin.androidtv

import android.app.ActivityManager

/** Whether this process currently has a foreground activity. */
fun isAppInForeground(): Boolean {
    val state = ActivityManager.RunningAppProcessInfo()
    ActivityManager.getMyMemoryState(state)
    return state.importance <=
        ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND
}
