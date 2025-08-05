#!/bin/bash

{
  echo "🚀 Starting post-deployment process..."

  # Fix abosolute path for npm for Plesk
  NPM_CMD="/var/www/vhosts/thaibible.or.th/.nodenv/shims/npm"

  echo "📦 Installing dependencies..."
  # Now you can safely run npm
  $NPM_CMD install

  echo "🔨 Building application..."
  $NPM_CMD run build

  echo "🔄 Triggering Passenger reload..."
  # Trigger reload for Passenger
  mkdir -p tmp
  touch tmp/restart.txt

  echo "✅ Post-deployment process completed!"
  echo "📝 Application should be available at: http://member-api-dev.thaibible.or.th"

} > plesk-deploy.log 2>&1
