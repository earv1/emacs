;;; ui.el --- UI configuration -*- lexical-binding: t; -*-
;;; Commentary:
;; UI-related packages: themes, modeline, fonts, etc.

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; Themes
(use-package doom-themes
  :demand t  ; Load theme immediately for visual consistency
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (with-eval-after-load 'org
    (doom-themes-org-config)))

;; Which-key - shows available keybindings
(use-package which-key
  :demand t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5
        which-key-sort-order 'which-key-key-order-alpha))

;; Modeline
(use-package doom-modeline
  :demand t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 25
        doom-modeline-bar-width 3
        doom-modeline-project-detection 'projectile
        doom-modeline-buffer-file-name-style 'truncate-with-project
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-minor-modes nil
        doom-modeline-enable-word-count nil
        doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)))

;; Rainbow delimiters - colorful parentheses
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Highlight TODO keywords
(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#ff6c6b")
          ("FIXME"  . "#ff6c6b")
          ("HACK"   . "#da8548")
          ("REVIEW" . "#51afef")
          ("NOTE"   . "#98be65")
          ("DEPRECATED" . "#bbc2cf"))))

;;; Window management
;; Ace-window - quick window switching
(use-package ace-window
  :bind ("M-o" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-scope 'frame))

;; Winner-mode - undo/redo window layouts
(use-package winner
  :demand t
  :config
  (winner-mode 1))

;;; All-the-icons (for dashboard icons)
(use-package all-the-icons
  :if (display-graphic-p))

;;; Dashboard - Startup splash screen
(use-package dashboard
  :demand t
  :config
  (dashboard-setup-startup-hook)

  ;; Configure dashboard items
  (setq dashboard-items '((recents  . 10)
                          (bookmarks . 5)
                          (projects . 5))
        dashboard-set-heading-icons nil
        dashboard-set-file-icons nil
        dashboard-center-content t
        dashboard-startup-banner 'logo
        dashboard-set-navigator t
        dashboard-set-init-info t)

  ;; Custom footer with documentation links
  (setq dashboard-footer-messages
        '("Welcome to Emacs!"
          "Happy Hacking!"
          "Press ? for help"))

  ;; Set up navigation buttons (without icons for simplicity)
  (setq dashboard-navigator-buttons
        `(;; Line 1
          (("GitHub"
            "Browse GitHub"
            (lambda (&rest _) (browse-url "https://github.com")))
           ("Emacs Manual"
            "Read Emacs documentation"
            (lambda (&rest _) (info "emacs")))
           ("Settings"
            "Open config"
            (lambda (&rest _) (find-file user-init-file)))))))

;; Recentf mode for tracking recently opened files
(use-package recentf
  :demand t
  :config
  (setq recentf-max-saved-items 100
        recentf-max-menu-items 20
        recentf-auto-cleanup 'never)
  (recentf-mode 1))

(provide 'ui)
;;; ui.el ends here
