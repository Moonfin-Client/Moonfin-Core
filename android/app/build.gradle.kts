import java.util.Properties
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    // Applied only for a normal build. google-services.json lists clients for
    // the real application ids, so a test build under MOONFIN_TEST_ID_SUFFIX
    // (see productFlavors) would fail with "No matching client found". Skipping
    // it there is safe because the initializeApp call is try/caught, so a test
    // build just runs without push.
    id("com.google.gms.google-services")
        .apply(System.getenv("MOONFIN_TEST_ID_SUFFIX").isNullOrEmpty())
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties().apply {
    val file = rootProject.file("keystore.properties")
    if (file.exists()) file.inputStream().use { load(it) }
}
val keystoreStoreType = keystoreProperties
    .getProperty("storeType")
    ?.trim()
    ?.takeIf { it.isNotEmpty() }

val hasReleaseKeystore = rootProject.file("app/release.keystore").exists() &&
    (keystoreProperties.getProperty("keyAlias")?.isNotBlank() == true)

android {
    namespace = "org.moonfin.androidtv"
    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
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
        // Optional application-id suffix for on-device testing, set through the
        // environment so an unset build is byte-identical to before:
        //   MOONFIN_TEST_ID_SUFFIX=.hwtest flutter build apk --flavor mobile --debug
        //
        // Why this exists: a debug-signed test build cannot install over a
        // release-signed build of the same flavor, and uninstalling to make room
        // deletes that package's data directory - which holds the cartridge
        // saves (SRAM/EEPROM). Those are stored locally and are NOT backed up to
        // the server, so an uninstall can lose real game progress. A distinct id
        // installs alongside instead and touches nothing.
        val testIdSuffix = System.getenv("MOONFIN_TEST_ID_SUFFIX").orEmpty()
        val abis = listOf("arm64-v8a", "armeabi-v7a", "x86_64")
        // Phones, tablets and TVs share this package, and the app picks the TV
        // UI and the renderer at runtime.
        create("mobile") {
            dimension = "device"
            applicationId = baseAppId + testIdSuffix
            versionCode = flutter.versionCode
            versionName = flutter.versionName
            ndk { abiFilters += abis }
            manifestPlaceholders["appName"] =
                if (testIdSuffix.isEmpty()) baseAppName else "$baseAppName Test"
        }
        create("mobile-beta") {
            dimension = "device"
            applicationId = "$baseAppId.beta"
            versionCode = flutter.versionCode
            versionName = flutter.versionName
            ndk { abiFilters += abis }
            manifestPlaceholders["appName"] = "$baseAppName Beta"
        }
    }

    signingConfigs {
        create("release") {
            if (hasReleaseKeystore) {
                storeFile = file("release.keystore")
                storeType = keystoreStoreType
                storePassword = keystoreProperties["storePassword"] as String?
                keyAlias = keystoreProperties["keyAlias"] as String?
                keyPassword = keystoreProperties["keyPassword"] as String?
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (hasReleaseKeystore) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
        }
    }

    packaging {
        jniLibs {
            useLegacyPackaging = true
            pickFirsts += setOf("**/libc++_shared.so")
        }
    }

    externalNativeBuild {
        cmake {
            path = file("src/main/cpp/CMakeLists.txt")
            version = "3.22.1"
        }
    }

}

kotlin {
    compilerOptions {
        jvmTarget = JvmTarget.JVM_11
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
    implementation("com.google.android.gms:play-services-cast-framework:22.3.1")
    implementation("eu.simonbinder:sqlite3-native-library:3.52.0")
    implementation("androidx.tvprovider:tvprovider:1.1.0")
    implementation("androidx.work:work-runtime-ktx:2.12.0")
}

val flutterApkOutputDir = layout.buildDirectory.dir("app/outputs/flutter-apk")

tasks.register<Copy>("copyMobileDebugApkForFlutter") {
    from(flutterApkOutputDir.map { it.file("app-mobile-debug.apk") })
    into(flutterApkOutputDir)
    rename { "app-debug.apk" }
}

tasks.matching { it.name == "assembleDebug" }.configureEach {
    finalizedBy("copyMobileDebugApkForFlutter")
}
