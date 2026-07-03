package org.moonfin.nativevideo

import android.app.ActivityManager
import android.app.Activity
import android.app.UiModeManager
import android.content.Context
import android.content.Intent
import android.content.ContextWrapper
import android.content.res.Configuration
import android.graphics.Color
import android.graphics.Typeface
import android.media.MediaCodecList
import android.media.audiofx.AudioEffect
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.view.Gravity
import android.view.Display
import android.view.Surface
import android.view.SurfaceView
import android.view.TextureView
import android.view.View
import android.widget.FrameLayout
import androidx.annotation.OptIn
import androidx.core.content.getSystemService
import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.MimeTypes
import androidx.media3.common.PlaybackException
import androidx.media3.common.PlaybackParameters
import androidx.media3.common.Player
import androidx.media3.common.TrackGroup
import androidx.media3.common.TrackSelectionParameters
import androidx.media3.common.TrackSelectionOverride
import androidx.media3.common.VideoSize
import androidx.media3.common.audio.AudioProcessor
import androidx.media3.common.audio.BaseAudioProcessor
import androidx.media3.common.audio.ChannelMixingAudioProcessor
import androidx.media3.common.audio.ChannelMixingMatrix
import androidx.media3.common.text.Cue
import androidx.media3.common.text.CueGroup
import androidx.media3.common.util.ExperimentalApi
import androidx.media3.common.util.UnstableApi
import androidx.media3.common.util.Util
import androidx.media3.datasource.DefaultDataSource
import androidx.media3.datasource.DefaultHttpDataSource
import androidx.media3.decoder.av1.Dav1dLibrary
import androidx.media3.decoder.av1.Libdav1dVideoRenderer
import androidx.media3.exoplayer.DefaultRenderersFactory
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.DecoderReuseEvaluation
import androidx.media3.exoplayer.analytics.AnalyticsListener
import androidx.media3.exoplayer.audio.AudioRendererEventListener
import androidx.media3.exoplayer.audio.AudioSink
import androidx.media3.exoplayer.audio.DefaultAudioSink
import androidx.media3.exoplayer.Renderer
import androidx.media3.exoplayer.mediacodec.MediaCodecInfo
import androidx.media3.exoplayer.mediacodec.MediaCodecSelector
import androidx.media3.exoplayer.source.DefaultMediaSourceFactory
import androidx.media3.exoplayer.trackselection.DefaultTrackSelector
import androidx.media3.exoplayer.video.MediaCodecVideoRenderer
import androidx.media3.exoplayer.video.VideoRendererEventListener
import androidx.media3.extractor.DefaultExtractorsFactory
import androidx.media3.extractor.ts.DefaultTsPayloadReaderFactory
import androidx.media3.extractor.ts.TsExtractor
import androidx.media3.ui.CaptionStyleCompat
import androidx.media3.ui.SubtitleView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import io.github.peerless2012.ass.media.AssHandler
import io.github.peerless2012.ass.media.kt.withAssMkvSupport
import io.github.peerless2012.ass.media.kt.withAssSupport
import io.github.peerless2012.ass.media.parser.AssSubtitleParserFactory
import io.github.peerless2012.ass.media.type.AssRenderType
import io.github.peerless2012.ass.media.widget.AssSubtitleView
import java.io.File
import java.nio.ByteBuffer
import kotlin.math.roundToInt

@OptIn(ExperimentalApi::class)
private class MoonfinRenderersFactory(
    context: Context,
    private val audioDelayProcessor: AdjustableAudioDelayProcessor,
    private val channelMixingProcessor: ChannelMixingAudioProcessor,
    private val preferSoftwareAv1Renderer: Boolean,
) : DefaultRenderersFactory(context) {
    override fun buildVideoRenderers(
        context: Context,
        extensionRendererMode: Int,
        mediaCodecSelector: MediaCodecSelector,
        enableDecoderFallback: Boolean,
        eventHandler: Handler,
        eventListener: VideoRendererEventListener,
        allowedVideoJoiningTimeMs: Long,
        out: ArrayList<Renderer>,
    ) {
        var videoRendererBuilder =
            MediaCodecVideoRenderer
                .Builder(context)
                .setCodecAdapterFactory(codecAdapterFactory)
                .setMediaCodecSelector(mediaCodecSelector)
                .setAllowedJoiningTimeMs(allowedVideoJoiningTimeMs)
                .setEnableDecoderFallback(enableDecoderFallback)
                .setEventHandler(eventHandler)
                .setEventListener(eventListener)
                .setMaxDroppedFramesToNotify(MAX_DROPPED_VIDEO_FRAME_COUNT_TO_NOTIFY)

        if (Build.VERSION.SDK_INT >= 34) {
            videoRendererBuilder =
                videoRendererBuilder.experimentalSetEnableMediaCodecBufferDecodeOnlyFlag(
                    false,
                )
        }

        val av1ExtensionRenderer = buildAv1ExtensionRenderer(
            extensionRendererMode = extensionRendererMode,
            eventHandler = eventHandler,
            eventListener = eventListener,
            allowedVideoJoiningTimeMs = allowedVideoJoiningTimeMs,
        )
        if (av1ExtensionRenderer != null &&
            extensionRendererMode == DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER
        ) {
            out.add(av1ExtensionRenderer)
        }

        out.add(videoRendererBuilder.build())

        if (av1ExtensionRenderer != null &&
            extensionRendererMode != DefaultRenderersFactory.EXTENSION_RENDERER_MODE_OFF &&
            extensionRendererMode != DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER
        ) {
            out.add(av1ExtensionRenderer)
        }
    }

    override fun buildAudioRenderers(
        context: Context,
        extensionRendererMode: Int,
        mediaCodecSelector: MediaCodecSelector,
        enableDecoderFallback: Boolean,
        audioSink: AudioSink,
        eventHandler: Handler,
        eventListener: AudioRendererEventListener,
        out: ArrayList<Renderer>,
    ) {
        super.buildAudioRenderers(
            context,
            extensionRendererMode,
            FlacWorkaroundMediaCodecSelector(mediaCodecSelector),
            enableDecoderFallback,
            audioSink,
            eventHandler,
            eventListener,
            out,
        )
    }

    override fun buildAudioSink(
        context: Context,
        enableFloatOutput: Boolean,
        enableAudioOutputPlaybackParams: Boolean,
    ): AudioSink {
        return DefaultAudioSink.Builder(context)
            .setAudioProcessorChain(
                DefaultAudioSink.DefaultAudioProcessorChain(
                    // Downmix runs first (on decoded multichannel PCM), then the
                    // delay processor. The mixer is inactive (identity) unless a
                    // stereo downmix is requested after an AudioTrack init failure.
                    channelMixingProcessor,
                    audioDelayProcessor,
                ),
            )
            .setEnableFloatOutput(enableFloatOutput)
            .setEnableAudioOutputPlaybackParameters(enableAudioOutputPlaybackParams)
            .build()
    }

    private fun buildAv1ExtensionRenderer(
        extensionRendererMode: Int,
        eventHandler: Handler,
        eventListener: VideoRendererEventListener,
        allowedVideoJoiningTimeMs: Long,
    ): Renderer? {
        if (!preferSoftwareAv1Renderer ||
            extensionRendererMode == DefaultRenderersFactory.EXTENSION_RENDERER_MODE_OFF
        ) {
            return null
        }

        if (!runCatching { Dav1dLibrary.isAvailable() }.getOrDefault(false)) {
            return null
        }

        return runCatching {
            Libdav1dVideoRenderer(
                allowedVideoJoiningTimeMs,
                eventHandler,
                eventListener,
                MAX_DROPPED_VIDEO_FRAME_COUNT_TO_NOTIFY,
            )
        }.getOrNull()
    }
}

/**
 * Wraps a [MediaCodecSelector] to exclude the Google software FLAC decoders
 * (`c2.android.flac.decoder` and the older `OMX.google.flac.decoder`).
 *
 * Those decoders crash with
 * `DecoderInputBuffer$InsufficientCapacityException: Buffer too small (32768 < N)`
 * on many 16-bit FLAC streams because the Media3 FLAC extractor underestimates
 * the maximum frame size. By filtering them out we allow Media3 to fall through
 * to the bundled `FfmpegAudioRenderer`, which decodes FLAC correctly. All other
 * audio mime types (AAC, AC3, E-AC3, TrueHD, DTS, ...) are passed through
 * untouched so hardware decode and passthrough to AVRs are preserved.
 */
private class FlacWorkaroundMediaCodecSelector(
    private val delegate: MediaCodecSelector,
) : MediaCodecSelector {
    override fun getDecoderInfos(
        mimeType: String,
        requiresSecureDecoder: Boolean,
        requiresTunnelingDecoder: Boolean,
    ): List<MediaCodecInfo> {
        val infos = delegate.getDecoderInfos(
            mimeType,
            requiresSecureDecoder,
            requiresTunnelingDecoder,
        )
        if (mimeType.equals(MimeTypes.AUDIO_FLAC, ignoreCase = true)) {
            return infos.filterNot { info -> isBuggyFlacDecoder(info.name) }
        }
        return infos
    }

    private fun isBuggyFlacDecoder(name: String): Boolean =
        name.equals("c2.android.flac.decoder", ignoreCase = true) ||
            name.equals("OMX.google.flac.decoder", ignoreCase = true)
}

@UnstableApi
private class AdjustableAudioDelayProcessor : BaseAudioProcessor() {
    companion object {
        private const val MAX_DELAY_MS = 5000
        private const val ZERO_CHUNK_BYTES = 4096
    }

    @Volatile
    private var requestedDelayMs: Int = 0

    private var pendingTrimBytes: Int = 0
    private var pendingSilenceBytes: Int = 0
    private val silenceChunk = ByteArray(ZERO_CHUNK_BYTES)

    fun setDelayMs(delayMs: Long) {
        requestedDelayMs = delayMs.coerceIn(-MAX_DELAY_MS.toLong(), MAX_DELAY_MS.toLong()).toInt()
    }

    override fun onConfigure(inputAudioFormat: AudioProcessor.AudioFormat): AudioProcessor.AudioFormat {
        return if (Util.isEncodingLinearPcm(inputAudioFormat.encoding)) {
            inputAudioFormat
        } else {
            AudioProcessor.AudioFormat.NOT_SET
        }
    }

    override fun onFlush(streamMetadata: AudioProcessor.StreamMetadata) {
        recalculatePendingBytes()
    }

    override fun onReset() {
        pendingTrimBytes = 0
        pendingSilenceBytes = 0
    }

    override fun queueInput(inputBuffer: ByteBuffer) {
        if (!inputBuffer.hasRemaining() && pendingSilenceBytes <= 0) {
            return
        }

        if (pendingTrimBytes > 0 && inputBuffer.hasRemaining()) {
            val bytesToTrim = minOf(pendingTrimBytes, inputBuffer.remaining())
            inputBuffer.position(inputBuffer.position() + bytesToTrim)
            pendingTrimBytes -= bytesToTrim
        }

        val inputBytes = inputBuffer.remaining()
        val leadingSilenceBytes = pendingSilenceBytes
        if (inputBytes <= 0 && leadingSilenceBytes <= 0) {
            return
        }

        val outputBuffer = replaceOutputBuffer(leadingSilenceBytes + inputBytes)
        if (leadingSilenceBytes > 0) {
            var remainingSilence = leadingSilenceBytes
            while (remainingSilence > 0) {
                val chunk = minOf(remainingSilence, silenceChunk.size)
                outputBuffer.put(silenceChunk, 0, chunk)
                remainingSilence -= chunk
            }
            pendingSilenceBytes = 0
        }
        if (inputBytes > 0) {
            outputBuffer.put(inputBuffer)
        }
        outputBuffer.flip()
    }

    private fun recalculatePendingBytes() {
        pendingTrimBytes = 0
        pendingSilenceBytes = 0

        val bytesPerFrame = inputAudioFormat.bytesPerFrame
        val sampleRate = inputAudioFormat.sampleRate
        if (bytesPerFrame <= 0 || sampleRate <= 0) {
            return
        }

        val delayFrames = (kotlin.math.abs(requestedDelayMs).toLong() * sampleRate) / 1000L
        val delayBytes = (delayFrames * bytesPerFrame.toLong())
            .coerceAtMost(Int.MAX_VALUE.toLong())
            .toInt()

        if (requestedDelayMs > 0) {
            pendingSilenceBytes = delayBytes
        } else if (requestedDelayMs < 0) {
            pendingTrimBytes = delayBytes
        }
    }
}

@UnstableApi
class Media3VideoView(
    private val context: Context,
) : PlatformView, MethodChannel.MethodCallHandler {
    companion object {
        private const val TS_SEARCH_BYTES_LOW_RAM = TsExtractor.TS_PACKET_SIZE * 1800
        private const val TS_SEARCH_BYTES_DEFAULT = TsExtractor.DEFAULT_TIMESTAMP_SEARCH_BYTES
        private const val EXTERNAL_SUBTITLE_ID_BASE = 10000
        private const val ASS_FALLBACK_FONT_ASSET = "fonts/NotoSans-Regular.ttf"
        private const val ASS_FALLBACK_FONT_NAME = "Noto Sans"
        private val FONT_EXTENSIONS = setOf("ttf", "otf", "ttc")
        private val ASS_SYSTEM_CJK_FONTS = listOf(
            "NotoSansCJK-Regular.ttc",
            "NotoSerifCJK-Regular.ttc",
            "DroidSansFallbackFull.ttf",
            "DroidSansFallback.ttf",
        )
        // libass renders ASS itself and cannot query the OS font system, so it
        // must be handed the system fonts for each script/symbol block. Matched
        // by filename prefix so it works whether Android ships "-Regular.ttf" or
        // a variable "-VF.ttf" file, and picks up scripts added in newer builds.
        private val ASS_SYSTEM_SCRIPT_PREFIXES = listOf(
            "NotoNaskhArabic", "NotoSansArabic",
            "NotoSansDevanagari", "NotoSansBengali", "NotoSansTamil",
            "NotoSansTelugu", "NotoSansKannada", "NotoSansMalayalam",
            "NotoSansGujarati", "NotoSansGurmukhi", "NotoSansOriya",
            "NotoSansSinhala", "NotoSansThai", "NotoSansLao",
            "NotoSansKhmer", "NotoSansMyanmar", "NotoSansHebrew",
            "NotoSansGeorgian", "NotoSansArmenian", "NotoSansEthiopic",
            "NotoSansSymbols", "NotoSansSymbols2", "NotoSansMath", "NotoMusic",
        )
    }

    private fun DefaultExtractorsFactory.setTsPayloadReaderFactoryFlagsCompat(
        flags: Int,
    ): DefaultExtractorsFactory {
        try {
            DefaultExtractorsFactory::class.java
                .getMethod(
                    "setTsExtractorPayloadReaderFactoryFlags",
                    Int::class.javaPrimitiveType,
                )
                .invoke(this, flags)
            return this
        } catch (_: Throwable) {
        }

        try {
            DefaultExtractorsFactory::class.java
                .getMethod("setTsExtractorFlags", Int::class.javaPrimitiveType)
                .invoke(this, flags)
        } catch (_: Throwable) {
        }

        return this
    }


    private enum class SubtitleRendererMode(
        val wireValue: String,
    ) {
        NATIVE("native"),
        ASS_OVERLAY("assOverlay"),
        ;

        companion object {
            fun fromWire(value: String?): SubtitleRendererMode {
                return entries.firstOrNull { it.wireValue == value } ?: NATIVE
            }
        }
    }

    private data class TrackEntry(
        val group: TrackGroup,
        val trackIndex: Int,
    )

    private enum class ZoomMode(
        val wireValue: String,
    ) {
        FIT("fit"),
        CROP("crop"),
        STRETCH("stretch"),
        ;

        companion object {
            fun fromWire(value: String?): ZoomMode {
                return entries.firstOrNull { it.wireValue == value } ?: FIT
            }
        }
    }

    private val mainHandler = Handler(Looper.getMainLooper())
    // SurfaceView is required for display refresh-rate switching (applyFrameRateSwitching is gated
    // on SurfaceView); TextureView never receives it, so 24/25fps content judders. SurfaceView works
    // on older Android too once it is lifted above Flutter's background on the legacy hybrid-
    // composition path (see newVideoView). Previously gated to API 30+.
    private val useSurfaceView = true
    private var videoView: View = newVideoView()

    private fun newVideoView(): View =
        if (useSurfaceView) {
            SurfaceView(context).apply {
                // Legacy hybrid composition (older devices without Impeller) otherwise composites
                // this platform-view SurfaceView behind Flutter and the video renders black; lift it
                // as a media overlay so it stays visible. The Flutter controls still draw on top.
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) setZOrderMediaOverlay(true)
            }
        } else {
            TextureView(context)
        }
    private val firstFrameCover = View(context).apply {
        setBackgroundColor(Color.BLACK)
    }
    private val subtitleView = SubtitleView(context)
    private val containerView: FrameLayout = FrameLayout(context).also { container ->
        container.setBackgroundColor(Color.BLACK)
        val videoLayoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT,
            Gravity.CENTER,
        )
        val subtitleLayoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT,
        )
        container.addView(videoView, videoLayoutParams)
        container.addView(firstFrameCover, subtitleLayoutParams)
        container.addView(subtitleView, subtitleLayoutParams)
    }
    private val isLowRamDevice = context.getSystemService<ActivityManager>()?.isLowRamDevice == true
    private val hasHardwareAv1Decoder by lazy { queryHardwareAv1DecoderAvailability() }
    // Recreated alongside the player in createPlayer(). A TrackSelector must not
    // be shared across ExoPlayer instances: it binds to the playback thread of
    // the player it is built with, so reusing it after the player is released
    // and rebuilt throws "DefaultTrackSelector is accessed on the wrong thread" 
    // on the new player's  playback thread, killing that thread and freezing 
    // playback.
    private lateinit var trackSelector: DefaultTrackSelector
    private val audioPipeline = ExoPlayerAudioPipeline()
    private val audioAttributeState = AudioAttributeState()
    private var preferFfmpegDecoder = Media3Bridge.preferFfmpegDecoderEnabled()
    private var mapDolbyVisionProfile7ToHevc = Media3Bridge.mapDolbyVisionProfile7ToHevcEnabled()
    private var allowExternalAudioEffects = Media3Bridge.allowExternalAudioEffectsEnabled()
    private var frameRateSwitchingBehavior = Media3Bridge.frameRateSwitchingBehavior()
    private var decoderPreferenceDirty = false
    private val audioDelayProcessor = AdjustableAudioDelayProcessor()
    // Downmixes multichannel PCM (e.g. AAC 7.1) to stereo. Inactive (identity)
    // by default; enabled per-session after an AudioTrack init failure so a
    // device that cannot open a >2-channel PCM AudioTrack can still play.
    private val channelMixingProcessor = ChannelMixingAudioProcessor()
    private var stereoDownmixEnabled = false
    private var stereoDownmixRetryAttemptedForCurrentSource = false
    // Sticky once a device proves it cannot open a >2-channel PCM AudioTrack, so
    // subsequent sources start downmixed instead of glitching on every item.
    private var deviceRequiresStereoDownmix = false
    // Guards the container/source-error transcode fallback against re-emitting.
    private var containerFallbackAttempted = false

    private var player: ExoPlayer

    // True once a source has been loaded into the current player. Reusing the
    // same ExoPlayer instance + surface for a second source hangs in buffering
    // on some Android TVs (e.g. Sony BRAVIA after a cinema-mode intro), so the
    // player is recreated for each new source after the first.
    private var playerHasLoadedSource = false

    private var ticker: Runnable? = null
    private var currentUrl: String? = null
    private var currentHeaders: Map<String, String> = emptyMap()
    private lateinit var httpDataSourceFactory: DefaultHttpDataSource.Factory
    private var requestedSubtitleRendererMode: SubtitleRendererMode = SubtitleRendererMode.NATIVE
    private var activeSubtitleRendererMode: SubtitleRendererMode = SubtitleRendererMode.NATIVE
    private var selectedSubtitleCodec: String? = null
    private var selectedSubtitleIsExternal = false
    private var selectedSubtitleIsBitmap = false
    private var selectedExternalSubtitleUrl: String? = null
    private var subtitleTrackEnabled = false

    private var pendingSubtitleIndex: Int? = null
    private var pendingSubtitleCodec: String? = null
    private var pendingSubtitleIsExternal: Boolean? = null
    private var pendingSubtitleIsBitmap: Boolean? = null
    private var pendingExternalSubtitleUrl: String? = null
    private var pendingAudioIndex: Int? = null
    private var zoomMode = ZoomMode.FIT
    private var videoWidthPx = 0
    private var videoHeightPx = 0
    private var videoPixelRatio = 1f
    private var currentNormalizationGainDb: Float? = null
    private var currentContainer: String? = null
    private var currentMediaType: String = "video"
    private var currentAudioSessionId = C.AUDIO_SESSION_ID_UNSET
    private var openedAudioEffectSessionId = C.AUDIO_SESSION_ID_UNSET
    private var originalPreferredDisplayModeId: Int? = null
    private var activePreferredDisplayModeId: Int? = null
    private var detectedFrameRate: Float? = null
    private var audioOffloadDisabled = false
    private var audioOffloadRetryAttemptedForCurrentSource = false
    private var sessionTunnelingDisabled = Media3Bridge.sessionTunnelingDisabledEnabled()
    private var currentAudioIsBitstream = false
    private var tunnelingActive = false
    private var audioRekickRunnable: Runnable? = null
    private var suppressStateEmissionsForRekick = false
    private var skipSilenceEnabled = false
    private var subtitleDelayMs = 0L
    private var audioDelayMs = 0L
    private var userVolumeBoostLevel = 0
    private var preferredAudioLanguage: String? = null
    private var preferredTextLanguage: String? = null
    private var selectUndeterminedTextLanguage = false
    private var subtitleEmbeddedStylesEnabled = true
    private var subtitleEmbeddedFontSizesEnabled = true
    private var assFallbackFontBytes: ByteArray? = null
    // Single pending runnable for delayed cue rendering (positive subtitle delay).
    // Replaced on every new cue group; cancelled on seek, source change, and dispose.
    private var pendingCueRunnable: Runnable? = null
    private var isDisposed = false
    private var isDisposedByFlutter = false
    private var isPlayerReleased = false
    private var firstFrameRendered = false
    private val externalSubtitleConfigurations = mutableListOf<MediaItem.SubtitleConfiguration>()

    /**
     * Cancel any pending delayed cue and clear the current subtitle view.
     * Called on seek, source change, and dispose so stale cues never appear
     * after the player position has jumped.
     */
    private fun cancelPendingSubtitleCue(clearView: Boolean = true) {
        pendingCueRunnable?.let { mainHandler.removeCallbacks(it) }
        pendingCueRunnable = null
        if (clearView) {
            subtitleView.setCues(emptyList())
        }
    }

    /**
     * Encoded surround formats that Android TV typically bitstreams (passes
     * through) to an AVR/soundbar rather than decoding to PCM.
     */
    private fun isBitstreamAudioMime(mime: String?): Boolean = when (mime) {
        MimeTypes.AUDIO_AC3,
        MimeTypes.AUDIO_E_AC3,
        MimeTypes.AUDIO_E_AC3_JOC,
        MimeTypes.AUDIO_AC4,
        MimeTypes.AUDIO_TRUEHD,
        MimeTypes.AUDIO_DTS,
        MimeTypes.AUDIO_DTS_HD,
        MimeTypes.AUDIO_DTS_X -> true
        else -> false
    }

    private fun scheduleAudioRekickAfterSeek() {
        if (!player.playWhenReady) return
        if (!currentAudioIsBitstream && !tunnelingActive) return
        cancelPendingAudioRekick()
        val runnable = Runnable {
            audioRekickRunnable = null
            performAudioRekick()
        }
        audioRekickRunnable = runnable
        mainHandler.postDelayed(runnable, 200L)
    }

    private fun cancelPendingAudioRekick() {
        audioRekickRunnable?.let { mainHandler.removeCallbacks(it) }
        audioRekickRunnable = null
    }

    private fun performAudioRekick() {
        if (isDisposed || !player.playWhenReady) return
        suppressStateEmissionsForRekick = true
        player.playWhenReady = false
        mainHandler.post {
            if (!isDisposed) {
                player.playWhenReady = true
            }
            suppressStateEmissionsForRekick = false
            if (!isDisposed) emitState()
        }
    }

    /**
     * Schedule (or immediately show) a cue group, respecting [subtitleDelayMs].
     *
     * Positive delay: display cues [subtitleDelayMs] ms after they arrive.
     * Zero / negative delay: display immediately (negative delay for embedded
     * subtitles is not supported without deep ExoPlayer hooks; clamp to 0).
     *
     * Each call replaces any previously scheduled cue so the view always
     * reflects the most-recently-received group at the adjusted time.
     */
    private fun renderCuesWithDelay(cues: List<Cue>) {
        // Cancel whatever was queued before; the incoming group supersedes it.
        pendingCueRunnable?.let { mainHandler.removeCallbacks(it) }
        pendingCueRunnable = null

        val delayMs = subtitleDelayMs.coerceAtLeast(0L) // negative not supported natively
        if (delayMs <= 0L) {
            subtitleView.setCues(cues)
            return
        }

        val runnable = Runnable {
            pendingCueRunnable = null
            if (!isDisposed) subtitleView.setCues(cues)
        }
        pendingCueRunnable = runnable
        mainHandler.postDelayed(runnable, delayMs)
    }

    private val listener = object : Player.Listener {
        @Suppress("DEPRECATION")
        override fun onCues(cues: List<Cue>) {
            renderCuesWithDelay(cues)
        }

        override fun onCues(cueGroup: CueGroup) {
            renderCuesWithDelay(cueGroup.cues)
        }

        override fun onPlaybackStateChanged(playbackState: Int) {
            if (
                playbackState == Player.STATE_READY &&
                !firstFrameRendered &&
                firstFrameCover.visibility == View.VISIBLE &&
                videoWidthPx > 0 &&
                videoHeightPx > 0
            ) {
                revealVideo()
            }
            emitState()
            if (playbackState == Player.STATE_ENDED) {
                Media3Bridge.emitEvent(
                    mapOf(
                        "event" to "completed",
                        "completed" to true,
                    ),
                )
            }
        }

        override fun onIsPlayingChanged(isPlaying: Boolean) {
            emitState()
        }

        override fun onPlayerError(error: PlaybackException) {
            val offloadRetryTriggered = retryAudioWithoutOffloadIfNeeded(error)
            // If offload retry didn't apply, try an in-place stereo downmix
            // before falling back to a server transcode (handles 7.1 PCM that
            // the device can't open as an 8-channel AudioTrack).
            val downmixRetryTriggered = if (offloadRetryTriggered) {
                false
            } else {
                retryAudioWithStereoDownmixIfNeeded(error)
            }
            val nativeRetryTriggered = offloadRetryTriggered || downmixRetryTriggered
            emitRecoverablePlayerError(error, nativeRetryTriggered)
            Media3Bridge.emitEvent(
                mapOf(
                    "event" to "error",
                    "message" to (error.localizedMessage ?: "Unknown Media3 playback error"),
                ),
            )
            emitState()
        }

        override fun onTracksChanged(tracks: androidx.media3.common.Tracks) {
            pendingSubtitleIndex?.let { index ->
                if (selectTrack(C.TRACK_TYPE_TEXT, index)) {
                    selectedSubtitleCodec = pendingSubtitleCodec?.trim()?.lowercase()
                    selectedSubtitleIsExternal = pendingSubtitleIsExternal ?: false
                    selectedSubtitleIsBitmap = pendingSubtitleIsBitmap ?: false
                    selectedExternalSubtitleUrl = pendingExternalSubtitleUrl?.takeIf { it.isNotBlank() }
                    subtitleTrackEnabled = true
                    applyTrackSelectorForCurrentSource()
                    refreshSubtitleRendererMode()

                    pendingSubtitleIndex = null
                    pendingSubtitleCodec = null
                    pendingSubtitleIsExternal = null
                    pendingSubtitleIsBitmap = null
                    pendingExternalSubtitleUrl = null
                }
            }
            pendingAudioIndex?.let { index ->
                if (selectTrack(C.TRACK_TYPE_AUDIO, index)) {
                    pendingAudioIndex = null
                }
            }
            emitTracksChanged()
            emitState()
        }

        override fun onVideoSizeChanged(videoSize: VideoSize) {
            videoWidthPx = videoSize.width
            videoHeightPx = videoSize.height
            videoPixelRatio = videoSize.pixelWidthHeightRatio
            applyVideoLayout()
            if (detectedFrameRate == null) {
                resolveSelectedVideoFrameRate()?.let { frameRate ->
                    maybeApplyFrameRateSwitching(frameRate)
                }
            }
            Media3Bridge.emitEvent(
                mapOf(
                    "event" to "videoSizeChanged",
                    "width" to videoSize.width,
                    "height" to videoSize.height,
                    "pixelWidthHeightRatio" to videoSize.pixelWidthHeightRatio,
                ),
            )
        }

        override fun onAudioSessionIdChanged(audioSessionId: Int) {
            audioPipeline.setAudioSessionId(audioSessionId)
            if (currentAudioSessionId != audioSessionId) {
                if (
                    openedAudioEffectSessionId != C.AUDIO_SESSION_ID_UNSET &&
                    openedAudioEffectSessionId != audioSessionId
                ) {
                    closeExternalAudioEffectSessionIfOpen()
                }
                currentAudioSessionId = audioSessionId
            }
            openExternalAudioEffectSessionIfNeeded()
        }

        override fun onPositionDiscontinuity(
            oldPosition: Player.PositionInfo,
            newPosition: Player.PositionInfo,
            reason: Int,
        ) {
            // On any seek, cancel pending delayed subtitle cues so a cue
            // scheduled for the previous position never fires at the new one.
            if (reason == Player.DISCONTINUITY_REASON_SEEK ||
                reason == Player.DISCONTINUITY_REASON_SEEK_ADJUSTMENT
            ) {
                cancelPendingSubtitleCue(clearView = true)
                scheduleAudioRekickAfterSeek()
            }
        }

        override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
            audioPipeline.normalizationGainDb = currentNormalizationGainDb
            audioPipeline.userBoostMb = userVolumeBoostLevel * 200
        }

        override fun onRenderedFirstFrame() {
            Media3Bridge.emitEvent(
                mapOf(
                    "event" to "firstFrameRendered",
                    "positionMs" to player.currentPosition,
                ),
            )
            if (detectedFrameRate == null) {
                resolveSelectedVideoFrameRate()?.let { frameRate ->
                    maybeApplyFrameRateSwitching(frameRate)
                }
            }
            revealVideo()
        }
    }

    private val analyticsListener = object : AnalyticsListener {
        override fun onVideoInputFormatChanged(
            eventTime: AnalyticsListener.EventTime,
            format: Format,
            decoderReuseEvaluation: DecoderReuseEvaluation?,
        ) {
            val frameRate = format.frameRate
            if (frameRate.isFinite() && frameRate > 0f) {
                maybeApplyFrameRateSwitching(frameRate)
            }
        }

        override fun onAudioInputFormatChanged(
            eventTime: AnalyticsListener.EventTime,
            format: Format,
            decoderReuseEvaluation: DecoderReuseEvaluation?,
        ) {
            currentAudioIsBitstream = isBitstreamAudioMime(format.sampleMimeType)
        }

        override fun onAudioSinkError(
            eventTime: AnalyticsListener.EventTime,
            audioSinkError: Exception,
        ) {
            val message = audioSinkError.message?.lowercase() ?: ""
            val isDiscontinuityError =
                audioSinkError is AudioSink.UnexpectedDiscontinuityException ||
                    message.contains("discontinuity") ||
                    message.contains("discontinu")
            if (isDiscontinuityError) {
                Media3Bridge.emitEvent(
                    mapOf(
                        "event" to "tunnelingDiscontinuity",
                    ),
                )
            } else {
                Media3Bridge.emitEvent(
                    mapOf(
                        "event" to "audioSinkError",
                        "message" to (audioSinkError.message ?: audioSinkError.toString()),
                    ),
                )
            }
        }

        override fun onDroppedVideoFrames(
            eventTime: AnalyticsListener.EventTime,
            droppedFrames: Int,
            elapsedMs: Long,
        ) {
            Media3Bridge.emitEvent(
                mapOf(
                    "event" to "droppedFrames",
                    "count" to droppedFrames,
                    "elapsedMs" to elapsedMs,
                ),
            )
        }

        override fun onAudioUnderrun(
            eventTime: AnalyticsListener.EventTime,
            bufferSize: Int,
            bufferSizeMs: Long,
            elapsedSinceLastFeedMs: Long,
        ) {
            Media3Bridge.emitEvent(
                mapOf(
                    "event" to "audioUnderrun",
                    "bufferSizeMs" to bufferSizeMs,
                    "elapsedMs" to elapsedSinceLastFeedMs,
                ),
            )
        }

        override fun onVideoDecoderInitialized(
            eventTime: AnalyticsListener.EventTime,
            decoderName: String,
            initializedTimestampMs: Long,
            initializationDurationMs: Long,
        ) {
            Media3Bridge.emitEvent(
                mapOf(
                    "event" to "videoDecoderInit",
                    "decoder" to decoderName,
                ),
            )
        }
    }

    init {
        // createPlayer() constructs trackSelector, so build the player first.
        player = createPlayer()

        applyTrackSelectorForCurrentSource()

        containerView.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
            applyVideoLayout()
        }

        refreshSubtitleRendererMode()

        startTicker()
        Media3Bridge.attachView(this)
    }

    override fun getView(): View = containerView

    fun forceReleasePlayer() {
        if (isPlayerReleased) return
        isPlayerReleased = true
        isDisposed = true
        cancelPendingSubtitleCue(clearView = false)
        cancelPendingAudioRekick()
        stopTicker()
        closeExternalAudioEffectSessionIfOpen()
        currentAudioSessionId = C.AUDIO_SESSION_ID_UNSET
        restorePreferredDisplayMode()
        detectedFrameRate = null
        player.removeListener(listener)
        player.removeAnalyticsListener(analyticsListener)
        audioPipeline.release()
        player.clearVideoSurface()
        Media3SessionController.releaseForPlayer(player)
        player.release()
    }

    override fun dispose() {
        isDisposedByFlutter = true
        if (currentMediaType == "audio") {
            player.clearVideoSurface()
            return
        }
        forceReleasePlayer()
        Media3Bridge.detachView(this)
    }

    private fun createPlayer(): ExoPlayer {
        // Fresh selector for every player; see the trackSelector field comment.
        trackSelector = DefaultTrackSelector(context)
        audioDelayProcessor.setDelayMs(audioDelayMs)
        val renderersFactory = MoonfinRenderersFactory(
            context = context,
            audioDelayProcessor = audioDelayProcessor,
            channelMixingProcessor = channelMixingProcessor,
            preferSoftwareAv1Renderer = !hasHardwareAv1Decoder,
        ).apply {
            setEnableDecoderFallback(true)
            setExtensionRendererMode(extensionRendererModeForCurrentPreference())
        }

        val extractorsFactory = DefaultExtractorsFactory()
            .setTsExtractorMode(TsExtractor.MODE_SINGLE_PMT)
            .setTsPayloadReaderFactoryFlagsCompat(DefaultTsPayloadReaderFactory.FLAG_ALLOW_NON_IDR_KEYFRAMES)
            .setTsExtractorTimestampSearchBytes(
                if (isLowRamDevice) TS_SEARCH_BYTES_LOW_RAM else TS_SEARCH_BYTES_DEFAULT,
            )
            .setConstantBitrateSeekingEnabled(true)
            .setConstantBitrateSeekingAlwaysEnabled(true)

        httpDataSourceFactory = DefaultHttpDataSource.Factory()
            .setAllowCrossProtocolRedirects(true)
        val bootDataSourceFactory = DefaultDataSource.Factory(context, httpDataSourceFactory)
        val assHandler = AssHandler(AssRenderType.OVERLAY_CANVAS)
        registerAssFonts(assHandler)
        val assParserFactory = AssSubtitleParserFactory(assHandler)
        val bootMediaSourceFactory = DefaultMediaSourceFactory(
            bootDataSourceFactory,
            extractorsFactory.withAssMkvSupport(assParserFactory, assHandler),
        ).apply {
            setSubtitleParserFactory(assParserFactory)
        }

        return ExoPlayer.Builder(context, renderersFactory.withAssSupport(assHandler))
            .setTrackSelector(trackSelector)
            .setMediaSourceFactory(bootMediaSourceFactory)
            .setHandleAudioBecomingNoisy(true)
            .setWakeMode(C.WAKE_MODE_NETWORK)
            .setPauseAtEndOfMediaItems(true)
            .build()
            .also {
                attachAssOverlay(assHandler)
                assHandler.init(it)
                if (currentMediaType != "audio") {
                    if (useSurfaceView) {
                        it.setVideoSurfaceView(videoView as SurfaceView)
                    } else {
                        it.setVideoTextureView(videoView as TextureView)
                    }
                }
                it.addListener(listener)
                it.addAnalyticsListener(analyticsListener)
                if (currentMediaType != "audio") {
                    Media3SessionController.attachPlayer(context, it)
                }
            }
    }

    private fun registerAssFonts(assHandler: AssHandler) {
        if (assFallbackFontBytes == null) {
            assFallbackFontBytes = runCatching {
                context.assets.open(ASS_FALLBACK_FONT_ASSET).use { it.readBytes() }
            }.getOrNull()
        }
        assFallbackFontBytes?.let { bytes ->
            runCatching { assHandler.addFont(ASS_FALLBACK_FONT_NAME, bytes) }
        }
        registerSystemFallbackFonts(assHandler)
    }

    private fun registerSystemFallbackFonts(assHandler: AssHandler) {
        val dir = File("/system/fonts")
        if (!dir.isDirectory) return
        val fonts = dir.listFiles()?.filter {
            it.isFile && it.canRead() &&
                it.extension.lowercase() in FONT_EXTENSIONS
        } ?: return

        val added = HashSet<String>()
        fun add(file: File?) {
            if (file == null || !added.add(file.name)) return
            runCatching { assHandler.addFont(file.nameWithoutExtension, file.readBytes()) }
        }

        // One CJK font is enough
        add(ASS_SYSTEM_CJK_FONTS.firstNotNullOfOrNull { name ->
            fonts.firstOrNull { it.name.equals(name, ignoreCase = true) }
        })

        // One font per script/symbol block. The char after the prefix must not be
        // a digit, so "NotoSansSymbols" does not swallow "NotoSansSymbols2".
        for (prefix in ASS_SYSTEM_SCRIPT_PREFIXES) {
            add(fonts.firstOrNull {
                it.name.startsWith(prefix, ignoreCase = true) &&
                    it.name.getOrNull(prefix.length)?.isDigit() != true
            })
        }
    }

    private fun attachAssOverlay(assHandler: AssHandler) {
        for (i in subtitleView.childCount - 1 downTo 0) {
            if (subtitleView.getChildAt(i) is AssSubtitleView) {
                subtitleView.removeViewAt(i)
            }
        }
        subtitleView.withAssSupport(assHandler)
    }

    private fun rebuildPlayerForDecoderPreference() {
        closeExternalAudioEffectSessionIfOpen()
        currentAudioSessionId = C.AUDIO_SESSION_ID_UNSET
        restorePreferredDisplayMode()
        detectedFrameRate = null
        player.removeListener(listener)
        player.removeAnalyticsListener(analyticsListener)
        player.clearVideoSurface()
        Media3SessionController.releaseForPlayer(player)
        player.release()
        recreateVideoView()
        player = createPlayer()
        httpDataSourceFactory.setDefaultRequestProperties(currentHeaders)
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "playerRebuilt",
                "viewType" to if (useSurfaceView) "surfaceview" else "textureview",
                "sdk" to Build.VERSION.SDK_INT,
            ),
        )
    }

    // Swaps in a fresh SurfaceView/TextureView so each new source gets a brand
    // new Surface. Reusing the same Surface across sources hangs the decoder in
    // buffering on some Android TVs even after the ExoPlayer is recreated.
    private fun recreateVideoView() {
        val params = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT,
            Gravity.CENTER,
        )
        containerView.removeView(videoView)
        videoView = newVideoView()
        containerView.addView(videoView, 0, params)
    }

    private fun releaseActivePlayer() {
        if (isDisposed) return
        cancelPendingAudioRekick()
        closeExternalAudioEffectSessionIfOpen()
        currentAudioSessionId = C.AUDIO_SESSION_ID_UNSET
        restorePreferredDisplayMode()
        detectedFrameRate = null
        player.removeListener(listener)
        player.removeAnalyticsListener(analyticsListener)
        audioPipeline.release()
        player.clearVideoSurface()
        Media3SessionController.releaseForPlayer(player)
        player.release()
        player = createPlayer()
        httpDataSourceFactory.setDefaultRequestProperties(currentHeaders)
        playerHasLoadedSource = false
        firstFrameCover.visibility = View.VISIBLE
        emitState()
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        handleControlCall(call, result)
    }

    fun handleControlCall(call: MethodCall, result: MethodChannel.Result) {
        try {
            when (call.method) {
                "setSource" -> {
                    setSource(call.arguments)
                    result.success(null)
                }

                "play" -> {
                    player.playWhenReady = true
                    player.play()
                    emitState()
                    result.success(null)
                }

                "pause" -> {
                    player.pause()
                    emitState()
                    result.success(null)
                }

                "stop" -> {
                    stopPlaybackAndRestoreDisplayMode()
                    if (isDisposedByFlutter && currentMediaType != "audio") {
                        forceReleasePlayer()
                        Media3Bridge.detachView(this)
                    }
                    result.success(null)
                }

                "release" -> {
                    releaseActivePlayer()
                    if (isDisposedByFlutter && currentMediaType != "audio") {
                        forceReleasePlayer()
                        Media3Bridge.detachView(this)
                    }
                    result.success(null)
                }

                "seek" -> {
                    val positionMs = when (val args = call.arguments) {
                        is Number -> args.toLong()
                        is Map<*, *> -> (args["positionMs"] as? Number)?.toLong() ?: 0L
                        else -> 0L
                    }
                    player.seekTo(positionMs)
                    emitState()
                    result.success(null)
                }

                "setVolume" -> {
                    val volumePercent = when (val args = call.arguments) {
                        is Number -> args.toFloat()
                        is Map<*, *> -> (args["volume"] as? Number)?.toFloat() ?: 100f
                        else -> 100f
                    }
                    player.volume = (volumePercent / 100f).coerceIn(0f, 1f)
                    result.success(null)
                }

                "setSpeed" -> {
                    val speed = when (val args = call.arguments) {
                        is Number -> args.toFloat()
                        is Map<*, *> -> (args["speed"] as? Number)?.toFloat() ?: 1f
                        else -> 1f
                    }
                    player.playbackParameters = PlaybackParameters(speed)
                    emitState()
                    result.success(null)
                }

                "setAudioDelay" -> {
                    updateAudioDelay(call.arguments)
                    result.success(null)
                }

                "setSubtitleDelay" -> {
                    updateSubtitleDelay(call.arguments)
                    result.success(null)
                }

                "setRepeatMode" -> {
                    updateRepeatMode(call.arguments)
                    result.success(null)
                }

                "setSkipSilence" -> {
                    updateSkipSilence(call.arguments)
                    result.success(null)
                }

                "setVolumeBoost" -> {
                    updateVolumeBoost(call.arguments)
                    result.success(null)
                }

                "setZoomMode" -> {
                    updateZoomMode(call.arguments)
                    result.success(null)
                }

                "setAudioTrack" -> {
                    val index = ((call.arguments as? Map<*, *>)?.get("index") as? Number)?.toInt() ?: 0
                    pendingAudioIndex = index
                    val selected = selectTrack(C.TRACK_TYPE_AUDIO, index)
                    if (selected) {
                        pendingAudioIndex = null
                    }
                    result.success(null)
                }

                "setSubtitleTrack" -> {
                    val args = call.arguments as? Map<*, *>
                    val index = (args?.get("index") as? Number)?.toInt() ?: 0
                    val codec = args?.get("codec")?.toString()
                    val isExternal = args?.get("isExternalSubtitle") as? Boolean ?: false
                    val isBitmap = args?.get("isBitmapSubtitle") as? Boolean ?: false
                    val externalUrl = args?.get("externalSubtitleUrl")?.toString()

                    pendingSubtitleIndex = index
                    pendingSubtitleCodec = codec
                    pendingSubtitleIsExternal = isExternal
                    pendingSubtitleIsBitmap = isBitmap
                    pendingExternalSubtitleUrl = externalUrl

                    val selected = selectTrack(C.TRACK_TYPE_TEXT, index)
                    if (selected) {
                        selectedSubtitleCodec = codec?.trim()?.lowercase()
                        selectedSubtitleIsExternal = isExternal
                        selectedSubtitleIsBitmap = isBitmap
                        selectedExternalSubtitleUrl = externalUrl?.takeIf { it.isNotBlank() }
                        subtitleTrackEnabled = true
                        applyTrackSelectorForCurrentSource()
                        refreshSubtitleRendererMode()

                        pendingSubtitleIndex = null
                        pendingSubtitleCodec = null
                        pendingSubtitleIsExternal = null
                        pendingSubtitleIsBitmap = null
                        pendingExternalSubtitleUrl = null
                    }
                    result.success(null)
                }

                "disableSubtitleTrack" -> {
                    trackSelector.parameters = trackSelector.parameters
                        .buildUpon()
                        .clearOverridesOfType(C.TRACK_TYPE_TEXT)
                        .setTrackTypeDisabled(C.TRACK_TYPE_TEXT, true)
                        .build()
                    selectedSubtitleCodec = null
                    selectedSubtitleIsExternal = false
                    selectedSubtitleIsBitmap = false
                    selectedExternalSubtitleUrl = null
                    subtitleTrackEnabled = false

                    pendingSubtitleIndex = null
                    pendingSubtitleCodec = null
                    pendingSubtitleIsExternal = null
                    pendingSubtitleIsBitmap = null
                    pendingExternalSubtitleUrl = null

                    applyTrackSelectorForCurrentSource()
                    clearAssSubtitleScript()
                    refreshSubtitleRendererMode()
                    emitTracksChanged()
                    emitState()
                    result.success(null)
                }

                "setSubtitleRendererMode" -> {
                    updateSubtitleRendererMode(call.arguments)
                    result.success(null)
                }

                "setDecoderPreferences" -> {
                    updateDecoderPreferences(call.arguments)
                    result.success(null)
                }

                "disableTunnelingForSession" -> {
                    disableTunnelingForSession()
                    result.success(null)
                }

                "addExternalSubtitle" -> {
                    addExternalSubtitle(call.arguments as? Map<*, *>)
                    result.success(null)
                }

                "configureSubtitleStyle" -> {
                    configureSubtitleStyle(call.arguments as? Map<*, *>)
                    result.success(null)
                }

                "getState" -> {
                    result.success(stateMap())
                }

                else -> result.notImplemented()
            }
        } catch (t: Throwable) {
            result.error("MEDIA3_VIEW_ERROR", t.localizedMessage ?: "Unknown error", null)
        }
    }

    fun handleQueuedCall(method: String, args: Any?) {
        try {
            when (method) {
                "setSource" -> setSource(args)
                "play" -> {
                    player.playWhenReady = true
                    player.play()
                    emitState()
                }

                "pause" -> {
                    player.pause()
                    emitState()
                }

                "stop" -> {
                    stopPlaybackAndRestoreDisplayMode()
                    if (isDisposedByFlutter && currentMediaType != "audio") {
                        forceReleasePlayer()
                        Media3Bridge.detachView(this)
                    }
                }

                "release" -> {
                    releaseActivePlayer()
                    if (isDisposedByFlutter && currentMediaType != "audio") {
                        forceReleasePlayer()
                        Media3Bridge.detachView(this)
                    }
                }

                "seek" -> {
                    val positionMs = when (args) {
                        is Number -> args.toLong()
                        is Map<*, *> -> (args["positionMs"] as? Number)?.toLong() ?: 0L
                        else -> 0L
                    }
                    player.seekTo(positionMs)
                    emitState()
                }

                "setVolume" -> {
                    val volumePercent = when (args) {
                        is Number -> args.toFloat()
                        is Map<*, *> -> (args["volume"] as? Number)?.toFloat() ?: 100f
                        else -> 100f
                    }
                    player.volume = (volumePercent / 100f).coerceIn(0f, 1f)
                }

                "setSpeed" -> {
                    val speed = when (args) {
                        is Number -> args.toFloat()
                        is Map<*, *> -> (args["speed"] as? Number)?.toFloat() ?: 1f
                        else -> 1f
                    }
                    player.playbackParameters = PlaybackParameters(speed)
                    emitState()
                }

                "setAudioDelay" -> {
                    updateAudioDelay(args)
                }

                "setSubtitleDelay" -> {
                    updateSubtitleDelay(args)
                }

                "setRepeatMode" -> {
                    updateRepeatMode(args)
                }

                "setSkipSilence" -> {
                    updateSkipSilence(args)
                }

                "setVolumeBoost" -> {
                    updateVolumeBoost(args)
                }

                "setZoomMode" -> {
                    updateZoomMode(args)
                }

                "setAudioTrack" -> {
                    val index = (args as? Map<*, *>)?.get("index") as? Number ?: return
                    selectTrack(C.TRACK_TYPE_AUDIO, index.toInt())
                }

                "setSubtitleTrack" -> {
                    val subtitleArgs = args as? Map<*, *> ?: return
                    val index = subtitleArgs["index"] as? Number ?: return
                    val codec = subtitleArgs["codec"]?.toString()
                    val isExternal = subtitleArgs["isExternalSubtitle"] as? Boolean ?: false
                    val isBitmap = subtitleArgs["isBitmapSubtitle"] as? Boolean ?: false
                    val externalUrl = subtitleArgs["externalSubtitleUrl"]?.toString()
                    val selected = selectTrack(C.TRACK_TYPE_TEXT, index.toInt())
                    if (selected) {
                        selectedSubtitleCodec = codec?.trim()?.lowercase()
                        selectedSubtitleIsExternal = isExternal
                        selectedSubtitleIsBitmap = isBitmap
                        selectedExternalSubtitleUrl = externalUrl?.takeIf { it.isNotBlank() }
                        subtitleTrackEnabled = true
                        applyTrackSelectorForCurrentSource()
                        refreshSubtitleRendererMode()
                    }
                }

                "disableSubtitleTrack" -> {
                    trackSelector.parameters = trackSelector.parameters
                        .buildUpon()
                        .clearOverridesOfType(C.TRACK_TYPE_TEXT)
                        .setTrackTypeDisabled(C.TRACK_TYPE_TEXT, true)
                        .build()
                    selectedSubtitleCodec = null
                    selectedSubtitleIsExternal = false
                    selectedSubtitleIsBitmap = false
                    selectedExternalSubtitleUrl = null
                    subtitleTrackEnabled = false
                    applyTrackSelectorForCurrentSource()
                    clearAssSubtitleScript()
                    refreshSubtitleRendererMode()
                    emitTracksChanged()
                    emitState()
                }

                "setSubtitleRendererMode" -> {
                    updateSubtitleRendererMode(args)
                }

                "disableTunnelingForSession" -> {
                    disableTunnelingForSession()
                }

                "addExternalSubtitle" -> addExternalSubtitle(args as? Map<*, *>)
                "configureSubtitleStyle" -> configureSubtitleStyle(args as? Map<*, *>)
            }
        } catch (_: Throwable) {
        }
    }

    fun stateSnapshot(): Map<String, Any> = stateMap()

    fun trackSnapshot(): Map<String, Any?> = trackStateMap()

    private fun setSource(arguments: Any?) {
        val args = arguments as? Map<*, *> ?: return
        val url = args["url"]?.toString() ?: return
        val startPositionMs = (args["startPositionMs"] as? Number)?.toLong() ?: 0L
        val autoPlay = args["autoPlay"] as? Boolean ?: false

        restorePreferredDisplayMode()
        detectedFrameRate = null

        val nextMediaType = args["mediaType"]?.toString()?.lowercase() ?: "video"
        val isAudio = nextMediaType == "audio"
        val mediaTypeChanged = nextMediaType != currentMediaType

        currentMediaType = nextMediaType

        if (mediaTypeChanged || (!isAudio && (decoderPreferenceDirty || playerHasLoadedSource))) {
            rebuildPlayerForDecoderPreference()
            decoderPreferenceDirty = false
        }

        closeExternalAudioEffectSessionIfOpen()

        currentContainer = args["container"]
            ?.toString()
            ?.trim()
            ?.lowercase()
            ?.takeIf { it.isNotEmpty() }
        player.setPauseAtEndOfMediaItems(currentMediaType != "audio")
        audioOffloadRetryAttemptedForCurrentSource = false
        stereoDownmixRetryAttemptedForCurrentSource = false
        containerFallbackAttempted = false
        // Start each source with the downmix state the device has proven it
        // needs (sticky once an AudioTrack init failure was recovered).
        applyStereoDownmix(deviceRequiresStereoDownmix)
        currentNormalizationGainDb = (args["normalizationGainDb"] as? Number)?.toFloat()
        skipSilenceEnabled = args["skipSilenceEnabled"] as? Boolean ?: false
        subtitleDelayMs = ((args["subtitleDelayMs"] as? Number)?.toLong() ?: 0L).coerceIn(-5000L, 5000L)
        audioDelayMs = ((args["audioDelayMs"] as? Number)?.toLong() ?: 0L).coerceIn(-5000L, 5000L)
        userVolumeBoostLevel = ((args["volumeBoostLevel"] as? Number)?.toInt() ?: 0).coerceIn(0, 10)
        preferredAudioLanguage = normalizeLanguageCode(args["preferredAudioLanguage"]?.toString())
        preferredTextLanguage = normalizeLanguageCode(args["preferredTextLanguage"]?.toString())
        selectUndeterminedTextLanguage = args["selectUndeterminedTextLanguage"] as? Boolean ?: false
        subtitleEmbeddedStylesEnabled = args["subtitleEmbeddedStylesEnabled"] as? Boolean ?: true
        subtitleEmbeddedFontSizesEnabled = args["subtitleEmbeddedFontSizesEnabled"] as? Boolean ?: true

        currentUrl = url
        currentHeaders = (args["headers"] as? Map<*, *>)
            ?.mapNotNull { (k, v) ->
                if (k == null || v == null) {
                    null
                } else {
                    k.toString() to v.toString()
                }
            }
            ?.toMap()
            ?: emptyMap()
        httpDataSourceFactory.setDefaultRequestProperties(currentHeaders)

        resetTrackSelectionsForNewSource()
        externalSubtitleConfigurations.clear()
        selectedSubtitleCodec = null
        selectedSubtitleIsExternal = false
        selectedSubtitleIsBitmap = false
        selectedExternalSubtitleUrl = null
        val forceSubtitlesDisabledOnStart = args["forceSubtitlesDisabledOnStart"] as? Boolean ?: false
        subtitleTrackEnabled = !forceSubtitlesDisabledOnStart
        pendingSubtitleIndex = null
        pendingSubtitleCodec = null
        pendingSubtitleIsExternal = null
        pendingSubtitleIsBitmap = null
        pendingExternalSubtitleUrl = null
        pendingAudioIndex = null
        firstFrameRendered = false
        firstFrameCover.visibility = View.VISIBLE
        cancelPendingSubtitleCue(clearView = true)
        clearAssSubtitleScript()
        applyTrackSelectorForCurrentSource()
        refreshSubtitleRendererMode()
        applyAudioAttributesForCurrentMediaType()
        openExternalAudioEffectSessionIfNeeded()
        audioPipeline.normalizationGainDb = currentNormalizationGainDb
        audioPipeline.userBoostMb = userVolumeBoostLevel * 200
        audioDelayProcessor.setDelayMs(audioDelayMs)
        player.skipSilenceEnabled = skipSilenceEnabled
        emitSyncDelayState()
        emitVolumeBoostState()
        setMediaItem(startPositionMs, playWhenReady = autoPlay)
        playerHasLoadedSource = true
    }

    private fun revealVideo() {
        if (firstFrameRendered) {
            return
        }
        firstFrameRendered = true
        firstFrameCover.visibility = View.GONE
    }

    private fun resetTrackSelectionsForNewSource() {
        trackSelector.parameters = trackSelector.parameters
            .buildUpon()
            .clearOverrides()
            .setTrackTypeDisabled(C.TRACK_TYPE_AUDIO, false)
            .setTrackTypeDisabled(C.TRACK_TYPE_TEXT, false)
            .build()
    }

    private fun applyAudioAttributesForCurrentMediaType() {
        val contentType = if (currentMediaType == "audio") {
            C.AUDIO_CONTENT_TYPE_MUSIC
        } else {
            C.AUDIO_CONTENT_TYPE_MOVIE
        }

        audioAttributeState.updateAudioAttributes(
            builder = {
                setContentType(contentType)
                setUsage(C.USAGE_MEDIA)
            },
            onChange = { audioAttributes ->
                player.setAudioAttributes(audioAttributes, true)
            },
        )
    }

    private fun findHostActivity(): Activity? {
        var currentContext: Context? = context
        while (currentContext is ContextWrapper) {
            if (currentContext is Activity) {
                return currentContext
            }
            currentContext = currentContext.baseContext
        }
        return null
    }

    private fun isTelevisionDevice(): Boolean {
        val manager = context.getSystemService<UiModeManager>()
        return manager?.currentModeType == Configuration.UI_MODE_TYPE_TELEVISION
    }

    private fun isFrameRateSwitchingEnabled(): Boolean {
        return when (frameRateSwitchingBehavior) {
            "scaleondevice" -> true
            "scaleontv" -> isTelevisionDevice()
            else -> false
        }
    }

    private fun normalizeFrameRate(frameRate: Float): Float {
        val standards = floatArrayOf(23.976f, 24f, 25f, 29.97f, 30f, 50f, 59.94f, 60f)
        var closest = frameRate
        var closestDelta = Float.MAX_VALUE
        for (candidate in standards) {
            val delta = kotlin.math.abs(candidate - frameRate)
            if (delta < closestDelta) {
                closest = candidate
                closestDelta = delta
            }
        }
        return if (closestDelta <= 0.08f) closest else frameRate
    }

    private fun isRefreshRateMultiple(refreshRate: Float, contentFrameRate: Float): Boolean {
        if (!refreshRate.isFinite() || refreshRate <= 0f || contentFrameRate <= 0f) {
            return false
        }
        val ratio = refreshRate / contentFrameRate
        val rounded = ratio.roundToInt().toFloat()
        return rounded >= 1f && kotlin.math.abs(ratio - rounded) <= 0.02f
    }

    private fun choosePreferredDisplayMode(display: Display, contentFrameRate: Float): Display.Mode? {
        val currentMode = display.mode
        val modes = display.supportedModes ?: return null

        val sameResolutionModes = modes.filter { mode ->
            mode.physicalWidth == currentMode.physicalWidth &&
                mode.physicalHeight == currentMode.physicalHeight
        }
        val candidates = if (sameResolutionModes.isNotEmpty()) sameResolutionModes else modes.toList()

        var bestMultipleMode: Display.Mode? = null
        var bestMultipleDelta = Float.MAX_VALUE
        for (mode in candidates) {
            val refreshRate = mode.refreshRate
            if (!isRefreshRateMultiple(refreshRate, contentFrameRate)) {
                continue
            }
            val delta = kotlin.math.abs(refreshRate - contentFrameRate)
            if (
                bestMultipleMode == null ||
                delta < bestMultipleDelta ||
                (delta == bestMultipleDelta && refreshRate > (bestMultipleMode?.refreshRate ?: 0f))
            ) {
                bestMultipleMode = mode
                bestMultipleDelta = delta
            }
        }

        if (bestMultipleMode != null) {
            return bestMultipleMode
        }

        var bestMode: Display.Mode? = null
        var bestDelta = Float.MAX_VALUE
        for (mode in candidates) {
            val delta = kotlin.math.abs(mode.refreshRate - contentFrameRate)
            if (
                bestMode == null ||
                delta < bestDelta ||
                (delta == bestDelta && mode.refreshRate > (bestMode?.refreshRate ?: 0f))
            ) {
                bestMode = mode
                bestDelta = delta
            }
        }
        return bestMode
    }

    private fun maybeApplyFrameRateSwitching(rawFrameRate: Float) {
        val normalizedFrameRate = normalizeFrameRate(rawFrameRate)
        detectedFrameRate = normalizedFrameRate

        if (!isFrameRateSwitchingEnabled()) {
            clearSurfaceFrameRateHint()
            restorePreferredDisplayMode()
            emitFrameRateState(
                detectedFrameRate = normalizedFrameRate,
                appliedFrameRate = null,
                appliedModeId = null,
                enabled = false,
            )
            return
        }

        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return
        }
        applySurfaceFrameRateHint(normalizedFrameRate)

        val activity = findHostActivity() ?: return
        val window = activity.window ?: return
        val display = activity.windowManager.defaultDisplay ?: return

        if (originalPreferredDisplayModeId == null) {
            originalPreferredDisplayModeId = window.attributes.preferredDisplayModeId
        }

        val preferredMode = choosePreferredDisplayMode(display, normalizedFrameRate) ?: return
        val preferredModeId = preferredMode.modeId
        if (activePreferredDisplayModeId == preferredModeId) {
            emitFrameRateState(
                detectedFrameRate = normalizedFrameRate,
                appliedFrameRate = preferredMode.refreshRate,
                appliedModeId = preferredModeId,
                enabled = true,
            )
            return
        }

        val updatedLayoutParams = window.attributes
        updatedLayoutParams.preferredDisplayModeId = preferredModeId
        window.attributes = updatedLayoutParams
        activePreferredDisplayModeId = preferredModeId

        emitFrameRateState(
            detectedFrameRate = normalizedFrameRate,
            appliedFrameRate = preferredMode.refreshRate,
            appliedModeId = preferredModeId,
            enabled = true,
        )
    }

    private fun stopPlaybackAndRestoreDisplayMode() {
        player.stop()
        player.clearMediaItems()
        restorePreferredDisplayMode()
        firstFrameCover.visibility = View.VISIBLE
        emitState()
    }

    private fun restorePreferredDisplayMode() {
        clearSurfaceFrameRateHint()
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return
        }

        val activity = findHostActivity() ?: return
        val window = activity.window ?: return
        val originalModeId = originalPreferredDisplayModeId ?: 0
        val currentModeId = window.attributes.preferredDisplayModeId
        if (currentModeId == originalModeId && activePreferredDisplayModeId == null) {
            return
        }

        val restoredLayoutParams = window.attributes
        restoredLayoutParams.preferredDisplayModeId = originalModeId
        window.attributes = restoredLayoutParams
        activePreferredDisplayModeId = null
    }

    private fun applySurfaceFrameRateHint(frameRate: Float) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            return
        }
        val surfaceView = videoView as? SurfaceView ?: return
        val targetSurface = surfaceView.holder.surface ?: return
        if (!targetSurface.isValid) {
            return
        }

        runCatching {
            targetSurface.setFrameRate(
                frameRate,
                Surface.FRAME_RATE_COMPATIBILITY_FIXED_SOURCE,
            )
        }
    }

    private fun clearSurfaceFrameRateHint() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            return
        }
        val surfaceView = videoView as? SurfaceView ?: return
        val targetSurface = surfaceView.holder.surface ?: return
        if (!targetSurface.isValid) {
            return
        }

        runCatching {
            targetSurface.setFrameRate(
                0f,
                Surface.FRAME_RATE_COMPATIBILITY_DEFAULT,
            )
        }
    }

    private fun resolveSelectedVideoFrameRate(): Float? {
        for (group in player.currentTracks.groups) {
            if (group.type != C.TRACK_TYPE_VIDEO) {
                continue
            }
            for (index in 0 until group.length) {
                if (!group.isTrackSelected(index)) {
                    continue
                }
                val frameRate = group.getTrackFormat(index).frameRate
                if (frameRate.isFinite() && frameRate > 0f) {
                    return frameRate
                }
            }
        }
        return null
    }

    private fun emitFrameRateState(
        detectedFrameRate: Float,
        appliedFrameRate: Float?,
        appliedModeId: Int?,
        enabled: Boolean,
    ) {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "frameRate",
                "detectedFrameRate" to detectedFrameRate.toDouble(),
                "appliedFrameRate" to appliedFrameRate?.toDouble(),
                "appliedDisplayModeId" to appliedModeId,
                "enabled" to enabled,
            ),
        )
    }

    private fun audioEffectContentType(): Int {
        return if (currentMediaType == "audio") {
            AudioEffect.CONTENT_TYPE_MUSIC
        } else {
            AudioEffect.CONTENT_TYPE_MOVIE
        }
    }

    private fun openExternalAudioEffectSessionIfNeeded() {
        if (!allowExternalAudioEffects) {
            return
        }
        val sessionId = currentAudioSessionId
        if (sessionId == C.AUDIO_SESSION_ID_UNSET || sessionId <= 0) {
            return
        }
        if (openedAudioEffectSessionId == sessionId) {
            return
        }

        closeExternalAudioEffectSessionIfOpen()
        val opened = runCatching {
            context.sendBroadcast(
                Intent(AudioEffect.ACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION).apply {
                    putExtra(AudioEffect.EXTRA_AUDIO_SESSION, sessionId)
                    putExtra(AudioEffect.EXTRA_PACKAGE_NAME, context.packageName)
                    putExtra(AudioEffect.EXTRA_CONTENT_TYPE, audioEffectContentType())
                },
            )
        }.isSuccess
        if (opened) {
            openedAudioEffectSessionId = sessionId
        }
    }

    private fun closeExternalAudioEffectSessionIfOpen() {
        val sessionId = openedAudioEffectSessionId
        if (sessionId == C.AUDIO_SESSION_ID_UNSET || sessionId <= 0) {
            openedAudioEffectSessionId = C.AUDIO_SESSION_ID_UNSET
            return
        }

        runCatching {
            context.sendBroadcast(
                Intent(AudioEffect.ACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION).apply {
                    putExtra(AudioEffect.EXTRA_AUDIO_SESSION, sessionId)
                    putExtra(AudioEffect.EXTRA_PACKAGE_NAME, context.packageName)
                },
            )
        }
        openedAudioEffectSessionId = C.AUDIO_SESSION_ID_UNSET
    }

    private fun applyTrackSelectorForCurrentSource() {
        val isAudioContent = currentMediaType == "audio"
        val hasExternalSubtitle = selectedSubtitleIsExternal ||
            !selectedExternalSubtitleUrl.isNullOrBlank() ||
            externalSubtitleConfigurations.isNotEmpty()
        val shouldEnableTunneling =
            !isAudioContent &&
                !hasExternalSubtitle &&
                !sessionTunnelingDisabled

        tunnelingActive = shouldEnableTunneling

        val offloadMode = if (isAudioContent && !audioOffloadDisabled) {
            TrackSelectionParameters.AudioOffloadPreferences.AUDIO_OFFLOAD_MODE_ENABLED
        } else {
            TrackSelectionParameters.AudioOffloadPreferences.AUDIO_OFFLOAD_MODE_DISABLED
        }

        val parametersBuilder = trackSelector.buildUponParameters()
            .setAudioOffloadPreferences(
                TrackSelectionParameters.AudioOffloadPreferences.DEFAULT
                    .buildUpon()
                    .setAudioOffloadMode(offloadMode)
                    .build(),
            )
            .setAllowInvalidateSelectionsOnRendererCapabilitiesChange(true)
            .setPreferredAudioLanguage(preferredAudioLanguage)
            .setPreferredTextLanguage(preferredTextLanguage)
            .setSelectUndeterminedTextLanguage(selectUndeterminedTextLanguage)
            .setTunnelingEnabled(shouldEnableTunneling)
            .setTrackTypeDisabled(C.TRACK_TYPE_TEXT, !subtitleTrackEnabled)

        if (mapDolbyVisionProfile7ToHevc) {
            parametersBuilder.setPreferredVideoMimeType(MimeTypes.VIDEO_H265)
        } else {
            parametersBuilder.setPreferredVideoMimeType(null)
        }

        trackSelector.setParameters(parametersBuilder)
    }

    private fun updateSubtitleRendererMode(arguments: Any?) {
        val args = arguments as? Map<*, *>
        val modeValue = args?.get("mode")?.toString()
        val nextMode = SubtitleRendererMode.fromWire(modeValue)
        if (requestedSubtitleRendererMode == nextMode) {
            return
        }

        requestedSubtitleRendererMode = nextMode
        refreshSubtitleRendererMode()
    }

    private fun updateDecoderPreferences(arguments: Any?) {
        val args = arguments as? Map<*, *> ?: return

        val nextPreference = args["preferFfmpeg"] as? Boolean
        if (nextPreference != null && preferFfmpegDecoder != nextPreference) {
            preferFfmpegDecoder = nextPreference
            decoderPreferenceDirty = true
        }

        val nextMapDv = args["mapDolbyVisionProfile7ToHevc"] as? Boolean
        if (nextMapDv != null && mapDolbyVisionProfile7ToHevc != nextMapDv) {
            mapDolbyVisionProfile7ToHevc = nextMapDv
            decoderPreferenceDirty = true
        }

        val nextTunnelingDisabled = args["tunnelingDisabled"] as? Boolean
        if (nextTunnelingDisabled != null && sessionTunnelingDisabled != nextTunnelingDisabled) {
            sessionTunnelingDisabled = nextTunnelingDisabled
            Media3Bridge.setSessionTunnelingDisabledEnabled(nextTunnelingDisabled)
            applyTrackSelectorForCurrentSource()
        }

        val nextAllowExternalAudioEffects = args["allowExternalAudioEffects"] as? Boolean
        if (
            nextAllowExternalAudioEffects != null &&
            allowExternalAudioEffects != nextAllowExternalAudioEffects
        ) {
            allowExternalAudioEffects = nextAllowExternalAudioEffects
            if (allowExternalAudioEffects) {
                openExternalAudioEffectSessionIfNeeded()
            } else {
                closeExternalAudioEffectSessionIfOpen()
            }
        }

        val nextFrameRateBehavior = args["frameRateSwitchingBehavior"]
            ?.toString()
            ?.trim()
            ?.lowercase()
            ?.ifBlank { "disabled" }
        if (nextFrameRateBehavior != null && frameRateSwitchingBehavior != nextFrameRateBehavior) {
            frameRateSwitchingBehavior = nextFrameRateBehavior
            val lastDetected = detectedFrameRate
            if (isFrameRateSwitchingEnabled()) {
                if (lastDetected != null) {
                    maybeApplyFrameRateSwitching(lastDetected)
                }
            } else {
                restorePreferredDisplayMode()
                if (lastDetected != null) {
                    emitFrameRateState(
                        detectedFrameRate = lastDetected,
                        appliedFrameRate = null,
                        appliedModeId = null,
                        enabled = false,
                    )
                }
            }
        }
    }

    private fun updateAudioDelay(arguments: Any?) {
        val nextDelayMs = parseDelayMs(arguments).coerceIn(-2000L, 2000L)
        if (audioDelayMs == nextDelayMs) {
            return
        }
        audioDelayMs = nextDelayMs
        audioDelayProcessor.setDelayMs(nextDelayMs)
        // Trigger a buffer flush so the new delay takes effect immediately
        // rather than waiting for the next natural seek or track change.
        // Only do this when the player has an active, prepared item; skip
        // during initial setSource (handled by setMediaItem + prepare).
        val state = player.playbackState
        if (player.currentMediaItem != null &&
            state != Player.STATE_IDLE &&
            state != Player.STATE_ENDED
        ) {
            val pos = player.currentPosition.coerceAtLeast(0L)
            player.seekTo(pos)
        }
        emitSyncDelayState()
        emitState()
    }

    private fun updateSubtitleDelay(arguments: Any?) {
        val nextDelayMs = parseDelayMs(arguments).coerceIn(-5000L, 5000L)
        if (subtitleDelayMs == nextDelayMs) {
            return
        }
        subtitleDelayMs = nextDelayMs
        // Cancel any pending cue so the adjusted delay takes effect cleanly.
        cancelPendingSubtitleCue(clearView = true)
        emitSyncDelayState()
        emitState()
    }

    private fun updateRepeatMode(arguments: Any?) {
        val nextMode = when (arguments) {
            is Number -> {
                when (arguments.toInt()) {
                    Player.REPEAT_MODE_ONE -> Player.REPEAT_MODE_ONE
                    Player.REPEAT_MODE_ALL -> Player.REPEAT_MODE_ALL
                    else -> Player.REPEAT_MODE_OFF
                }
            }

            is Map<*, *> -> {
                when ((arguments["mode"]?.toString() ?: "").trim().lowercase()) {
                    "one",
                    "repeatone",
                    -> Player.REPEAT_MODE_ONE

                    "all",
                    "repeatall",
                    -> Player.REPEAT_MODE_ALL

                    else -> Player.REPEAT_MODE_OFF
                }
            }

            else -> Player.REPEAT_MODE_OFF
        }
        if (player.repeatMode == nextMode) {
            return
        }
        player.repeatMode = nextMode
        emitRepeatModeState()
        emitState()
    }

    private fun updateSkipSilence(arguments: Any?) {
        val nextEnabled = when (arguments) {
            is Boolean -> arguments
            is Map<*, *> -> arguments["enabled"] as? Boolean ?: false
            else -> false
        }
        if (skipSilenceEnabled == nextEnabled) {
            return
        }
        skipSilenceEnabled = nextEnabled
        player.skipSilenceEnabled = nextEnabled
        emitState()
    }

    private fun updateVolumeBoost(arguments: Any?) {
        val level = when (arguments) {
            is Number -> arguments.toInt()
            is Map<*, *> -> (arguments["level"] as? Number)?.toInt() ?: 0
            else -> 0
        }.coerceIn(0, 10)
        if (userVolumeBoostLevel == level) {
            return
        }
        userVolumeBoostLevel = level
        audioPipeline.userBoostMb = level * 200
        emitVolumeBoostState()
        emitState()
    }

    private fun parseDelayMs(arguments: Any?): Long {
        return when (arguments) {
            is Number -> arguments.toLong()
            is Map<*, *> -> {
                val ms = (arguments["delayMs"] as? Number)?.toLong()
                if (ms != null) {
                    ms
                } else {
                    val seconds = (arguments["seconds"] as? Number)?.toDouble() ?: 0.0
                    (seconds * 1000.0).toLong()
                }
            }

            else -> 0L
        }
    }

    private fun normalizeLanguageCode(raw: String?): String? {
        val normalized = raw?.trim()?.lowercase().orEmpty()
        if (
            normalized.isEmpty() ||
            normalized == "auto" ||
            normalized == "device" ||
            normalized == "default" ||
            normalized == "none"
        ) {
            return null
        }
        return normalized
    }

    private fun emitSyncDelayState() {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "syncDelays",
                "audioDelayMs" to audioDelayMs,
                "subtitleDelayMs" to subtitleDelayMs,
            ),
        )
    }

    private fun emitVolumeBoostState() {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "volumeBoost",
                "level" to userVolumeBoostLevel,
            ),
        )
    }

    private fun emitRepeatModeState() {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "repeatModeChanged",
                "repeatMode" to repeatModeToWire(player.repeatMode),
            ),
        )
    }

    private fun repeatModeToWire(mode: Int): String {
        return when (mode) {
            Player.REPEAT_MODE_ONE -> "one"
            Player.REPEAT_MODE_ALL -> "all"
            else -> "off"
        }
    }

    private fun disableTunnelingForSession() {
        if (sessionTunnelingDisabled) {
            return
        }
        sessionTunnelingDisabled = true
        Media3Bridge.setSessionTunnelingDisabledEnabled(true)
        applyTrackSelectorForCurrentSource()
    }

    private fun extensionRendererModeForCurrentPreference(): Int =
        if (preferFfmpegDecoder) DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER
        else DefaultRenderersFactory.EXTENSION_RENDERER_MODE_ON

    private fun updateZoomMode(arguments: Any?) {
        val args = arguments as? Map<*, *>
        val modeValue = args?.get("mode")?.toString()
        val nextMode = ZoomMode.fromWire(modeValue)
        if (zoomMode == nextMode) {
            return
        }

        zoomMode = nextMode
        applyVideoLayout()
    }

    private fun applyVideoLayout() {
        val currentParams = videoView.layoutParams as? FrameLayout.LayoutParams
        val layoutParams = currentParams ?: FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT,
            Gravity.CENTER,
        )

        if (zoomMode == ZoomMode.STRETCH) {
            updateVideoLayoutParams(
                layoutParams = layoutParams,
                width = FrameLayout.LayoutParams.MATCH_PARENT,
                height = FrameLayout.LayoutParams.MATCH_PARENT,
            )
            return
        }

        val containerWidth = containerView.width
        val containerHeight = containerView.height
        val sourceWidth = videoWidthPx.toFloat() * videoPixelRatio
        val sourceHeight = videoHeightPx.toFloat()
        if (containerWidth <= 0 || containerHeight <= 0 || sourceWidth <= 0f || sourceHeight <= 0f) {
            updateVideoLayoutParams(
                layoutParams = layoutParams,
                width = FrameLayout.LayoutParams.MATCH_PARENT,
                height = FrameLayout.LayoutParams.MATCH_PARENT,
            )
            return
        }

        val containerAspect = containerWidth.toFloat() / containerHeight.toFloat()
        val sourceAspect = sourceWidth / sourceHeight
        val targetSize = when (zoomMode) {
            ZoomMode.FIT -> {
                if (containerAspect > sourceAspect) {
                    val targetHeight = containerHeight
                    val targetWidth = (targetHeight * sourceAspect).roundToInt()
                    targetWidth to targetHeight
                } else {
                    val targetWidth = containerWidth
                    val targetHeight = (targetWidth / sourceAspect).roundToInt()
                    targetWidth to targetHeight
                }
            }

            ZoomMode.CROP -> {
                if (containerAspect > sourceAspect) {
                    val targetWidth = containerWidth
                    val targetHeight = (targetWidth / sourceAspect).roundToInt()
                    targetWidth to targetHeight
                } else {
                    val targetHeight = containerHeight
                    val targetWidth = (targetHeight * sourceAspect).roundToInt()
                    targetWidth to targetHeight
                }
            }

            ZoomMode.STRETCH -> FrameLayout.LayoutParams.MATCH_PARENT to FrameLayout.LayoutParams.MATCH_PARENT
        }

        updateVideoLayoutParams(
            layoutParams = layoutParams,
            width = targetSize.first.coerceAtLeast(1),
            height = targetSize.second.coerceAtLeast(1),
        )
    }

    private fun updateVideoLayoutParams(
        layoutParams: FrameLayout.LayoutParams,
        width: Int,
        height: Int,
    ) {
        if (
            layoutParams.width == width &&
            layoutParams.height == height &&
            layoutParams.gravity == Gravity.CENTER
        ) {
            return
        }

        layoutParams.width = width
        layoutParams.height = height
        layoutParams.gravity = Gravity.CENTER
        videoView.layoutParams = layoutParams
    }

    private fun applySubtitleRendererMode(mode: SubtitleRendererMode) {
        when (mode) {
            SubtitleRendererMode.NATIVE,
            SubtitleRendererMode.ASS_OVERLAY,
            -> {
                subtitleView.visibility = View.VISIBLE
                subtitleView.setApplyEmbeddedStyles(subtitleEmbeddedStylesEnabled)
                subtitleView.setApplyEmbeddedFontSizes(subtitleEmbeddedFontSizesEnabled)
            }
        }
    }

    private fun refreshSubtitleRendererMode() {
        val desiredMode = SubtitleRendererMode.NATIVE
        val resolvedMode = SubtitleRendererMode.NATIVE
        val fallbackReason = if (requestedSubtitleRendererMode == SubtitleRendererMode.ASS_OVERLAY) {
            "handledByAssMedia"
        } else {
            null
        }

        val previousActive = activeSubtitleRendererMode
        activeSubtitleRendererMode = resolvedMode

        applySubtitleRendererMode(activeSubtitleRendererMode)

        if (previousActive != activeSubtitleRendererMode || desiredMode != previousActive) {
            emitSubtitleRendererModeChanged(desiredMode)
        }

        if (desiredMode != resolvedMode && !fallbackReason.isNullOrBlank()) {
            emitSubtitleRendererFallback(desiredMode, resolvedMode, fallbackReason)
        }
    }

    private fun emitSubtitleRendererFallback(
        desiredMode: SubtitleRendererMode,
        activeMode: SubtitleRendererMode,
        reason: String,
    ) {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "subtitleRendererFallback",
                "requestedMode" to requestedSubtitleRendererMode.wireValue,
                "desiredMode" to desiredMode.wireValue,
                "activeMode" to activeMode.wireValue,
                "reason" to reason,
                "codec" to selectedSubtitleCodec,
                "isExternalSubtitle" to selectedSubtitleIsExternal,
                "isBitmapSubtitle" to selectedSubtitleIsBitmap,
            ),
        )
    }

    private fun emitSubtitleRendererModeChanged(desiredMode: SubtitleRendererMode) {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "subtitleRendererModeChanged",
                "requestedMode" to requestedSubtitleRendererMode.wireValue,
                "desiredMode" to desiredMode.wireValue,
                "activeMode" to activeSubtitleRendererMode.wireValue,
                "usesFallback" to (desiredMode != activeSubtitleRendererMode),
                "codec" to selectedSubtitleCodec,
                "isExternalSubtitle" to selectedSubtitleIsExternal,
                "isBitmapSubtitle" to selectedSubtitleIsBitmap,
            ),
        )
    }

    private fun clearAssSubtitleScript() {
    }

    private fun addExternalSubtitle(args: Map<*, *>?) {
        val url = args?.get("url")?.toString() ?: return
        val codec = args["codec"]?.toString()
        val language = args["language"]?.toString()
        val title = args["title"]?.toString()

        val subtitleBuilder = MediaItem.SubtitleConfiguration.Builder(Uri.parse(url))
            .setSelectionFlags(C.SELECTION_FLAG_DEFAULT)
            // ass-media matches selected Media3 text tracks back to libass tracks by ID.
            .setId((EXTERNAL_SUBTITLE_ID_BASE + externalSubtitleConfigurations.size).toString())

        val mimeType = codecToMimeType(codec)
        if (!mimeType.isNullOrEmpty()) {
            subtitleBuilder.setMimeType(mimeType)
        }
        if (!language.isNullOrEmpty()) {
            subtitleBuilder.setLanguage(language)
        }
        if (!title.isNullOrEmpty()) {
            subtitleBuilder.setLabel(title)
        }

        externalSubtitleConfigurations.add(subtitleBuilder.build())
        applyTrackSelectorForCurrentSource()

        val playWhenReady = player.playWhenReady
        val currentPosition = player.currentPosition
        setMediaItem(currentPosition, playWhenReady = playWhenReady)
    }

    private fun configureSubtitleStyle(args: Map<*, *>?) {
        val textColor = (args?.get("textColor") as? Number)?.toInt() ?: Color.WHITE
        val bgColor = (args?.get("backgroundColor") as? Number)?.toInt() ?: Color.TRANSPARENT
        val strokeColor = (args?.get("strokeColor") as? Number)?.toInt() ?: Color.TRANSPARENT
        val fontSize = (args?.get("fontSize") as? Number)?.toFloat()
        val fontWeight = (args?.get("fontWeight") as? Number)?.toInt() ?: 400
        val bold = (args?.get("bold") as? Boolean) ?: (fontWeight >= 600)
        val verticalOffset = (args?.get("verticalOffset") as? Number)?.toFloat()
        val applyEmbeddedStyles = args?.get("applyEmbeddedStyles") as? Boolean
        val applyEmbeddedFontSizes = args?.get("applyEmbeddedFontSizes") as? Boolean

        val edgeType = if (strokeColor != Color.TRANSPARENT) {
            CaptionStyleCompat.EDGE_TYPE_OUTLINE
        } else {
            CaptionStyleCompat.EDGE_TYPE_NONE
        }

        if (applyEmbeddedStyles != null) {
            subtitleEmbeddedStylesEnabled = applyEmbeddedStyles
        }
        if (applyEmbeddedFontSizes != null) {
            subtitleEmbeddedFontSizesEnabled = applyEmbeddedFontSizes
        }
        refreshSubtitleRendererMode()

        // Use the OS default typeface so Android falls back per script
        // for glyphs beyond Latin, instead of a bundled font
        // that only covers Latin and renders everything else as tofu.
        val baseTypeface = Typeface.DEFAULT
        val resolvedTypeface = if (bold) {
            Typeface.create(baseTypeface, Typeface.BOLD)
        } else {
            baseTypeface
        }

        subtitleView.setStyle(
            CaptionStyleCompat(
                textColor,
                bgColor,
                Color.TRANSPARENT,
                edgeType,
                strokeColor,
                resolvedTypeface,
            ),
        )

        if (fontSize != null) {
            val fractionalTextSize = (fontSize / 24f) * 0.06f
            subtitleView.setFractionalTextSize(fractionalTextSize.coerceAtLeast(0.01f))
        }

        if (verticalOffset != null) {
            subtitleView.setBottomPaddingFraction(verticalOffset.coerceIn(0f, 0.95f))
        }
    }

    private fun setMediaItem(startPositionMs: Long, playWhenReady: Boolean) {
        val url = currentUrl ?: return

        val subtitleConfigurations = externalSubtitleConfigurations.toList()
        val mediaItemBuilder = MediaItem.Builder()
            .setUri(url)
            .setSubtitleConfigurations(subtitleConfigurations)
            .setMediaMetadata(buildNowPlayingMetadata())
        val inferredMimeType = inferStreamMimeType(url, currentContainer, currentMediaType)
        inferredMimeType?.let { mimeType ->
            mediaItemBuilder.setMimeType(mimeType)
        }
        val mediaItem = mediaItemBuilder.build()
        player.setMediaItem(mediaItem, startPositionMs)
        player.prepare()
        if (playWhenReady) {
            player.playWhenReady = true
            player.play()
        } else {
            player.playWhenReady = false
        }
        emitState()
    }

    fun refreshNowPlayingMetadata() {
        val index = player.currentMediaItemIndex
        if (index == C.INDEX_UNSET || index < 0 || index >= player.mediaItemCount) {
            return
        }

        val currentMediaItem = player.getMediaItemAt(index)
        val updatedItem = currentMediaItem.buildUpon()
            .setMediaMetadata(buildNowPlayingMetadata())
            .build()
        player.replaceMediaItem(index, updatedItem)
    }

    private fun buildNowPlayingMetadata(): MediaMetadata {
        val uiMetadata = Media3Bridge.activeUiMetadata()
        val topTitle = uiMetadata["topTitle"]?.toString()?.trim().orEmpty()
        val topSubtitle = uiMetadata["topSubtitle"]?.toString()?.trim().orEmpty()
        val artworkUrl = uiMetadata["artworkUrl"]?.toString()?.trim().orEmpty()

        return MediaMetadata.Builder().apply {
            if (topTitle.isNotEmpty()) {
                setTitle(topTitle)
                setDisplayTitle(topTitle)
            }
            if (topSubtitle.isNotEmpty()) {
                setSubtitle(topSubtitle)
                setArtist(topSubtitle)
            }
            if (artworkUrl.isNotEmpty()) {
                runCatching {
                    setArtworkUri(Uri.parse(artworkUrl))
                }
            }
        }.build()
    }

    private fun inferStreamMimeType(url: String, container: String?, mediaType: String?): String? {
        val normalizedMediaType = mediaType?.trim()?.lowercase()
        val normalizedUrl = url.lowercase()

        when {
            normalizedUrl.startsWith("rtsp://") -> return MimeTypes.APPLICATION_RTSP
            normalizedUrl.contains(".m3u8") -> return MimeTypes.APPLICATION_M3U8
            normalizedUrl.contains(".mpd") -> return MimeTypes.APPLICATION_MPD
            normalizedUrl.contains(".ism") || normalizedUrl.contains(".isml") -> return MimeTypes.APPLICATION_SS
        }

        val containerTokens = container
            ?.split(',', ';', '|', ' ')
            ?.mapNotNull { token -> token.trim().lowercase().takeIf { it.isNotEmpty() } }
            ?: emptyList()

        for (token in containerTokens) {
            when (token) {
                "hls", "m3u8" -> return MimeTypes.APPLICATION_M3U8
                "dash", "mpd" -> return MimeTypes.APPLICATION_MPD
                "ss", "smoothstreaming", "ism" -> return MimeTypes.APPLICATION_SS
                "rtsp" -> return MimeTypes.APPLICATION_RTSP
            }
            inferAudioMimeType(token, normalizedMediaType)?.let { return it }
            inferVideoMimeType(token, normalizedMediaType)?.let { return it }
        }

        return when {
            normalizedUrl.contains(".mkv") -> MimeTypes.VIDEO_MATROSKA
            normalizedUrl.contains(".webm") -> MimeTypes.VIDEO_WEBM
            normalizedUrl.contains(".mov") -> MimeTypes.VIDEO_QUICK_TIME
            normalizedUrl.contains(".mp4") || normalizedUrl.contains(".m4v") -> MimeTypes.VIDEO_MP4
            normalizedUrl.contains(".avi") -> MimeTypes.VIDEO_AVI
            normalizedUrl.contains(".flv") -> MimeTypes.VIDEO_FLV
            normalizedUrl.contains(".ts") || normalizedUrl.contains(".m2ts") || normalizedUrl.contains(".mts") -> MimeTypes.VIDEO_MP2T
            normalizedUrl.contains(".mpg") || normalizedUrl.contains(".mpeg") -> MimeTypes.VIDEO_MPEG
            normalizedUrl.contains(".ogv") -> MimeTypes.VIDEO_OGG
            normalizedUrl.contains(".flac") -> MimeTypes.AUDIO_FLAC
            normalizedUrl.contains(".mp3") -> MimeTypes.AUDIO_MPEG
            normalizedUrl.contains(".m4a") || normalizedUrl.contains(".aac") -> MimeTypes.AUDIO_AAC
            normalizedUrl.contains(".opus") -> MimeTypes.AUDIO_OPUS
            normalizedUrl.contains(".ogg") || normalizedUrl.contains(".oga") -> MimeTypes.AUDIO_OGG
            normalizedUrl.contains(".wav") || normalizedUrl.contains(".wave") -> MimeTypes.AUDIO_WAV
            normalizedUrl.contains(".ac3") -> MimeTypes.AUDIO_AC3
            normalizedUrl.contains(".eac3") -> MimeTypes.AUDIO_E_AC3
            normalizedUrl.contains(".dts") -> MimeTypes.AUDIO_DTS
            normalizedUrl.contains(".mka") -> MimeTypes.AUDIO_MATROSKA
            else -> null
        }
    }

    private fun inferVideoMimeType(containerToken: String, mediaType: String?): String? {
        if (mediaType == "audio") {
            return null
        }
        return when (containerToken) {
            "mkv",
            "matroska",
            -> MimeTypes.VIDEO_MATROSKA

            "webm" -> MimeTypes.VIDEO_WEBM
            "mov" -> MimeTypes.VIDEO_QUICK_TIME
            "mp4",
            "m4v",
            -> MimeTypes.VIDEO_MP4

            "avi" -> MimeTypes.VIDEO_AVI
            "flv" -> MimeTypes.VIDEO_FLV
            "ts",
            "m2ts",
            "mts",
            -> MimeTypes.VIDEO_MP2T

            "mp2p",
            "ps",
            -> MimeTypes.VIDEO_PS

            "mpg",
            "mpeg",
            -> MimeTypes.VIDEO_MPEG

            "ogv" -> MimeTypes.VIDEO_OGG
            else -> null
        }
    }

    private fun inferAudioMimeType(containerToken: String, mediaType: String?): String? {
        return when (containerToken) {
            "mp3" -> MimeTypes.AUDIO_MPEG
            "flac" -> MimeTypes.AUDIO_FLAC
            "aac" -> MimeTypes.AUDIO_AAC
            "m4a",
            "m4b",
            -> MimeTypes.AUDIO_AAC

            "mp4" -> if (mediaType == "audio") MimeTypes.AUDIO_AAC else null
            "opus" -> MimeTypes.AUDIO_OPUS
            "ogg",
            "oga",
            -> MimeTypes.AUDIO_OGG

            "wav",
            "wave",
            -> MimeTypes.AUDIO_WAV

            "wma" -> "audio/x-ms-wma"
            "alac" -> "audio/alac"
            "ac3" -> MimeTypes.AUDIO_AC3
            "eac3" -> MimeTypes.AUDIO_E_AC3
            "dts" -> MimeTypes.AUDIO_DTS
            "mka",
            "matroska",
            -> MimeTypes.AUDIO_MATROSKA

            else -> null
        }
    }

    private fun retryAudioWithoutOffloadIfNeeded(error: PlaybackException): Boolean {
        val isAudioContent = currentMediaType == "audio"
        val isRetryableError =
            error.errorCode == PlaybackException.ERROR_CODE_AUDIO_TRACK_INIT_FAILED ||
                error.errorCode == PlaybackException.ERROR_CODE_DECODING_FORMAT_UNSUPPORTED

        if (!isAudioContent || !isRetryableError || audioOffloadDisabled || audioOffloadRetryAttemptedForCurrentSource) {
            return false
        }

        audioOffloadRetryAttemptedForCurrentSource = true
        val mediaItem = player.currentMediaItem ?: return false
        val retryPositionMs = player.currentPosition.coerceAtLeast(0L)
        val playWhenReady = player.playWhenReady

        audioOffloadDisabled = true
        applyTrackSelectorForCurrentSource()
        player.setMediaItem(mediaItem, retryPositionMs)
        player.prepare()
        player.playWhenReady = playWhenReady
        return true
    }

    /**
     * Recovery for `AudioTrack init failed` (e.g. AAC 7.1 decoded to 8-channel
     * PCM on a device that can only open a stereo PCM AudioTrack). Enables an
     * in-place stereo downmix and re-prepares from the current position, which
     * avoids a costly server-transcode round-trip. Applies to both audio-only
     * and video content.
     */
    private fun retryAudioWithStereoDownmixIfNeeded(error: PlaybackException): Boolean {
        val isRetryableError =
            error.errorCode == PlaybackException.ERROR_CODE_AUDIO_TRACK_INIT_FAILED ||
                error.errorCode == PlaybackException.ERROR_CODE_AUDIO_TRACK_WRITE_FAILED

        if (!isRetryableError || stereoDownmixEnabled || stereoDownmixRetryAttemptedForCurrentSource) {
            return false
        }

        val mediaItem = player.currentMediaItem ?: return false
        stereoDownmixRetryAttemptedForCurrentSource = true
        val retryPositionMs = player.currentPosition.coerceAtLeast(0L)
        val playWhenReady = player.playWhenReady

        // Sticky for the rest of the session so later items start downmixed
        // instead of failing the AudioTrack init again.
        deviceRequiresStereoDownmix = true
        applyStereoDownmix(true)
        player.setMediaItem(mediaItem, retryPositionMs)
        player.prepare()
        player.playWhenReady = playWhenReady
        return true
    }

    /**
     * Enable or disable the stereo downmix on [channelMixingProcessor].
     *
     * When enabled, registers downmix matrices for 3-8 input channels (to 2)
     * and identity matrices for mono/stereo input. Identity matrices for 1-2 are
     * required: the processor throws on any input channel count it has no matrix
     * for once it is active. When disabled, all counts get identity matrices so
     * isActive() is false and the processor is bypassed entirely.
     */
    private fun applyStereoDownmix(enabled: Boolean) {
        stereoDownmixEnabled = enabled
        for (channelCount in 1..8) {
            val matrix = if (enabled && channelCount > 2) {
                ChannelMixingMatrix(channelCount, 2, buildStereoDownmixCoefficients(channelCount))
            } else {
                ChannelMixingMatrix(channelCount, channelCount, identityCoefficients(channelCount))
            }
            runCatching { channelMixingProcessor.putChannelMixingMatrix(matrix) }
        }
    }

    /**
     * Row-major [inputChannel * 2 + output] downmix coefficients (output 0 = L,
     * 1 = R) following the conventional ITU-R BS.775 stereo fold-down. Assumes
     * the standard Android/ExoPlayer PCM channel order
     * (FL, FR, FC, LFE, BL, BR, SL, SR). LFE is dropped; centre and surrounds
     * are mixed at -3 dB.
     */
    private fun buildStereoDownmixCoefficients(inputChannelCount: Int): FloatArray {
        val coefficients = FloatArray(inputChannelCount * 2)
        val minus3dB = 0.7071068f
        for (channel in 0 until inputChannelCount) {
            val (toLeft, toRight) = when (channel) {
                0 -> 1f to 0f          // Front Left
                1 -> 0f to 1f          // Front Right
                2 -> minus3dB to minus3dB // Front Centre
                3 -> 0f to 0f          // LFE (dropped)
                4 -> minus3dB to 0f    // Back/Surround Left
                5 -> 0f to minus3dB    // Back/Surround Right
                6 -> minus3dB to 0f    // Side Left
                7 -> 0f to minus3dB    // Side Right
                else -> minus3dB to minus3dB
            }
            coefficients[channel * 2] = toLeft
            coefficients[channel * 2 + 1] = toRight
        }
        return coefficients
    }

    private fun identityCoefficients(channelCount: Int): FloatArray {
        val coefficients = FloatArray(channelCount * channelCount)
        for (channel in 0 until channelCount) {
            coefficients[channel * channelCount + channel] = 1f
        }
        return coefficients
    }

    private fun queryHardwareAv1DecoderAvailability(): Boolean {
        return runCatching {
            MediaCodecList(MediaCodecList.ALL_CODECS).codecInfos.any { codecInfo ->
                if (codecInfo.isEncoder) {
                    return@any false
                }

                val supportsAv1 = codecInfo.supportedTypes.any { supportedType ->
                    supportedType.equals(MimeTypes.VIDEO_AV1, ignoreCase = true)
                }
                if (!supportsAv1) {
                    return@any false
                }

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    return@any codecInfo.isHardwareAccelerated
                }

                val codecName = codecInfo.name.lowercase()
                !codecName.startsWith("omx.google.") &&
                    !codecName.startsWith("c2.android.") &&
                    !codecName.startsWith("c2.google.")
            }
        }.getOrDefault(false)
    }

    private fun emitRecoverablePlayerError(
        error: PlaybackException,
        audioOffloadRetryTriggered: Boolean,
    ) {
        val recoverableKind = when (error.errorCode) {
            PlaybackException.ERROR_CODE_AUDIO_TRACK_INIT_FAILED,
            PlaybackException.ERROR_CODE_AUDIO_TRACK_WRITE_FAILED,
            PlaybackException.ERROR_CODE_DECODING_FORMAT_UNSUPPORTED,
            PlaybackException.ERROR_CODE_DECODING_FORMAT_EXCEEDS_CAPABILITIES,
            -> "unsupported_audio"

            // No extractor could read the stream (e.g. brand-less MP4 / remux
            // that fails byte-sniffing, UnrecognizedInputFormatException). The
            // MIME hint only picks the media source, not the extractor, so the
            // only reliable recovery for a server client is a transcode fallback.
            PlaybackException.ERROR_CODE_PARSING_CONTAINER_UNSUPPORTED,
            PlaybackException.ERROR_CODE_PARSING_CONTAINER_MALFORMED,
            -> if (containerFallbackAttempted) null else "unsupported_container"

            else -> null
        }

        if (recoverableKind == null) {
            return
        }

        if (recoverableKind == "unsupported_container") {
            // Guard against re-emitting for the same source; the Dart side also
            // refuses to re-resolve when already transcoding, so this cannot loop.
            containerFallbackAttempted = true
        }

        Media3Bridge.emitEvent(
            mapOf(
                "event" to "playerError",
                "recoverable" to true,
                "kind" to recoverableKind,
                "code" to error.errorCode,
                "message" to (error.localizedMessage ?: ""),
                "audioOffloadRetryTriggered" to audioOffloadRetryTriggered,
            ),
        )
    }

    private fun selectTrack(trackType: Int, oneBasedIndex: Int): Boolean {
        val entries = collectTracks(trackType)
        if (oneBasedIndex <= 0 || oneBasedIndex > entries.size) {
            return false
        }
        val entry = entries[oneBasedIndex - 1]

        return try {
            val override = TrackSelectionOverride(entry.group, listOf(entry.trackIndex))

            trackSelector.parameters = trackSelector.parameters
                .buildUpon()
                .setTrackTypeDisabled(trackType, false)
                .clearOverridesOfType(trackType)
                .addOverride(override)
                .build()

            emitTracksChanged()
            emitState()
            true
        } catch (_: Throwable) {
            emitTracksChanged()
            emitState()
            false
        }
    }

    private fun collectTracks(trackType: Int): List<TrackEntry> {
        val entries = mutableListOf<TrackEntry>()

        for (group in player.currentTracks.groups) {
            if (group.type != trackType) continue
            val mediaTrackGroup = group.mediaTrackGroup
            for (index in 0 until group.length) {
                if (group.isTrackSupported(index)) {
                    entries.add(TrackEntry(mediaTrackGroup, index))
                }
            }
        }

        return entries
    }

    private fun trackCount(trackType: Int): Int = collectTracks(trackType).size

    private fun trackStateMap(): Map<String, Any?> {
        return mapOf(
            "audioTracks" to collectTrackOptions(C.TRACK_TYPE_AUDIO),
            "subtitleTracks" to collectTrackOptions(C.TRACK_TYPE_TEXT),
        )
    }

    private fun collectTrackOptions(trackType: Int): List<Map<String, Any?>> {
        val options = mutableListOf<Map<String, Any?>>()
        var oneBasedIndex = 1

        for (group in player.currentTracks.groups) {
            if (group.type != trackType) continue

            for (trackIndex in 0 until group.length) {
                if (!group.isTrackSupported(trackIndex)) continue

                val format = group.getTrackFormat(trackIndex)
                options.add(
                    mapOf(
                        "index" to oneBasedIndex,
                        "label" to formatTrackLabel(format, trackType, oneBasedIndex),
                        "selected" to group.isTrackSelected(trackIndex),
                        "language" to (format.language ?: ""),
                        "codec" to (format.codecs ?: format.sampleMimeType ?: ""),
                    ),
                )
                oneBasedIndex += 1
            }
        }

        return options
    }

    private fun formatTrackLabel(format: Format, trackType: Int, fallbackIndex: Int): String {
        val explicitLabel = format.label?.trim().orEmpty()
        if (explicitLabel.isNotEmpty()) {
            return explicitLabel
        }

        val language = format.language
            ?.takeIf { it.isNotBlank() && it != "und" }
            ?.replaceFirstChar { it.uppercase() }
        val codec = format.codecs
            ?.takeIf { it.isNotBlank() }
            ?: format.sampleMimeType
                ?.substringAfterLast('.')
                ?.takeIf { it.isNotBlank() }
                ?.uppercase()

        val pieces = listOfNotNull(language, codec)
        if (pieces.isNotEmpty()) {
            return pieces.joinToString(" • ")
        }

        return "${trackTypeLabel(trackType)} $fallbackIndex"
    }

    private fun trackTypeLabel(trackType: Int): String {
        return when (trackType) {
            C.TRACK_TYPE_AUDIO -> "Audio"
            C.TRACK_TYPE_TEXT -> "Subtitle"
            else -> "Track"
        }
    }

    private fun emitTracksChanged() {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "tracksChanged",
                "audioTrackCount" to trackCount(C.TRACK_TYPE_AUDIO),
                "textTrackCount" to trackCount(C.TRACK_TYPE_TEXT),
                "subtitleRendererMode" to activeSubtitleRendererMode.wireValue,
                "subtitleRendererModeRequested" to requestedSubtitleRendererMode.wireValue,
            ),
        )
    }

    private fun stateMap(): Map<String, Any> {
        val duration = player.duration
        val bufferedPosition = player.bufferedPosition
        val videoSize = player.videoSize
        return mapOf(
            "positionMs" to player.currentPosition,
            "durationMs" to if (duration > 0) duration else 0L,
            "bufferedMs" to if (bufferedPosition > 0) bufferedPosition else 0L,
            "isPlaying" to player.isPlaying,
            "isBuffering" to (player.playbackState == Player.STATE_BUFFERING),
            "playbackSpeed" to player.playbackParameters.speed.toDouble(),
            "videoWidth" to videoSize.width,
            "videoHeight" to videoSize.height,
            "repeatMode" to repeatModeToWire(player.repeatMode),
            "skipSilenceEnabled" to skipSilenceEnabled,
            "audioDelayMs" to audioDelayMs,
            "subtitleDelayMs" to subtitleDelayMs,
            "volumeBoostLevel" to userVolumeBoostLevel,
            "subtitleRendererMode" to activeSubtitleRendererMode.wireValue,
            "subtitleRendererModeRequested" to requestedSubtitleRendererMode.wireValue,
        )
    }

    private fun emitState() {
        if (suppressStateEmissionsForRekick) return
        Media3Bridge.emitEvent(stateMap() + ("event" to "state"))
    }

    private fun startTicker() {
        val runnable = object : Runnable {
            override fun run() {
                emitState()
                mainHandler.postDelayed(this, 250L)
            }
        }
        ticker = runnable
        mainHandler.post(runnable)
    }

    private fun stopTicker() {
        ticker?.let { mainHandler.removeCallbacks(it) }
        ticker = null
    }

    private fun codecToMimeType(codec: String?): String? {
        val normalized = codec?.trim()?.lowercase() ?: return null
        return when (normalized) {
            "ass", "ssa" -> MimeTypes.TEXT_SSA
            "srt", "subrip" -> MimeTypes.APPLICATION_SUBRIP
            "vtt", "webvtt" -> MimeTypes.TEXT_VTT
            "ttml" -> MimeTypes.APPLICATION_TTML
            "pgs", "pgssub", "hdmv_pgs_subtitle" -> MimeTypes.APPLICATION_PGS
            "dvbsub", "dvb_subtitle" -> MimeTypes.APPLICATION_DVBSUBS
            "dvdsub", "dvd_subtitle", "vobsub", "xsub" -> MimeTypes.APPLICATION_VOBSUB
            else -> null
        }
    }
}
