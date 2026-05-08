#!/bin/bash

# Скрипт для запуска всех компонентов DAMUMED
# Использует Java 21 для совместимости

set -e

export JAVA_HOME=/usr/local/sdkman/candidates/java/21.0.10-ms
export PATH=$JAVA_HOME/bin:$PATH

echo "======================================"
echo "🚀 DAMUMED - Запуск всех компонентов"
echo "======================================"
echo ""

# Проверка Java
echo "✓ Java версия:"
java -version 2>&1 | head -1
echo ""

# Запуск ML Service
echo "📊 Запуск ML Service на порту 8000..."
cd ml_service
python main.py > /tmp/ml_service.log 2>&1 &
ML_PID=$!
echo "  PID: $ML_PID"
sleep 2

# Проверка ML Service
if curl -s http://localhost:8000/health > /dev/null; then
    echo "  ✅ ML Service работает на http://localhost:8000"
else
    echo "  ⚠️  ML Service может быть недоступен"
fi
echo ""

# Запуск Backend
cd ../backend
echo "🔌 Запуск Backend на порту 8080..."
./gradlew bootRun > /tmp/backend.log 2>&1 &
BACKEND_PID=$!
echo "  PID: $BACKEND_PID"
sleep 5

# Проверка Backend
if curl -s http://localhost:8080/api/doctors > /dev/null 2>&1; then
    echo "  ✅ Backend работает на http://localhost:8080"
else
    echo "  ⚠️  Backend может быть недоступен"
fi
echo ""

echo "======================================"
echo "✅ Все компоненты запущены!"
echo "======================================"
echo ""
echo "Логи:"
echo "  ML Service: tail -f /tmp/ml_service.log"
echo "  Backend:    tail -f /tmp/backend.log"
echo ""
echo "API endpoints:"
echo "  Backend:     http://localhost:8080"
echo "  ML Service:  http://localhost:8000"
echo ""
echo "Android Frontend:"
echo "  Откройте Android Studio и запустите frontend"
echo "  File -> Open -> /workspaces/damumed-alt/frontend"
echo ""
echo "Для остановки сервисов:"
echo "  kill $ML_PID $BACKEND_PID"
echo ""

# Ожидание сигнала завершения
trap "kill $ML_PID $BACKEND_PID 2>/dev/null; echo '✓ Сервисы остановлены'" EXIT
wait
