@echo off
REM Find Java 21 installation and configure Gradle

setlocal enabledelayedexpansion

echo.
echo ========================================
echo  Java 21 Configuration for IntelliJ
echo ========================================
echo.

REM Try to find Java 21 from common locations
set "JAVA21_FOUND="

REM Check Oracle JDK installation
if exist "C:\Program Files\Java\jdk-21" (
    for /d %%D in ("C:\Program Files\Java\jdk-21*") do (
        set "JAVA21_FOUND=%%D"
        goto :found
    )
)

REM Check Eclipse Temurin
if exist "C:\Program Files\Eclipse Foundation" (
    for /d %%D in ("C:\Program Files\Eclipse Foundation\jdk-21*") do (
        set "JAVA21_FOUND=%%D"
        goto :found
    )
)

REM Check Scoop installation
if exist "%USERPROFILE%\scoop\apps\openjdk21" (
    set "JAVA21_FOUND=%USERPROFILE%\scoop\apps\openjdk21\current"
    goto :found
)

REM Check user home Java folder
if exist "%USERPROFILE%\.jdks" (
    for /d %%D in ("%USERPROFILE%\.jdks\openjdk-21*") do (
        set "JAVA21_FOUND=%%D"
        goto :found
    )
)

:found
if not "!JAVA21_FOUND!"=="" (
    echo [SUCCESS] Found Java 21 at:
    echo   !JAVA21_FOUND!
    echo.
    
    REM Test if it's really Java 21
    "!JAVA21_FOUND!\bin\java.exe" -version 2>&1 | findstr /R "21\."
    
    if !errorlevel! equ 0 (
        echo.
        echo [CONFIGURING] Setting up gradle.properties...
        
        REM Create gradle.properties
        (
            echo # Gradle Configuration for Java 21
            echo org.gradle.java.home=!JAVA21_FOUND!
            echo org.gradle.jvmargs=-Xmx2048m
            echo org.gradle.parallel=true
            echo org.gradle.daemon.idletimeout=600000
        ) > gradle.properties
        
        echo [DONE] gradle.properties created successfully!
        echo.
        echo Next steps:
        echo 1. Close IntelliJ IDEA completely
        echo 2. In IntelliJ: File ^> Project Structure
        echo 3. Set Project SDK to Java 21
        echo 4. Set Gradle JVM to "Project SDK"
        echo 5. Reopen the project
        echo.
        pause
        exit /b 0
    ) else (
        echo [ERROR] Found directory but it's not Java 21
        echo Please verify your Java 21 installation
        pause
        exit /b 1
    )
) else (
    echo [ERROR] Java 21 not found in common locations!
    echo.
    echo Please download Java 21 from:
    echo   - https://www.oracle.com/java/technologies/downloads/#java21
    echo   - https://adoptium.net/temurin/releases/?version=21
    echo.
    echo After installation, run this script again.
    echo.
    pause
    exit /b 1
)
