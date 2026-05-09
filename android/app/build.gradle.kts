import java.util.Properties

fun loadAndroidTvVersionCode(rootDir: File, fallback: Int): Int {
    val pubspec = rootDir.resolve("../pubspec.yaml")
    if (!pubspec.exists()) return fallback

    val line = pubspec.readLines().firstOrNull {
        it.trimStart().startsWith("android_tv_build_number:")
    } ?: return fallback

    val rawValue = line.substringAfter(":", "").trim()
    return rawValue.toIntOrNull() ?: fallback
}

fun loadAndroidTvVersionName(rootDir: File, fallback: String): String {
    val pubspec = rootDir.resolve("../pubspec.yaml")
    if (!pubspec.exists()) return fallback

    val line = pubspec.readLines().firstOrNull {
        it.trimStart().startsWith("android_tv_version:")
    } ?: return fallback

    val rawValue = line.substringAfter(":", "").trim()
    return rawValue.ifEmpty { fallback }
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties().apply {
    val file = rootProject.file("keystore.properties")
    if (file.exists()) file.inputStream().use { load(it) }
}

android {
    namespace = "org.moonfin.androidtv"
    compileSdk = 36
    ndkVersion = "28.2.13676358"
    val androidTvVersionCode = loadAndroidTvVersionCode(rootDir, flutter.versionCode)
    val androidTvVersionName = loadAndroidTvVersionName(rootDir, flutter.versionName)

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += "device"
    productFlavors {
        val baseAppId = "org.moonfin.androidtv"
        val baseAppName = "Moonfin"
        val mobileAbis = listOf("arm64-v8a")
        val tvAbis = listOf("arm64-v8a", "armeabi-v7a", "x86_64")
        create("mobile") {
            dimension = "device"
            applicationId = baseAppId
            versionCode = flutter.versionCode
            versionName = flutter.versionName
            ndk { abiFilters += mobileAbis }
            manifestPlaceholders["appName"] = baseAppName
        }
        create("mobile-beta") {
            dimension = "device"
            applicationId = "$baseAppId.beta"
            versionCode = flutter.versionCode
            versionName = flutter.versionName
            ndk { abiFilters += mobileAbis }
            manifestPlaceholders["appName"] = "$baseAppName Beta"
        }
        create("androidTv") {
            dimension = "device"
            applicationId = baseAppId
            versionCode = androidTvVersionCode
            versionName = androidTvVersionName
            ndk { abiFilters += tvAbis }
            manifestPlaceholders["appName"] = baseAppName
        }
        create("androidTv-beta") {
            dimension = "device"
            applicationId = "$baseAppId.beta"
            versionCode = androidTvVersionCode
            versionName = androidTvVersionName
            ndk { abiFilters += tvAbis }
            manifestPlaceholders["appName"] = "$baseAppName Beta"
        }
    }

    signingConfigs {
        create("release") {
            storeFile = file("release.keystore")
            storePassword = keystoreProperties["storePassword"] as String?
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }

    packaging {
        jniLibs {
            useLegacyPackaging = true
            pickFirsts += setOf("**/libc++_shared.so")
        }
    }

}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("com.google.android.gms:play-services-cast-framework:22.0.0")
    implementation("eu.simonbinder:sqlite3-native-library:3.52.0")
}
