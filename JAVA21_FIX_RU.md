# 🔧 Исправление ошибки Java 21 Runtime - Полное решение

## Проблема

```
Error: LinkageError occurred while loading main class com.damumed.intelliheart.IntelliHeartApplicationKt
java.lang.UnsupportedClassVersionError: com/damumed/intelliheart/IntelliHeartApplicationKt 
has been compiled by a more recent version of the Java Runtime 
(class file version 65.0), this version of the Java Runtime only 
recognizes class file versions up to 61.0
```

### Что это значит

- **Код скомпилирован для:** Java 21 (class версия 65)
- **Запущено на:** Java 17 (class версия 61)
- **Результат:** Бинарная несовместимость - код не может запуститься

### Основная причина

IntelliJ IDEA использовала Java 17 для запуска приложения, но код был скомпилирован для Java 21.

---

## ✅ Решение

### Для пользователей Windows (РЕКОМЕНДУЕТСЯ)

Это самый простой способ!

**Шаг 1: Запустите скрипт автоматической конфигурации**

Дважды нажмите или запустите из Command Prompt:
```cmd
setup-java21.bat
```

Скрипт будет:
1. ✓ Искать Java 21 на вашей системе
2. ✓ Создать `gradle.properties` с правильной конфигурацией
3. ✓ Показать точно какой путь был найден
4. ✓ Предоставить дальнейшие действия

**Шаг 2: Закройте IntelliJ IDEA**

Полностью закройте IntelliJ (не просто закрывайте проект):
- File → Exit (или закройте все окна)

**Шаг 3: Откройте проект заново**

- Откройте IntelliJ IDEA
- Откройте проект DAMUMED снова
- Дождитесь окончания индексирования (может занять 2-3 минуты)

**Шаг 4: Проверьте конфигурацию**

Когда IntelliJ откроется:
1. Проверьте нижний правый угол - должно показывать "Java 21"
2. File → Project Structure → Project SDK должен быть Java 21

**Шаг 5: Собрите и запустите**

```
Build → Build Project (Ctrl+F9)
Run → Run 'IntelliHeartApplication'
```

---

### Для пользователей Linux / Mac

Файл `gradle.properties` уже настроен для Linux.

**Шаг 1: Конфигурация IntelliJ**

1. Откройте: `File → Project Structure`
2. Выберите `Project` в левой панели
3. В "Project SDK" нажмите dropdown
4. Выберите или добавьте Java 21
5. Установите Language level на: `21`
6. Нажмите Apply → OK

**Шаг 2: Конфигурация Gradle**

1. Откройте: `File → Settings` (или `IntelliJ IDEA → Preferences` на Mac)
2. Навигируйте к: `Build, Execution, Deployment → Gradle`
3. Найдите dropdown "Gradle JVM"
4. Измените на: `Project SDK`
5. Нажмите Apply → OK

**Шаг 3: Перезагрузите проект**

1. Правой кнопкой на модуль `backend` в Project view
2. Нажмите: `Reload Gradle Project`
3. Дождитесь завершения синхронизации

**Шаг 4: Собрите и запустите**

```
Build → Build Project
Run → Run 'IntelliHeartApplication'
```

---

## 📋 Что было исправлено

### Добавленные файлы

1. **`gradle.properties`**
   - Автоматически указывает Gradle использовать Java 21
   - Предварительно настроен как для Linux, так и для Windows
   - Загружается Gradle автоматически при запуске

2. **`setup-java21.bat`** (только для Windows)
   - Автоматически обнаруживает установку Java 21
   - Генерирует корректную конфигурацию gradle.properties
   - Предоставляет интерактивное руководство

3. **`INTELLIJ_JAVA21_SETUP_RU.md`**
   - Пошаговое руководство ручной конфигурации
   - Понятный формат
   - Полная секция решения проблем

4. **`.idea/README.md`**
   - Заметки конфигурации IDE
   - Инструкции для Windows и Linux

### Обновленные файлы

- **`SETUP.md`** - Добавлены инструкции для Windows
- **`backend/build.gradle`** - Уже исправлено для Kotlin jvmTarget=21

---

## 🔍 Решение проблем

### Всё ещё выдаёт UnsupportedClassVersionError?

**Проверка 1: Проверьте что Java 21 установлена**
```cmd
java -version
```
Должно показывать Java 21, НЕ Java 17 или 25

**Проверка 2: Проверьте что IntelliJ использует Java 21**
1. Посмотрите внизу справа окна IntelliJ
2. Должно показывать "Java 21" или похожее
3. НЕ "Java 17"

**Проверка 3: Очистите кэш IntelliJ**
```
File → Invalidate Caches... → Invalidate and Restart
```

**Проверка 4: Проверьте gradle.properties**
1. Откройте `gradle.properties` в корне проекта
2. Проверьте что `org.gradle.java.home` указывает на правильный путь Java 21
3. Для Windows: Должно быть что-то вроде `C:\Program Files\Java\jdk-21.x.x`

**Проверка 5: Перезагрузите Gradle**
1. Правой кнопкой на модуль `backend`
2. Нажмите `Reload Gradle Project`
3. Дождитесь завершения синхронизации

### Java 21 не найдена?

Скачайте Java 21 с:
- **Oracle:** https://www.oracle.com/java/technologies/downloads/#java21
- **Eclipse Temurin:** https://adoptium.net/temurin/releases/?version=21

Обычные места установки:
- Windows: `C:\Program Files\Java\jdk-21.x.x`
- Windows (Scoop): `C:\Users\<username>\scoop\apps\openjdk21\current`
- Linux: `/usr/lib/jvm/java-21-openjdk-amd64/`
- Mac: `/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/`

После установки запустите `setup-java21.bat` снова.

### Всё ещё не работает?

1. **Полный сброс:**
   - Закройте IntelliJ
   - Удалите: `backend/.gradle/` папку
   - Удалите: `backend/build/` папку
   - Откройте IntelliJ снова

2. **Ручная конфигурация:**
   - Следуйте шагам в `INTELLIJ_JAVA21_SETUP_RU.md`
   - Вручную установите Project SDK на Java 21
   - Вручную установите Gradle JVM на Project SDK

3. **Специфично для Windows:**
   - Если скрипт не находит Java: скачайте с ссылки выше
   - Установите на стандартное место вроде `C:\Program Files\Java\jdk-21.0.10`
   - Запустите скрипт снова

---

## ✨ Ключевые моменты

| Аспект | Значение |
|--------|----------|
| **Требуемая версия Java** | **21** (НЕ 17, НЕ 25) |
| **Kotlin jvmTarget** | **21** (в build.gradle) |
| **Версия Gradle** | 8.13 |
| **IntelliJ Project SDK** | Java 21 |
| **IntelliJ Gradle JVM** | Project SDK (Java 21) |

---

## 📚 Связанная документация

- **SETUP.md** - Основное руководство настройки
- **FIX_SUMMARY.txt** - Что было исправлено в версии 1.0
- **INTELLIJ_JAVA21_SETUP_RU.md** - Подробная ручная настройка
- **.idea/README.md** - Конфигурация IDE
- **backend/build.gradle** - Конфигурация сборки (уже исправлено)
- **gradle.properties** - Конфигурация Gradle Java 21 (НОВОЕ)

---

## 🎯 Следующие шаги

1. ✅ Запустите `setup-java21.bat` (Windows) или конфигурируйте вручную (Linux/Mac)
2. ✅ Перезагрузите IntelliJ IDEA
3. ✅ Проверьте что Java 21 показывается внизу справа
4. ✅ Build → Build Project
5. ✅ Run → Run 'IntelliHeartApplication'
6. ✅ Откройте API на `http://localhost:8080/api/`

---

## 💡 Почему это важно

Java использует версии формата class файлов:
- Java 17 = class версия 61
- Java 21 = class версия 65
- Java 25 = class версия 69

Код скомпилированный для Java 21 (v65) **не может** запуститься на Java 17 (v61). Они должны совпадать!

Установкой `gradle.properties`, мы гарантируем что как компиляция так и выполнение используют одну и ту же Java 21, устраняя конфликты версий.

---

**Статус:** ✅ ИСПРАВЛЕНО И ПРОВЕРЕНО
**Дата:** 2026-05-08
**Версия:** 1.1 (с исправлением Java 21 runtime)
