package org.moonfin.nativevideo.subtitle

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class DeclaredSubtitlesTest {

    @Test
    fun `sidecars keep the order the app sent them in`() {
        val declared = declaredSubtitlesFrom(
            listOf(
                mapOf("url" to "http://s/1.srt", "codec" to "srt", "language" to "hin", "title" to "Hindi"),
                mapOf("url" to "http://s/2.srt", "codec" to "subrip", "language" to "eng"),
            ),
        )

        assertEquals(listOf("http://s/1.srt", "http://s/2.srt"), declared.map { it.url })
        assertEquals("Hindi", declared[0].title)
        assertNull(declared[1].title)
    }

    @Test
    fun `an entry with no url is dropped and the rest still land`() {
        val declared = declaredSubtitlesFrom(
            listOf(
                mapOf("codec" to "srt"),
                mapOf("url" to "http://s/2.srt"),
                "not a map",
            ),
        )

        assertEquals(listOf("http://s/2.srt"), declared.map { it.url })
    }

    @Test
    fun `anything but a list declares nothing`() {
        assertEquals(emptyList<DeclaredSubtitle>(), declaredSubtitlesFrom(null))
        assertEquals(emptyList<DeclaredSubtitle>(), declaredSubtitlesFrom("http://s/1.srt"))
    }

    @Test
    fun `blank optional fields read as absent`() {
        val subtitle = declaredSubtitleFrom(
            mapOf("url" to "http://s/1.srt", "codec" to "", "language" to "", "title" to ""),
        )

        assertEquals("http://s/1.srt", subtitle?.url)
        assertNull(subtitle?.codec)
        assertNull(subtitle?.language)
        assertNull(subtitle?.title)
    }
}
