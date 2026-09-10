package org.moonfin.androidtv

import androidx.work.NetworkType
import org.junit.Assert.assertEquals
import org.junit.Test
import org.moonfin.androidtv.AutoDownloadRefreshPolicy.Outcome

class AutoDownloadRefreshPolicyTest {
    @Test
    fun `wifi only waits for an unmetered network`() {
        assertEquals(NetworkType.UNMETERED, AutoDownloadRefreshPolicy.networkTypeFor(wifiOnly = true))
        assertEquals(NetworkType.CONNECTED, AutoDownloadRefreshPolicy.networkTypeFor(wifiOnly = false))
    }

    @Test
    fun `a finished check succeeds`() {
        assertEquals(Outcome.SUCCESS, AutoDownloadRefreshPolicy.outcome(ok = true, permanent = false, attempt = 0))
    }

    @Test
    fun `nobody signed in counts as done rather than retried`() {
        assertEquals(Outcome.SUCCESS, AutoDownloadRefreshPolicy.outcome(ok = false, permanent = true, attempt = 0))
    }

    @Test
    fun `a failed or unanswered check retries until the cap`() {
        for (ok in listOf(false, null)) {
            assertEquals("$ok", Outcome.RETRY, AutoDownloadRefreshPolicy.outcome(ok, permanent = false, attempt = 0))
            assertEquals(
                "$ok",
                Outcome.RETRY,
                AutoDownloadRefreshPolicy.outcome(ok, permanent = false, attempt = AutoDownloadRefreshPolicy.MAX_RETRY_ATTEMPTS - 1),
            )
            assertEquals(
                "$ok",
                Outcome.GIVE_UP,
                AutoDownloadRefreshPolicy.outcome(ok, permanent = false, attempt = AutoDownloadRefreshPolicy.MAX_RETRY_ATTEMPTS),
            )
        }
    }
}
