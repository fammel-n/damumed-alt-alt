# 🔧 Java 21 Runtime Error - Complete Solution

## Problem

```
Error: LinkageError occurred while loading main class com.damumed.intelliheart.IntelliHeartApplicationKt
java.lang.UnsupportedClassVersionError: com/damumed/intelliheart/IntelliHeartApplicationKt 
has been compiled by a more recent version of the Java Runtime 
(class file version 65.0), this version of the Java Runtime only 
recognizes class file versions up to 61.0
```

### What This Means

- **Code compiled for:** Java 21 (class version 65)
- **Running on:** Java 17 (class version 61)
- **Result:** Binary incompatibility - code cannot run

### Root Cause

IntelliJ IDEA was using Java 17 to run the application, but the code was compiled with Java 21.

---

## ✅ Solution

### For Windows Users (RECOMMENDED)

This is the easiest method!

**Step 1: Run the Auto-Configuration Script**

Double-click or run from Command Prompt:
```cmd
setup-java21.bat
```

The script will:
1. ✓ Search for Java 21 on your system
2. ✓ Create `gradle.properties` with correct configuration
3. ✓ Show you exactly what path was found
4. ✓ Provide next steps

**Step 2: Close IntelliJ IDEA**

Completely close IntelliJ (don't just close the project):
- File → Exit (or close all windows)

**Step 3: Reopen the Project**

- Open IntelliJ IDEA
- Open the DAMUMED project again
- Wait for indexing to complete (may take 2-3 minutes)

**Step 4: Verify Configuration**

When IntelliJ opens:
1. Check bottom-right corner - should show "Java 21"
2. File → Project Structure → Project SDK should be Java 21

**Step 5: Build and Run**

```
Build → Build Project (Ctrl+F9)
Run → Run 'IntelliHeartApplication'
```

---

### For Linux / Mac Users

The `gradle.properties` file is already configured for Linux.

**Step 1: Configure IntelliJ**

1. Open: `File → Project Structure`
2. Select `Project` in left panel
3. Under "Project SDK", click dropdown
4. Select or add Java 21
5. Set Language level to: `21`
6. Click Apply → OK

**Step 2: Configure Gradle**

1. Open: `File → Settings` (or `IntelliJ IDEA → Preferences` on Mac)
2. Navigate to: `Build, Execution, Deployment → Gradle`
3. Find "Gradle JVM" dropdown
4. Change to: `Project SDK`
5. Click Apply → OK

**Step 3: Reload Project**

1. Right-click `backend` module in Project view
2. Click: `Reload Gradle Project`
3. Wait for sync to complete

**Step 4: Build and Run**

```
Build → Build Project
Run → Run 'IntelliHeartApplication'
```

---

## 📋 What Was Fixed

### Files Added

1. **`gradle.properties`**
   - Automatically tells Gradle to use Java 21
   - Pre-configured for both Linux and Windows
   - Loaded by Gradle automatically on startup

2. **`setup-java21.bat`** (Windows only)
   - Auto-detects Java 21 installation
   - Generates correct gradle.properties configuration
   - Provides interactive guidance

3. **`INTELLIJ_JAVA21_SETUP.md`**
   - Step-by-step manual configuration guide
   - Screenshots-friendly format
   - Comprehensive troubleshooting section

4. **`.idea/README.md`**
   - IDE-specific configuration notes
   - Windows and Linux-specific instructions

### Updated Files

- **`SETUP.md`** - Added Windows-specific instructions
- **`backend/build.gradle`** - Already fixed for Kotlin jvmTarget=21

---

## 🔍 Troubleshooting

### Still Getting UnsupportedClassVersionError?

**Check 1: Verify Java 21 is installed**
```cmd
java -version
```
Should show Java 21, NOT Java 17 or 25

**Check 2: Verify IntelliJ is using Java 21**
1. Look at bottom-right corner of IntelliJ window
2. Should show "Java 21" or similar
3. NOT "Java 17"

**Check 3: Clear IntelliJ Cache**
```
File → Invalidate Caches... → Invalidate and Restart
```

**Check 4: Verify gradle.properties**
1. Open `gradle.properties` in project root
2. Check that `org.gradle.java.home` points to correct Java 21 path
3. For Windows: Should be something like `C:\Program Files\Java\jdk-21.x.x`

**Check 5: Reload Gradle**
1. Right-click `backend` module
2. Click `Reload Gradle Project`
3. Wait for sync to complete

### Java 21 Not Found?

Download Java 21 from:
- **Oracle:** https://www.oracle.com/java/technologies/downloads/#java21
- **Eclipse Temurin:** https://adoptium.net/temurin/releases/?version=21

Common installation locations:
- Windows: `C:\Program Files\Java\jdk-21.x.x`
- Windows (Scoop): `C:\Users\<username>\scoop\apps\openjdk21\current`
- Linux: `/usr/lib/jvm/java-21-openjdk-amd64/`
- Mac: `/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/`

After installation, run `setup-java21.bat` again.

### Still Not Working?

1. **Full Reset:**
   - Close IntelliJ
   - Delete: `backend/.gradle/` directory
   - Delete: `backend/build/` directory
   - Reopen IntelliJ

2. **Manual Configuration:**
   - Follow steps in `INTELLIJ_JAVA21_SETUP.md`
   - Manually set Project SDK to Java 21
   - Manually set Gradle JVM to Project SDK

3. **Windows Specific:**
   - If script can't find Java: Download from link above
   - Install to default location like `C:\Program Files\Java\jdk-21.0.10`
   - Run script again

---

## ✨ Key Points to Remember

| Aspect | Value |
|--------|-------|
| **Required Java Version** | **21** (NOT 17, NOT 25) |
| **Kotlin jvmTarget** | **21** (in build.gradle) |
| **Gradle Version** | 8.13 |
| **IntelliJ Project SDK** | Java 21 |
| **IntelliJ Gradle JVM** | Project SDK (Java 21) |

---

## 📚 Related Documentation

- **SETUP.md** - General setup guide
- **FIX_SUMMARY.txt** - What was fixed in version 1.0
- **INTELLIJ_JAVA21_SETUP.md** - Detailed manual setup
- **.idea/README.md** - IDE configuration
- **backend/build.gradle** - Build configuration (already fixed)
- **gradle.properties** - Gradle Java 21 configuration (NEW)

---

## 🎯 Next Steps

1. ✅ Run `setup-java21.bat` (Windows) or manually configure (Linux/Mac)
2. ✅ Restart IntelliJ IDEA
3. ✅ Verify Java 21 is shown in bottom-right
4. ✅ Build → Build Project
5. ✅ Run → Run 'IntelliHeartApplication'
6. ✅ Access API at `http://localhost:8080/api/`

---

## 💡 Why This Matters

Java uses class file format versions:
- Java 17 = class version 61
- Java 21 = class version 65
- Java 25 = class version 69

Code compiled for Java 21 (v65) **cannot** run on Java 17 (v61). They must match!

By setting `gradle.properties`, we ensure both compilation and runtime use the same Java 21, eliminating version conflicts.

---

**Status:** ✅ FIXED AND TESTED
**Date:** 2026-05-08
**Version:** 1.1 (with Java 21 runtime fix)
