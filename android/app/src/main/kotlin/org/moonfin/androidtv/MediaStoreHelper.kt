package org.moonfin.androidtv

import android.content.ContentValues
import android.content.Context
import android.media.MediaScannerConnection
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MediaStoreHelper(private val context: Context) : MethodChannel.MethodCallHandler {

    companion object {
        const val CHANNEL = "com.moonfin/media_store"
        private const val SUBFOLDER = "Moonfin"
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getDownloadPath" -> {
                val relativePath = call.argument<String>("relativePath") ?: ""
                val fileName = call.argument<String>("fileName") ?: ""
                if (fileName.isEmpty()) {
                    result.error("INVALID_ARG", "fileName is required", null)
                    return
                }
                try {
                    val path = createMediaStoreEntry(relativePath, fileName)
                    result.success(path)
                } catch (e: Exception) {
                    result.error("MEDIA_STORE_ERROR", e.message, null)
                }
            }
            "getMediaStorePath" -> {
                val base = Environment.getExternalStoragePublicDirectory(
                    Environment.DIRECTORY_DOWNLOADS
                ).absolutePath + "/$SUBFOLDER"
                result.success(base)
            }
            "scanFile" -> {
                val path = call.argument<String>("path") ?: ""
                if (path.isNotEmpty()) {
                    MediaScannerConnection.scanFile(context, arrayOf(path), null, null)
                }
                result.success(true)
            }
            else -> result.notImplemented()
        }
    }

    private fun createMediaStoreEntry(relativePath: String, fileName: String): String {
        val fullRelativePath = if (relativePath.isEmpty()) {
            "${Environment.DIRECTORY_DOWNLOADS}/$SUBFOLDER"
        } else {
            "${Environment.DIRECTORY_DOWNLOADS}/$SUBFOLDER/$relativePath"
        }

        val externalDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
        val targetDir = if (relativePath.isEmpty()) {
            java.io.File(externalDir, SUBFOLDER)
        } else {
            java.io.File(externalDir, "$SUBFOLDER/$relativePath")
        }
        if (!targetDir.exists()) {
            targetDir.mkdirs()
        }

        val targetFile = java.io.File(targetDir, fileName)

        val collection = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY)
        } else {
            MediaStore.Files.getContentUri("external")
        }

        val selection = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            "${MediaStore.Downloads.DISPLAY_NAME} = ? AND ${MediaStore.Downloads.RELATIVE_PATH} = ?"
        } else {
            "${MediaStore.Files.FileColumns.DISPLAY_NAME} = ?"
        }
        val selectionArgs = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            arrayOf(fileName, "$fullRelativePath/")
        } else {
            arrayOf(fileName)
        }

        val existingPhysicalPath: String? = try {
            context.contentResolver.query(collection, arrayOf(MediaStore.MediaColumns.DATA), selection, selectionArgs, null)?.use { cursor ->
                if (cursor.moveToFirst()) cursor.getString(cursor.getColumnIndexOrThrow(MediaStore.MediaColumns.DATA)) else null
            }
        } catch (_: Exception) { null }

        try {
            context.contentResolver.delete(collection, selection, selectionArgs)
        } catch (_: Exception) {}

        existingPhysicalPath?.let { try { java.io.File(it).delete() } catch (_: Exception) {} }
        if (targetFile.exists()) {
            try { targetFile.delete() } catch (_: Exception) {}
        }

        return targetFile.absolutePath
    }

    private fun guessMimeType(fileName: String): String {
        val lower = fileName.lowercase()
        return when {
            lower.endsWith(".mkv") -> "video/x-matroska"
            lower.endsWith(".mp4") || lower.endsWith(".m4v") -> "video/mp4"
            lower.endsWith(".avi") -> "video/x-msvideo"
            lower.endsWith(".webm") -> "video/webm"
            lower.endsWith(".ts") -> "video/mp2t"
            lower.endsWith(".flac") -> "audio/flac"
            lower.endsWith(".mp3") -> "audio/mpeg"
            lower.endsWith(".m4a") -> "audio/mp4"
            lower.endsWith(".ogg") -> "audio/ogg"
            lower.endsWith(".opus") -> "audio/opus"
            lower.endsWith(".wav") -> "audio/wav"
            lower.endsWith(".epub") -> "application/epub+zip"
            lower.endsWith(".pdf") -> "application/pdf"
            else -> "application/octet-stream"
        }
    }
}
