package org.moonfin.androidtv

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import androidx.annotation.RequiresApi
import androidx.tvprovider.media.tv.TvContractCompat
import androidx.tvprovider.media.tv.TvContractCompat.WatchNextPrograms
import androidx.tvprovider.media.tv.WatchNextProgram
import java.util.concurrent.Executors

class WatchNextPublisher(private val context: Context) {

    companion object {
        const val EXTRA_ITEM_ID = "org.moonfin.androidtv.watchnext.ITEM_ID"
        const val EXTRA_SERVER_ID = "org.moonfin.androidtv.watchnext.SERVER_ID"
    }

    private val io = Executors.newSingleThreadExecutor()

    fun publish(items: List<Map<String, Any?>>) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        io.execute { runCatching { updateWatchNext(items) } }
    }

    fun clear() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        io.execute { runCatching { deleteAll() } }
    }

    fun publishNow(items: List<Map<String, Any?>>) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        runCatching { updateWatchNext(items) }
    }

    fun clearNow() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        runCatching { deleteAll() }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun updateWatchNext(items: List<Map<String, Any?>>) {
        val incomingIds = items.mapNotNull { it["id"] as? String }.toSet()
        val current = currentPrograms()

        val stale = current.filter { program ->
            val pid = program.internalProviderId
            !program.isBrowsable ||
                pid == null ||
                pid !in incomingIds ||
                program.watchNextType == WatchNextPrograms.WATCH_NEXT_TYPE_CONTINUE
        }
        for (program in stale) {
            context.contentResolver.delete(
                TvContractCompat.buildWatchNextProgramUri(program.id), null, null,
            )
        }

        val remaining = current.filter { it !in stale }
            .mapNotNull { it.internalProviderId }
            .toSet()

        val values = items.mapNotNull { item ->
            val id = item["id"] as? String
            if (id == null || id in remaining) null
            else buildProgram(item)?.toContentValues()
        }
        if (values.isNotEmpty()) {
            context.contentResolver.bulkInsert(
                WatchNextPrograms.CONTENT_URI, values.toTypedArray(),
            )
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun deleteAll() {
        for (program in currentPrograms()) {
            context.contentResolver.delete(
                TvContractCompat.buildWatchNextProgramUri(program.id), null, null,
            )
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun currentPrograms(): List<WatchNextProgram> {
        val programs = mutableListOf<WatchNextProgram>()
        context.contentResolver.query(
            WatchNextPrograms.CONTENT_URI, WatchNextProgram.PROJECTION, null, null, null,
        )?.use { cursor ->
            if (cursor.moveToFirst()) {
                do {
                    runCatching { programs.add(WatchNextProgram.fromCursor(cursor)) }
                } while (cursor.moveToNext())
            }
        }
        return programs
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun buildProgram(item: Map<String, Any?>): WatchNextProgram? {
        val id = item["id"] as? String ?: return null
        val isMovie = (item["kind"] as? String) == "movie"
        val resumeMs = (item["resumePositionMs"] as? Number)?.toInt() ?: 0

        val intent = Intent(context, MainActivity::class.java).apply {
            putExtra(EXTRA_ITEM_ID, id)
            (item["serverId"] as? String)?.takeIf { it.isNotEmpty() }
                ?.let { putExtra(EXTRA_SERVER_ID, it) }
        }

        val builder = WatchNextProgram.Builder()
            .setInternalProviderId(id)
            .setType(
                if (isMovie) WatchNextPrograms.TYPE_MOVIE
                else WatchNextPrograms.TYPE_TV_EPISODE,
            )
            .setPosterArtAspectRatio(
                if (isMovie) WatchNextPrograms.ASPECT_RATIO_MOVIE_POSTER
                else WatchNextPrograms.ASPECT_RATIO_16_9,
            )
            .setTitle(item["title"] as? String ?: "")
            .setIntent(intent)

        (item["episodeTitle"] as? String)?.let { builder.setEpisodeTitle(it) }
        (item["seasonNumber"] as? Number)?.let { builder.setSeasonNumber(it.toInt()) }
        (item["episodeNumber"] as? Number)?.let { builder.setEpisodeNumber(it.toInt()) }
        (item["description"] as? String)?.let { builder.setDescription(it) }
        (item["posterUri"] as? String)?.let { builder.setPosterArtUri(Uri.parse(it)) }
        (item["durationMs"] as? Number)?.let { builder.setDurationMillis(it.toInt()) }
        (item["lastEngagementMs"] as? Number)?.let {
            builder.setLastEngagementTimeUtcMillis(it.toLong())
        }

        if (resumeMs > 0) {
            builder.setWatchNextType(WatchNextPrograms.WATCH_NEXT_TYPE_CONTINUE)
                .setLastPlaybackPositionMillis(resumeMs)
        } else {
            builder.setWatchNextType(WatchNextPrograms.WATCH_NEXT_TYPE_NEXT)
        }

        return builder.build()
    }
}
