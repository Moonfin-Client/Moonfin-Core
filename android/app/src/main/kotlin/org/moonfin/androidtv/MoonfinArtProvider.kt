package org.moonfin.androidtv

import android.content.ContentProvider
import android.content.ContentValues
import android.content.Context
import android.database.Cursor
import android.net.Uri
import android.os.ParcelFileDescriptor
import java.io.File
import java.io.FileNotFoundException
import java.net.HttpURLConnection
import java.net.URL
import java.security.MessageDigest

/**
 * Serves browse artwork to the Android Auto host as content:// URIs.
 *
 * The car host fetches browse icons in its own process, which refuses cleartext
 * http and has no server credentials, so a raw home-server image URL never
 * loads. The Dart browse layer instead hands out content://<app>.artwork/img?u=<url>
 * URIs pointing here; on first read we download the image in the app's own
 * process (cleartext and auth allowed), cache it, and return the file.
 *
 * The provider is exported because audio_service's MediaBrowserService hands the
 * icon URI to the car process without granting it any read permission, so an
 * unexported provider is unreadable there. To keep an exported provider from
 * being an open image proxy, we only fetch http/https URLs whose host is one of
 * the signed-in servers the Dart layer recorded in moonfin_art_hosts.
 */
class MoonfinArtProvider : ContentProvider() {
    override fun onCreate(): Boolean = true

    override fun openFile(uri: Uri, mode: String): ParcelFileDescriptor {
        val remote = uri.getQueryParameter("u")
            ?: throw FileNotFoundException("missing url")
        val url = try {
            URL(remote)
        } catch (e: Exception) {
            throw FileNotFoundException("bad url")
        }
        if (url.protocol != "http" && url.protocol != "https") {
            throw FileNotFoundException("unsupported scheme")
        }
        if (url.host !in allowedHosts()) {
            throw FileNotFoundException("host not allowed")
        }
        val ctx = context ?: throw FileNotFoundException("no context")
        val dir = File(ctx.cacheDir, "carart").apply { mkdirs() }
        val file = File(dir, hashName(remote))
        if (!file.exists() || file.length() == 0L) {
            download(url, file)
        }
        return ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY)
    }

    private fun allowedHosts(): Set<String> {
        val ctx = context ?: return emptySet()
        // shared_preferences stores its keys under the flutter. prefix.
        val raw = ctx
            .getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            .getString("flutter.moonfin_art_hosts", "")
            ?: ""
        return raw.split(",").map { it.trim() }.filter { it.isNotEmpty() }.toSet()
    }

    private fun download(url: URL, dest: File) {
        val tmp = File.createTempFile("art", ".tmp", dest.parentFile)
        var conn: HttpURLConnection? = null
        try {
            conn = (url.openConnection() as HttpURLConnection).apply {
                connectTimeout = 8000
                readTimeout = 8000
                instanceFollowRedirects = true
            }
            if (conn.responseCode !in 200..299) {
                throw FileNotFoundException("http ${conn.responseCode}")
            }
            conn.inputStream.use { input ->
                tmp.outputStream().use { output -> input.copyTo(output) }
            }
            // A concurrent read may have already produced the file; keep the
            // first result and drop ours.
            if (!dest.exists() && !tmp.renameTo(dest)) {
                tmp.copyTo(dest, overwrite = true)
            }
        } catch (e: Exception) {
            throw FileNotFoundException(e.message)
        } finally {
            conn?.disconnect()
            if (tmp.exists()) tmp.delete()
        }
    }

    private fun hashName(value: String): String {
        val digest = MessageDigest.getInstance("SHA-1").digest(value.toByteArray())
        return digest.joinToString("") { "%02x".format(it) }
    }

    override fun getType(uri: Uri): String = "image/*"

    override fun query(
        uri: Uri,
        projection: Array<out String>?,
        selection: String?,
        selectionArgs: Array<out String>?,
        sortOrder: String?,
    ): Cursor? = null

    override fun insert(uri: Uri, values: ContentValues?): Uri? = null

    override fun delete(
        uri: Uri,
        selection: String?,
        selectionArgs: Array<out String>?,
    ): Int = 0

    override fun update(
        uri: Uri,
        values: ContentValues?,
        selection: String?,
        selectionArgs: Array<out String>?,
    ): Int = 0
}
