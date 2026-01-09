@echo off
setlocal enabledelayedexpansion

echo === Building DevOps Application ===

echo Compiling source files...
dir /s /b src\*.java > sources.txt
javac @sources.txt
if errorlevel 1 exit /b 1

echo === Running Tests ===
java -cp src\main\java;src\test\java com.example.HelloDevOpsTest
if errorlevel 1 exit /b 1

echo === Creating JAR ===
jar cfe app.jar com.example.HelloDevOps -C src\main\java .
if errorlevel 1 exit /b 1

echo === Running Application ===
java -jar app.jar

echo Build completed successfully
