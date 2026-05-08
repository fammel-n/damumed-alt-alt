# 🔧 IntelliJ IDEA - Java 21 Configuration Guide

## Problem
```
Error: UnsupportedClassVersionError: class file version 65.0, this version 
of the Java Runtime only recognizes class file versions up to 61.0
```

**Why:** IntelliJ is using Java 17, but backend is compiled for Java 21.

---

## ✅ Solution: Configure IntelliJ to Use Java 21

### Step 1: Check Your Java Installation
First, ensure you have Java 21 installed:

**Windows:**
```
java -version
```

If you don't have Java 21, download from:
- https://www.oracle.com/java/technologies/downloads/#java21
- Or use: https://adoptium.net/temurin/releases/?version=21

Recommended location: `C:\Program Files\Java\jdk-21.x.x`

### Step 2: Configure Project SDK

**In IntelliJ IDEA 2026.1.1:**

1. **Open Project Structure:**
   - Click: `File` → `Project Structure`
   - Shortcut: `Ctrl + Alt + Shift + S` (Windows/Linux) or `Cmd + ;` (Mac)

2. **Select Project:**
   - Left panel: Click `Project`
   - Right panel appears

3. **Set SDK to Java 21:**
   - Look for "Project SDK" dropdown (currently shows Java 17)
   - Click dropdown → `Add SDK` → `Download JDK...`
   - OR select existing Java 21 if already listed

   **If adding new JDK:**
   - Provider: `Eclipse Temurin` or `Oracle OpenJDK`
   - Version: `21` (LTS)
   - Click `Download`
   - Once installed, select it

4. **Select Language Level:**
   - Set Language level to: `21`

5. **Click Apply → OK**

---

### Step 3: Configure Gradle SDK

1. **Open Settings:**
   - Click: `File` → `Settings`
   - Shortcut: `Ctrl + Alt + S`

2. **Navigate to Gradle:**
   - Left panel: `Build, Execution, Deployment` → `Gradle`

3. **Configure Gradle JVM:**
   - Look for "Gradle JVM" dropdown
   - Change from current Java to: `Project SDK` (Java 21)
   - Click `Apply` → `OK`

4. **Reload Gradle Project:**
   - Right-click on `backend` module in Project view
   - Click: `Reload Gradle Project`
   - Wait for Gradle refresh to complete

---

### Step 4: Invalidate Caches and Restart

Sometimes IntelliJ caches old bytecode:

1. Click: `File` → `Invalidate Caches...`
2. Select: `Invalidate and Restart`
3. Click `Invalidate`
4. IntelliJ will restart automatically

---

### Step 5: Rebuild Project

1. Click: `Build` → `Clean Project`
2. Click: `Build` → `Build Project`
   - Shortcut: `Ctrl + F9`
3. Wait for build to complete (no errors should appear)

---

### Step 6: Run Application

1. **In IntelliJ, find the main class:**
   - Navigate to: `backend/src/main/kotlin/com/damumed/intelliheart/IntelliHeartApplicationKt.kt`

2. **Run it:**
   - Right-click on the file → `Run 'IntelliHeartApplicationKt'`
   - OR click the green play icon in the gutter
   - OR use: `Ctrl + Shift + F10`

3. **Or create a Run Configuration:**
   - Click: `Run` → `Edit Configurations...`
   - Click `+` → `Kotlin`
   - Set Main class: `com.damumed.intelliheart.IntelliHeartApplicationKt`
   - Click `OK`
   - Click green play button to run

---

## 🔍 Verification

### Check SDK in IntelliJ:
1. Bottom-right corner of IntelliJ
2. Should show: `Java 21` or similar
3. NOT `Java 17`

### Check Gradle Configuration:
1. Open `File` → `Project Structure` → `Modules`
2. Select `backend` module
3. Check "Module SDK" is set to Java 21

### Terminal Command:
```bash
# In IntelliJ terminal
echo %JAVA_HOME%  # Windows
# Should point to Java 21 installation
```

---

## 📋 Troubleshooting

### Still getting UnsupportedClassVersionError?

**Issue:** IntelliJ still using Java 17

**Fix:**
1. `File` → `Project Structure` → `Project`
2. Verify Project SDK shows Java 21 (not 17)
3. `File` → `Invalidate Caches...` → `Invalidate and Restart`
4. Wait 2-3 minutes for IntelliJ to restart and re-index

### "JDK not found" error

**Fix:**
1. Download Java 21 from https://adoptium.net/
2. Install to: `C:\Program Files\Java\jdk-21.x.x`
3. In Project Structure, click `+` to add new JDK
4. Point to installation directory

### Build fails with "Inconsistent JVM-target"

**This should NOT happen** - we already fixed this in `build.gradle`

**If it does:**
1. Run: `./gradlew clean build -x test`
2. Or in IntelliJ: `Build` → `Clean Project` → `Build Project`

### Gradle still downloading dependencies?

**Expected behavior:** First build takes 2-5 minutes

**If stuck:**
1. Wait for download to complete
2. Check internet connection
3. Check `~/.gradle/gradle.properties` for proxy settings

---

## ✅ Checklist Before Running

- [ ] Java 21 installed on your system
- [ ] Project SDK set to Java 21
- [ ] Gradle JVM set to Project SDK
- [ ] Gradle project reloaded (`Reload Gradle Project`)
- [ ] Project built successfully (`Build Project`)
- [ ] No errors in Build console
- [ ] Caches invalidated and IntelliJ restarted

---

## 🚀 Quick Reference

| Task | Command/Action |
|------|---|
| **Set Project SDK** | File → Project Structure (Ctrl+Alt+Shift+S) → Project → SDK dropdown |
| **Set Gradle JVM** | File → Settings (Ctrl+Alt+S) → Build... → Gradle → Gradle JVM |
| **Reload Gradle** | Right-click `backend` → `Reload Gradle Project` |
| **Build Project** | Build → Build Project (Ctrl+F9) |
| **Clean Project** | Build → Clean Project |
| **Clear Caches** | File → Invalidate Caches → Invalidate and Restart |
| **Run Application** | Run → Run 'IntelliHeartApplicationKt' (Ctrl+Shift+F10) |

---

## 💡 Why This Matters

- **Java versions are binary incompatible**
- Code compiled for Java 21 (class version 65) cannot run on Java 17 (class version 61)
- IntelliJ compiles your code with the Project SDK
- IntelliJ runs tests/app with the selected JVM
- **All must use Java 21** to avoid conflicts

---

## 📞 If Still Having Issues

1. Check that Java 21 is actually installed: `java -version`
2. Verify IntelliJ is using it: `File → Project Structure → Project SDK`
3. Clear IntelliJ cache: `File → Invalidate Caches → Invalidate and Restart`
4. Reload Gradle: Right-click `backend` → `Reload Gradle Project`
5. Clean and rebuild: `Build → Clean Project` → `Build → Build Project`

---

**Status:** ✅ Fixed and Ready to Run
**Required Java Version:** 21 (NOT 17, NOT 25)
**IntelliJ IDEA Version:** 2026.1.1 or later
