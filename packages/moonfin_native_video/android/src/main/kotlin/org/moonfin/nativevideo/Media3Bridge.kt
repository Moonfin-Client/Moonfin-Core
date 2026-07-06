package org.moonfin.nativevideo

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

object Media3Bridge {
    private val mainHandler = Handler(Looper.getMainLooper())

    private val fallbackState = mapOf(
        "positionMs" to 0L,
        "durationMs" to 0L,
        "bufferedMs" to 0L,
        "isPlaying" to false,
        "isBuffering" to false,
        "playbackSpeed" to 1.0,
        "videoWidth" to 0,
        "videoHeight" to 0,
    )

    private val fallbackTracks = mapOf(
        "audioTracks" to emptyList<Map<String, Any?>>(),
        "subtitleTracks" to emptyList<Map<String, Any?>>(),
    )

    private val fallbackUiMetadata = mapOf(
        "hasPrevious" to false,
        "hasNext" to false,
        "selectedBitrateMbps" to null,
        "skipBackMs" to 10000,
        "skipForwardMs" to 10000,
        "topTitle" to "",
        "topSubtitle" to "",
        "artworkUrl" to "",
        "showClock" to false,
        "zoomModeLabel" to "",
        "streamInfoSections" to emptyList<Map<String, Any?>>(),
        "hasCastCrew" to false,
        "castPeople" to emptyList<Map<String, Any?>>(),
        "canCastControl" to false,
        "castKindLabel" to "",
        "castStateLabel" to "",
        "castPositionMs" to 0L,
        "castVolume" to null,
        "chapters" to emptyList<Map<String, Any?>>(),
    )

    @Volatile
    private var uiMetadata: Map<String, Any?> = fallbackUiMetadata

    @Volatile
    private var preferFfmpegDecoder = false

    @Volatile
    private var sessionTunnelingDisabled = false

    @Volatile
    private var mapDolbyVisionProfile7ToHevc = false

    @Volatile
    private var allowExternalAudioEffects = true

    @Volatile
    private var frameRateSwitchingBehavior = "disabled"

    @Volatile
    private var activeView: Media3VideoView? = null

    @Volatile
    private var eventSink: EventChannel.EventSink? = null

    private val pendingCalls = ArrayDeque<Pair<String, Any?>>()

    // Lets a persistent (still-mounted) view reclaim control routing after
    // another view attached. Everything here stays on the main thread, where
    // platform view create/dispose and method-channel callbacks all run.
    private val viewRegistry = HashMap<Int, Media3VideoView>()

    fun registerView(viewId: Int, view: Media3VideoView) {
        if (viewId < 0) return
        viewRegistry[viewId] = view
    }

    fun unregisterView(viewId: Int, view: Media3VideoView) {
        if (viewId < 0) return
        if (viewRegistry[viewId] === view) {
            viewRegistry.remove(viewId)
        }
    }

    fun attachView(view: Media3VideoView) {
        mainHandler.post {
            val oldView = activeView
            if (oldView != null && oldView !== view) {
                oldView.forceReleasePlayer()
            }
            activeView = view
            emitEvent(
                mapOf(
                    "event" to "viewReady",
                ),
            )
            flushPendingCalls(view)
        }
    }

    fun detachView(view: Media3VideoView) {
        mainHandler.post {
            if (activeView === view) {
                activeView = null
                emitEvent(
                    mapOf(
                        "event" to "viewDisposed",
                    ),
                )
            }
        }
    }

    fun setEventSink(sink: EventChannel.EventSink?) {
        mainHandler.post {
            eventSink = sink
        }
    }

    fun emitEvent(event: Map<String, Any?>) {
        mainHandler.post {
            eventSink?.success(event)
        }
    }

    fun preferFfmpegDecoderEnabled(): Boolean = preferFfmpegDecoder

    fun sessionTunnelingDisabledEnabled(): Boolean = sessionTunnelingDisabled

    fun mapDolbyVisionProfile7ToHevcEnabled(): Boolean = mapDolbyVisionProfile7ToHevc

    fun allowExternalAudioEffectsEnabled(): Boolean = allowExternalAudioEffects

    fun frameRateSwitchingBehavior(): String = frameRateSwitchingBehavior

    fun setSessionTunnelingDisabledEnabled(value: Boolean) {
        sessionTunnelingDisabled = value
    }

    fun handleMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "activateView") {
            val id = ((call.arguments as? Map<*, *>)?.get("viewId") as? Number)?.toInt()
            val view = id?.let { viewRegistry[it] }
            if (view != null && view.isReattachable()) {
                view.ensurePlayerAlive()
                // The posted attachView runs before the next channel message;
                // attaching the already-active view just flushes the queue.
                attachView(view)
                result.success(true)
            } else {
                result.success(false)
            }
            return
        }

        if (call.method == "setUiMetadata") {
            uiMetadata = normalizeUiMetadata(call.arguments as? Map<*, *>)
            activeView?.refreshNowPlayingMetadata()
            result.success(null)
            return
        }

        if (call.method == "setDecoderPreferences") {
            val args = call.arguments as? Map<*, *>
            preferFfmpegDecoder = args?.get("preferFfmpeg") as? Boolean ?: false
            (args?.get("tunnelingDisabled") as? Boolean)?.let {
                sessionTunnelingDisabled = it
            }
            (args?.get("mapDolbyVisionProfile7ToHevc") as? Boolean)?.let {
                mapDolbyVisionProfile7ToHevc = it
            }
            (args?.get("allowExternalAudioEffects") as? Boolean)?.let {
                allowExternalAudioEffects = it
            }
            frameRateSwitchingBehavior =
                args?.get("frameRateSwitchingBehavior")?.toString()?.trim()?.lowercase()
                    ?: "disabled"

            val view = activeView
            if (view != null) {
                view.handleControlCall(call, result)
            } else {
                result.success(null)
            }
            return
        }

        val view = activeView
        if (view != null) {
            view.handleControlCall(call, result)
            return
        }

        when (call.method) {
            "getState" -> {
                result.success(activeState())
            }

            "setSource",
            "play",
            "pause",
            "stop",
            "seek",
            "setVolume",
            "setSpeed",
            "setZoomMode",
            "setAudioTrack",
            "setSubtitleTrack",
            "disableSubtitleTrack",
            "setAudioDelay",
            "setSubtitleDelay",
            "setRepeatMode",
            "setSkipSilence",
            "setVolumeBoost",
            "setSubtitleRendererMode",
            "disableTunnelingForSession",
            "addExternalSubtitle",
            "configureSubtitleStyle",
            -> {
                queueCall(call.method, call.arguments)
                result.success(null)
            }

            else -> {
                result.error("NO_MEDIA3_VIEW", "Media3 view is not attached", null)
            }
        }
    }

    private fun queueCall(method: String, args: Any?) {
        synchronized(pendingCalls) {
            pendingCalls.addLast(method to args)
            while (pendingCalls.size > 64) {
                pendingCalls.removeFirst()
            }
        }
    }

    fun dispatchControl(method: String, args: Any? = null) {
        val view = activeView
        if (view != null) {
            view.handleQueuedCall(method, args)
            return
        }
        queueCall(method, args)
    }

    fun activeState(): Map<String, Any?> {
        val view = activeView ?: return fallbackState
        return view.stateSnapshot()
    }

    fun activeTracks(): Map<String, Any?> {
        val view = activeView ?: return fallbackTracks
        return view.trackSnapshot()
    }

    fun activeUiMetadata(): Map<String, Any?> = uiMetadata

    private fun normalizeUiMetadata(args: Map<*, *>?): Map<String, Any?> {
        if (args == null) {
            return fallbackUiMetadata
        }

        val hasPrevious = args["hasPrevious"] as? Boolean ?: false
        val hasNext = args["hasNext"] as? Boolean ?: false
        val selectedBitrateMbps = (args["selectedBitrateMbps"] as? Number)?.toInt()
        val skipBackMs = (args["skipBackMs"] as? Number)?.toInt() ?: 10000
        val skipForwardMs = (args["skipForwardMs"] as? Number)?.toInt() ?: 10000
        val topTitle = args["topTitle"]?.toString() ?: ""
        val topSubtitle = args["topSubtitle"]?.toString() ?: ""
        val artworkUrl = args["artworkUrl"]?.toString() ?: ""
        val showClock = args["showClock"] as? Boolean ?: false
        val zoomModeLabel = args["zoomModeLabel"]?.toString() ?: ""
        val hasCastCrew = args["hasCastCrew"] as? Boolean ?: false
        val canCastControl = args["canCastControl"] as? Boolean ?: false
        val castKindLabel = args["castKindLabel"]?.toString() ?: ""
        val castStateLabel = args["castStateLabel"]?.toString() ?: ""
        val castPositionMs = (args["castPositionMs"] as? Number)?.toLong() ?: 0L
        val castVolume = (args["castVolume"] as? Number)?.toDouble()

        val rawSections = args["streamInfoSections"] as? List<*> ?: emptyList<Any?>()
        val streamInfoSections = rawSections.mapNotNull { raw ->
            val section = raw as? Map<*, *> ?: return@mapNotNull null
            val title = section["title"]?.toString()?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
            val rawRows = section["rows"] as? List<*> ?: emptyList<Any?>()
            val rows = rawRows.mapNotNull { rowRaw ->
                val row = rowRaw as? Map<*, *> ?: return@mapNotNull null
                val label = row["label"]?.toString()?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
                val value = row["value"]?.toString() ?: return@mapNotNull null
                val highlight = row["highlight"] as? Boolean ?: false
                mapOf(
                    "label" to label,
                    "value" to value,
                    "highlight" to highlight,
                )
            }
            mapOf(
                "title" to title,
                "rows" to rows,
            )
        }

        val rawPeople = args["castPeople"] as? List<*> ?: emptyList<Any?>()
        val castPeople = rawPeople.mapNotNull { raw ->
            val person = raw as? Map<*, *> ?: return@mapNotNull null
            val name = person["name"]?.toString()?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
            val subtitle = person["subtitle"]?.toString() ?: ""
            val personId = person["personId"]?.toString() ?: ""
            val imageUrl = person["imageUrl"]?.toString() ?: ""
            val serverId = person["serverId"]?.toString() ?: ""
            mapOf(
                "name" to name,
                "subtitle" to subtitle,
                "personId" to personId,
                "imageUrl" to imageUrl,
                "serverId" to serverId,
            )
        }

        val rawChapters = args["chapters"] as? List<*> ?: emptyList<Any?>()
        val chapters = rawChapters.mapNotNull { raw ->
            val chapter = raw as? Map<*, *> ?: return@mapNotNull null
            val title = chapter["title"]?.toString()?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
            val startMs = (chapter["startMs"] as? Number)?.toLong() ?: return@mapNotNull null
            mapOf(
                "title" to title,
                "startMs" to startMs,
            )
        }

        return mapOf(
            "hasPrevious" to hasPrevious,
            "hasNext" to hasNext,
            "selectedBitrateMbps" to selectedBitrateMbps,
            "skipBackMs" to skipBackMs,
            "skipForwardMs" to skipForwardMs,
            "topTitle" to topTitle,
            "topSubtitle" to topSubtitle,
            "artworkUrl" to artworkUrl,
            "showClock" to showClock,
            "zoomModeLabel" to zoomModeLabel,
            "streamInfoSections" to streamInfoSections,
            "hasCastCrew" to hasCastCrew,
            "castPeople" to castPeople,
            "canCastControl" to canCastControl,
            "castKindLabel" to castKindLabel,
            "castStateLabel" to castStateLabel,
            "castPositionMs" to castPositionMs,
            "castVolume" to castVolume,
            "chapters" to chapters,
        )
    }

    private fun flushPendingCalls(view: Media3VideoView) {
        val queued = mutableListOf<Pair<String, Any?>>()
        synchronized(pendingCalls) {
            while (pendingCalls.isNotEmpty()) {
                queued.add(pendingCalls.removeFirst())
            }
        }

        for ((method, args) in queued) {
            view.handleQueuedCall(method, args)
        }
    }
}
