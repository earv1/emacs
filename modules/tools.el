;;; tools.el --- Development tools -*- lexical-binding: t; -*-
;;; Commentary:
;; Git, project management, terminal, and other dev tools

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; Version control
;; (use-package magit
;;   :bind ("C-x g" . magit-status)
;;   :config
;;   (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Show git changes in the fringe
;; (use-package git-gutter
;;   :config
;;   (global-git-gutter-mode +1))

;;; Project management
;; (use-package projectile
;;   :config
;;   (projectile-mode +1)
;;   :bind-keymap
;;   ("C-c p" . projectile-command-map)
;;   :init
;;   (setq projectile-project-search-path '("~/projects/")))

;;; Terminal
;; (use-package vterm
;;   :config
;;   (setq vterm-max-scrollback 10000))

;;; File explorer
;; (use-package dired
;;   :ensure nil  ; built-in
;;   :config
;;   (setq dired-listing-switches "-alh --group-directories-first"))

;; (use-package dired-single
;;   :after dired)

;; (use-package all-the-icons-dired
;;   :hook (dired-mode . all-the-icons-dired-mode))

;;; Syntax checking
;; (use-package flycheck
;;   :init (global-flycheck-mode))

;; or use flymake (built-in to Emacs)
;; (use-package flymake
;;   :ensure nil
;;   :hook (prog-mode . flymake-mode))

(provide 'tools)
;;; tools.el ends here
