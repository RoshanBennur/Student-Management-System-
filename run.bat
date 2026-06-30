@echo off
title Student Data Portal Launcher
echo =======================================================
echo               Student Data Portal
echo =======================================================
echo.
echo [1/3] Checking Java environment...

:: Set direct paths based on your JDK 21 installation
set "JAVA_EXE=C:\Program Files\Java\jdk-21\bin\java.exe"
set "JAVAC_EXE=C:\Program Files\Java\jdk-21\bin\javac.exe"

:: If JDK 21 is not found at that direct path, fall back to checking system PATH
if not exist "%JAVA_EXE%" (
    echo JDK 21 not found at default location. Checking system PATH...
    set "JAVA_EXE=java"
    set "JAVAC_EXE=javac"
)

echo Java path: "%JAVA_EXE%"
echo.

echo [2/3] Compiling source files...
if not exist bin mkdir bin
"%JAVAC_EXE%" -encoding UTF-8 -d bin src/main/java/com/student/*.java
if %errorlevel% neq 0 (
    echo [ERROR] Java compilation failed. Please make sure Java JDK is installed.
    pause
    exit /b 1
)
echo [SUCCESS] Compilation completed.

echo.
echo [3/3] Launching Student Management System...
echo Server is launching on: http://localhost:8080
echo Press Ctrl+C in this command window to stop the server.
echo.
"%JAVA_EXE%" -cp bin com.student.App
if %errorlevel% neq 0 (
    echo [WARNING] Server stopped with exit code %errorlevel%.
)
pause
