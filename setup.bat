@echo off
title Orbital CLI Setup

echo 🚀 Starting Orbital CLI Setup...

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js v18 or higher.
    pause
    exit /b 1
)

echo ✅ Node.js is installed

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm.
    pause
    exit /b 1
)

echo ✅ npm is installed

REM Install server dependencies
echo 📦 Installing server dependencies...
cd server
call npm install
if %errorlevel% neq 0 (
    echo ❌ Failed to install server dependencies.
    pause
    exit /b 1
)
echo ✅ Server dependencies installed

REM Install client dependencies
echo 📦 Installing client dependencies...
cd ../client
call npm install
if %errorlevel% neq 0 (
    echo ❌ Failed to install client dependencies.
    pause
    exit /b 1
)
echo ✅ Client dependencies installed

REM Generate Prisma client
echo 🔧 Generating Prisma client...
cd ../server
call npx prisma generate
if %errorlevel% neq 0 (
    echo ❌ Failed to generate Prisma client.
    pause
    exit /b 1
)
echo ✅ Prisma client generated

echo 🎉 Setup complete! Follow these steps to run the application:
echo.
echo 1. Configure your environment variables:
echo    - Create server\.env with your database and API keys
echo.
echo 2. Run database migrations:
echo    cd server ^&^& npx prisma migrate dev
echo.
echo 3. Start the server:
echo    cd server ^&^& npm run dev
echo.
echo 4. Start the client:
echo    cd client ^&^& npm run dev
echo.
echo 5. Use the CLI:
echo    cd server ^&^& npm run cli login
echo.
echo For detailed instructions, check the README.md file.
pause