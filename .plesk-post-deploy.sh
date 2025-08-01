#!/bin/bash

# Plesk Post-Deployment Script
# This script runs after Git deployment in Plesk

# Create a log file to track execution
LOG_FILE="plesk-deploy.log"

echo "==========================================" > $LOG_FILE
echo "🚀 Plesk Post-Deployment Started" >> $LOG_FILE
echo "==========================================" >> $LOG_FILE

# Log current directory
echo "📁 Current directory: $(pwd)" >> $LOG_FILE

# Install dependencies
echo "📦 Installing dependencies..." >> $LOG_FILE

# Try different npm paths
NPM_CMD=""
if command -v npm >/dev/null 2>&1; then
    NPM_CMD="npm"
elif [ -f "/opt/plesk/node/22/bin/npm" ]; then
    NPM_CMD="/opt/plesk/node/22/bin/npm"
elif [ -f "/opt/plesk/node/20/bin/npm" ]; then
    NPM_CMD="/opt/plesk/node/20/bin/npm"
elif [ -f "/opt/plesk/node/18/bin/npm" ]; then
    NPM_CMD="/opt/plesk/node/18/bin/npm"
elif [ -f "/usr/local/bin/npm" ]; then
    NPM_CMD="/usr/local/bin/npm"
else
    echo "❌ npm not found in PATH or common locations" >> $LOG_FILE
    echo "🔍 Available node/npm installations:" >> $LOG_FILE
    find /opt/plesk -name "npm" 2>/dev/null >> $LOG_FILE
    find /usr/local -name "npm" 2>/dev/null >> $LOG_FILE
    exit 1
fi

echo "🔧 Using npm: $NPM_CMD" >> $LOG_FILE
$NPM_CMD install >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully" >> $LOG_FILE
else
    echo "❌ Failed to install dependencies" >> $LOG_FILE
    exit 1
fi

# Clean and build the application
echo "🧹 Cleaning previous build..." >> $LOG_FILE
rm -rf dist/ >> $LOG_FILE 2>&1

echo "🔨 Building application..." >> $LOG_FILE
$NPM_CMD run build >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Application built successfully" >> $LOG_FILE
    echo "📁 Build output:" >> $LOG_FILE
    ls -la dist/ >> $LOG_FILE 2>&1
else
    echo "❌ Failed to build application" >> $LOG_FILE
    exit 1
fi

# Create a deployment marker file
echo "📝 Creating deployment marker..." >> $LOG_FILE
echo "Deployed successfully" > deployment-marker.txt
echo "Build completed" >> deployment-marker.txt

# Create tmp directory if it doesn't exist
mkdir -p tmp

# Touch restart file for Plesk
touch tmp/restart.txt
echo "🔄 Restart file created" >> $LOG_FILE

# Final status
echo "==========================================" >> $LOG_FILE
echo "✅ Post-deployment process completed" >> $LOG_FILE
echo "📝 Application should be available at: http://member-api-dev.thaibible.or.th" >> $LOG_FILE
echo "📋 Check plesk-deploy.log for detailed logs" >> $LOG_FILE
echo "==========================================" >> $LOG_FILE

echo "✅ Post-deployment process completed!"
echo "📝 Application should be available at: http://member-api-dev.thaibible.or.th"
echo "📋 Check plesk-deploy.log for detailed logs" 