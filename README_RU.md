# 🏥 DAMUMED - Интеллектуальная система управления здравоохранением

Проект DAMUMED представляет собой комплексную систему для управления медицинскими учреждениями, включая подсистемы для управления пациентами, назначений, истории болезни и взаимодействия с AI помощником.

## 📋 Документация

### Для быстрого старта (Windows):
1. **Прочитайте:** [JAVA21_FIX_RU.md](JAVA21_FIX_RU.md)
2. **Запустите:** `setup-java21.bat`
3. **Следуйте:** [SETUP_RU.md](SETUP_RU.md)

### Подробные руководства:
- **[SETUP_RU.md](SETUP_RU.md)** - Полное руководство по настройке
- **[INTELLIJ_JAVA21_SETUP_RU.md](INTELLIJ_JAVA21_SETUP_RU.md)** - Настройка IntelliJ IDEA
- **[JAVA21_FIX_RU.md](JAVA21_FIX_RU.md)** - Исправление ошибок Java 21
- **[FIX_SUMMARY.txt](FIX_SUMMARY.txt)** - Сводка всех исправлений
- **[MICROSERVICES.md](MICROSERVICES.md)** - Архитектура микросервисов

### English Documentation:
- **[SETUP.md](SETUP.md)** - Setup guide (English)
- **[INTELLIJ_JAVA21_SETUP.md](INTELLIJ_JAVA21_SETUP.md)** - IntelliJ configuration (English)
- **[JAVA21_FIX.md](JAVA21_FIX.md)** - Java 21 fixes (English)

## 🎯 Быстрый старт

### Для Windows:
```bash
# 1. Запустите автоматическую конфигурацию
setup-java21.bat

# 2. Закройте IntelliJ полностью
# 3. Откройте проект заново
# 4. Дождитесь индексирования
# 5. Запустите приложение
```

### Для Linux/Mac:
```bash
# 1. Откройте проект в IntelliJ
# 2. File → Project Structure → Set Project SDK to Java 21
# 3. File → Settings → Gradle → Set Gradle JVM to Project SDK
# 4. Right-click backend → Reload Gradle Project
# 5. Build → Build Project
```

## 🏗️ Архитектура

Проект состоит из следующих компонентов:

### Backend
- **Framework:** Spring Boot 3.2.5
- **Language:** Kotlin
- **Database:** PostgreSQL / H2
- **Port:** 8080
- **Status:** ✅ Готов к использованию

### Frontend
- **Framework:** React/Vue (в папке frontend)
- **Build:** npm / yarn
- **Status:** ⏳ Требуется настройка

### ML Service
- **Language:** Python
- **Framework:** FastAPI/Flask (в папке ml_service)
- **Status:** ⏳ Требуется настройка

## 📦 Требования

### Минимальные требования:
- **Java 21** (НЕ 17, НЕ 25)
- **Gradle 8.13** (автоматически через wrapper)
- **IntelliJ IDEA 2026.1.1** или позже (для Windows)

### Рекомендуемые:
- **Node.js 18+** (для frontend)
- **Python 3.10+** (для ML service)
- **PostgreSQL 14+** (для production)

## 🚀 Команды

### Backend
```bash
cd backend

# Сборка
./gradlew clean build -x test

# Запуск
./gradlew bootRun

# Тесты
./gradlew test
```

### Frontend
```bash
cd frontend

# Установка зависимостей
npm install

# Разработка
npm start

# Сборка
npm run build
```

### ML Service
```bash
cd ml_service

# Создание виртуального окружения
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

# Установка зависимостей
pip install -r requirements.txt

# Запуск
python main.py
```

### Запуск всех сервисов одновременно
```bash
./start-all.sh
```

## 🔧 Решённые проблемы

### ✅ Проблема 1: Ошибка компиляции Gradle
- **Ошибка:** `Inconsistent JVM-target compatibility detected for tasks 'compileJava' (21) and 'compileKotlin' (17)`
- **Решение:** Обновлён build.gradle с явной конфигурацией Kotlin jvmTarget=21

### ✅ Проблема 2: UnsupportedClassVersionError
- **Ошибка:** `class file version 65.0 vs 61.0`
- **Решение:** Добавлен gradle.properties для автоматического использования Java 21

### ✅ Проблема 3: Конфигурация IntelliJ
- **Ошибка:** IntelliJ использует Java 17 вместо Java 21
- **Решение:** Создан скрипт setup-java21.bat для автоматической конфигурации

## 📚 API Endpoints

### Health Check
- `GET /actuator/health` - Статус приложения

### API Base
- `GET /api/` - API root

(Дополнительные endpoints см. в коде приложения)

## 🐛 Решение проблем

### Проблема: "UnsupportedClassVersionError"
1. Прочитайте [JAVA21_FIX_RU.md](JAVA21_FIX_RU.md)
2. Запустите `setup-java21.bat` на Windows
3. На Linux/Mac: см. [INTELLIJ_JAVA21_SETUP_RU.md](INTELLIJ_JAVA21_SETUP_RU.md)

### Проблема: "Gradle fails to build"
1. Убедитесь что Java 21 установлена
2. Проверьте gradle.properties
3. Запустите: `./gradlew clean build -x test`

### Проблема: "Dependencies not downloaded"
1. Проверьте подключение к интернету
2. Удалите кэш: `rm -rf ~/.gradle`
3. Запустите сборку снова

## 📖 Дополнительная информация

- **Git Repository:** https://github.com/fammel-n/damumed-alt-alt
- **Java:** OpenJDK 21.0.10
- **Spring Boot:** 3.2.5
- **Gradle:** 8.13

## 📞 Поддержка

Если у вас есть проблемы:

1. Проверьте [JAVA21_FIX_RU.md](JAVA21_FIX_RU.md)
2. Посмотрите [SETUP_RU.md](SETUP_RU.md)
3. Прочитайте [INTELLIJ_JAVA21_SETUP_RU.md](INTELLIJ_JAVA21_SETUP_RU.md)

## ✨ Статус проекта

| Компонент | Статус | Примечание |
|-----------|--------|-----------|
| Backend | ✅ Готов | Собирается, запускается, готов к разработке |
| Frontend | ⏳ В процессе | Требуется npm setup |
| ML Service | ⏳ В процессе | Требуется Python setup |
| Database | ⏳ Конфигурация | H2 по умолчанию, PostgreSQL для production |
| Documentation | ✅ Готова | На русском и английском |

---

**Последнее обновление:** 2026-05-08  
**Версия:** 1.1  
**Статус:** ✅ Функционально готов для разработки
