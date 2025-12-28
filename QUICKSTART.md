# Emacs Configuration - Quick Start

## Launch Emacs

### Option 1: Emacs.app (Normal)
- Open from Applications folder
- Or: Spotlight → "Emacs"
- Startup: ~0.5-1.5 seconds

### Option 2: Daemon Mode (Fastest)
```bash
# One-time setup: Auto-start on login
launchctl load ~/Library/LaunchAgents/com.emacs.daemon.plist

# Connect to daemon (instant!)
~/.config/emacs/emacsclient-wrapper.sh

# Or add alias to ~/.zshrc:
alias e='~/.config/emacs/emacsclient-wrapper.sh'
# Then use: e filename.txt
```

## What's Installed

### Core
- **Evil mode** - Full Vim emulation
- **Doom themes** - Beautiful theme (doom-one)
- **Straight.el** - Package manager
- **GCMH** - Smart garbage collection

### Evil Plugins (Active)
- evil-surround - `cs"'` change surround
- evil-snipe - `s<char><char>` jump
- evil-escape - `jk` to exit insert mode
- evil-collection - Evil bindings everywhere
- undo-tree - Visual undo

### Evil Plugins (Lazy-loaded)
- evil-matchit - `%` jump to matching tag
- evil-visualstar - `*` search visual selection
- evil-lion - `gl` align operator
- evil-numbers - `C-c +/-` inc/dec numbers
- evil-args - `ia/aa` argument text objects
- evil-indent-plus - `ii/ai` indent text objects
- evil-nerd-commenter - `gc` comment operator
- evil-easymotion - `SPC` prefix for jumps
- evil-exchange - `gx` exchange regions

## Configuration Structure

```
~/.config/emacs/
├── init.el              # Main entry point
├── early-init.el        # Performance optimizations
├── modules/
│   ├── core.el          # Basic Emacs settings
│   ├── editor.el        # Evil/Vim config
│   ├── ui.el            # Themes & UI
│   ├── completion.el    # Completion (ready to enable)
│   ├── tools.el         # Git, projects (ready to enable)
│   └── lang/
│       ├── lang.el      # LSP config (ready to enable)
│       ├── python.el    # Python support
│       ├── javascript.el # JS/TS support
│       ├── rust.el      # Rust support
│       └── web.el       # HTML/CSS/Markdown
└── straight/
    └── versions/
        └── default.el   # Package version lockfile
```

## Enabling Features

### Add Completion Framework
Edit `modules/completion.el`, uncomment:
```elisp
(use-package vertico ...)
(use-package marginalia ...)
(use-package orderless ...)
```

### Add Git Support (Magit)
Edit `modules/tools.el`, uncomment:
```elisp
(use-package magit ...)
```

### Add LSP (Language Server)
1. Edit `modules/lang/lang.el`
2. Uncomment either:
   - `lsp-mode` (more features) OR
   - `eglot` (lighter, faster, recommended)
3. Edit `init.el`, uncomment language modules:
```elisp
(require 'python)
(require 'javascript)
```

### Add Modeline
Edit `modules/ui.el`, uncomment:
```elisp
(use-package doom-modeline ...)
(use-package all-the-icons ...)
```

Then run: `M-x all-the-icons-install-fonts`

## Maintenance

### Recompile After Changes
```bash
/opt/homebrew/opt/emacs-plus@30/bin/emacs --batch -l compile-config.el
```

### Update Packages
Inside Emacs:
```
M-x straight-pull-all
M-x straight-rebuild-all
```

Then update lockfile:
```bash
~/.config/emacs/create-lockfile.sh
```

### Check Startup Time
Inside Emacs:
```
M-x benchmark-init/show-durations-tree
```

## Useful Keybindings

### Vim Basics (if you know Vim)
Standard Vim commands work: `hjkl`, `w`, `b`, `d`, `y`, `p`, etc.

### Emacs Basics
- `C-x C-f` - Find file
- `C-x C-s` - Save file
- `C-x C-c` - Quit Emacs
- `C-x b` - Switch buffer
- `C-g` - Cancel command
- `M-x` - Run command

### Evil Extensions
- `jk` - Exit insert mode (instead of ESC)
- `cs"'` - Change " to '
- `ds"` - Delete surrounding "
- `ysiw"` - Surround word with "
- `s<char><char>` - Jump to character pair
- `gc` - Comment (in visual mode)
- `SPC w` - Jump to word (easymotion)

## Getting Help

### Inside Emacs
- `C-h k` - Describe key
- `C-h f` - Describe function
- `C-h v` - Describe variable
- `C-h m` - Describe current mode
- `SPC h d h` - Doom help (if applicable)

### Documentation
- `PERFORMANCE.md` - Performance optimization details
- `README-DAEMON.md` - Daemon mode setup
- Official Emacs manual: `C-h r`

## Common Issues

### Slow startup?
1. Check benchmark: `M-x benchmark-init/show-durations-tree`
2. See `PERFORMANCE.md` for troubleshooting

### Package not found?
Run inside Emacs: `M-x straight-rebuild-all`

### Want to disable daemon?
```bash
launchctl unload ~/Library/LaunchAgents/com.emacs.daemon.plist
```

## Next Steps

1. **Try it**: Launch Emacs and edit a file
2. **Customize**: Edit `modules/core.el` to set your name/email
3. **Enable features**: Uncomment packages you want
4. **Learn Evil**: https://github.com/emacs-evil/evil
5. **Explore packages**: https://melpa.org

Enjoy your lightning-fast Emacs! ⚡
