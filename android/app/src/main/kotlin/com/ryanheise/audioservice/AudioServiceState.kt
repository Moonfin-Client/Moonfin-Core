package com.ryanheise.audioservice

import android.util.Log

// AudioService.instance is package private, so the lookup lives in the
// plugin's package.
object AudioServiceState {
    fun isPlaying(): Boolean = AudioService.instance?.isPlaying() == true

    // audio_service marks Dart ready once and never unmarks it. After
    // MainActivity swaps the car's engine for a fresh one, a car browse call
    // would reach a Dart side with no handler yet and throw in
    // MediaBrowserServiceCompat. Clearing the flag makes audio_service queue
    // those calls until the new engine configures it. The field is private,
    // hence the reflection, and proguard-rules.pro keeps its name.
    fun markFlutterNotReady() {
        try {
            val field = AudioServicePlugin::class.java.getDeclaredField("flutterReady")
            field.isAccessible = true
            field.setBoolean(null, false)
        } catch (e: Exception) {
            Log.w("AudioServiceState", "couldn't reset audio_service's ready flag", e)
        }
    }
}
