#!/bin/bash

LOG_FILE="plesk-deploy.log"

log_message() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Redirect all output to log file and console
exec > >(tee -a "$LOG_FILE") 2>&1

log_message "🚀 Starting Plesk post-deploy..."

log_message "📦 Installing dependencies..."
npm install

log_message "🔨 Building application..."
npm run build

# Don’t start the app here—Plesk will do it
# Instead, trigger a reload

## If using Passenger:
log_message "🔁 Triggering Passenger restart..."
mkdir -p tmp
touch tmp/restart.txt

## If you have PM2 (SSH-enabled):
# log_message "🔁 Restarting PM2 process..."
# npx pm2 reload member-api-dev || npx pm2 start dist/main.js --name member-api-dev

log_message "✅ Post-deploy complete — waiting for Plesk to restart the app."
