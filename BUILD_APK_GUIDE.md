# How to Build APK for Flappy Bird Game

## Option 1: Using Online Build Service (Easiest)

### Using AppGyver / Capacitor Online
1. Go to https://appgyver.com or similar service
2. Upload your files (index.html, MC.png, habibi.mp3, out.mp3, config.xml)
3. Follow their build instructions

### Using Cordova Build Service
1. Install Cordova globally (if not already): `npm install -g cordova`
2. Create a new Cordova project: `cordova create flappybird com.flappybird.game FlappyBird`
3. Copy all files from teryy folder to `flappybird/www/` folder
4. Navigate to the project: `cd flappybird`
5. Add Android platform: `cordova platform add android`
6. Build the APK: `cordova build android`
7. Find your APK in: `platforms/android/app/build/outputs/apk/debug/app-debug.apk`

## Option 2: Using Android Studio (Most Control)

1. Download and install Android Studio
2. Create a new WebView project
3. Place your HTML5 game files in the assets folder
4. Configure the WebView to load index.html
5. Build APK from Android Studio

## Option 3: Using Capacitor (Modern Approach)

1. Install Capacitor: `npm install -g @capacitor/cli @capacitor/core`
2. Initialize: `npx cap init FlappyBird com.flappybird.game`
3. Add Android: `npx cap add android`
4. Copy your files to the web folder
5. Sync: `npx cap sync`
6. Open in Android Studio: `npx cap open android`
7. Build APK from Android Studio

## Requirements for Building

- Node.js and npm installed
- Java JDK 8 or higher
- Android SDK (comes with Android Studio)
- Gradle (usually comes with Android Studio)

## Quick Test Without Building APK

You can test your game on mobile by:
1. Upload the teryy folder to a web server
2. Access it from your mobile browser
3. Add to home screen for app-like experience

## Notes

- The config.xml file is already created for you
- Make sure all audio files (habibi.mp3, out.mp3) and images (MC.png) are in the same folder
- For production, you'll need to sign the APK with a keystore
