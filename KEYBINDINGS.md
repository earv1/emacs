# Keybindings Reference

## Leader Key System

**Leader Key:** `SPC` (in Normal/Visual mode) or `C-SPC` (in Insert mode)

After pressing the leader key, you'll see which-key popup showing available commands.

---

## 🎯 Command Palette - The Most Important Key!

### `SPC SPC` - Open Command Palette

**This is your gateway to everything!** Press `SPC SPC` and type to search all commands with their keybindings shown.

**Examples:**
- Type `terminal` → See `vterm` with keybinding `C-c t` or `SPC o t`
- Type `magit` → See `magit-status` with keybinding `C-x g` or `SPC g g`
- Type `buffer` → See all buffer commands with their keys
- Type `file` → See all file commands with their keys
- Type anything → Find the command and see how to invoke it!

**Features:**
- 🔍 **Fuzzy search** - Type any part of the command name
- ⌨️ **Shows keybindings** - See the shortcut right next to each command
- 📝 **Shows descriptions** - Understand what each command does
- ⚡ **Instant preview** - See results as you type

**Pro tip:** If you forget any keybinding, just press `SPC SPC` and search for what you want to do!

---

## 🎯 Quick Access

| Key | Command | Description |
|-----|---------|-------------|
| `SPC SPC` | **Command Palette** | **Search all commands with keybindings** |
| `SPC :` | eval-expression | Evaluate elisp |
| `SPC ;` | Command Palette | Same as `SPC SPC` |

---

## 📁 File Operations (`SPC f`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC f f` | find-file | Find/open file |
| `SPC f r` | recent files | Open recent file |
| `SPC f s` | save-buffer | Save current file |
| `SPC f S` | save-as | Save file as... |
| `SPC f d` | dired | Open file manager |
| `SPC f D` | delete-file | Delete current file |
| `SPC f y` | yank filename | Copy filename to clipboard |

---

## 📋 Buffer Operations (`SPC b`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC b b` | switch buffer | Switch to buffer |
| `SPC b d` | kill buffer | Close current buffer |
| `SPC b n` | next buffer | Next buffer |
| `SPC b p` | previous buffer | Previous buffer |
| `SPC b r` | revert buffer | Reload from disk |
| `SPC b s` | save buffer | Save current buffer |
| `SPC b S` | save all | Save all buffers |
| `SPC b i` | ibuffer | Advanced buffer list |

---

## 🪟 Window Operations (`SPC w`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC w w` | ace-window | Jump to window by letter |
| `SPC w d` | delete window | Close current window |
| `SPC w D` | delete others | Close all other windows |
| `SPC w s` | split below | Split window horizontally |
| `SPC w v` | split right | Split window vertically |
| `SPC w h/j/k/l` | navigate | Move between windows (vim-style) |
| `SPC w =` | balance | Balance window sizes |
| `SPC w u` | undo | Undo window change |
| `SPC w r` | redo | Redo window change |

---

## 📦 Project Operations (`SPC p`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC p f` | find file | Find file in project |
| `SPC p p` | switch project | Switch to project |
| `SPC p b` | project buffers | List project buffers |
| `SPC p s` | search project | Ripgrep search in project |
| `SPC p r` | recent files | Recent files in project |
| `SPC p k` | kill buffers | Close all project buffers |
| `SPC p a` | add project | Add project to list |

---

## 🔀 Git Operations (`SPC g`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC g g` | magit-status | Open Magit |
| `SPC g d` | magit-diff | Show diff |
| `SPC g c` | magit-commit | Create commit |
| `SPC g p` | magit-push | Push changes |
| `SPC g P` | magit-pull | Pull changes |
| `SPC g b` | magit-branch | Branch operations |
| `SPC g B` | magit-blame | Git blame |
| `SPC g l` | magit-log | Show log |
| `SPC g t` | time machine | Browse file history |

---

## 🔍 Search Operations (`SPC s`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC s s` | search buffer | Search current buffer |
| `SPC s p` | search project | Search in project (ripgrep) |
| `SPC s d` | find file | Find file by name |
| `SPC s i` | imenu | Jump to heading/function |
| `SPC s I` | imenu all | Jump to heading in all buffers |
| `SPC s m` | jump to mark | Jump to mark |
| `SPC s M` | global mark | Jump to global mark |

---

## 💻 Code Operations (`SPC c`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC c c` | compile | Compile project |
| `SPC c r` | recompile | Recompile |
| `SPC c d` | definition | Go to definition |
| `SPC c D` | references | Find references |
| `SPC c f` | format | Format buffer |

---

## 🔧 Toggle Operations (`SPC t`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC t t` | theme | Choose theme |
| `SPC t l` | line numbers | Toggle line numbers |
| `SPC t w` | whitespace | Toggle whitespace mode |
| `SPC t s` | flycheck | Toggle syntax checking |
| `SPC t f` | fullscreen | Toggle fullscreen |

---

## ❓ Help Operations (`SPC h`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC h f` | describe function | Help for function |
| `SPC h v` | describe variable | Help for variable |
| `SPC h k` | describe key | Help for keybinding |
| `SPC h m` | describe mode | Help for current mode |
| `SPC h a` | apropos | Search help |
| `SPC h i` | info | Info documentation |

---

## 📝 Notes/Org Operations (`SPC n`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC n f` | find note | Find/create note |
| `SPC n i` | insert note | Insert note link |
| `SPC n c` | capture | Capture new note |
| `SPC n l` | backlinks | Show backlinks |
| `SPC n j` | daily note | Today's journal |
| `SPC n a` | agenda | Org agenda |

---

## 🚀 Open Operations (`SPC o`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC o t` | terminal | Open vterm |
| `SPC o e` | eshell | Open eshell |
| `SPC o d` | dired | Open dired here |

---

## 🚪 Quit Operations (`SPC q`)

| Key | Command | Description |
|-----|---------|-------------|
| `SPC q q` | quit | Quit Emacs (with save prompt) |
| `SPC q Q` | force quit | Quit without saving |
| `SPC q r` | restart | Restart Emacs |

---

## 🎹 Other Useful Bindings

### Navigation (Available Everywhere)
- `C-'` - Jump to 2 characters (avy)
- `C-:` - Jump to line (avy)
- `M-o` - Switch window (ace-window)
- `C-s` - Search buffer (consult-line)

### Editing
- `C-=` - Expand region
- `C--` - Contract region
- `C-n` - Multiple cursors (next match)
- `C-p` - Multiple cursors (previous match)
- `gc` - Comment operator (in normal/visual mode)

### Completion
- `C-j` / `C-k` - Navigate company completions

### Evil Mode Extras
- `jk` - Escape (in insert mode)
- `SPC SPC` - Easymotion (in normal mode)

---

## 💡 Pro Tips

1. **Press `SPC` and wait** - which-key will show you all available commands
2. **Fuzzy matching** - Type any part of a command name (e.g., "buf kill" finds "kill-buffer")
3. **C-SPC in Insert mode** - Access leader commands without leaving insert mode
4. **Embark actions** - Press `C-.` on any item for context actions

---

## 📚 Learning More

- **M-x which-key-show-top-level** - Show all top-level keybindings
- **SPC h k** - Find what any key does
- See `EXTENSIONS.md` for more package-specific keybindings
