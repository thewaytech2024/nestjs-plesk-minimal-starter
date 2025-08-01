#!/bin/bash

# Deployment Verification Script
# Run this to check if .plesk-post-deploy.sh was executed

echo "🔍 Checking deployment status..."
echo "=========================================="

# Check if deployment log exists
if [ -f "plesk-deploy.log" ]; then
    echo "✅ Deployment log found: plesk-deploy.log"
    echo "📋 Last deployment details:"
    if command -v tail >/dev/null 2>&1; then
        tail -20 plesk-deploy.log
    else
        cat plesk-deploy.log
    fi
else
    echo "❌ No deployment log found - .plesk-post-deploy.sh may not have run"
fi

echo ""

# Check if deployment marker exists
if [ -f "deployment-marker.txt" ]; then
    echo "✅ Deployment marker found: deployment-marker.txt"
    echo "📋 Deployment marker contents:"
    cat deployment-marker.txt
else
    echo "❌ No deployment marker found - .plesk-post-deploy.sh may not have run"
fi

echo ""

# Check if dist directory exists and has files
if [ -d "dist" ]; then
    if [ "$(ls -A dist 2>/dev/null)" ]; then
        echo "✅ Build output found in dist/"
        echo "📋 Build files:"
        if command -v ls >/dev/null 2>&1; then
            ls -la dist/
        else
            echo "dist/ directory contains files"
        fi
    else
        echo "❌ dist/ directory is empty - build may have failed"
    fi
else
    echo "❌ No dist/ directory found - build may have failed"
fi

echo ""

# Check if restart file exists
if [ -f "tmp/restart.txt" ]; then
    echo "✅ Restart file found: tmp/restart.txt"
    echo "📋 Restart file exists"
else
    echo "❌ No restart file found - Plesk restart may not have been triggered"
fi

echo ""
echo "=========================================="
echo "🔍 Deployment verification complete" 