# 🔧 DAMUMED Backend - Руководство по настройке

## Проблема решена
✅ Исправлена ошибка Gradle JVM совместимости:
```
Execution failed for task ':compileKotlin'.
> Inconsistent JVM-target compatibility detected for tasks 'compileJava' (21) and 'compileKotlin' (17).
```

## Основные проблемы и решения

### Проблема 1: Несоответствие целей JVM
**Ошибка:** 
- `compileJava` была установлена на Java 21
- `compileKotlin` использовала значение по умолчанию 17
- Gradle не мог компилировать с несовместимыми целями

**Решение:**
- Обновлён `build.gradle` чтобы явно установить Kotlin JVM target на 21
- Добавлена правильная конфигурация совместимости версий Java

### Проблема 2: Несовместимость Java 25
**Ошибка:** 
- Системное значение Java по умолчанию было 25 (class format 69)
- Gradle 8.x не поддерживает Java 25

**Решение:**
- Используйте Java 21 (class format 61) которая полностью совместима с Gradle 8.13
- Обновлён gradle-wrapper.properties для использования Gradle 8.13

### Проблема 3: Отсутствие конфигурации Kotlin в Gradle
**Ошибка:**
- Плагин Kotlin не имел явной конфигурации JVM target
- Привело к несоответствию версий между Java и Kotlin компиляцией

**Решение:**
- Добавлен блок конфигурации `tasks.withType(KotlinCompile)`
- Явно установлен `jvmTarget = '21'`

## ✅ Что было исправлено

### Изменённые файлы

1. **backend/build.gradle**
   - Изменено с `sourceCompatibility = '21'` (строка)
   - На правильный объект Java версии с targetCompatibility
   - Добавлена конфигурация компиляции Kotlin

2. **backend/gradle/wrapper/gradle-wrapper.properties**
   - Подтверждено использование Gradle 8.13 (совместим с Java 21)

## 🚀 Как использовать

### Требования
- **Java 21** должна использоваться (НЕ Java 25 или новее)
- Linux: Расположена в: `/home/codespace/java/21.0.10-ms/`
- Windows: Скачайте с https://www.oracle.com/java/technologies/downloads/#java21

### Сборка Backend

```bash
cd backend

# Используя Java 21 явно
export JAVA_HOME=/home/codespace/java/21.0.10-ms

# Сборка (без тестов)
./gradlew clean build -x test

# Сборка с тестами
./gradlew build

# Запуск приложения
./gradlew bootRun
```

### Запуск в IntelliJ IDEA

#### ⚠️ ВАЖНО: Первичная настройка

**Если вы на Windows:**
1. Запустите: `setup-java21.bat` в корне проекта
2. Скрипт автоматически:
   - Найдёт Java 21 на вашей системе
   - Создаст `gradle.properties` с правильной конфигурацией
   - Подскажет дальнейшие действия

**Если на Linux/Mac:**
1. Откройте проект в IntelliJ
2. Переходите к "Конфигурация Project SDK" ниже

#### Конфигурация Project SDK:
   - Откройте: File → Project Structure → Project
   - Установите Project SDK на: Java 21 (openjdk-21.0.10)
   - Установите Language Level на: 21
   - Нажмите OK

#### Конфигурация Gradle SDK:
   - Откройте: File → Settings → Build, Execution, Deployment → Gradle
   - Установите Gradle JVM на: **Project SDK** (Java 21)
   - Нажмите OK

#### Перезагрузка проекта:
   - Правой кнопкой на модуль `backend` в Project view
   - Нажмите: `Reload Gradle Project`
   - Дождитесь завершения синхронизации

#### Сборка и запуск:
   - Нажмите: Build → Build Project (Ctrl+F9)
   - Нажмите: Run → Run 'IntelliHeartApplication'
   - Или: Правой кнопкой на главный класс → Run

### Доступ к API

- Базовый URL:    http://localhost:8080
- API база:       http://localhost:8080/api/
- Проверка здоровья: http://localhost:8080/actuator/health

## 💡 Ключевые требования
────────────────────────────────────────────────────────────────────────────

✓ Java 21 должна использоваться (НЕ Java 25 или новее)
✓ Установите JAVA_HOME=/home/codespace/java/21.0.10-ms
✓ Gradle 8.13 (настроена в gradle-wrapper.properties)
✓ Требуется доступ к Maven Central репозиторию

## 🎯 Следующие шаги
────────────────────────────────────────────────────────────────────────────

1. ✅ Backend собирается успешно
2. Сборка и запуск frontend: `cd ../frontend && npm install && npm start`
3. Установка ML service: `cd ../ml_service && python -m venv venv ...`
4. Запуск всех сервисов: `./start-all.sh`

## 📝 Заметки

- Все зависимости скачиваются автоматически через Gradle Maven Central
- Нет необходимости в ручной загрузке JAR файлов
- Backend настроен для работы с PostgreSQL или H2 базой данных
- По умолчанию работает с H2 in-memory базой

Для подробностей смотрите:
- `README.md` - Обзор проекта
- `CHANGES.md` - История версий
- `MICROSERVICES.md` - Подробности архитектуры
