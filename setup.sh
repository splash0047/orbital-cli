#!/bin/bash

# Orbital CLI Setup Script

echo "🚀 Starting Orbital CLI Setup..."

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "❌ Node.js is not installed. Please install Node.js v18 or higher."
    exit 1
fi

echo "✅ Node.js is installed"

# Check if npm is installed
if ! command -v npm &> /dev/null
then
    echo "❌ npm is not installed. Please install npm."
    exit 1
fi

echo "✅ npm is installed"

# Install server dependencies
echo "📦 Installing server dependencies..."
cd server
npm install
echo "✅ Server dependencies installed"

# Install client dependencies
echo "📦 Installing client dependencies..."
cd ../client
npm install
echo "✅ Client dependencies installed"

# Generate Prisma client
echo "🔧 Generating Prisma client..."
cd ../server
npx prisma generate
echo "✅ Prisma client generated"

echo "🎉 Setup complete! Follow these steps to run the application:"
echo ""
echo "1. Configure your environment variables:"
echo "   - Create server/.env with your database and API keys"
echo ""
echo "2. Run database migrations:"
echo "   cd server && npx prisma migrate dev"
echo ""
echo "3. Start the server:"
echo "   cd server && npm run dev"
echo ""
echo "4. Start the client:"
echo "   cd client && npm run dev"
echo ""
echo "5. Use the CLI:"
echo "   cd server && npm run cli login"
echo ""
echo "For detailed instructions, check the README.md file."