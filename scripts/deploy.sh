#!/bin/bash

# Prompt Gallery App - Quick Deploy Script
echo "🚀 Prompt Gallery App - Quick Deploy"
echo "======================================"

# Check if required tools are installed
command -v npm >/dev/null 2>&1 || { echo "❌ npm is required but not installed. Aborting." >&2; exit 1; }

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check environment variables
if [ -f .env.local ]; then
    echo "✅ Environment variables found"
else
    echo "⚠️  Creating .env.local from template..."
    cp .env.example .env.local
    echo "📝 Please update .env.local with your Supabase credentials"
fi

# Build the application
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🌐 Ready for deployment!"
    echo ""
    echo "Next steps:"
    echo "1. Update .env.local with Supabase credentials"
    echo "2. Run database migrations in Supabase"
    echo "3. Deploy to Vercel"
    echo ""
    echo "📖 See docs/LIVE_DEPLOYMENT.md for detailed instructions"
else
    echo "❌ Build failed. Please check the errors above."
    exit 1
fi