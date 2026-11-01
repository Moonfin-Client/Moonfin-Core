package org.moonfin.nativevideo

import android.media.MediaFormat
import androidx.media3.common.Format
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.video.VideoFrameMetadataListener
import kotlin.math.abs

/** Where along the pipeline a frame's timing was read. */
internal enum class FrameTimingStage(val wireValue: String) {
    /** Sample timestamps as the demuxer writes them, a buffer ahead of playback. */
    DEMUX("demux"),

    /** Presentation timestamps the decoder hands back for frames about to show. */
    OUTPUT("output"),

    /** The release times Media3 schedules for those frames. */
    RELEASE("release"),

    /** The release times that actually reach the codec, after [VsyncPacer]. */
    PACED("paced"),
}

/** One report from [FrameTimingProbe]. */
internal class FrameTimingReport(
    val stage: FrameTimingStage,
    val cadence: FrameCadence,
    val sampleMimeType: String?,
    /** The declared rate, [Format.NO_VALUE] when none was given. */
    val formatFrameRate: Float,
    val lastTimestampUs: Long,
    val discontinuities: Int,
    /**
     * Whether this agrees with the demuxer's latest reading. Kept null until
     * reports are aligned to the same media-time window.
     */
    val matchesDemux: Boolean?,
)

/**
 * Follows a frame's timing through each stage of the pipeline and reports the
 * [FrameCadence] at each one, so a stage that bends the timing shows up as the
 * point where its reading parts from the one before. Observation only.
 *
 * The demuxer stage is fed on the loading thread. The other three arrive on the
 * playback thread: Media3's frame-metadata callback for [FrameTimingStage.OUTPUT]
 * and [FrameTimingStage.RELEASE], and the codec adapter for
 * [FrameTimingStage.PACED]. [onReport] is called on whichever of those threads
 * produced the report.
 *
 * [latest] keeps the most recent reading per stage for anything that wants to
 * act on it later.
 */
@UnstableApi
internal class FrameTimingProbe(
    private val onReport: (FrameTimingReport) -> Unit,
) : VideoFrameMetadataListener {

    private val latestByStage = java.util.concurrent.ConcurrentHashMap<FrameTimingStage, FrameCadence>()

    // Playback-thread state.
    private val output = FrameCadenceObserver(reorderDepth = 0)
    private val release = FrameCadenceObserver(reorderDepth = 0)
    private val paced = FrameCadenceObserver(reorderDepth = 0)
    private var seenProcessingGeneration = 0
    private var mimeType: String? = null
    private var formatFrameRate = Format.NO_VALUE.toFloat()
    private val generationLock = Any()

    @Volatile
    private var sourceGeneration = 0

    @Volatile
    private var processingGeneration = 0

    /** Token to capture when constructing a source-specific demux observer. */
    val generationToken: Int
        get() = sourceGeneration

    fun latest(stage: FrameTimingStage): FrameCadence? = latestByStage[stage]

    /**
     * A new source: invalidate its old demux callbacks and clear stage caches.
     * Playback-thread stages start over when they next see a frame.
     */
    fun reset() {
        synchronized(generationLock) {
            sourceGeneration++
            processingGeneration++
            latestByStage.clear()
        }
    }

    /** A seek within the current source: clear readings but keep its demux token valid. */
    fun resetForDiscontinuity() {
        synchronized(generationLock) {
            processingGeneration++
            latestByStage.clear()
        }
    }

    /** The demuxer stage, which resets itself with the extractor. Stale sources are ignored. */
    fun onDemuxReport(report: CadenceReport, sourceGeneration: Int) {
        val accepted = synchronized(generationLock) {
            if (sourceGeneration != this.sourceGeneration) {
                false
            } else {
                latestByStage[FrameTimingStage.DEMUX] = report.cadence
                true
            }
        }
        if (!accepted) return
        publish(
            FrameTimingReport(
                stage = FrameTimingStage.DEMUX,
                cadence = report.cadence,
                sampleMimeType = report.sampleMimeType,
                formatFrameRate = report.formatFrameRate,
                lastTimestampUs = report.lastTimestampUs,
                discontinuities = report.discontinuities,
                matchesDemux = null,
            ),
        )
    }

    override fun onVideoFrameAboutToBeRendered(
        presentationTimeUs: Long,
        releaseTimeNs: Long,
        format: Format,
        mediaFormat: MediaFormat?,
    ) {
        syncGeneration()
        mimeType = format.sampleMimeType
        formatFrameRate = format.frameRate
        feed(FrameTimingStage.OUTPUT, output, presentationTimeUs)
        feed(FrameTimingStage.RELEASE, release, releaseTimeNs / 1000)
    }

    /** From the codec adapter, after [VsyncPacer] has had its say. */
    fun onPacedRelease(requestedNs: Long, pacedNs: Long) {
        syncGeneration()
        feed(FrameTimingStage.PACED, paced, pacedNs / 1000)
    }

    private fun syncGeneration() {
        val current = processingGeneration
        if (current == seenProcessingGeneration) return
        seenProcessingGeneration = current
        output.reset()
        release.reset()
        paced.reset()
    }

    private fun feed(stage: FrameTimingStage, observer: FrameCadenceObserver, timeUs: Long) {
        val cadence = runCatching { observer.onFrame(timeUs) }.getOrNull() ?: return
        latestByStage[stage] = cadence
        // Latest demux/output reports can describe different media-time
        // windows, so a binary comparison here would imply unsupported evidence.
        publish(
            FrameTimingReport(
                stage = stage,
                cadence = cadence,
                sampleMimeType = mimeType,
                formatFrameRate = formatFrameRate,
                lastTimestampUs = observer.lastTimestampUs,
                discontinuities = observer.discontinuities,
                matchesDemux = null,
            ),
        )
    }

    private fun publish(report: FrameTimingReport) {
        runCatching { onReport(report) }
    }

    companion object {
        /** Two grid-less readings with dominant intervals this close describe the same timing. */
        const val MATCH_TOLERANCE_US = 1_000L

        /**
         * Whether two stages saw the same timing: the same kind on the same
         * refresh grid. A decoder that rewrites timestamps moves the grid (the
         * X-Files case read 23.976 at the demuxer and 29.97 at the output),
         * while variable content on one grid keeps it.
         */
        fun matches(a: FrameCadence, b: FrameCadence): Boolean =
            if (a.gridHz != null || b.gridHz != null) {
                a.kind == b.kind && a.gridHz == b.gridHz
            } else {
                abs(a.dominantIntervalUs - b.dominantIntervalUs) <= MATCH_TOLERANCE_US
            }
    }
}
