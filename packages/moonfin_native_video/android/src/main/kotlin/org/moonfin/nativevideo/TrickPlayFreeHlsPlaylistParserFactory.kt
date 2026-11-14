package org.moonfin.nativevideo

import android.net.Uri
import androidx.annotation.OptIn
import androidx.media3.common.C
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.hls.playlist.DefaultHlsPlaylistParserFactory
import androidx.media3.exoplayer.hls.playlist.HlsMediaPlaylist
import androidx.media3.exoplayer.hls.playlist.HlsMultivariantPlaylist
import androidx.media3.exoplayer.hls.playlist.HlsPlaylist
import androidx.media3.exoplayer.hls.playlist.HlsPlaylistParserFactory
import androidx.media3.exoplayer.upstream.ParsingLoadable
import java.io.InputStream

/**
 * Leaves I-frame-only (trick play) variants out of a multivariant playlist.
 *
 * Media3 decides whether the variants carry muxed audio from the codecs of the
 * first one it lists. A playlist that names its I-frame stream first, whose
 * codecs are video only, therefore plays with no audio track at all although
 * every segment carries it (Dungeon TV on a getpublica.com origin). Nothing
 * here plays trick-play variants, so dropping them costs nothing.
 */
@OptIn(UnstableApi::class)
internal class TrickPlayFreeHlsPlaylistParserFactory(
    private val delegate: HlsPlaylistParserFactory = DefaultHlsPlaylistParserFactory(),
) : HlsPlaylistParserFactory {

    override fun createPlaylistParser(): ParsingLoadable.Parser<HlsPlaylist> =
        withoutTrickPlay(delegate.createPlaylistParser())

    override fun createPlaylistParser(
        multivariantPlaylist: HlsMultivariantPlaylist,
        previousMediaPlaylist: HlsMediaPlaylist?,
    ): ParsingLoadable.Parser<HlsPlaylist> =
        withoutTrickPlay(delegate.createPlaylistParser(multivariantPlaylist, previousMediaPlaylist))

    private fun withoutTrickPlay(
        parser: ParsingLoadable.Parser<HlsPlaylist>,
    ): ParsingLoadable.Parser<HlsPlaylist> =
        ParsingLoadable.Parser { uri: Uri, inputStream: InputStream ->
            val playlist = parser.parse(uri, inputStream)
            if (playlist is HlsMultivariantPlaylist) withoutTrickPlay(playlist) else playlist
        }

    companion object {
        fun withoutTrickPlay(playlist: HlsMultivariantPlaylist): HlsMultivariantPlaylist {
            val variants = playlist.variants.filter {
                it.format.roleFlags and C.ROLE_FLAG_TRICK_PLAY == 0
            }
            // A playlist of nothing but trick play is left alone rather than emptied.
            if (variants.size == playlist.variants.size || variants.isEmpty()) return playlist
            return HlsMultivariantPlaylist(
                playlist.baseUri,
                playlist.tags,
                variants,
                playlist.videos,
                playlist.audios,
                playlist.subtitles,
                playlist.closedCaptions,
                playlist.muxedAudioFormat,
                playlist.muxedCaptionFormats,
                playlist.hasIndependentSegments,
                playlist.variableDefinitions,
                playlist.sessionKeyDrmInitData,
            )
        }
    }
}
