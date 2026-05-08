# 🔧 DAMUMED Backend Setup Guide

## Problem Solved
✅ Fixed the Gradle JVM compatibility error:
```
Execution failed for task ':compileKotlin'.
> Inconsistent JVM-target compatibility detected for tasks 'compileJava' (21) and 'compileKotlin' (17).
```

## Root Causes & Solutions

### Issue 1: Mismatched JVM Target Versions
**Problem:** 
- `compileJava` was set to target Java 21
- `compileKotlin` was using the default target of 17
- Gradle couldn't compile with incompatible targets

**Solution:**
- Updated `build.gradle` to explicitly set Kotlin JVM target to 21
- Added proper Java version compatibility configuration

### Issue 2: Java 25 Incompatibility
**Problem:** 
- System default Java was 25 (class file format 69)
- Gradle 8.x doesn't support Java 25

**Solution:**
- Use Java 21 (class file format 61) which is fully compatible with Gradle 8.13
- Updated gradle-wrapper.properties to use Gradle 8.13

### Issue 3: Missing Kotlin Configuration in Gradle
**Problem:**
- Kotlin plugin had no explicit JVM target configuration
- Led to version mismatch between Java and Kotlin compilation

**Solution:**
- Added `tasks.withType(KotlinCompile)` configuration block
- Explicitly set `jvmTarget = '21'`

## ✅ What Was Fixed

### Files Modified

1. **backend/build.gradle**
   - Changed from `sourceCompatibility = '21'` (string)
   - To proper Java version object with targetCompatibility
   - Added Kotlin compilation task configuration

2. **backend/gradle/wrapper/gradle-wrapper.properties**
   - Confirmed Gradle 8.13 is in use (Java 21 compatible)

## 🚀 How to Use

### Prerequisites
- **Java 21** must be used (NOT Java 25 or later)
- Located at: `/home/codespace/java/21.0.10-ms/`

### Build the Backend

```bash
cd backend

# Using Java 21 explicitly
export JAVA_HOME=/home/codespace/java/21.0.10-ms

# Build (skip tests)
./gradlew clean build -x test

# Build with tests
./gradlew build

# Run the application
./gradlew bootRun
```

### Run in IntelliJ IDEA

1. **Configure Project SDK:**
   - Open: File → Project Structure → Project
   - Set Project SDK to: Java 21 (openjdk-21.0.10)
   - Click OK

2. **Configure Gradle SDK:**
   - Open: File → Settings → Build, Execution, Deployment → Gradle
   - Set Gradle JVM to: Project SDK (Java 21)
   - Click OK

3. **Build the project:**
   - Click: Build → Build Project
   - Or use keyboard shortcut: Ctrl+F9 / Cmd+F9

4. **Run the application:**
   - Click: Run → Run 'IntelliHeartApplication'
   - Or find the main class in: `com.damumed.intelliheart.IntelliHeartApplication`
   - Application starts on port 8080

### Access the API

- **Health check:** `http://localhost:8080/actuator/health`
- **API base:** `http://localhost:8080/api/`

## 🔍 Troubleshooting

### Error: "Inconsistent JVM-target compatibility"
**Solution:** Ensure JAVA_HOME is set to Java 21:
```bash
export JAVA_HOME=/home/codespace/java/21.0.10-ms
./gradlew build -x test
```

### Error: "Unsupported class file major version 69"
**Solution:** This means Java 25+ is being used. Switch to Java 21:
```bash
# Check Java version
java -version

# If showing Java 25, reset to Java 21
export JAVA_HOME=/home/codespace/java/21.0.10-ms
java -version  # Should show Java 21
```

### IntelliJ says "Gradle not configured"
**Solution:**
1. File → Settings → Build, Execution, Deployment → Gradle
2. Set Gradle JVM to "Project SDK" 
3. Restart IntelliJ

### Tests fail to compile
**Solution:** 
- Build without tests first: `./gradlew build -x test`
- Then: `./gradlew test` to run just the tests

## 📦 Project Structure

```
backend/
├── build.gradle           ← Fixed: Now uses Gradle 8.13 + Kotlin JVM 21 config
├── gradle/
│   └── wrapper/
│       └── gradle-wrapper.properties  ← Updated to Gradle 8.13
├── src/
│   ├── main/kotlin/      ← Source code
│   └── test/kotlin/      ← Tests
└── build/                ← Generated (git-ignored)
```

## 🎯 Key Configuration Changes

**build.gradle snippet:**
```gradle
java {
    sourceCompatibility = JavaVersion.VERSION_21
    targetCompatibility = JavaVersion.VERSION_21
}

tasks.withType(org.jetbrains.kotlin.gradle.tasks.KotlinCompile).configureEach {
    kotlinOptions {
        jvmTarget = '21'
    }
}
```

This ensures both Java and Kotlin compile to the same JVM bytecode version (21), eliminating version conflicts.

## ✨ Next Steps

1. ✅ Backend builds successfully
2. Build and run frontend: `cd ../frontend && npm install && npm run dev`
3. Set up ML service: `cd ../ml_service && python -m venv venv && source venv/bin/activate && pip install -r requirements.txt`
4. Run all services: `./start-all.sh`

## 📝 Notes

- All dependencies are pulled automatically via Gradle Maven Central
- No manual JAR downloads needed
- The backend is configured to work with PostgreSQL or H2 database
- Default runs with H2 in-memory database

For more details, see:
- `README.md` - Project overview
- `CHANGES.md` - Version history
- `MICROSERVICES.md` - Architecture details
