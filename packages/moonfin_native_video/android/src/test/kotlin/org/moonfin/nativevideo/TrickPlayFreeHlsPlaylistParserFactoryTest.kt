package org.moonfin.nativevideo

import android.net.Uri
import androidx.annotation.OptIn
import androidx.media3.common.C
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.hls.playlist.HlsMultivariantPlaylist
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@OptIn(UnstableApi::class)
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], manifest = Config.NONE)
class TrickPlayFreeHlsPlaylistParserFactoryTest {

    private fun parse(text: String): HlsMultivariantPlaylist =
        TrickPlayFreeHlsPlaylistParserFactory().createPlaylistParser()
            .parse(Uri.parse("https://example.com/playlist.m3u8"), text.byteInputStream()) as HlsMultivariantPlaylist

    @Test
    fun `an I-frame stream listed first is dropped so the first variant names its audio`() {
        // The shape of Dungeon TV's playlist, which played with no audio track.
        val playlist = parse(
            """
            #EXTM3U
            #EXT-X-VERSION:6
            #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac",LANGUAGE="en",NAME="English",DEFAULT=YES,AUTOSELECT=YES
            #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=65254,CODECS="avc1.4d001f",RESOLUTION=960x540,URI="iframes.m3u8"
            #EXT-X-STREAM-INF:BANDWIDTH=1822351,CODECS="mp4a.40.5,avc1.4d001f",RESOLUTION=960x540,AUDIO="aac",FRAME-RATE=30.000
            540.m3u8
            #EXT-X-STREAM-INF:BANDWIDTH=3016294,CODECS="mp4a.40.5,avc1.64001f",RESOLUTION=1280x720,AUDIO="aac",FRAME-RATE=30.000
            720.m3u8
            """.trimIndent(),
        )

        assertEquals(2, playlist.variants.size)
        assertTrue(playlist.variants.none { it.format.roleFlags and C.ROLE_FLAG_TRICK_PLAY != 0 })
        assertEquals("mp4a.40.5,avc1.4d001f", playlist.variants.first().format.codecs)
        assertNotNull(playlist.muxedAudioFormat)
        assertEquals(2, playlist.mediaPlaylistUrls.size)
    }

    @Test
    fun `a playlist without trick play is returned unchanged`() {
        val text = """
            #EXTM3U
            #EXT-X-STREAM-INF:BANDWIDTH=3373106,CODECS="avc1.4D401F,mp4a.40.2",RESOLUTION=1280x720
            720.m3u8
        """.trimIndent()
        val playlist = parse(text)

        assertEquals(1, playlist.variants.size)
        assertEquals("720.m3u8", playlist.variants.single().url.lastPathSegment)
    }
}
