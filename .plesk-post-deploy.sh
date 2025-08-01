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
npm install >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully" >> $LOG_FILE
else
    echo "❌ Failed to install dependencies" >> $LOG_FILE
    exit 1
fi

# Build the application
echo "🔨 Building application..." >> $LOG_FILE
npm run build >> $LOG_FILE 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Application built successfully" >> $LOG_FILE
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