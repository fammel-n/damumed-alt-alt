#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}  DAMUMED Backend Build Script${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"

# Set Java 21
export JAVA_HOME=/home/codespace/java/21.0.10-ms

# Check if JAVA_HOME exists
if [ ! -d "$JAVA_HOME" ]; then
    echo -e "${RED}✗ Java 21 not found at $JAVA_HOME${NC}"
    echo "Please install Java 21 or update the path"
    exit 1
fi

echo -e "${GREEN}✓ Using Java 21: $JAVA_HOME${NC}"
java -version

cd backend || exit 1

echo -e "\n${BLUE}Building backend...${NC}"
./gradlew clean build -x test

if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}═══════════════════════════════════════${NC}"
    echo -e "${GREEN}✓ Build successful!${NC}"
    echo -e "${GREEN}═══════════════════════════════════════${NC}"
    echo -e "\n${BLUE}Next steps:${NC}"
    echo "1. To run the app: ./gradlew bootRun"
    echo "2. To open in IntelliJ IDEA:"
    echo "   - Set Project SDK to Java 21"
    echo "   - Run → Run 'IntelliHeartApplication'"
    echo "3. API will be available at: http://localhost:8080/api/"
else
    echo -e "\n${RED}✗ Build failed${NC}"
    exit 1
fi
