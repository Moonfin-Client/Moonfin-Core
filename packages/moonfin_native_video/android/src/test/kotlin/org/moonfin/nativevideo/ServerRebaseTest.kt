package org.moonfin.nativevideo

import android.net.Uri
import androidx.annotation.OptIn
import androidx.media3.common.util.UnstableApi
import androidx.media3.datasource.DataSource
import androidx.media3.datasource.DataSpec
import androidx.media3.datasource.TransferListener
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@OptIn(UnstableApi::class)
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], manifest = Config.NONE)
class ServerRebaseTest {

    private val source = "https://proxy.example/a/Videos/1/stream?api_key=t"

    /** A delegate that records the URI it was opened with. */
    private class Recording : DataSource {
        var opened: Uri? = null
        var closes = 0

        override fun addTransferListener(transferListener: TransferListener) {}

        override fun open(dataSpec: DataSpec): Long {
            opened = dataSpec.uri
            return 0
        }

        override fun read(buffer: ByteArray, offset: Int, length: Int): Int = -1

        override fun getUri(): Uri? = opened

        override fun close() {
            closes++
        }
    }

    private fun openOn(scope: ServerRebase.Scope, url: String): Pair<RebasingDataSource, Recording> {
        val delegate = Recording()
        val load = RebasingDataSource(delegate, scope)
        load.open(DataSpec(Uri.parse(url)))
        return load to delegate
    }

    @Test
    fun `a host and port move rewrites later requests under the server's path`() {
        val scope = ServerRebase.Scope()
        assertEquals(0, scope.rebase("https://proxy.example/a", "https://new.example:8443/a", source))
        assertEquals(
            "https://new.example:8443/a/Videos/1/stream?api_key=t",
            scope.rewrite("https://proxy.example/a/Videos/1/stream?api_key=t"),
        )
    }

    @Test
    fun `another server behind the same origin keeps its address`() {
        val scope = ServerRebase.Scope()
        scope.rebase("https://proxy.example/a", "https://new.example/a", source)
        assertNull(scope.rewrite("https://proxy.example/b/Videos/2/stream?api_key=other"))
        assertNull(scope.rewrite("https://proxy.example/ab/Videos/2/stream"))
    }

    @Test
    fun `a changed base path installs nothing and reports failure`() {
        val scope = ServerRebase.Scope()
        assertEquals(-1, scope.rebase("https://old.example/media", "https://new.example/library", source))
        assertEquals(-1, scope.rebase("https://target.example/old", "https://target.example/new", source))
        assertNull(scope.rewrite("https://old.example/media/Videos/1/stream"))
        assertNull(scope.rewrite("https://target.example/old/Videos/1/stream"))
    }

    @Test
    fun `a move that installs no mapping reports failure, not zero cuts`() {
        val scope = ServerRebase.Scope()
        assertEquals(-1, scope.rebase("not a url", "https://new.example", source))
        assertEquals(-1, scope.rebase("https://same.example/", "https://SAME.example:443", source))
        assertEquals(-1, scope.rebase("https://old.example", "https://new.example", null))
    }

    @Test
    fun `earlier moves lead to the newest address`() {
        val scope = ServerRebase.Scope()
        scope.rebase("http://h:1000", "http://h:2000", source)
        scope.rebase("http://h:2000", "http://h:3000", source)
        assertEquals("http://h:3000/Videos/1", scope.rewrite("http://h:1000/Videos/1"))
        assertEquals("http://h:3000/Videos/1", scope.rewrite("http://h:2000/Videos/1"))
    }

    @Test
    fun `the moves end with the source they were made for`() {
        val scope = ServerRebase.Scope()
        scope.rebase("http://h:1000", "http://h:2000", source)
        scope.sourceSet(source)
        assertEquals("http://h:2000/x", scope.rewrite("http://h:1000/x"))
        scope.sourceSet("http://h:2000/other")
        assertNull(scope.rewrite("http://h:1000/x"))

        scope.rebase("http://h:1000", "http://h:2000", source)
        scope.clear()
        assertNull(scope.rewrite("http://h:1000/x"))
    }

    @Test
    fun `a carried source takes its moves along`() {
        val from = ServerRebase.Scope()
        val to = ServerRebase.Scope()
        from.rebase("http://h:1000", "http://h:2000", source)
        to.takeOver(from)
        to.sourceSet(source)
        assertEquals("http://h:2000/x", to.rewrite("http://h:1000/x"))
        assertNull(from.rewrite("http://h:1000/x"))
    }

    @Test
    fun `only loads of the moving player on the old server are cut`() {
        val scope = ServerRebase.Scope()
        val other = ServerRebase.Scope()
        val (onOld, oldDelegate) = openOn(scope, "http://h:1000/a/Videos/1")
        val (onOtherPath, otherPathDelegate) = openOn(scope, "http://h:1000/b/Videos/2")
        val (otherPlayer, otherPlayerDelegate) = openOn(other, "http://h:1000/a/Videos/1")
        try {
            assertEquals(1, scope.rebase("http://h:1000/a", "http://h:2000/a", source))
            assertEquals(1, oldDelegate.closes)
            assertEquals(0, otherPathDelegate.closes)
            assertEquals(0, otherPlayerDelegate.closes)

            val (moved, movedDelegate) = openOn(scope, "http://h:1000/a/Videos/1?x=1")
            assertEquals("http://h:2000/a/Videos/1?x=1", movedDelegate.opened.toString())
            moved.close()
        } finally {
            onOld.close()
            onOtherPath.close()
            otherPlayer.close()
        }
    }
}
