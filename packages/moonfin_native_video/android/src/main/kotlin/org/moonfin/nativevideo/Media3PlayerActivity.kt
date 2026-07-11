package org.moonfin.nativevideo

import android.app.PictureInPictureParams
import android.content.Context
import android.content.Intent
import android.content.res.Configuration
import android.os.Build
import android.os.Bundle
import android.util.Rational
import android.view.KeyEvent
import androidx.activity.ComponentActivity
import androidx.activity.compose.BackHandler
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.FilledTonalButton
import androidx.compose.material3.Icon
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Slider
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.rounded.FastForward
import androidx.compose.material.icons.rounded.FastRewind
import androidx.compose.material.icons.rounded.Pause
import androidx.compose.material.icons.rounded.Person
import androidx.compose.material.icons.rounded.PlayArrow
import androidx.compose.material.icons.rounded.SkipNext
import androidx.compose.material.icons.rounded.SkipPrevious
import coil.compose.AsyncImage
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.lang.ref.WeakReference
import kotlinx.coroutines.delay

class Media3PlayerActivity : ComponentActivity() {
    private val controlsVisibleState = mutableStateOf(true)
    private val isInPipModeState = mutableStateOf(false)
    private val titleState = mutableStateOf<String?>(null)

    private var autoEnterPip: Boolean = true
    private lateinit var media3View: Media3VideoView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        enableEdgeToEdge()

        autoEnterPip = intent.getBooleanExtra(EXTRA_AUTO_ENTER_PIP, true)
        titleState.value = intent.getStringExtra(EXTRA_TITLE)

        media3View = Media3VideoView(this)
        Media3ActivityHost.setActive(this)
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "activityStarted",
            ),
        )

        setContent {
            val isInPip = isInPipModeState.value
            var uiState by remember { mutableStateOf(Media3UiState()) }
            var trackState by remember { mutableStateOf(Media3TrackState()) }
            var metadataState by remember { mutableStateOf(Media3UiMetadataState()) }
            var showAudioDialog by remember { mutableStateOf(false) }
            var showSubtitleDialog by remember { mutableStateOf(false) }
            var showInfoDialog by remember { mutableStateOf(false) }
            var showChaptersDialog by remember { mutableStateOf(false) }
            var showBitrateDialog by remember { mutableStateOf(false) }
            var showSpeedDialog by remember { mutableStateOf(false) }
            var showCastCrewDialog by remember { mutableStateOf(false) }
            var showCastControlsDialog by remember { mutableStateOf(false) }
            // Scrubber state: while the user is dragging, freeze the displayed
            // position to the thumb position rather than the live player position.
            var isScrubbing by remember { mutableStateOf(false) }
            var scrubPositionMs by remember { mutableStateOf(0L) }
            val hasOpenDialog =
                showAudioDialog ||
                    showSubtitleDialog ||
                    showInfoDialog ||
                    showChaptersDialog ||
                    showBitrateDialog ||
                    showSpeedDialog ||
                    showCastCrewDialog ||
                    showCastControlsDialog

            LaunchedEffect(Unit) {
                while (true) {
                    uiState = Media3UiState.fromMap(Media3Bridge.activeState())
                    trackState = Media3TrackState.fromMap(Media3Bridge.activeTracks())
                    metadataState = Media3UiMetadataState.fromMap(Media3Bridge.activeUiMetadata())
                    delay(250L)
                }
            }

            LaunchedEffect(controlsVisibleState.value, isInPip, hasOpenDialog) {
                if (!controlsVisibleState.value || isInPip || hasOpenDialog) {
                    return@LaunchedEffect
                }
                delay(3000L)
                controlsVisibleState.value = false
            }

            BackHandler(enabled = !isInPip) {
                when {
                    showAudioDialog -> showAudioDialog = false
                    showSubtitleDialog -> showSubtitleDialog = false
                    showChaptersDialog -> showChaptersDialog = false
                    showBitrateDialog -> showBitrateDialog = false
                    showSpeedDialog -> showSpeedDialog = false
                    showInfoDialog -> showInfoDialog = false
                    showCastCrewDialog -> showCastCrewDialog = false
                    showCastControlsDialog -> showCastControlsDialog = false
                    else -> finish()
                }
            }

            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(Color.Black),
            ) {
                AndroidView(
                    modifier = Modifier.fillMaxSize(),
                    factory = {
                        media3View.getView()
                    },
                )

                if (!isInPip && controlsVisibleState.value) {
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(horizontal = 20.dp, vertical = 16.dp),
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically,
                        ) {
                            OutlinedButton(
                                onClick = {
                                    finish()
                                },
                                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                            ) {
                                Text("Back")
                            }
                            Column(
                                modifier = Modifier
                                    .weight(1f)
                                    .padding(horizontal = 16.dp),
                                horizontalAlignment = Alignment.CenterHorizontally,
                            ) {
                                val subtitle = metadataState.topSubtitle
                                    .takeIf { it.isNotBlank() }
                                if (subtitle != null) {
                                    Text(
                                        text = subtitle,
                                        color = Color.White.copy(alpha = 0.72f),
                                        style = MaterialTheme.typography.bodySmall,
                                        maxLines = 1,
                                    )
                                }
                                Text(
                                    text = metadataState.topTitle
                                        .takeIf { it.isNotBlank() }
                                        ?: titleState.value
                                        ?: "Playback",
                                    style = MaterialTheme.typography.titleMedium,
                                    color = Color.White,
                                    maxLines = 1,
                                )
                            }
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                            ) {
                                if (metadataState.showClock) {
                                    Text(
                                        text = formatCurrentClock(),
                                        color = Color.White.copy(alpha = 0.78f),
                                        style = MaterialTheme.typography.bodySmall,
                                        modifier = Modifier.padding(end = 10.dp),
                                    )
                                }
                                OutlinedButton(
                                    onClick = {
                                        enterPictureInPictureIfSupported(uiState)
                                    },
                                    enabled = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O,
                                    border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                                ) {
                                    Text("PiP")
                                }
                            }
                        }

                        Spacer(modifier = Modifier.weight(1f))

                        if (uiState.isBuffering) {
                            Text(
                                text = "Buffering...",
                                color = Color.White,
                                style = MaterialTheme.typography.bodyMedium,
                                modifier = Modifier
                                    .align(Alignment.CenterHorizontally)
                                    .padding(bottom = 12.dp),
                            )
                        }

                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.Center,
                            verticalAlignment = Alignment.CenterVertically,
                        ) {
                            if (metadataState.hasPrevious) {
                                TransportButton(
                                    icon = Icons.Rounded.SkipPrevious,
                                    contentDescription = "Previous",
                                    size = 64.dp,
                                    onClick = {
                                        dispatchActivityAction("previous")
                                    },
                                )
                                Spacer(modifier = Modifier.width(10.dp))
                            }

                            TransportButton(
                                icon = Icons.Rounded.FastRewind,
                                contentDescription = "Seek back ${formatSkipSeconds(metadataState.skipBackMs)} seconds",
                                size = 68.dp,
                                onClick = {
                                    seekRelative(uiState, -metadataState.skipBackMs.toLong())
                                },
                            )

                            TransportButton(
                                icon = if (uiState.isPlaying) {
                                    Icons.Rounded.Pause
                                } else {
                                    Icons.Rounded.PlayArrow
                                },
                                contentDescription = if (uiState.isPlaying) "Pause" else "Play",
                                size = 88.dp,
                                primary = true,
                                modifier = Modifier.padding(horizontal = 16.dp),
                                onClick = {
                                    togglePlayPause(uiState)
                                },
                            )

                            TransportButton(
                                icon = Icons.Rounded.FastForward,
                                contentDescription = "Seek forward ${formatSkipSeconds(metadataState.skipForwardMs)} seconds",
                                size = 68.dp,
                                onClick = {
                                    seekRelative(uiState, metadataState.skipForwardMs.toLong())
                                },
                            )

                            if (metadataState.hasNext) {
                                Spacer(modifier = Modifier.width(10.dp))
                                TransportButton(
                                    icon = Icons.Rounded.SkipNext,
                                    contentDescription = "Next",
                                    size = 64.dp,
                                    onClick = {
                                        dispatchActivityAction("next")
                                    },
                                )
                            }
                        }

                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(top = 12.dp),
                            horizontalArrangement = Arrangement.Center,
                            verticalAlignment = Alignment.CenterVertically,
                        ) {
                            OutlinedButton(
                                onClick = {
                                    controlsVisibleState.value = true
                                    showSpeedDialog = true
                                },
                                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                            ) {
                                Text("Speed")
                            }
                            Text(
                                text = formatPlaybackSpeed(uiState.playbackSpeed),
                                color = Color.White,
                                style = MaterialTheme.typography.bodyMedium,
                                modifier = Modifier.padding(horizontal = 14.dp),
                            )
                        }

                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(top = 12.dp),
                            horizontalArrangement = Arrangement.Center,
                            verticalAlignment = Alignment.CenterVertically,
                        ) {
                            OutlinedButton(
                                onClick = {
                                    controlsVisibleState.value = true
                                    showAudioDialog = true
                                },
                                enabled = trackState.audioTracks.isNotEmpty(),
                                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                            ) {
                                Text("Audio")
                            }
                            Spacer(modifier = Modifier.width(10.dp))
                            OutlinedButton(
                                onClick = {
                                    controlsVisibleState.value = true
                                    showSubtitleDialog = true
                                },
                                enabled = trackState.subtitleTracks.isNotEmpty(),
                                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                            ) {
                                Text("Subtitles")
                            }
                            Spacer(modifier = Modifier.width(10.dp))
                            OutlinedButton(
                                onClick = {
                                    controlsVisibleState.value = true
                                    showInfoDialog = true
                                },
                                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                            ) {
                                Text("Info")
                            }
                            Spacer(modifier = Modifier.width(10.dp))
                            OutlinedButton(
                                onClick = {
                                    controlsVisibleState.value = true
                                    showChaptersDialog = true
                                },
                                enabled = metadataState.chapters.isNotEmpty(),
                                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                            ) {
                                Text("Chapters")
                            }
                            Spacer(modifier = Modifier.width(10.dp))
                            OutlinedButton(
                                onClick = {
                                    controlsVisibleState.value = true
                                    showBitrateDialog = true
                                },
                                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                            ) {
                                Text("Bitrate")
                            }
                            Spacer(modifier = Modifier.width(10.dp))
                            OutlinedButton(
                                onClick = {
                                    dispatchActivityAction("toggleZoom")
                                    controlsVisibleState.value = true
                                },
                                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                            ) {
                                Text(
                                    metadataState.zoomModeLabel
                                        .takeIf { it.isNotBlank() }
                                        ?.let { "Zoom: $it" }
                                        ?: "Zoom",
                                )
                            }
                            if (metadataState.hasCastCrew) {
                                Spacer(modifier = Modifier.width(10.dp))
                                OutlinedButton(
                                    onClick = {
                                        if (metadataState.castPeople.isNotEmpty()) {
                                            showCastCrewDialog = true
                                        } else {
                                            dispatchActivityAction("showCastCrew")
                                        }
                                        controlsVisibleState.value = true
                                    },
                                    border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                                ) {
                                    Text("Cast & Crew")
                                }
                            }
                            if (metadataState.canCastControl) {
                                Spacer(modifier = Modifier.width(10.dp))
                                OutlinedButton(
                                    onClick = {
                                        showCastControlsDialog = true
                                        controlsVisibleState.value = true
                                    },
                                    border = BorderStroke(1.dp, Color.White.copy(alpha = 0.35f)),
                                ) {
                                    Text("Cast")
                                }
                            }
                        }

                        Column(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(top = 14.dp),
                            horizontalAlignment = Alignment.CenterHorizontally,
                        ) {
                            val displayPositionMs = if (isScrubbing) scrubPositionMs else uiState.positionMs
                            val sliderValue = if (uiState.durationMs > 0L) {
                                (displayPositionMs.toFloat() / uiState.durationMs.toFloat()).coerceIn(0f, 1f)
                            } else {
                                0f
                            }

                            Box(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(horizontal = 4.dp),
                            ) {
                                LinearProgressIndicator(
                                    progress = uiState.bufferedProgress,
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .align(Alignment.Center),
                                    color = Color.White.copy(alpha = 0.30f),
                                    trackColor = Color.White.copy(alpha = 0.12f),
                                )
                                Slider(
                                    value = sliderValue,
                                    onValueChange = { fraction ->
                                        isScrubbing = true
                                        scrubPositionMs = (fraction * uiState.durationMs).toLong()
                                        controlsVisibleState.value = true
                                    },
                                    onValueChangeFinished = {
                                        val targetMs = scrubPositionMs
                                        isScrubbing = false
                                        if (uiState.durationMs > 0L) {
                                            Media3Bridge.dispatchControl(
                                                method = "seek",
                                                args = mapOf("positionMs" to targetMs),
                                            )
                                        }
                                    },
                                    enabled = uiState.durationMs > 0L,
                                    modifier = Modifier.fillMaxWidth(),
                                    colors = androidx.compose.material3.SliderDefaults.colors(
                                        thumbColor = Color.White,
                                        activeTrackColor = Color.White,
                                        inactiveTrackColor = Color.Transparent,
                                    ),
                                )
                            }
                            Spacer(modifier = Modifier.height(4.dp))
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically,
                            ) {
                                Text(
                                    text = formatDuration(displayPositionMs),
                                    color = Color.White,
                                    style = MaterialTheme.typography.bodySmall,
                                )
                                Text(
                                    text = "-${formatDuration((uiState.durationMs - displayPositionMs).coerceAtLeast(0L))}",
                                    color = Color.White,
                                    style = MaterialTheme.typography.bodySmall,
                                )
                            }
                        }

                        Spacer(modifier = Modifier.height(8.dp))
                    }
                }

                if (!isInPip && showAudioDialog) {
                    TrackSelectionDialog(
                        title = "Audio Tracks",
                        tracks = trackState.audioTracks,
                        onDismiss = {
                            showAudioDialog = false
                        },
                        onSelectTrack = { selectedIndex ->
                            Media3Bridge.dispatchControl(
                                method = "setAudioTrack",
                                args = mapOf("index" to selectedIndex),
                            )
                            controlsVisibleState.value = true
                            showAudioDialog = false
                        },
                    )
                }

                if (!isInPip && showSubtitleDialog) {
                    TrackSelectionDialog(
                        title = "Subtitle Tracks",
                        tracks = trackState.subtitleTracks,
                        onDismiss = {
                            showSubtitleDialog = false
                        },
                        onDisable = {
                            Media3Bridge.dispatchControl("disableSubtitleTrack")
                            controlsVisibleState.value = true
                            showSubtitleDialog = false
                        },
                        onSelectTrack = { selectedIndex ->
                            Media3Bridge.dispatchControl(
                                method = "setSubtitleTrack",
                                args = mapOf("index" to selectedIndex),
                            )
                            controlsVisibleState.value = true
                            showSubtitleDialog = false
                        },
                    )
                }

                if (!isInPip && showInfoDialog) {
                    PlaybackInfoDialog(
                        metadataState = metadataState,
                        onDismiss = {
                            showInfoDialog = false
                        },
                    )
                }

                if (!isInPip && showCastCrewDialog) {
                    CastCrewDialog(
                        people = metadataState.castPeople,
                        onDismiss = {
                            showCastCrewDialog = false
                        },
                        onOpenPerson = { person ->
                            if (person.personId.isBlank()) {
                                return@CastCrewDialog
                            }
                            dispatchActivityAction(
                                action = "openCastPerson",
                                args = mapOf(
                                    "personId" to person.personId,
                                    "serverId" to person.serverId.takeIf { it.isNotBlank() },
                                ),
                            )
                            showCastCrewDialog = false
                        },
                    )
                }

                if (!isInPip && showCastControlsDialog) {
                    CastControlsDialog(
                        metadataState = metadataState,
                        onDismiss = {
                            showCastControlsDialog = false
                        },
                        onAction = { action ->
                            dispatchActivityAction(action)
                        },
                        onVolumeChanged = { volume ->
                            dispatchActivityAction(
                                action = "castSetVolume",
                                args = mapOf("volume" to volume),
                            )
                        },
                    )
                }

                if (!isInPip && showChaptersDialog) {
                    TrackSelectionDialog(
                        title = "Chapters",
                        tracks = metadataState.chapters.map { chapter ->
                            Media3TrackOption(
                                index = chapter.startMs.toInt(),
                                label = chapter.title,
                                selected = false,
                            )
                        },
                        onDismiss = {
                            showChaptersDialog = false
                        },
                        onSelectTrack = { selectedStartMs ->
                            Media3Bridge.dispatchControl(
                                method = "seek",
                                args = mapOf("positionMs" to selectedStartMs.toLong()),
                            )
                            controlsVisibleState.value = true
                            showChaptersDialog = false
                        },
                    )
                }

                if (!isInPip && showBitrateDialog) {
                    val options = listOf<Int?>(null, 40, 20, 12, 8, 4, 2)
                    val current = metadataState.selectedBitrateMbps
                    TrackSelectionDialog(
                        title = "Bitrate",
                        tracks = options.map { mbps ->
                            Media3TrackOption(
                                index = mbps ?: -1,
                                label = if (mbps == null) "Auto" else "$mbps Mbps",
                                selected = mbps == current,
                            )
                        },
                        onDismiss = {
                            showBitrateDialog = false
                        },
                        onSelectTrack = { selected ->
                            dispatchActivityAction(
                                action = "setBitrate",
                                args = mapOf(
                                    "bitrateMbps" to (if (selected < 0) null else selected),
                                ),
                            )
                            controlsVisibleState.value = true
                            showBitrateDialog = false
                        },
                    )
                }

                if (!isInPip && showSpeedDialog) {
                    val options = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 1.75f, 2.0f)
                    TrackSelectionDialog(
                        title = "Playback Speed",
                        tracks = options.map { speed ->
                            Media3TrackOption(
                                index = (speed * 100f).toInt(),
                                label = String.format("%.2fx", speed),
                                selected = kotlin.math.abs(speed - uiState.playbackSpeed) < 0.01f,
                            )
                        },
                        onDismiss = {
                            showSpeedDialog = false
                        },
                        onSelectTrack = { selected ->
                            val speed = selected.toFloat() / 100f
                            Media3Bridge.dispatchControl(
                                method = "setSpeed",
                                args = mapOf("speed" to speed),
                            )
                            controlsVisibleState.value = true
                            showSpeedDialog = false
                        },
                    )
                }
            }
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        autoEnterPip = intent.getBooleanExtra(EXTRA_AUTO_ENTER_PIP, autoEnterPip)
        titleState.value = intent.getStringExtra(EXTRA_TITLE) ?: titleState.value
        controlsVisibleState.value = true
    }

    override fun onUserLeaveHint() {
        super.onUserLeaveHint()
        if (!autoEnterPip) {
            return
        }
        if (!Media3UiState.fromMap(Media3Bridge.activeState()).isPlaying) {
            return
        }
        enterPictureInPictureIfSupported(Media3UiState.fromMap(Media3Bridge.activeState()))
    }

    override fun onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean) {
        super.onPictureInPictureModeChanged(isInPictureInPictureMode)
        isInPipModeState.value = isInPictureInPictureMode
        if (!isInPictureInPictureMode) {
            controlsVisibleState.value = true
        }
    }

    override fun onPictureInPictureModeChanged(
        isInPictureInPictureMode: Boolean,
        newConfig: Configuration,
    ) {
        super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
        isInPipModeState.value = isInPictureInPictureMode
        if (!isInPictureInPictureMode) {
            controlsVisibleState.value = true
        }
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        controlsVisibleState.value = true

        val uiState = Media3UiState.fromMap(Media3Bridge.activeState())
        return when (keyCode) {
            KeyEvent.KEYCODE_DPAD_CENTER,
            KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE,
            -> {
                togglePlayPause(uiState)
                true
            }

            KeyEvent.KEYCODE_MEDIA_PLAY -> {
                Media3Bridge.dispatchControl("play")
                true
            }

            KeyEvent.KEYCODE_MEDIA_PAUSE -> {
                Media3Bridge.dispatchControl("pause")
                true
            }

            KeyEvent.KEYCODE_DPAD_LEFT,
            KeyEvent.KEYCODE_MEDIA_REWIND,
            -> {
                val metadataState = Media3UiMetadataState.fromMap(Media3Bridge.activeUiMetadata())
                seekRelative(uiState, -metadataState.skipBackMs.toLong())
                true
            }

            KeyEvent.KEYCODE_DPAD_RIGHT,
            KeyEvent.KEYCODE_MEDIA_FAST_FORWARD,
            -> {
                val metadataState = Media3UiMetadataState.fromMap(Media3Bridge.activeUiMetadata())
                seekRelative(uiState, metadataState.skipForwardMs.toLong())
                true
            }

            else -> super.onKeyDown(keyCode, event)
        }
    }

    override fun onStart() {
        super.onStart()
        if (::media3View.isInitialized) {
            media3View.ensurePlayerAlive()
        }
    }

    override fun onStop() {
        if (::media3View.isInitialized) {
            media3View.forceReleasePlayer()
        }
        super.onStop()
    }

    override fun onDestroy() {
        if (::media3View.isInitialized) {
            media3View.dispose()
        }
        Media3ActivityHost.clear(this)
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "activityFinished",
            ),
        )
        super.onDestroy()
    }

    private fun togglePlayPause(state: Media3UiState) {
        if (state.isPlaying) {
            Media3Bridge.dispatchControl("pause")
        } else {
            Media3Bridge.dispatchControl("play")
        }
    }

    private fun seekRelative(state: Media3UiState, deltaMs: Long) {
        val upperBound = if (state.durationMs > 0L) state.durationMs else Long.MAX_VALUE
        val target = (state.positionMs + deltaMs).coerceIn(0L, upperBound)
        Media3Bridge.dispatchControl(
            method = "seek",
            args = mapOf(
                "positionMs" to target,
            ),
        )
    }

    private fun formatPlaybackSpeed(value: Float): String {
        return String.format("%.2fx", value)
    }

    private fun formatSkipSeconds(skipMs: Int): Int {
        val seconds = skipMs / 1000
        return if (seconds <= 0) 10 else seconds
    }

    private fun formatCurrentClock(): String {
        return SimpleDateFormat("H:mm", Locale.getDefault()).format(Date())
    }

    private fun dispatchActivityAction(
        action: String,
        args: Map<String, Any?> = emptyMap(),
    ) {
        val payload = mutableMapOf<String, Any?>(
            "event" to "activityAction",
            "action" to action,
        )
        payload.putAll(args)
        Media3Bridge.emitEvent(payload)
    }

    private fun enterPictureInPictureIfSupported(state: Media3UiState) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            return
        }

        val width = if (state.videoWidth > 0) state.videoWidth else 16
        val height = if (state.videoHeight > 0) state.videoHeight else 9
        val params = PictureInPictureParams.Builder()
            .setAspectRatio(Rational(width, height))
            .build()
        enterPictureInPictureMode(params)
    }

    private fun formatDuration(valueMs: Long): String {
        val clampedMs = valueMs.coerceAtLeast(0L)
        val totalSeconds = clampedMs / 1000L
        val seconds = totalSeconds % 60L
        val minutes = (totalSeconds / 60L) % 60L
        val hours = totalSeconds / 3600L
        return if (hours > 0L) {
            String.format("%d:%02d:%02d", hours, minutes, seconds)
        } else {
            String.format("%02d:%02d", minutes, seconds)
        }
    }

    companion object {
        private const val EXTRA_TITLE = "title"
        private const val EXTRA_AUTO_ENTER_PIP = "autoEnterPip"

        fun createIntent(context: Context, args: Map<*, *>?): Intent {
            val title = args?.get("title")?.toString()
            val autoEnterPip = args?.get("autoEnterPip") as? Boolean ?: true
            return Intent(context, Media3PlayerActivity::class.java)
                .addFlags(
                    Intent.FLAG_ACTIVITY_NEW_TASK or
                        Intent.FLAG_ACTIVITY_SINGLE_TOP or
                        Intent.FLAG_ACTIVITY_CLEAR_TOP,
                ).apply {
                    if (!title.isNullOrBlank()) {
                        putExtra(EXTRA_TITLE, title)
                    }
                    putExtra(EXTRA_AUTO_ENTER_PIP, autoEnterPip)
                }
        }
    }
}

@Composable
private fun TransportButton(
    icon: ImageVector,
    contentDescription: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    size: androidx.compose.ui.unit.Dp = 72.dp,
    primary: Boolean = false,
) {
    FilledTonalButton(
        onClick = onClick,
        shape = if (primary) RoundedCornerShape(40.dp) else CircleShape,
        modifier = modifier.size(size),
    ) {
        Icon(
            imageVector = icon,
            contentDescription = contentDescription,
            tint = Color.White,
        )
    }
}

private data class Media3TrackOption(
    val index: Int,
    val label: String,
    val selected: Boolean,
)

private data class Media3ChapterOption(
    val title: String,
    val startMs: Long,
)

private data class Media3InfoRow(
    val label: String,
    val value: String,
    val highlight: Boolean,
)

private data class Media3InfoSection(
    val title: String,
    val rows: List<Media3InfoRow>,
)

private data class Media3CastPerson(
    val name: String,
    val subtitle: String,
    val personId: String,
    val imageUrl: String,
    val serverId: String,
)

private data class Media3UiMetadataState(
    val hasPrevious: Boolean = false,
    val hasNext: Boolean = false,
    val selectedBitrateMbps: Int? = null,
    val skipBackMs: Int = 10000,
    val skipForwardMs: Int = 10000,
    val topTitle: String = "",
    val topSubtitle: String = "",
    val showClock: Boolean = false,
    val zoomModeLabel: String = "",
    val streamInfoSections: List<Media3InfoSection> = emptyList(),
    val hasCastCrew: Boolean = false,
    val castPeople: List<Media3CastPerson> = emptyList(),
    val canCastControl: Boolean = false,
    val castKindLabel: String = "",
    val castStateLabel: String = "",
    val castPositionMs: Long = 0L,
    val castVolume: Float? = null,
    val chapters: List<Media3ChapterOption> = emptyList(),
) {
    companion object {
        fun fromMap(map: Map<String, Any?>): Media3UiMetadataState {
            val hasPrevious = map["hasPrevious"] as? Boolean ?: false
            val hasNext = map["hasNext"] as? Boolean ?: false
            val selectedBitrateMbps = (map["selectedBitrateMbps"] as? Number)?.toInt()
            val skipBackMs = (map["skipBackMs"] as? Number)?.toInt() ?: 10000
            val skipForwardMs = (map["skipForwardMs"] as? Number)?.toInt() ?: 10000
            val topTitle = map["topTitle"]?.toString() ?: ""
            val topSubtitle = map["topSubtitle"]?.toString() ?: ""
            val showClock = map["showClock"] as? Boolean ?: false
            val zoomModeLabel = map["zoomModeLabel"]?.toString() ?: ""
            val hasCastCrew = map["hasCastCrew"] as? Boolean ?: false
            val canCastControl = map["canCastControl"] as? Boolean ?: false
            val castKindLabel = map["castKindLabel"]?.toString() ?: ""
            val castStateLabel = map["castStateLabel"]?.toString() ?: ""
            val castPositionMs = (map["castPositionMs"] as? Number)?.toLong() ?: 0L
            val castVolume = (map["castVolume"] as? Number)?.toFloat()

            val streamInfoSections = (map["streamInfoSections"] as? List<*>)
                ?.mapNotNull { raw ->
                    val section = raw as? Map<*, *> ?: return@mapNotNull null
                    val title = section["title"]?.toString()?.takeIf { it.isNotBlank() }
                        ?: return@mapNotNull null
                    val rows = (section["rows"] as? List<*>)
                        ?.mapNotNull { rowRaw ->
                            val row = rowRaw as? Map<*, *> ?: return@mapNotNull null
                            val label = row["label"]?.toString()?.takeIf { it.isNotBlank() }
                                ?: return@mapNotNull null
                            val value = row["value"]?.toString() ?: return@mapNotNull null
                            val highlight = row["highlight"] as? Boolean ?: false
                            Media3InfoRow(
                                label = label,
                                value = value,
                                highlight = highlight,
                            )
                        }
                        ?: emptyList()
                    Media3InfoSection(
                        title = title,
                        rows = rows,
                    )
                }
                ?: emptyList()

            val castPeople = (map["castPeople"] as? List<*>)
                ?.mapNotNull { raw ->
                    val person = raw as? Map<*, *> ?: return@mapNotNull null
                    val name = person["name"]?.toString()?.takeIf { it.isNotBlank() }
                        ?: return@mapNotNull null
                    val subtitle = person["subtitle"]?.toString() ?: ""
                    val personId = person["personId"]?.toString() ?: ""
                    val imageUrl = person["imageUrl"]?.toString() ?: ""
                    val serverId = person["serverId"]?.toString() ?: ""
                    Media3CastPerson(
                        name = name,
                        subtitle = subtitle,
                        personId = personId,
                        imageUrl = imageUrl,
                        serverId = serverId,
                    )
                }
                ?: emptyList()

            val chapters = (map["chapters"] as? List<*>)
                ?.mapNotNull { raw ->
                    val chapter = raw as? Map<*, *> ?: return@mapNotNull null
                    val title = chapter["title"]?.toString()?.takeIf { it.isNotBlank() }
                        ?: return@mapNotNull null
                    val startMs = (chapter["startMs"] as? Number)?.toLong()
                        ?: return@mapNotNull null
                    Media3ChapterOption(title = title, startMs = startMs)
                }
                ?: emptyList()

            return Media3UiMetadataState(
                hasPrevious = hasPrevious,
                hasNext = hasNext,
                selectedBitrateMbps = selectedBitrateMbps,
                skipBackMs = skipBackMs,
                skipForwardMs = skipForwardMs,
                topTitle = topTitle,
                topSubtitle = topSubtitle,
                showClock = showClock,
                zoomModeLabel = zoomModeLabel,
                streamInfoSections = streamInfoSections,
                hasCastCrew = hasCastCrew,
                castPeople = castPeople,
                canCastControl = canCastControl,
                castKindLabel = castKindLabel,
                castStateLabel = castStateLabel,
                castPositionMs = castPositionMs,
                castVolume = castVolume,
                chapters = chapters,
            )
        }
    }
}

private data class Media3TrackState(
    val audioTracks: List<Media3TrackOption> = emptyList(),
    val subtitleTracks: List<Media3TrackOption> = emptyList(),
) {
    companion object {
        fun fromMap(map: Map<String, Any?>): Media3TrackState {
            return Media3TrackState(
                audioTracks = readTrackList(map, "audioTracks"),
                subtitleTracks = readTrackList(map, "subtitleTracks"),
            )
        }

        private fun readTrackList(
            map: Map<String, Any?>,
            key: String,
        ): List<Media3TrackOption> {
            val raw = map[key] as? List<*> ?: return emptyList()
            return raw.mapNotNull { entry ->
                val data = entry as? Map<*, *> ?: return@mapNotNull null
                // Unsupported tracks keep their position in the numbering but
                // can't be selected, so hide them from the menu.
                if (data["supported"] == false) return@mapNotNull null
                val index = (data["index"] as? Number)?.toInt() ?: return@mapNotNull null
                val label = data["label"]?.toString()?.takeIf { it.isNotBlank() } ?: "Track $index"
                val selected = data["selected"] as? Boolean ?: false
                Media3TrackOption(index = index, label = label, selected = selected)
            }
        }
    }
}

@Composable
private fun TrackSelectionDialog(
    title: String,
    tracks: List<Media3TrackOption>,
    onDismiss: () -> Unit,
    onDisable: (() -> Unit)? = null,
    onSelectTrack: (Int) -> Unit,
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(title)
        },
        text = {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .heightIn(max = 320.dp)
                    .verticalScroll(rememberScrollState()),
            ) {
                if (onDisable != null) {
                    OutlinedButton(
                        onClick = onDisable,
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = 8.dp),
                    ) {
                        Text("Off")
                    }
                }

                tracks.forEach { track ->
                    OutlinedButton(
                        onClick = { onSelectTrack(track.index) },
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = 8.dp),
                        border = BorderStroke(
                            1.dp,
                            if (track.selected) {
                                Color.White
                            } else {
                                Color.White.copy(alpha = 0.35f)
                            },
                        ),
                    ) {
                        Text(track.label)
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        },
    )
}

@Composable
private fun PlaybackInfoDialog(
    metadataState: Media3UiMetadataState,
    onDismiss: () -> Unit,
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Playback Info")
        },
        text = {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .heightIn(max = 420.dp)
                    .verticalScroll(rememberScrollState()),
            ) {
                if (metadataState.streamInfoSections.isEmpty()) {
                    Text("No stream information available")
                } else {
                    metadataState.streamInfoSections.forEach { section ->
                        Text(
                            text = section.title,
                            style = MaterialTheme.typography.titleSmall,
                            modifier = Modifier.padding(top = 8.dp, bottom = 6.dp),
                        )
                        section.rows.forEach { row ->
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 2.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically,
                            ) {
                                Text(
                                    text = row.label,
                                    color = Color.White.copy(alpha = 0.74f),
                                    style = MaterialTheme.typography.bodySmall,
                                )
                                Text(
                                    text = row.value,
                                    color = Color.White,
                                    style = if (row.highlight) {
                                        MaterialTheme.typography.bodyMedium
                                    } else {
                                        MaterialTheme.typography.bodySmall
                                    },
                                    modifier = Modifier.padding(start = 16.dp),
                                )
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        },
    )
}

@Composable
private fun CastCrewDialog(
    people: List<Media3CastPerson>,
    onDismiss: () -> Unit,
    onOpenPerson: (Media3CastPerson) -> Unit,
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Cast & Crew")
        },
        text = {
            if (people.isEmpty()) {
                Text("No cast information available")
            } else {
                LazyRow(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(min = 190.dp, max = 240.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp),
                    contentPadding = PaddingValues(horizontal = 2.dp, vertical = 4.dp),
                ) {
                    items(
                        items = people,
                        key = { person ->
                            if (person.personId.isNotBlank()) {
                                person.personId
                            } else {
                                person.name
                            }
                        },
                    ) { person ->
                        OutlinedButton(
                            onClick = {
                                onOpenPerson(person)
                            },
                            enabled = person.personId.isNotBlank(),
                            modifier = Modifier
                                .width(118.dp)
                                .height(186.dp),
                            shape = RoundedCornerShape(18.dp),
                            contentPadding = PaddingValues(horizontal = 8.dp, vertical = 10.dp),
                            border = BorderStroke(
                                1.dp,
                                if (person.personId.isNotBlank()) {
                                    Color.White.copy(alpha = 0.4f)
                                } else {
                                    Color.White.copy(alpha = 0.18f)
                                },
                            ),
                        ) {
                            Column(
                                horizontalAlignment = Alignment.CenterHorizontally,
                            ) {
                                Box(
                                    modifier = Modifier
                                        .size(92.dp)
                                        .clip(CircleShape)
                                        .background(Color.White.copy(alpha = 0.12f)),
                                    contentAlignment = Alignment.Center,
                                ) {
                                    if (person.imageUrl.isNotBlank()) {
                                        AsyncImage(
                                            model = person.imageUrl,
                                            contentDescription = person.name,
                                            modifier = Modifier.fillMaxSize(),
                                            contentScale = ContentScale.Crop,
                                        )
                                    } else {
                                        Icon(
                                            imageVector = Icons.Rounded.Person,
                                            contentDescription = null,
                                            tint = Color.White.copy(alpha = 0.6f),
                                        )
                                    }
                                }
                                Spacer(modifier = Modifier.height(8.dp))
                                Text(
                                    text = person.name,
                                    color = Color.White,
                                    style = MaterialTheme.typography.bodySmall,
                                    textAlign = TextAlign.Center,
                                    maxLines = 2,
                                )
                                if (person.subtitle.isNotBlank()) {
                                    Text(
                                        text = person.subtitle,
                                        color = Color.White.copy(alpha = 0.68f),
                                        style = MaterialTheme.typography.labelSmall,
                                        textAlign = TextAlign.Center,
                                        maxLines = 1,
                                    )
                                }
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        },
    )
}

@Composable
private fun CastControlsDialog(
    metadataState: Media3UiMetadataState,
    onDismiss: () -> Unit,
    onAction: (String) -> Unit,
    onVolumeChanged: (Float) -> Unit,
) {
    var localVolume by remember(metadataState.castVolume) {
        mutableStateOf(metadataState.castVolume ?: 1.0f)
    }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(
                metadataState.castKindLabel
                    .takeIf { it.isNotBlank() }
                    ?.let { "$it Controls" }
                    ?: "Cast Controls",
            )
        },
        text = {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .heightIn(max = 360.dp)
                    .verticalScroll(rememberScrollState()),
            ) {
                if (metadataState.castStateLabel.isNotBlank()) {
                    Text(
                        text = metadataState.castStateLabel,
                        style = MaterialTheme.typography.bodySmall,
                        color = Color.White.copy(alpha = 0.72f),
                        modifier = Modifier.padding(bottom = 12.dp),
                    )
                }

                if (metadataState.castVolume != null) {
                    Text(
                        text = "Volume ${(localVolume * 100f).toInt()}%",
                        style = MaterialTheme.typography.bodySmall,
                    )
                    Slider(
                        value = localVolume,
                        onValueChange = { value ->
                            localVolume = value
                            onVolumeChanged(value)
                        },
                        valueRange = 0f..1f,
                        modifier = Modifier.padding(bottom = 10.dp),
                    )
                }

                OutlinedButton(
                    onClick = {
                        onAction("castPlay")
                        onDismiss()
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 8.dp),
                ) {
                    Text("Play")
                }
                OutlinedButton(
                    onClick = {
                        onAction("castPause")
                        onDismiss()
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 8.dp),
                ) {
                    Text("Pause")
                }
                OutlinedButton(
                    onClick = {
                        onAction("castSyncPosition")
                        onDismiss()
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 8.dp),
                ) {
                    Text("Sync Position")
                }
                OutlinedButton(
                    onClick = {
                        onAction("castStop")
                        onDismiss()
                    },
                    modifier = Modifier.fillMaxWidth(),
                ) {
                    Text("Stop")
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        },
    )
}

private data class Media3UiState(
    val positionMs: Long = 0L,
    val durationMs: Long = 0L,
    val bufferedMs: Long = 0L,
    val isPlaying: Boolean = false,
    val isBuffering: Boolean = false,
    val playbackSpeed: Float = 1.0f,
    val videoWidth: Int = 0,
    val videoHeight: Int = 0,
) {
    val progress: Float
        get() {
            if (durationMs <= 0L) return 0f
            return (positionMs.toFloat() / durationMs.toFloat()).coerceIn(0f, 1f)
        }

    val bufferedProgress: Float
        get() {
            if (durationMs <= 0L) return 0f
            return (bufferedMs.toFloat() / durationMs.toFloat()).coerceIn(0f, 1f)
        }

    companion object {
        fun fromMap(map: Map<String, Any?>): Media3UiState {
            fun readLong(key: String): Long {
                val value = map[key]
                return when (value) {
                    is Long -> value
                    is Int -> value.toLong()
                    is Number -> value.toLong()
                    else -> 0L
                }
            }

            fun readInt(key: String): Int {
                val value = map[key]
                return when (value) {
                    is Int -> value
                    is Long -> value.toInt()
                    is Number -> value.toInt()
                    else -> 0
                }
            }

            fun readBool(key: String): Boolean {
                return map[key] as? Boolean ?: false
            }

            fun readFloat(key: String): Float {
                val value = map[key]
                return when (value) {
                    is Float -> value
                    is Double -> value.toFloat()
                    is Number -> value.toFloat()
                    else -> 0f
                }
            }

            return Media3UiState(
                positionMs = readLong("positionMs"),
                durationMs = readLong("durationMs"),
                bufferedMs = readLong("bufferedMs"),
                isPlaying = readBool("isPlaying"),
                isBuffering = readBool("isBuffering"),
                playbackSpeed = readFloat("playbackSpeed").coerceIn(0.5f, 2.0f),
                videoWidth = readInt("videoWidth"),
                videoHeight = readInt("videoHeight"),
            )
        }
    }
}

internal object Media3ActivityHost {
    @Volatile
    private var activeActivityRef: WeakReference<Media3PlayerActivity>? = null

    fun setActive(activity: Media3PlayerActivity) {
        activeActivityRef = WeakReference(activity)
    }

    fun clear(activity: Media3PlayerActivity) {
        val current = activeActivityRef?.get()
        if (current === activity) {
            activeActivityRef = null
        }
    }

    fun finishActive() {
        val activity = activeActivityRef?.get() ?: return
        activity.runOnUiThread {
            activity.finish()
        }
    }

    fun isRunning(): Boolean = activeActivityRef?.get() != null
}
