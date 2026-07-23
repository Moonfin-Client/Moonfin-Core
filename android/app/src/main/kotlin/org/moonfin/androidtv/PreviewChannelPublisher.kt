package org.moonfin.androidtv

import android.content.ContentUris
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import androidx.annotation.RequiresApi
import androidx.tvprovider.media.tv.Channel
import androidx.tvprovider.media.tv.PreviewProgram
import androidx.tvprovider.media.tv.TvContractCompat
import java.util.concurrent.Executors

/**
 * Publishes the app-owned home screen channel rows (Latest Movies, Latest
 * Shows, Upcoming) as preview channels on the Android TV launcher. Data is
 * shaped in Dart and handed over the watch next method channel, so this class
 * only talks to the TvProvider. Deep link intents reuse the watch next extras
 * so a tapped tile resolves through the same handler.
 */
class PreviewChannelPublisher(private val context: Context) {

    private val io = Executors.newSingleThreadExecutor()

    private val isSupported: Boolean
        get() = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O &&
            context.packageManager.hasSystemFeature("android.software.leanback") &&
            context.packageManager.resolveContentProvider(TvContractCompat.AUTHORITY, 0) != null

    fun publishChannels(channels: List<Map<String, Any?>>) {
        if (!isSupported) return
        io.execute { runCatching { updateChannels(channels) } }
    }

    fun clearChannels() {
        if (!isSupported) return
        io.execute { runCatching { deleteAllPrograms() } }
    }

    fun publishChannelsNow(channels: List<Map<String, Any?>>) {
        if (!isSupported) return
        runCatching { updateChannels(channels) }
    }

    fun clearChannelsNow() {
        if (!isSupported) return
        runCatching { deleteAllPrograms() }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun updateChannels(channels: List<Map<String, Any?>>) {
        // Every preview program here belongs to us, so wiping ours and
        // reinserting keeps each row current without touching other apps.
        deleteAllPrograms()

        channels.forEachIndexed { index, channel ->
            val key = channel["key"] as? String ?: return@forEachIndexed
            val title = channel["title"] as? String ?: key
            @Suppress("UNCHECKED_CAST")
            val items = channel["items"] as? List<Map<String, Any?>> ?: emptyList()
            if (items.isEmpty()) return@forEachIndexed

            // The launcher only lets an app auto add one row, so the first
            // channel is requested browsable and the rest are opt in.
            val channelId = getChannelId(key, title, default = index == 0)
                ?: return@forEachIndexed

            val values = items.mapNotNull { buildProgram(channelId, it)?.toContentValues() }
            if (values.isNotEmpty()) {
                context.contentResolver.bulkInsert(
                    TvContractCompat.PreviewPrograms.CONTENT_URI, values.toTypedArray(),
                )
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun deleteAllPrograms() {
        context.contentResolver.delete(
            TvContractCompat.PreviewPrograms.CONTENT_URI, null, null,
        )
    }

    /**
     * Returns the id of the channel stored under [key], creating it when it does
     * not exist yet. The uri is cached so a channel the user placed on the home
     * screen keeps its position across refreshes.
     */
    @RequiresApi(Build.VERSION_CODES.O)
    private fun getChannelId(key: String, title: String, default: Boolean): Long? {
        val store = context.getSharedPreferences("moonfin_tv_channels", Context.MODE_PRIVATE)
        val settings = Channel.Builder()
            .setType(TvContractCompat.Channels.TYPE_PREVIEW)
            .setDisplayName(title)
            .setAppLinkIntent(Intent(context, MainActivity::class.java))
            .build()

        var uri: Uri? = null
        if (store.contains(key)) {
            uri = store.getString(key, null)?.let { Uri.parse(it) }
            if (uri != null) {
                val updated = context.contentResolver.update(
                    uri, settings.toContentValues(), null, null,
                )
                // Anything other than one affected row means the channel is
                // gone, so drop it and make a fresh one.
                if (updated != 1) uri = null
            }
        }

        if (uri == null) {
            uri = context.contentResolver.insert(
                TvContractCompat.Channels.CONTENT_URI, settings.toContentValues(),
            )
            if (uri != null && default) {
                runCatching {
                    TvContractCompat.requestChannelBrowsable(context, ContentUris.parseId(uri))
                }
            }
            store.edit().putString(key, uri?.toString()).apply()
        }

        return uri?.let { ContentUris.parseId(it) }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun buildProgram(channelId: Long, item: Map<String, Any?>): PreviewProgram? {
        val id = item["id"] as? String ?: return null
        val isMovie = (item["kind"] as? String) == "movie"

        val intent = Intent(context, MainActivity::class.java).apply {
            putExtra(WatchNextPublisher.EXTRA_ITEM_ID, id)
            (item["serverId"] as? String)?.takeIf { it.isNotEmpty() }
                ?.let { putExtra(WatchNextPublisher.EXTRA_SERVER_ID, it) }
        }

        val builder = PreviewProgram.Builder()
            .setChannelId(channelId)
            .setType(
                if (isMovie) TvContractCompat.PreviewPrograms.TYPE_MOVIE
                else TvContractCompat.PreviewPrograms.TYPE_TV_EPISODE,
            )
            .setPosterArtAspectRatio(
                if (isMovie) TvContractCompat.PreviewPrograms.ASPECT_RATIO_MOVIE_POSTER
                else TvContractCompat.PreviewPrograms.ASPECT_RATIO_16_9,
            )
            .setTitle(item["title"] as? String ?: "")
            .setIntent(intent)

        (item["episodeTitle"] as? String)?.let { builder.setEpisodeTitle(it) }
        (item["seasonNumber"] as? Number)?.let { builder.setSeasonNumber(it.toInt()) }
        (item["episodeNumber"] as? Number)?.let { builder.setEpisodeNumber(it.toInt()) }
        (item["description"] as? String)?.let { builder.setDescription(it) }
        (item["posterUri"] as? String)?.let { builder.setPosterArtUri(Uri.parse(it)) }
        (item["durationMs"] as? Number)?.let { builder.setDurationMillis(it.toInt()) }

        return builder.build()
    }
}
