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
 * Publishes the app-owned home screen channel rows (Next Up, Recently Added,
 * Recently Released) as preview channels on the Android TV launcher. Data is
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

        val incomingKeys = channels.mapNotNull { it["key"] as? String }.toSet()
        cleanUpObsoleteChannels(incomingKeys)

        var autoAddClaimed = false
        channels.forEach { channel ->
            val key = channel["key"] as? String ?: return@forEach
            val title = channel["title"] as? String ?: key
            @Suppress("UNCHECKED_CAST")
            val items = channel["items"] as? List<Map<String, Any?>> ?: emptyList()

            // The launcher only lets an app auto add one row, so the first
            // channel with something in it is requested browsable and the rest
            // are opt in. An empty row would only park a blank strip up there.
            val autoAdd = !autoAddClaimed && items.isNotEmpty()
            val channelId = getChannelId(key, title, default = autoAdd)
                ?: return@forEach
            if (autoAdd) autoAddClaimed = true

            // Empty channels are still created so the user can find and turn
            // them on in the launcher settings before they fill up.
            if (items.isEmpty()) return@forEach

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
     * Drops channels this build no longer publishes so a renamed or retired row
     * does not linger on the home screen. The provider only hands an app its own
     * channels, so this never reaches another app's rows.
     */
    @RequiresApi(Build.VERSION_CODES.O)
    private fun cleanUpObsoleteChannels(incomingKeys: Set<String>) {
        val store = context.getSharedPreferences("moonfin_tv_channels", Context.MODE_PRIVATE)
        val edits = store.edit()
        val projection = arrayOf(
            TvContractCompat.Channels._ID,
            TvContractCompat.Channels.COLUMN_INTERNAL_PROVIDER_ID,
        )

        runCatching {
            context.contentResolver.query(
                TvContractCompat.Channels.CONTENT_URI, projection, null, null, null,
            )?.use { cursor ->
                val idIndex = cursor.getColumnIndex(TvContractCompat.Channels._ID)
                val keyIndex = cursor.getColumnIndex(TvContractCompat.Channels.COLUMN_INTERNAL_PROVIDER_ID)

                while (cursor.moveToNext()) {
                    val id = if (idIndex != -1) cursor.getLong(idIndex) else -1L
                    val key = if (keyIndex != -1) cursor.getString(keyIndex) else null

                    if (id != -1L && key != null && key !in incomingKeys) {
                        val channelUri = TvContractCompat.buildChannelUri(id)
                        context.contentResolver.delete(channelUri, null, null)
                        edits.remove(key)
                    }
                }
            }
        }

        // Older channels have no key recorded on them, so they come back empty
        // handed above and are matched here by the uri cached when they were
        // created.
        for (oldKey in store.all.keys - incomingKeys) {
            store.getString(oldKey, null)?.let { oldUri ->
                runCatching {
                    context.contentResolver.delete(Uri.parse(oldUri), null, null)
                }
            }
            edits.remove(oldKey)
        }

        edits.apply()
    }

    /**
     * Returns the id of the channel stored under [key], creating it when it does
     * not exist yet. The uri is cached so a channel the user placed on the home
     * screen keeps its position across refreshes.
     */
    @RequiresApi(Build.VERSION_CODES.O)
    private fun getChannelId(key: String, title: String, default: Boolean): Long? {
        val store = context.getSharedPreferences("moonfin_tv_channels", Context.MODE_PRIVATE)
        val appLinkIntent = Intent(context, MainActivity::class.java).apply {
            setPackage(context.packageName)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
        }
        val settings = Channel.Builder()
            .setType(TvContractCompat.Channels.TYPE_PREVIEW)
            .setDisplayName(title)
            .setInternalProviderId(key)
            .setAppLinkIntent(appLinkIntent)
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
        // The tile is mostly artwork, so an item without a poster would show
        // up as a placeholder.
        val posterUriStr = item["posterUri"] as? String
        if (posterUriStr.isNullOrEmpty()) return null
        val kind = item["kind"] as? String

        val intent = Intent(context, MainActivity::class.java).apply {
            setPackage(context.packageName)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            putExtra(WatchNextPublisher.EXTRA_ITEM_ID, id)
            (item["serverId"] as? String)?.takeIf { it.isNotEmpty() }
                ?.let { putExtra(WatchNextPublisher.EXTRA_SERVER_ID, it) }
        }

        val builder = PreviewProgram.Builder()
            .setChannelId(channelId)
            .setType(
                when (kind) {
                    "episode" -> TvContractCompat.PreviewPrograms.TYPE_TV_EPISODE
                    "series" -> TvContractCompat.PreviewPrograms.TYPE_TV_SERIES
                    else -> TvContractCompat.PreviewPrograms.TYPE_MOVIE
                },
            )
            .setPosterArtAspectRatio(
                if (kind == "episode") TvContractCompat.PreviewPrograms.ASPECT_RATIO_16_9
                else TvContractCompat.PreviewPrograms.ASPECT_RATIO_MOVIE_POSTER,
            )
            .setTitle(item["title"] as? String ?: "")
            .setPosterArtUri(Uri.parse(posterUriStr))
            .setIntent(intent)

        (item["episodeTitle"] as? String)?.let { builder.setEpisodeTitle(it) }
        (item["seasonNumber"] as? Number)?.let { builder.setSeasonNumber(it.toInt()) }
        (item["episodeNumber"] as? Number)?.let { builder.setEpisodeNumber(it.toInt()) }
        (item["description"] as? String)?.let { builder.setDescription(it) }
        (item["durationMs"] as? Number)?.let { builder.setDurationMillis(it.toInt()) }

        return builder.build()
    }
}
