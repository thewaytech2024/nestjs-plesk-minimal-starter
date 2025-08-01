#!/bin/bash

# Plesk Post-Deployment Script
# This script runs after Git deployment in Plesk

echo "🚀 Starting post-deployment process..."

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build the application
echo "🔨 Building application..."
npm run build

# Run the application
echo "🚀 Running application..."
npm run start:prod

# Restart the application
touch tmp/restart.txt
echo "✅ Post-deployment process completed!"
echo "📝 Application should be available at: http://member-api-dev.thaibible.or.th" 