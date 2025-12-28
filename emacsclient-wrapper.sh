#!/bin/bash
# emacsclient-wrapper.sh - Connect to Emacs daemon or start it

EMACSCLIENT="/opt/homebrew/opt/emacs-plus@30/bin/emacsclient"
DAEMON_NAME="main"

# Try to connect to existing daemon, or start one if it doesn't exist
$EMACSCLIENT -c -s $DAEMON_NAME -a "" "$@"
