allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val media3Version = "1.10.1"

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    // file_picker 11 only applies the Kotlin plugin on AGP 8 and expects
    // built-in Kotlin on AGP 9, which this project opts out of, so its sources
    // never compile. Apply it here until the app moves to file_picker 12.
    if (name == "file_picker") {
        plugins.withId("com.android.library") {
            pluginManager.apply("org.jetbrains.kotlin.android")
        }
    }
}

subprojects {
    configurations.configureEach {
        resolutionStrategy.eachDependency {
            // This force covers only the androidx.media3 group. The bundled
            // FFmpeg audio extension (org.jellyfin.media3:media3-ffmpeg-decoder
            // in moonfin_native_video) isn't rewritten and ships against
            // media3 1.9.x, since no 1.10.x build of it exists yet.
            // Media3VideoView emits an "ffmpegDecoderDiagnostics" event at
            // first player build. If that ever reports unavailable, pin
            // media3Version back to the decoder's line until jellyfin
            // publishes a matched artifact.
            if (requested.group == "androidx.media3") {
                useVersion(media3Version)
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
