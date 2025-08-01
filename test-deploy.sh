#!/bin/bash

# Test the deployment script locally
echo "🧪 Testing deployment script locally..."

# Run the deployment script
echo "Running .plesk-post-deploy.sh..."
./.plesk-post-deploy.sh

# Check the results
echo ""
echo "🔍 Checking results..."
./check-deployment.sh 