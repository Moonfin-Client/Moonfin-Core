package org.moonfin.nativevideo.subtitle

import android.content.Context
import androidx.media3.common.AudioAttributes
import androidx.media3.common.C
import androidx.media3.common.Timeline
import androidx.media3.common.TrackGroup
import androidx.media3.common.TrackSelectionOverride
import androidx.media3.common.TrackSelectionParameters
import androidx.media3.common.Tracks
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.RendererCapabilities
import androidx.media3.exoplayer.RendererConfiguration
import androidx.media3.exoplayer.source.MediaSource.MediaPeriodId
import androidx.media3.exoplayer.source.TrackGroupArray
import androidx.media3.exoplayer.trackselection.DefaultTrackSelector
import androidx.media3.exoplayer.trackselection.FixedTrackSelection
import androidx.media3.exoplayer.trackselection.TrackSelector
import androidx.media3.exoplayer.trackselection.TrackSelectorResult
import androidx.media3.exoplayer.upstream.BandwidthMeter

/** Resolve an explicit override to its 1-based position before a source rebuild changes group IDs. */
@UnstableApi
internal fun overriddenTrackOrdinal(
    entries: List<Pair<TrackGroup, Int>>,
    overrides: Map<TrackGroup, TrackSelectionOverride>,
): Int? = entries.indexOfFirst { (group, index) ->
    overrides[group]?.trackIndices?.contains(index) == true
}.takeIf { it >= 0 }?.plus(1)

/**
 * Reserve the last renderer for secondary subtitles and use DefaultTrackSelector for
 * the others. Select the secondary track separately so it receives its own sample
 * stream from the same media period. The normal text selection uses only one renderer
 * here.
 */
@UnstableApi
internal class DualSubtitleTrackSelector(context: Context) : TrackSelector() {
    private val primary = DefaultTrackSelector(context)
    @Volatile private var secondary: TrackSelectionOverride? = null
    @Volatile private var activeSecondary: TrackSelectionOverride? = null
    @Volatile private var suspended = false
    @Volatile private var primaryTracks = Tracks.EMPTY
    private data class SelectionInfo(
        val primary: TrackSelectorResult,
        val secondary: TrackSelectionOverride?,
    )

    val currentMappedTrackInfo get() = primary.currentMappedTrackInfo

    fun isPrimaryTrackSelected(group: TrackGroup, index: Int): Boolean =
        primaryTracks.groups.any { it.mediaTrackGroup == group && it.isTrackSelected(index) }

    fun setSecondaryTrack(selection: TrackSelectionOverride?): Boolean {
        if (secondary == selection) return false
        secondary = selection
        invalidate()
        return true
    }

    fun isSecondaryTrackActive(group: TrackGroup, index: Int): Boolean {
        val active = activeSecondary ?: return false
        return active.mediaTrackGroup === group &&
            active.trackIndices.size == 1 &&
            active.trackIndices.single() == index
    }

    fun suspendSecondary(value: Boolean) {
        if (suspended == value) return
        suspended = value
        invalidate()
    }

    override fun init(listener: InvalidationListener, bandwidthMeter: BandwidthMeter) {
        super.init(listener, bandwidthMeter)
        primary.init(listener, bandwidthMeter)
    }

    override fun release() {
        activeSecondary = null
        primary.release()
        super.release()
    }

    override fun getParameters(): DefaultTrackSelector.Parameters = primary.parameters
    override fun setParameters(parameters: TrackSelectionParameters) = primary.setParameters(parameters)
    fun setParameters(builder: DefaultTrackSelector.Parameters.Builder) = primary.setParameters(builder)
    fun buildUponParameters(): DefaultTrackSelector.Parameters.Builder = primary.buildUponParameters()
    override fun isSetParametersSupported() = true
    override fun setAudioAttributes(audioAttributes: AudioAttributes) = primary.setAudioAttributes(audioAttributes)
    override fun getRendererCapabilitiesListener() = primary.rendererCapabilitiesListener
    override fun onSelectionActivated(info: Any?) {
        val selection = info as? SelectionInfo
        primaryTracks = selection?.primary?.tracks ?: Tracks.EMPTY
        activeSecondary = selection?.secondary
        primary.onSelectionActivated(selection?.primary?.info)
    }

    override fun selectTracks(
        rendererCapabilities: Array<out RendererCapabilities>,
        trackGroups: TrackGroupArray,
        periodId: MediaPeriodId,
        timeline: Timeline,
    ): TrackSelectorResult {
        val last = rendererCapabilities.lastIndex
        val result = primary.selectTracks(
            rendererCapabilities.copyOfRange(0, last), trackGroups, periodId, timeline,
        )
        val configurations = result.rendererConfigurations.copyOf(rendererCapabilities.size)
        val selections = result.selections.copyOf(rendererCapabilities.size)
        val requested = secondary?.takeUnless { suspended }
        if (requested != null && trackGroups.indexOf(requested.mediaTrackGroup) != C.INDEX_UNSET) {
            val group = requested.mediaTrackGroup
            val track = requested.trackIndices.single()
            val alreadyPrimary = result.selections.any {
                it?.trackGroup == group && it.indexOf(track) != C.INDEX_UNSET
            }
            val supported = RendererCapabilities.getFormatSupport(
                rendererCapabilities[last].supportsFormat(group.getFormat(track)),
            ) == C.FORMAT_HANDLED
            // A media period can't hand the same sample queue to two renderers.
            if (!alreadyPrimary && supported) {
                configurations[last] = RendererConfiguration.DEFAULT
                selections[last] = FixedTrackSelection(group, track)
            }
        }
        val selected = selections[last]
        val tracks = if (selected == null) result.tracks else Tracks(
            result.tracks.groups.map { group ->
                if (group.mediaTrackGroup != selected.trackGroup) group else Tracks.Group(
                    group.mediaTrackGroup,
                    group.isAdaptiveSupported,
                    IntArray(group.length) { group.getTrackSupport(it) },
                    BooleanArray(group.length) {
                        group.isTrackSelected(it) || selected.indexOf(it) != C.INDEX_UNSET
                    },
                )
            },
        )
        return TrackSelectorResult(
            configurations,
            selections,
            tracks,
            SelectionInfo(result, requested.takeIf { selected != null }),
        )
    }
}
