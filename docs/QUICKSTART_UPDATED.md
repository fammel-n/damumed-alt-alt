# IntelliHeart - Быстрый старт (обновлено 2026-05-08)

⚠️ **Важно:** Проект требует Java 21 для совместимости с Gradle 8.13 и Kotlin DSL

## 📋 Что было исправлено

✅ **Backend теперь работает!**
- Создан `build.gradle.kts` для сборки
- Создан главный класс приложения `IntelliHeartApplication.kt`
- Обновлена до Java 21 и Gradle 8.13
- Исправлены ошибки компиляции

## 🚀 Быстрый старт

### Требования
- Java 21+
- Gradle 8.13+ (автоматически)
- Python 3.8+ (для ML Service)
- Android Studio 2024+ (для frontend)

### Вариант 1: Только Backend

```bash
cd backend

# Собрать проект
./gradlew build -x test

# Запустить приложение
JAVA_HOME=/usr/local/sdkman/candidates/java/21.0.10-ms ./gradlew bootRun

# API будет доступен на http://localhost:8080
```

### Вариант 2: Backend + ML Service

```bash
# Терминал 1: ML Service
cd ml_service
pip install -r requirements.txt
python main.py
# http://localhost:8000

# Терминал 2: Backend
cd ../backend
JAVA_HOME=/usr/local/sdkman/candidates/java/21.0.10-ms ./gradlew bootRun
# http://localhost:8080

# Терминал 3: Проверка
curl http://localhost:8080/api/doctors
```

### Вариант 3: Full Stack (автоматический)

```bash
# Linux/Mac
chmod +x start-all.sh
./start-all.sh
```

## 📂 Новая структура

```
backend/
├── build.gradle.kts          ✅ СОЗДАНО
├── gradle/wrapper/           ✅ ОБНОВЛЕНО (Gradle 8.13)
└── src/main/kotlin/
    └── IntelliHeartApplication.kt  ✅ СОЗДАНО
```

## 🔧 Полезные команды

```bash
cd backend

# Собрать (без тестов)
./gradlew build -x test

# Запустить
JAVA_HOME=/usr/local/sdkman/candidates/java/21.0.10-ms ./gradlew bootRun

# Собрать JAR
./gradlew build -x test
java -jar build/libs/app.jar

# Очистить
./gradlew clean
```

## 📚 Документация

- **docs/CHANGES.md** - Подробные изменения (НОВОЕ)
- **docs/QUICKSTART.md** - Полный гайд
- **docs/API_DOCUMENTATION.md** - API эндпоинты
- **docs/README.md** - Общая информация

## 🆘 Если что-то не работает

**Backend не собирается?**
```bash
# Убедитесь что используете Java 21
java -version

# Очистите кеш
./gradlew clean --no-daemon

# Попробуйте ещё раз
./gradlew build -x test
```

**API недоступен?**
```bash
# Проверьте что backend запущен
curl http://localhost:8080/api/doctors

# Смотрите логи ошибок
./gradlew bootRun --info
```

## ✅ Статус проекта

- ✅ Backend: Собирается и работает
- ✅ ML Service: Готов (не требует изменений)
- ⏳ Frontend: Готов к использованию
- ⏳ Интеграция: В процессе

---

**Версия:** 1.1  
**Обновлено:** 2026-05-08  
**Статус:** Backend работает ✅
