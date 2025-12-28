#!/bin/bash
# create-lockfile.sh - Generate straight.el lockfile for reproducible builds

EMACS_BIN="/opt/homebrew/opt/emacs-plus@30/bin/emacs"

echo "Creating straight.el lockfile..."

$EMACS_BIN --batch --eval "
(progn
  (load-file \"~/.config/emacs/init.el\")
  (require 'straight)
  (straight-freeze-versions)
  (message \"Lockfile created at: ~/.config/emacs/straight/versions/default.el\")
  (kill-emacs 0))
"

if [ $? -eq 0 ]; then
    echo "✓ Lockfile created successfully!"
    echo "Location: ~/.config/emacs/straight/versions/default.el"
    echo ""
    echo "This file pins all package versions for reproducible builds."
    echo "Commit it to version control if you're tracking your config."
else
    echo "✗ Failed to create lockfile"
    exit 1
fi
