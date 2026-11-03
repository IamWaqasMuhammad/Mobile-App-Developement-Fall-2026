plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.practice_project"
    compileSdk = 35

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    // Replace the compilerOptions block with this universally recognizable line:
    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.practice_project"
        minSdk = flutter.minSdkVersion
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
