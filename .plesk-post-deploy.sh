#!/bin/bash

# Plesk Post-Deployment Script
# This script runs after Git deployment in Plesk

# Create a log file to track execution
LOG_FILE="plesk-deploy.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "==========================================" >> $LOG_FILE
echo "🚀 Plesk Post-Deployment Started: $TIMESTAMP" >> $LOG_FILE
echo "==========================================" >> $LOG_FILE

# Log current directory and environment
echo "📁 Current directory: $(pwd)" >> $LOG_FILE
echo "👤 User: $(whoami)" >> $LOG_FILE
echo "🔧 Node version: $(node --version)" >> $LOG_FILE
echo "📦 NPM version: $(npm --version)" >> $LOG_FILE

# Install dependencies
echo "📦 Installing dependencies..." | tee -a $LOG_FILE
npm install >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully" | tee -a $LOG_FILE
else
    echo "❌ Failed to install dependencies" | tee -a $LOG_FILE
    exit 1
fi

# Build the application
echo "🔨 Building application..." | tee -a $LOG_FILE
npm run build >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Application built successfully" | tee -a $LOG_FILE
else
    echo "❌ Failed to build application" | tee -a $LOG_FILE
    exit 1
fi

# Create a deployment marker file
echo "📝 Creating deployment marker..." | tee -a $LOG_FILE
echo "Deployed at: $TIMESTAMP" > deployment-marker.txt
echo "Build successful" >> deployment-marker.txt
echo "Node version: $(node --version)" >> deployment-marker.txt

# Create tmp directory if it doesn't exist
mkdir -p tmp

# Touch restart file for Plesk
touch tmp/restart.txt
echo "🔄 Restart file created" | tee -a $LOG_FILE

# Final status
echo "==========================================" >> $LOG_FILE
echo "✅ Post-deployment process completed: $TIMESTAMP" >> $LOG_FILE
echo "📝 Application should be available at: http://member-api-dev.thaibible.or.th" >> $LOG_FILE
echo "📋 Check plesk-deploy.log for detailed logs" >> $LOG_FILE
echo "==========================================" >> $LOG_FILE

echo "✅ Post-deployment process completed!"
echo "📝 Application should be available at: http://member-api-dev.thaibible.or.th"
echo "📋 Check plesk-deploy.log for detailed logs" 