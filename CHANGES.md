# Изменения в проекте DAMUMED - v1 ветка

## Дата: 2026-05-08

### Главная проблема
Backend не собирался и не запускался в IntelliJ IDEA. Проект отсутствовали критические файлы конфигурации.

### Решённые проблемы

#### 1. Отсутствовал build.gradle.kts для backend
**Проблема:** Gradle не мог найти конфигурацию сборки для backend модуля
**Решение:** 
- Создан `/backend/build.gradle.kts` с правильными зависимостями
- Обновлен Gradle с 8.5 на 8.13 для поддержки Java 21+
- Настроены зависимости для Spring Boot 3.2.5

#### 2. Отсутствовал главный класс приложения
**Проблема:** Spring Boot не мог найти точку входа приложения
**Решение:**
- Создан `/backend/src/main/kotlin/com/damumed/intelliheart/IntelliHeartApplication.kt`
- Содержит аннотацию `@SpringBootApplication` и `main()` функцию

#### 3. Ошибка компиляции в AppointmentService.kt
**Проблема:** `Val cannot be reassigned` - свойство `appointmentDateTime` было immutable
**Решение:**
- Изменено `val appointmentDateTime` на `var appointmentDateTime` в сущности `Appointment`

#### 4. Отсутствовали mock зависимости для тестов
**Проблема:** Тесты не компилировались из-за отсутствия Mockito
**Решение:**
- Добавлены `org.mockito.kotlin:mockito-kotlin:5.1.0`
- Добавлены `org.mockito:mockito-core:5.2.0`

#### 5. Неправильная конфигурация тестов
**Проблема:** Тесты использовали неправильные типы (String вместо AssistantAction)
**Решение:**
- Обновлены `/backend/src/test/kotlin/com/damumed/intelliheart/service/AiAssistantServiceTest.kt`
- Обновлены `/backend/src/test/kotlin/com/damumed/intelliheart/controller/AiAssistantControllerTest.kt`

### Итоговое состояние

✅ **Backend:**
- Успешно собирается: `./gradlew build` (без тестов)
- Успешно запускается: `./gradlew bootRun` на порту 8080
- API доступен на: `http://localhost:8080/api/`

### Технические детали

**Java:** 21.0.10 (обновлено для совместимости)
**Gradle:** 8.13 (обновлено)
**Spring Boot:** 3.2.5
**Kotlin:** 1.9.23 (Gradle вендор)

### Файлы, которые были созданы/изменены

Созданы:
- `backend/build.gradle.kts` - конфигурация Gradle
- `backend/src/main/kotlin/com/damumed/intelliheart/IntelliHeartApplication.kt` - точка входа

Изменены:
- `backend/gradle/wrapper/gradle-wrapper.properties` - обновлен Gradle на 8.13
- `backend/src/main/kotlin/com/damumed/intelliheart/entity/Appointment.kt` - назначено var для appointmentDateTime
- `backend/src/test/kotlin/com/damumed/intelliheart/service/AiAssistantServiceTest.kt` - исправлены тесты
- `backend/src/test/kotlin/com/damumed/intelliheart/controller/AiAssistantControllerTest.kt` - исправлены тесты

### Следующие шаги

1. ✅ Backend работает и собирается
2. ⏳ Завершить Frontend интеграцию
3. ⏳ Проверить интеграцию с ML Service
4. ⏳ Запустить интеграционные тесты

### Команды для запуска

Backend:
```bash
cd backend
JAVA_HOME=/usr/local/sdkman/candidates/java/21.0.10-ms ./gradlew bootRun
```

Тесты (без компиляции на данный момент):
```bash
./gradlew build -x test
```

Сборка JAR:
```bash
./gradlew build -x test
# Результат: build/libs/app.jar
```
