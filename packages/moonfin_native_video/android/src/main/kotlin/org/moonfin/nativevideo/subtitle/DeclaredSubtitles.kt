package org.moonfin.nativevideo.subtitle

// Kept free of Android and media3 imports so these run under plain JVM tests.

/** A sidecar subtitle as the app describes it over the channel. */
internal data class DeclaredSubtitle(
    val url: String,
    val codec: String?,
    val language: String?,
    val title: String?,
)

/** The sidecars a source came with, in the order the app counts them. */
internal fun declaredSubtitlesFrom(raw: Any?): List<DeclaredSubtitle> =
    (raw as? List<*>)?.mapNotNull { declaredSubtitleFrom(it as? Map<*, *>) } ?: emptyList()

/** One sidecar from its channel map, or null when it names no url. */
internal fun declaredSubtitleFrom(args: Map<*, *>?): DeclaredSubtitle? {
    val url = args?.get("url")?.toString()?.takeIf { it.isNotEmpty() } ?: return null
    return DeclaredSubtitle(
        url = url,
        codec = args["codec"]?.toString()?.takeIf { it.isNotEmpty() },
        language = args["language"]?.toString()?.takeIf { it.isNotEmpty() },
        title = args["title"]?.toString()?.takeIf { it.isNotEmpty() },
    )
}
