package org.moonfin.nativevideo

import android.content.Context
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
    private var doviCompatMode = "off"

    @Volatile
    private var allowExternalAudioEffects = true

    @Volatile
    private var frameRateSwitchingBehavior = "disabled"

    @Volatile
    private var passthroughMode = "auto"

    @Volatile
    private var passthroughCodecs: Set<String> = emptySet()

    // How bitstreams reach the AudioTrack: "platform" (raw codec encodings,
    // the Android HAL packs) or "iec" (app-side IEC 61937 packing).
    @Volatile
    private var passthroughOutput = "platform"

    @Volatile
    private var downmixToStereo = false

    @Volatile
    private var activeView: Media3VideoView? = null

    // Audio needs no surface, so it plays on this host rather than a platform
    // view. The plugin instance that created it owns it.
    private lateinit var appContext: Context
    private var headlessHost: Media3VideoView? = null
    private var hostOwner: Any? = null

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
        mainHandler.post { attachViewNow(view) }
    }

    fun isActive(view: Media3VideoView): Boolean = activeView === view

    fun onPluginAttached(context: Context) {
        appContext = context.applicationContext
    }

    // A host whose engine is gone has nothing left to stop it, so it goes with
    // its owner.
    fun onPluginDetached(plugin: Any, sink: EventChannel.EventSink?) {
        if (hostOwner === plugin) {
            destroyHeadlessHost()
        }
        if (sink != null && eventSink === sink) {
            synchronized(pendingCalls) { pendingCalls.clear() }
        }
    }

    private fun slotOf(view: Media3VideoView?): Media3SlotPolicy.Slot = when {
        view == null -> Media3SlotPolicy.Slot.NONE
        view === headlessHost -> Media3SlotPolicy.Slot.HOST
        view.role == "preview" -> Media3SlotPolicy.Slot.PREVIEW
        else -> Media3SlotPolicy.Slot.MAIN
    }

    private fun attachViewNow(view: Media3VideoView) {
        val oldView = activeView
        // A source that already landed on the outgoing main view moves with
        // the slot. Flutter can mount the replacement after setSource was
        // dispatched, and the incoming view would otherwise own the surface
        // with nothing loaded.
        var carriedSource: Map<*, *>? = null
        if (oldView != null && oldView !== view) {
            val action = Media3SlotPolicy.attach(
                incomingIsPreview = view.role == "preview",
                slot = slotOf(oldView),
                slotPlayerLive = oldView.isPlayerLive(),
                slotHasLiveSource = oldView.hasLiveSource(),
            )
            // A declined view stays registered so activateView or its own
            // source can promote it later.
            if (action == Media3SlotPolicy.AttachAction.DECLINE) return
            if (oldView === headlessHost) {
                destroyHeadlessHost()
            } else {
                oldView.forceReleasePlayer()
                if (action == Media3SlotPolicy.AttachAction.TAKE_CARRY) {
                    carriedSource = oldView.handoverSourceArguments()
                }
            }
        }
        activeView = view
        emitViewReady()
        // A queued source is the newer intent, so it wins over the carried
        // one rather than being replayed after it.
        val flushedSource = flushPendingCalls(view)
        if (carriedSource != null && !flushedSource) {
            view.ensurePlayerAlive()
            view.handleQueuedCall("setSource", carriedSource)
        }
    }

    private fun emitViewReady() {
        emitEvent(
            mapOf(
                "event" to "viewReady",
            ),
        )
    }

    // Runs synchronously so the source can't race a posted attach or be
    // overwritten by a source queued for a view that never mounted.
    private fun routeToHost(call: MethodCall, result: MethodChannel.Result, caller: Any) {
        synchronized(pendingCalls) { pendingCalls.clear() }
        val current = activeView
        if (current !== headlessHost) current?.forceReleasePlayer()
        val existing = headlessHost
        val host = existing ?: Media3VideoView(appContext, isHeadlessHost = true)
        headlessHost = host
        hostOwner = caller
        activeView = host
        if (existing == null) emitViewReady()
        host.handleControlCall(call, result)
        host.syncTicker()
    }

    private fun destroyHeadlessHost() {
        val host = headlessHost ?: return
        headlessHost = null
        hostOwner = null
        if (activeView === host) {
            activeView = null
        }
        host.destroyHeadless()
    }

    // The newest platform view still able to play, for a video source that
    // arrives after the host displaced it.
    private fun newestMountedMainView(): Media3VideoView? =
        viewRegistry.entries
            .filter { it.value.role == "main" && it.value.isReattachable() }
            .maxByOrNull { it.key }
            ?.value

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

    // Only drops the sink if this caller still owns it. Secondary FlutterEngines
    // in the process, like WatchNextWorker's background engine, also register
    // NativeVideoPlugin, and their teardown must not sever the foreground engine's
    // event stream. That froze the player OSD while ExoPlayer kept playing. This
    // guards clearing only; a background isolate must never register the playback
    // module and open its own sink.
    fun clearEventSink(sink: EventChannel.EventSink?) {
        mainHandler.post {
            if (eventSink === sink) {
                eventSink = null
            }
        }
    }

    fun emitEvent(event: Map<String, Any?>) {
        mainHandler.post {
            eventSink?.success(event)
        }
    }

    fun preferFfmpegDecoderEnabled(): Boolean = preferFfmpegDecoder

    fun sessionTunnelingDisabledEnabled(): Boolean = sessionTunnelingDisabled

    fun doviCompatMode(): String = doviCompatMode

    fun allowExternalAudioEffectsEnabled(): Boolean = allowExternalAudioEffects

    fun frameRateSwitchingBehavior(): String = frameRateSwitchingBehavior

    fun passthroughMode(): String = passthroughMode

    fun passthroughCodecs(): Set<String> = passthroughCodecs

    fun passthroughOutput(): String = passthroughOutput

    fun downmixToStereoEnabled(): Boolean = downmixToStereo

    fun setSessionTunnelingDisabledEnabled(value: Boolean) {
        sessionTunnelingDisabled = value
    }

    fun handleMethodCall(call: MethodCall, result: MethodChannel.Result, caller: Any) {
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

        if (call.method == "setAllowUntrustedTls") {
            val args = call.arguments as? Map<*, *>
            InsecureTls.setAllowed(args?.get("enabled") as? Boolean ?: false)
            result.success(null)
            return
        }

        if (call.method == "setDecoderPreferences") {
            val args = call.arguments as? Map<*, *>
            preferFfmpegDecoder = args?.get("preferFfmpeg") as? Boolean ?: false
            (args?.get("tunnelingDisabled") as? Boolean)?.let {
                sessionTunnelingDisabled = it
            }
            (args?.get("doviCompatMode") as? String)?.let {
                doviCompatMode = it
            }
            (args?.get("allowExternalAudioEffects") as? Boolean)?.let {
                allowExternalAudioEffects = it
            }
            frameRateSwitchingBehavior =
                args?.get("frameRateSwitchingBehavior")?.toString()?.trim()?.lowercase()
                    ?: "disabled"
            passthroughMode =
                (args?.get("passthroughMode")?.toString()?.trim()?.lowercase())
                    .takeIf { it == "disabled" || it == "auto" || it == "manual" }
                    ?: "auto"
            passthroughCodecs =
                (args?.get("passthroughCodecs") as? List<*>)
                    ?.mapNotNull { it?.toString()?.trim()?.lowercase() }
                    ?.filter { it in AudioPassthroughPolicy.KNOWN_CODECS }
                    ?.toSet()
                    ?: emptySet()
            passthroughOutput =
                (args?.get("passthroughOutput")?.toString()?.trim()?.lowercase())
                    .takeIf { it == "platform" || it == "iec" }
                    ?: "platform"
            (args?.get("downmixToStereo") as? Boolean)?.let {
                downmixToStereo = it
            }

            val view = activeView
            if (view != null) {
                view.handleControlCall(call, result)
            } else {
                result.success(null)
            }
            return
        }

        if (call.method == "setSource") {
            val sourceArgs = call.arguments as? Map<*, *>
            val current = activeView
            val mounted = newestMountedMainView()
            val route = Media3SlotPolicy.routeSource(
                isPreview = sourceArgs?.get("preview") as? Boolean ?: false,
                isAudio = sourceArgs?.get("mediaType")?.toString()?.lowercase() == "audio",
                slot = slotOf(current),
                slotReattachable = current?.isReattachable() == true,
                slotPlayerLive = current?.isPlayerLive() == true,
                slotHasLiveSource = current?.hasLiveSource() == true,
                hasMountedMain = mounted != null,
            )
            when (route) {
                Media3SlotPolicy.SourceRoute.TO_HOST -> {
                    routeToHost(call, result, caller)
                    return
                }
                Media3SlotPolicy.SourceRoute.REATTACH_MOUNTED -> {
                    val target = mounted ?: return queueSourceForNextView(call, result)
                    destroyHeadlessHost()
                    target.ensurePlayerAlive()
                    attachViewNow(target)
                    target.handleControlCall(call, result)
                    return
                }
                Media3SlotPolicy.SourceRoute.QUEUE -> {
                    queueSourceForNextView(call, result)
                    return
                }
                Media3SlotPolicy.SourceRoute.DROP -> {
                    result.success(null)
                    return
                }
                Media3SlotPolicy.SourceRoute.TO_ACTIVE -> Unit
            }
        }

        if (call.method == "release" && headlessHost != null && activeView === headlessHost) {
            // Trailer teardown releases the shared backend whenever main playback
            // starts, and that must never stop music. An idle host is cheap to
            // keep for the next song.
            result.success(null)
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
            "setLetterboxCrop",
            "setAudioTrack",
            "setSubtitleTrack",
            "setClosedCaptionTrack",
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

    // Drops the slot and queues the source so the flush lands on the view that
    // mounts next, rather than the one holding the slot now.
    private fun queueSourceForNextView(call: MethodCall, result: MethodChannel.Result) {
        val current = activeView
        if (current === headlessHost) destroyHeadlessHost() else current?.forceReleasePlayer()
        activeView = null
        queueCall(call.method, call.arguments)
        result.success(null)
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

    /** Returns whether the flushed calls included a source to load. */
    private fun flushPendingCalls(view: Media3VideoView): Boolean {
        val queued = mutableListOf<Pair<String, Any?>>()
        synchronized(pendingCalls) {
            while (pendingCalls.isNotEmpty()) {
                queued.add(pendingCalls.removeFirst())
            }
        }

        for ((method, args) in queued) {
            view.handleQueuedCall(method, args)
        }
        return queued.any { (method, _) -> method == "setSource" }
    }
}
