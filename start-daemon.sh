#!/bin/bash
# start-daemon.sh - Start Emacs daemon if not already running

EMACS_BIN="/opt/homebrew/opt/emacs-plus@30/bin/emacs"
DAEMON_NAME="main"

# Check if daemon is already running
if $EMACS_BIN --batch --eval "(kill-emacs (if (daemonp) 0 1))" 2>/dev/null; then
    echo "Emacs daemon '$DAEMON_NAME' is already running"
    exit 0
fi

# Start the daemon
echo "Starting Emacs daemon '$DAEMON_NAME'..."
$EMACS_BIN --daemon=$DAEMON_NAME

if [ $? -eq 0 ]; then
    echo "Emacs daemon '$DAEMON_NAME' started successfully"
else
    echo "Failed to start Emacs daemon"
    exit 1
fi
