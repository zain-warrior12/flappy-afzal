@echo off
echo ========================================
echo Flappy Bird APK Builder
echo ========================================
echo.

echo Step 1: Checking if Cordova is installed...
where cordova >nul 2>&1
if %errorlevel% neq 0 (
    echo Cordova not found. Installing Cordova...
    call npm install -g cordova
    if %errorlevel% neq 0 (
        echo ERROR: Failed to install Cordova
        echo Please run this script as Administrator
        pause
        exit /b 1
    )
)

echo Step 2: Creating Cordova project...
if exist flappybird-build (
    echo Removing old build folder...
    rmdir /s /q flappybird-build
)
     
call cordova create flappybird-build com.flappybird.game FlappyBird
if %errorlevel% neq 0 (
    echo ERROR: Failed to create Cordova project
    pause
    exit /b 1
)

echo Step 3: Copying game files...
xcopy /Y /Q teryy\index.html flappybird-build\www\
xcopy /Y /Q teryy\MC.png flappybird-build\www\
xcopy /Y /Q teryy\habibi.mp3 flappybird-build\www\
xcopy /Y /Q teryy\out.mp3 flappybird-build\www\
xcopy /Y /Q teryy\config.xml flappybird-build\

cd flappybird-build

echo Step 4: Adding Android platform...
call cordova platform add android
if %errorlevel% neq 0 (
    echo ERROR: Failed to add Android platform
    echo Make sure you have Android SDK installed
    cd ..
    pause
    exit /b 1
)

echo Step 5: Building APK...
call cordova build android
if %errorlevel% neq 0 (
    echo ERROR: Failed to build APK
    cd ..
    pause
    exit /b 1
)

cd ..

echo.
echo ========================================
echo BUILD SUCCESSFUL!
echo ========================================
echo.
echo Your APK file is located at:
echo flappybird-build\platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo You can install this APK on your Android device.
echo.
pause
