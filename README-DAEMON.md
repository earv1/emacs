# Emacs Daemon Mode Setup

## What is Daemon Mode?

Daemon mode runs Emacs as a background server. You connect to it with `emacsclient`:
- **First launch**: ~1 second (daemon starts)
- **Subsequent launches**: <100ms (instant!)
- All frames share the same Emacs instance

## Quick Start

### Option 1: Manual Start (Simple)
```bash
# Start daemon manually when needed
~/.config/emacs/start-daemon.sh

# Connect with emacsclient (creates new frame)
~/.config/emacs/emacsclient-wrapper.sh
```

### Option 2: Auto-start on Login (Recommended)
```bash
# Load the LaunchAgent (starts daemon on login)
launchctl load ~/Library/LaunchAgents/com.emacs.daemon.plist

# Verify it's running
launchctl list | grep emacs

# Connect with emacsclient
~/.config/emacs/emacsclient-wrapper.sh
```

## Optional: Create Terminal Alias

Add to `~/.zshrc` or `~/.bashrc`:
```bash
alias e='~/.config/emacs/emacsclient-wrapper.sh'
alias ec='~/.config/emacs/emacsclient-wrapper.sh -nw'  # Terminal mode
```

Then just use: `e filename.txt`

## Managing the Daemon

```bash
# Stop daemon
emacsclient -e "(kill-emacs)"

# Restart daemon (if using LaunchAgent)
launchctl unload ~/Library/LaunchAgents/com.emacs.daemon.plist
launchctl load ~/Library/LaunchAgents/com.emacs.daemon.plist

# Disable auto-start
launchctl unload ~/Library/LaunchAgents/com.emacs.daemon.plist
```

## Still Using Emacs.app?

You can still use Emacs.app from Applications! The daemon is optional.
The daemon is just faster for frequent file opening from terminal.
