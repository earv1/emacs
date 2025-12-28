;;; tools.el --- Development tools -*- lexical-binding: t; -*-
;;; Commentary:
;; Git, project management, terminal, and other dev tools

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; Version control
;; Magit - Git interface
(use-package magit
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1
        magit-diff-refine-hunk t  ; Show word-level diff highlighting
        magit-save-repository-buffers 'dontask))

;; Forge - GitHub/GitLab integration for magit
(use-package forge
  :after magit
  :config
  (setq forge-topic-list-limit '(60 . 0)))

;; Git timemachine - step through git history
(use-package git-timemachine
  :bind ("C-x v t" . git-timemachine))

;; Show git changes in the fringe/margin
(use-package diff-hl
  :demand t
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  :hook
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))

;; Git modes - for .gitignore, .gitconfig, etc.
(use-package git-modes
  :mode (("\\.gitignore\\'" . gitignore-mode)
         ("\\.gitconfig\\'" . gitconfig-mode)
         ("\\.gitattributes\\'" . gitattributes-mode)))

;; Magit todos - show TODOs in magit status
(use-package magit-todos
  :after magit
  :config
  (magit-todos-mode 1)
  (setq magit-todos-keyword-suffix "\\(?:([^)]+)\\)?:?"))

;; Evil bindings for magit (if using evil mode)
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init 'magit))

;;; Project management
(use-package projectile
  :demand t
  :config
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-project-search-path '("~/projects/" "~/")
        projectile-enable-caching t
        projectile-indexing-method 'alien))

;;; Terminal
(use-package vterm
  :bind ("C-c t" . vterm)
  :config
  (setq vterm-max-scrollback 10000
        vterm-kill-buffer-on-exit t))

;;; File explorer
(use-package dired
  :straight nil  ; built-in
  :config
  (setq dired-listing-switches "-alh --group-directories-first"
        dired-dwim-target t
        dired-recursive-copies 'always
        dired-recursive-deletes 'always
        delete-by-moving-to-trash t))

(use-package dired-single
  :after dired)

(use-package all-the-icons-dired
  :if (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :bind (:map dired-mode-map
              ("." . dired-hide-dotfiles-mode)))

;;; Syntax checking
(use-package flycheck
  :demand t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled)
        flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;;; Tree-sitter - Better syntax highlighting
(use-package tree-sitter
  :demand t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :after tree-sitter)

(provide 'tools)
;;; tools.el ends here
