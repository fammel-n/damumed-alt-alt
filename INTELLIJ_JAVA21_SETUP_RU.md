# 🔧 IntelliJ IDEA - Руководство конфигурации Java 21

## Проблема
```
Error: UnsupportedClassVersionError: class file version 65.0, this version 
of the Java Runtime only recognizes class file versions up to 61.0
```

**Почему:** IntelliJ использует Java 17, а backend скомпилирован для Java 21.

---

## ✅ Решение: Конфигурация IntelliJ для Java 21

### Шаг 1: Проверка установки Java

Сначала убедитесь, что Java 21 установлена:

**Windows:**
```
java -version
```

Если Java 21 не установлена, скачайте с:
- https://www.oracle.com/java/technologies/downloads/#java21
- Или: https://adoptium.net/temurin/releases/?version=21

Рекомендуемое место установки: `C:\Program Files\Java\jdk-21.x.x`

### Шаг 2: Конфигурация Project SDK

**В IntelliJ IDEA 2026.1.1:**

1. **Откройте Project Structure:**
   - Нажмите: `File` → `Project Structure`
   - Сочетание клавиш: `Ctrl + Alt + Shift + S` (Windows/Linux) или `Cmd + ;` (Mac)

2. **Выберите Project:**
   - Левая панель: нажмите `Project`
   - Появится правая панель

3. **Установите SDK на Java 21:**
   - Найдите dropdown "Project SDK" (сейчас показывает Java 17)
   - Нажмите dropdown → `Add SDK` → `Download JDK...`
   - ИЛИ выберите существующий Java 21 если он есть

   **Если добавляете новый JDK:**
   - Provider: `Eclipse Temurin` или `Oracle OpenJDK`
   - Version: `21` (LTS)
   - Нажмите `Download`
   - После установки выберите его

4. **Выберите Language Level:**
   - Установите на: `21`

5. **Нажмите Apply → OK**

---

### Шаг 3: Конфигурация Gradle SDK

1. **Откройте Settings:**
   - Нажмите: `File` → `Settings`
   - Сочетание клавиш: `Ctrl + Alt + S`

2. **Навигация к Gradle:**
   - Левая панель: `Build, Execution, Deployment` → `Gradle`

3. **Конфигурация Gradle JVM:**
   - Найдите dropdown "Gradle JVM"
   - Измените с текущей версии Java на: `Project SDK` (Java 21)
   - Нажмите `Apply` → `OK`

4. **Перезагрузите Gradle Project:**
   - Правой кнопкой нажмите на модуль `backend` в Project view
   - Нажмите: `Reload Gradle Project`
   - Дождитесь завершения обновления Gradle

---

### Шаг 4: Инвалидация кэша и перезагрузка

Иногда IntelliJ кэширует старой bytecode:

1. Нажмите: `File` → `Invalidate Caches...`
2. Выберите: `Invalidate and Restart`
3. Нажмите `Invalidate`
4. IntelliJ перезагрузится автоматически

---

### Шаг 5: Пересборка проекта

1. Нажмите: `Build` → `Clean Project`
2. Нажмите: `Build` → `Build Project`
   - Сочетание клавиш: `Ctrl + F9`
3. Дождитесь завершения сборки (ошибок не должно быть)

---

### Шаг 6: Запуск приложения

1. **В IntelliJ найдите главный класс:**
   - Навигируйте к: `backend/src/main/kotlin/com/damumed/intelliheart/IntelliHeartApplicationKt.kt`

2. **Запустите его:**
   - Правой кнопкой на файл → `Run 'IntelliHeartApplicationKt'`
   - ИЛИ нажмите зелёную стрелку в gutter
   - ИЛИ используйте: `Ctrl + Shift + F10`

3. **Или создайте Run Configuration:**
   - Нажмите: `Run` → `Edit Configurations...`
   - Нажмите `+` → `Kotlin`
   - Установите Main class: `com.damumed.intelliheart.IntelliHeartApplicationKt`
   - Нажмите `OK`
   - Нажмите зелёную стрелку для запуска

---

## 🔍 Проверка

### Проверьте SDK в IntelliJ:
1. Нижний правый угол IntelliJ
2. Должно показывать: `Java 21` или похожее
3. НЕ `Java 17`

### Проверьте конфигурацию Gradle:
1. Откройте `File` → `Project Structure` → `Modules`
2. Выберите модуль `backend`
3. Проверьте "Module SDK" установлен на Java 21

### Команда в терминале:
```bash
# В терминале IntelliJ
echo %JAVA_HOME%  # Windows
# Должен указывать на установку Java 21
```

---

## 📋 Решение проблем

### Всё ещё выдаёт UnsupportedClassVersionError?

**Ошибка:** IntelliJ всё ещё использует Java 17

**Решение:**
1. `File` → `Project Structure` → `Project`
2. Проверьте Project SDK показывает Java 21 (не 17)
3. `File` → `Invalidate Caches...` → `Invalidate and Restart`
4. Подождите 2-3 минуты пока IntelliJ перезагрузится и переиндексирует

### Ошибка "JDK not found"

**Решение:**
1. Скачайте Java 21 с https://adoptium.net/
2. Установите в: `C:\Program Files\Java\jdk-21.x.x`
3. В Project Structure нажмите `+` чтобы добавить новый JDK
4. Укажите папку установки

### Сборка падает с "Inconsistent JVM-target"

**Это НЕ должно происходить** - мы уже исправили это в `build.gradle`

**Если всё же происходит:**
1. Запустите: `./gradlew clean build -x test`
2. Или в IntelliJ: `Build` → `Clean Project` → `Build Project`

### Gradle всё ещё скачивает зависимости?

**Нормальное поведение:** Первая сборка занимает 2-5 минут

**Если зависнул:**
1. Дождитесь завершения скачивания
2. Проверьте подключение к интернету
3. Проверьте `~/.gradle/gradle.properties` на настройки прокси

---

## ✅ Чеклист перед запуском

- [ ] Java 21 установлена на вашей системе
- [ ] Project SDK установлен на Java 21
- [ ] Gradle JVM установлен на Project SDK
- [ ] Gradle проект перезагружен (`Reload Gradle Project`)
- [ ] Проект собран успешно (`Build Project`)
- [ ] Нет ошибок в консоли Build
- [ ] Кэш инвалидирован и IntelliJ перезагружен

---

## 🚀 Быстрый справочник

| Задача | Команда/Действие |
|--------|---|
| **Установка Project SDK** | File → Project Structure (Ctrl+Alt+Shift+S) → Project → SDK dropdown |
| **Установка Gradle JVM** | File → Settings (Ctrl+Alt+S) → Build... → Gradle → Gradle JVM |
| **Перезагрузить Gradle** | Правой кнопкой `backend` → `Reload Gradle Project` |
| **Собрать проект** | Build → Build Project (Ctrl+F9) |
| **Очистить проект** | Build → Clean Project |
| **Очистить кэш** | File → Invalidate Caches → Invalidate and Restart |
| **Запустить приложение** | Run → Run 'IntelliHeartApplicationKt' (Ctrl+Shift+F10) |

---

## 💡 Почему это важно

- **Java версии бинарно несовместимы**
- Код скомпилированный для Java 21 (class версия 65) не может запуститься на Java 17 (class версия 61)
- IntelliJ компилирует ваш код с Project SDK
- IntelliJ запускает тесты/приложение с выбранным JVM
- **Все должны использовать Java 21** чтобы избежать конфликтов

---

## 📞 Если всё ещё есть проблемы

1. Проверьте что Java 21 действительно установлена: `java -version`
2. Проверьте что IntelliJ использует её: `File → Project Structure → Project SDK`
3. Очистите кэш IntelliJ: `File → Invalidate Caches → Invalidate and Restart`
4. Перезагрузите Gradle: Правой кнопкой `backend` → `Reload Gradle Project`
5. Очистите и пересоберите: `Build → Clean Project` → `Build → Build Project`

---

**Статус:** ✅ Исправлено и проверено
**Требуемая версия Java:** 21 (НЕ 17, НЕ 25)
**Версия IntelliJ IDEA:** 2026.1.1 и позже
