
#!/bin/bash

set -e

echo "=== Building DevOps Application ==="

echo "Compiling source files..."
find src -name "*.java" > sources.txt
javac @sources.txt
echo "Compilation complete."

echo "=== Running Tests ==="
java -cp src/main/java:src/test/java com.example.HelloDevOpsTest
echo "Tests completed."

echo "=== Creating JAR ==="
jar cfe app.jar com.example.HelloDevOps -C src/main/java .
echo "JAR created: app.jar"

echo "=== Running Application ==="
java -jar app.jar
