package org.moonfin.nativevideo.subtitle

import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.MediaItem
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.UnstableApi
import androidx.media3.datasource.DataSource
import androidx.media3.exoplayer.source.MediaSource
import androidx.media3.exoplayer.source.ProgressiveMediaSource
import androidx.media3.exoplayer.source.loadOnlyOnceSelected
import androidx.media3.extractor.Extractor
import androidx.media3.extractor.ExtractorInput
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.ExtractorsFactory
import androidx.media3.extractor.PositionHolder
import androidx.media3.extractor.SeekMap
import androidx.media3.extractor.text.SubtitleExtractor
import androidx.media3.extractor.text.SubtitleParser
import java.io.IOException

/**
 * Builds a media source for one sideloaded subtitle the way
 * DefaultMediaSourceFactory does, which has to be repeated here because that
 * factory is final.
 *
 * The file is only fetched once its track is selected. A server extracting
 * subtitles out of a large file can take minutes to answer the first time,
 * and a source that read every file at prepare couldn't start playback until
 * the last of them came back.
 */
@UnstableApi
internal object SidecarSourceFactory {

    fun create(
        configuration: MediaItem.SubtitleConfiguration,
        dataSourceFactory: DataSource.Factory,
        parserFactory: SubtitleParser.Factory,
    ): MediaSource {
        val format = Format.Builder()
            .setSampleMimeType(configuration.mimeType)
            .setLanguage(configuration.language)
            .setSelectionFlags(configuration.selectionFlags)
            .setRoleFlags(configuration.roleFlags)
            .setLabel(configuration.label)
            .setId(configuration.id)
            .build()
        val canParse = parserFactory.supportsFormat(format)
        val extractorsFactory = ExtractorsFactory {
            arrayOf<Extractor>(
                if (canParse) {
                    SubtitleExtractor(parserFactory.create(format), /* format= */ null)
                } else {
                    UnknownSubtitlesExtractor(format)
                },
            )
        }
        val announcedFormat = if (canParse) {
            format.buildUpon()
                .setSampleMimeType(MimeTypes.APPLICATION_MEDIA3_CUES)
                .setCodecs(format.sampleMimeType)
                .setCueReplacementBehavior(parserFactory.getCueReplacementBehavior(format))
                .build()
        } else {
            format
        }
        return ProgressiveMediaSource.Factory(dataSourceFactory, extractorsFactory)
            .loadOnlyOnceSelected(SubtitleExtractor.TRACK_ID, announcedFormat)
            .createMediaSource(MediaItem.fromUri(configuration.uri))
    }
}

/**
 * Announces a text track no parser understands so it still shows in the
 * track list, then drains the file. A copy of the private class inside
 * DefaultMediaSourceFactory.
 */
@UnstableApi
private class UnknownSubtitlesExtractor(private val format: Format) : Extractor {

    @Throws(IOException::class)
    override fun sniff(input: ExtractorInput): Boolean = true

    override fun init(output: ExtractorOutput) {
        val trackOutput = output.track(SubtitleExtractor.TRACK_ID, C.TRACK_TYPE_TEXT)
        output.seekMap(SeekMap.Unseekable(C.TIME_UNSET))
        output.endTracks()
        trackOutput.format(
            format.buildUpon()
                .setSampleMimeType(MimeTypes.TEXT_UNKNOWN)
                .setCodecs(format.sampleMimeType)
                .build(),
        )
    }

    @Throws(IOException::class)
    override fun read(input: ExtractorInput, seekPosition: PositionHolder): Int {
        val skipResult = input.skip(Int.MAX_VALUE)
        return if (skipResult == C.RESULT_END_OF_INPUT) Extractor.RESULT_END_OF_INPUT else Extractor.RESULT_CONTINUE
    }

    override fun seek(position: Long, timeUs: Long) {}

    override fun release() {}
}
