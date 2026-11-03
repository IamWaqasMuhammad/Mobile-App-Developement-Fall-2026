pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    
    // 1. Upgrade Android Gradle Plugin to 9.0.1
    id("com.android.application") version "9.0.1" apply false
    
    // 2. Upgrade Kotlin Plugin to 2.3.20
    id("org.jetbrains.kotlin.android") version "2.3.20" apply false
}


include(":app")
