#!/bin/bash

# Try to find npm; if 'which' isn't available, fall back to a well‐known path
if command -v which >/dev/null 2>&1; then
  NPM_CMD=$(which npm)
else
  NPM_CMD="/opt/plesk/node/$(node -v | sed 's/^v//')/bin/npm"
fi

# Export its directory onto PATH so later calls just use 'npm'
export PATH="$(dirname $NPM_CMD):$PATH"

# Now you can safely run npm
$NPM_CMD install
$NPM_CMD run build

# Trigger reload for Passenger
mkdir -p tmp
touch tmp/restart.txt
