# Command Palette Guide

## What is the Command Palette?

The **Command Palette** is your universal search for ALL Emacs commands. Press `SPC SPC` and start typing to find any command along with its keybinding.

---

## How to Use It

### Step 1: Press `SPC SPC` (in normal mode) or `C-SPC SPC` (in insert mode)

You'll see a prompt:
```
M-x
```

### Step 2: Start Typing What You Want

The palette shows commands that match, with **keybindings displayed on the right**.

---

## Real Examples

### Example 1: "I want to open a terminal"

1. Press: `SPC SPC`
2. Type: `terminal`
3. You'll see:
   ```
   vterm                                    C-c t, SPC o t
   eshell                                   SPC o e
   multi-vterm
   ```
4. Now you know: Press `SPC o t` or `C-c t` to open terminal!

### Example 2: "I want to use git"

1. Press: `SPC SPC`
2. Type: `magit`
3. You'll see:
   ```
   magit-status                             C-x g, SPC g g
   magit-diff                               SPC g d
   magit-commit                             SPC g c
   magit-push                               SPC g p
   magit-pull                               SPC g P
   ```
4. Choose what you need and see its keybinding!

### Example 3: "I want to find a file"

1. Press: `SPC SPC`
2. Type: `find file`
3. You'll see:
   ```
   find-file                                C-x C-f, SPC f f
   projectile-find-file                     SPC p f
   consult-find                             M-s d, SPC s d
   ```

### Example 4: "I want to switch buffers"

1. Press: `SPC SPC`
2. Type: `buffer`
3. You'll see:
   ```
   consult-buffer                           C-x b, SPC b b
   switch-to-buffer
   kill-buffer                              SPC b k
   next-buffer                              SPC b n
   previous-buffer                          SPC b p
   ```

---

## Features

### 🔍 Fuzzy Matching
You don't need to type the exact name:
- Type `proj find` → finds `projectile-find-file`
- Type `win split` → finds `split-window-*`
- Type `org cap` → finds `org-roam-capture`

### ⌨️ Keybinding Display
Every command shows its keybinding on the right:
```
command-name                                 SPC x y
```

### 📝 Rich Information
Powered by **marginalia**, you see:
- Command name
- Keybindings
- Brief description
- Category/type

### ⚡ Instant Results
As you type, results update immediately with fuzzy matching.

---

## Common Searches

| What You Want | Type This | You'll Find |
|---------------|-----------|-------------|
| Open terminal | `terminal` or `vterm` | vterm, eshell |
| Git operations | `magit` or `git` | All magit commands |
| Find files | `find` or `file` | All file commands |
| Search in project | `search` or `grep` | consult-ripgrep, grep, etc |
| Switch buffers | `buffer` or `switch` | All buffer commands |
| Window operations | `window` or `split` | All window commands |
| Code formatting | `format` | format-all-buffer |
| Jump to definition | `definition` or `xref` | xref-find-definitions |
| Org notes | `org` or `roam` | All org/roam commands |
| Help/documentation | `help` or `describe` | All help commands |

---

## Pro Tips

1. **Don't memorize everything** - Just remember `SPC SPC` and search when you need something

2. **Learn as you go** - Each time you search, you see the keybinding, so you'll naturally learn the shortcuts you use most

3. **Combine with which-key** - Start typing `SPC f` and wait to see which-key popup for file operations

4. **Use fuzzy matching** - Type parts of words: `prj buf` finds `project-buffer`

5. **Arrow keys or C-n/C-p** - Navigate through results

6. **Tab** - Complete partial matches

7. **RET (Enter)** - Execute the selected command

---

## Keyboard Shortcuts in the Palette

While the command palette is open:

| Key | Action |
|-----|--------|
| `C-n` or `↓` | Next command |
| `C-p` or `↑` | Previous command |
| `C-j` | Next command (Evil) |
| `C-k` | Previous command (Evil) |
| `RET` | Execute command |
| `C-g` | Cancel/quit |
| `TAB` | Complete |
| `C-SPC` | Select/mark |

---

## Why This is Awesome

✅ **No need to memorize hundreds of keybindings**
✅ **Discoverable** - find commands you didn't know existed
✅ **Self-documenting** - see keybindings as you search
✅ **Fast** - fuzzy matching finds what you need instantly
✅ **Universal** - works for ALL Emacs commands (1000s of them!)

---

## Summary

**Remember just one thing: `SPC SPC`**

That's your gateway to everything in Emacs. Type what you want to do, see the keybinding, and either:
1. Execute it from the palette, or
2. Remember the keybinding for next time

**The more you use it, the more keybindings you'll naturally learn!** 🚀
