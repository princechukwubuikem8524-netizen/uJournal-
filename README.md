# uJournal V1 (Android)

Capacitor wrapper around the offline web app in `www/index.html`.
Data stays on the phone (WebView storage). Reminders use native local notifications.

## Get the APK (no Android Studio needed)
1. Create a private GitHub repo and push this folder.
2. Open the Actions tab, run "Build uJournal Android" (it also runs on push).
3. Download the `uJournal-android` artifact: `app-debug.apk` installs directly
   (allow "install unknown apps" on the phone).

## Play Store
`app-release.aab` must be signed with your upload key. Add repo secrets
KEYSTORE_BASE64, KEYSTORE_PASSWORD, KEY_ALIAS and the workflow signs it.

## Build locally
Node 22, JDK 21, Android SDK, then `./build-android.sh`.
