package androidx.media3.exoplayer.source

import androidx.media3.common.Format
import androidx.media3.common.util.UnstableApi

/**
 * The lazy loading DefaultMediaSourceFactory gives its own sideloaded
 * subtitles, which Media3 keeps package private, so this file sits in
 * Media3's package to reach it. The period announces [format] as soon as it
 * prepares and only fetches the file once its track is selected.
 */
@UnstableApi
internal fun ProgressiveMediaSource.Factory.loadOnlyOnceSelected(
    trackId: Int,
    format: Format,
): ProgressiveMediaSource.Factory = enableLazyLoadingWithSingleTrack(trackId, format)
