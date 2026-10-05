#!/usr/bin/env bash
# Local build. Needs Node 20+, JDK 21 and the Android SDK (ANDROID_HOME set).
set -e
npm install
[ -d android ] || npx cap add android
M=android/app/src/main/AndroidManifest.xml
grep -q SCHEDULE_EXACT_ALARM $M || sed -i 's#</manifest>#    <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>\n    <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>\n    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>\n</manifest>#' $M
npx capacitor-assets generate --android
npx cap sync android
cd android && ./gradlew assembleDebug bundleRelease
echo "APK: android/app/build/outputs/apk/debug/app-debug.apk"
echo "AAB: android/app/build/outputs/bundle/release/app-release.aab (unsigned)"
