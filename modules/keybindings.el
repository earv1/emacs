;;; keybindings.el --- Doom-style leader keybindings -*- lexical-binding: t; -*-
;;; Commentary:
;; Leader key system using general.el (SPC in normal mode, C-SPC in insert mode)

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; General - keybinding framework
(use-package general
  :demand t
  :config
  ;; Set up leader keys
  (general-create-definer leader-def
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (general-create-definer local-leader-def
    :states '(normal visual)
    :prefix "SPC m"
    :non-normal-prefix "C-SPC m"))

;;; Global leader keybindings (SPC)
(leader-def
  ;; Basic commands - SPC opens command palette with keybinding hints
  "SPC" '(command-palette :which-key "command palette")
  ":"   '(eval-expression :which-key "eval")
  ";"   '(command-palette :which-key "command palette")
  "u"   '(universal-argument :which-key "universal arg")
  "x"   '(command-palette :which-key "command palette")

  ;; File operations (SPC f)
  "f"   '(:ignore t :which-key "file")
  "ff"  '(find-file :which-key "find file")
  "fr"  '(consult-recent-file :which-key "recent files")
  "fs"  '(save-buffer :which-key "save file")
  "fS"  '(write-file :which-key "save file as")
  "fd"  '(dired :which-key "dired")
  "fD"  '(delete-file :which-key "delete file")
  "fy"  '(doom/yank-buffer-filename :which-key "yank filename")

  ;; Buffer operations (SPC b)
  "b"   '(:ignore t :which-key "buffer")
  "bb"  '(consult-buffer :which-key "switch buffer")
  "bd"  '(kill-current-buffer :which-key "kill buffer")
  "bk"  '(kill-buffer :which-key "kill buffer")
  "bn"  '(next-buffer :which-key "next buffer")
  "bp"  '(previous-buffer :which-key "previous buffer")
  "br"  '(revert-buffer :which-key "revert buffer")
  "bs"  '(save-buffer :which-key "save buffer")
  "bS"  '(save-some-buffers :which-key "save all buffers")
  "bi"  '(ibuffer :which-key "ibuffer")

  ;; Window operations (SPC w)
  "w"   '(:ignore t :which-key "window")
  "ww"  '(ace-window :which-key "ace window")
  "wd"  '(delete-window :which-key "delete window")
  "wD"  '(delete-other-windows :which-key "delete other windows")
  "ws"  '(split-window-below :which-key "split below")
  "wv"  '(split-window-right :which-key "split right")
  "wh"  '(evil-window-left :which-key "window left")
  "wj"  '(evil-window-down :which-key "window down")
  "wk"  '(evil-window-up :which-key "window up")
  "wl"  '(evil-window-right :which-key "window right")
  "w="  '(balance-windows :which-key "balance windows")
  "wu"  '(winner-undo :which-key "undo window change")
  "wr"  '(winner-redo :which-key "redo window change")

  ;; Project operations (SPC p)
  "p"   '(:ignore t :which-key "project")
  "pf"  '(projectile-find-file :which-key "find file in project")
  "pp"  '(projectile-switch-project :which-key "switch project")
  "pb"  '(consult-project-buffer :which-key "project buffers")
  "pk"  '(projectile-kill-buffers :which-key "kill project buffers")
  "pr"  '(projectile-recentf :which-key "recent project files")
  "ps"  '(consult-ripgrep :which-key "search project")
  "pa"  '(projectile-add-known-project :which-key "add project")

  ;; Git operations (SPC g)
  "g"   '(:ignore t :which-key "git")
  "gg"  '(magit-status :which-key "magit status")
  "gd"  '(magit-diff :which-key "magit diff")
  "gc"  '(magit-commit :which-key "magit commit")
  "gp"  '(magit-push :which-key "magit push")
  "gP"  '(magit-pull :which-key "magit pull")
  "gb"  '(magit-branch :which-key "magit branch")
  "gB"  '(magit-blame :which-key "magit blame")
  "gl"  '(magit-log :which-key "magit log")
  "gf"  '(magit-find-file :which-key "find file in git")
  "gt"  '(git-timemachine :which-key "time machine")

  ;; Search operations (SPC s)
  "s"   '(:ignore t :which-key "search")
  "ss"  '(consult-line :which-key "search buffer")
  "sb"  '(consult-line :which-key "search buffer")
  "sp"  '(consult-ripgrep :which-key "search project")
  "sd"  '(consult-find :which-key "find file")
  "si"  '(consult-imenu :which-key "imenu")
  "sI"  '(consult-imenu-multi :which-key "imenu all buffers")
  "sm"  '(consult-mark :which-key "jump to mark")
  "sM"  '(consult-global-mark :which-key "jump to global mark")

  ;; Code operations (SPC c)
  "c"   '(:ignore t :which-key "code")
  "cc"  '(compile :which-key "compile")
  "cr"  '(recompile :which-key "recompile")
  "cd"  '(xref-find-definitions :which-key "go to definition")
  "cD"  '(xref-find-references :which-key "find references")
  "cf"  '(format-all-buffer :which-key "format buffer")

  ;; Toggle operations (SPC t)
  "t"   '(:ignore t :which-key "toggle")
  "tt"  '(consult-theme :which-key "choose theme")
  "tl"  '(display-line-numbers-mode :which-key "line numbers")
  "tw"  '(whitespace-mode :which-key "whitespace")
  "ts"  '(flycheck-mode :which-key "flycheck")
  "tf"  '(toggle-frame-fullscreen :which-key "fullscreen")

  ;; Help operations (SPC h)
  "h"   '(:ignore t :which-key "help")
  "hf"  '(helpful-callable :which-key "describe function")
  "hv"  '(helpful-variable :which-key "describe variable")
  "hk"  '(helpful-key :which-key "describe key")
  "hm"  '(describe-mode :which-key "describe mode")
  "ha"  '(consult-apropos :which-key "apropos")
  "hF"  '(describe-face :which-key "describe face")
  "hi"  '(info :which-key "info")
  "hI"  '(info-display-manual :which-key "info manual")

  ;; Org-mode operations (SPC n)
  "n"   '(:ignore t :which-key "notes")
  "nf"  '(org-roam-node-find :which-key "find note")
  "ni"  '(org-roam-node-insert :which-key "insert note")
  "nc"  '(org-roam-capture :which-key "capture note")
  "nl"  '(org-roam-buffer-toggle :which-key "backlinks")
  "nj"  '(org-roam-dailies-capture-today :which-key "daily note")
  "na"  '(org-agenda :which-key "org agenda")

  ;; Open operations (SPC o)
  "o"   '(:ignore t :which-key "open")
  "ot"  '(vterm :which-key "terminal")
  "oe"  '(eshell :which-key "eshell")
  "od"  '(dired-jump :which-key "dired")

  ;; Quit/Session operations (SPC q)
  "q"   '(:ignore t :which-key "quit")
  "qq"  '(save-buffers-kill-terminal :which-key "quit emacs")
  "qQ"  '(kill-emacs :which-key "quit without saving")
  "qr"  '(restart-emacs :which-key "restart emacs"))

;;; Helper functions
(defun doom/yank-buffer-filename ()
  "Copy the current buffer's filename to the kill ring."
  (interactive)
  (if-let ((filename (or buffer-file-name
                         (bound-and-true-p list-buffers-directory))))
      (progn
        (kill-new filename)
        (message "Copied: %s" filename))
    (message "Buffer is not visiting a file")))

(defun restart-emacs ()
  "Restart Emacs."
  (interactive)
  (save-some-buffers)
  (kill-emacs 0))

(defun consult-recent-file ()
  "Find recent file using consult."
  (interactive)
  (find-file (consult--read
              recentf-list
              :prompt "Recent file: "
              :sort nil
              :require-match t
              :category 'file
              :state (consult--file-preview)
              :history 'file-name-history)))

(defun command-palette ()
  "Enhanced M-x with keybinding hints - type to search all commands.
Example: type 'terminal' to find vterm and see its keybinding."
  (interactive)
  (let ((current-prefix-arg current-prefix-arg))
    ;; Use the enhanced M-x with marginalia annotations showing keybindings
    (call-interactively 'execute-extended-command)))

(provide 'keybindings)
;;; keybindings.el ends here
