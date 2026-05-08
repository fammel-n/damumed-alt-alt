# IntelliJ IDEA Configuration

## Java 21 Setup Instructions

### For Windows Users:

1. **Run the setup script:**
   ```bash
   setup-java21.bat
   ```
   This script will automatically:
   - Find Java 21 on your system
   - Create `gradle.properties` with correct configuration
   - Guide you through IntelliJ setup

2. **Manual Configuration (if script doesn't work):**

   a. **Find your Java 21 installation:**
   ```cmd
   where java
   java -version
   ```
   
   Note the path (should be something like: `C:\Program Files\Java\jdk-21.0.10`)
   
   b. **Edit `gradle.properties`:**
   Replace the path in:
   ```properties
   org.gradle.java.home=C:\Program Files\Java\jdk-21.x.x
   ```
   
   c. **Configure IntelliJ:**
   - File → Project Structure → Project
   - Set Project SDK to Java 21
   - Set Language Level to 21
   
   d. **Configure Gradle in IntelliJ:**
   - File → Settings → Build, Execution, Deployment → Gradle
   - Set Gradle JVM to: Project SDK
   
   e. **Reload:**
   - Right-click backend module → Reload Gradle Project

3. **Restart IntelliJ:**
   - Close IntelliJ completely
   - Reopen the project
   - Wait for indexing to complete

### For Linux/Mac Users:

The `gradle.properties` file is already configured.

Just make sure IntelliJ uses Java 21:
1. File → Project Structure → Project
2. Set Project SDK to Java 21 (or add it if missing)
3. Set Language Level to 21
4. File → Settings → Gradle → Set Gradle JVM to Project SDK

---

## What This Does

- `gradle.properties`: Tells Gradle to always use Java 21
- `setup-java21.bat`: Auto-finds and configures Java 21 on Windows
- IntelliJ auto-detection: Uses Project SDK for compilation

## Troubleshooting

**Still getting UnsupportedClassVersionError?**

1. Verify Java 21 is installed: `java -version`
2. Check gradle.properties exists and has correct path
3. In IntelliJ: File → Invalidate Caches → Invalidate and Restart
4. Close and reopen IntelliJ
5. Right-click backend → Reload Gradle Project

**Can't find Java 21?**

Download from:
- https://www.oracle.com/java/technologies/downloads/#java21
- https://adoptium.net/temurin/releases/?version=21

---

**Status:** ✅ Ready to configure
