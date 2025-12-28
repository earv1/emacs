;;; core.el --- Core Emacs settings -*- lexical-binding: t; -*-
;;; Commentary:
;; Basic Emacs configuration and sensible defaults

;;; Code:

;;; Personal information
(setq user-full-name "Your Name"
      user-mail-address "your.email@example.com")

;;; Better defaults
(setq-default
 ;; Don't use tabs for indentation
 indent-tabs-mode nil
 ;; Set tab width to 2 spaces
 tab-width 2
 ;; Truncate lines instead of wrapping
 truncate-lines t)

;; Disable startup message
(setq inhibit-startup-message t)

;; Enable line numbers
(global-display-line-numbers-mode t)

;; Show column number in mode line
(column-number-mode t)

;; Enable visual feedback on selections
(transient-mark-mode t)

;; Auto-refresh buffers when files change on disk
(global-auto-revert-mode t)

;; Save place in files
(save-place-mode 1)

;; Remember minibuffer history
(savehist-mode 1)

;; Keep customize settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Better scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Enable recent files
(recentf-mode 1)
(setq recentf-max-saved-items 100)

;; Delete selection when typing
(delete-selection-mode 1)

;; Show matching parentheses
(show-paren-mode 1)

;; Electric pair mode - auto-close brackets
(electric-pair-mode 1)

;;; Auto-save configuration
;; Auto-save visited files every 1 second
(setq auto-save-visited-interval 1)  ; Save every 1 second
(auto-save-visited-mode 1)

;; Also configure traditional auto-save settings
(setq auto-save-timeout 1           ; Auto-save after 1 second of idle time
      auto-save-interval 100)       ; Auto-save after 100 keystrokes

;;; Org mode configuration
(use-package org
  :straight (:type built-in)
  :hook (org-mode . (lambda ()
                      ;; Auto-update checkbox statistics on save
                      (add-hook 'before-save-hook
                                (lambda () (org-update-statistics-cookies t))
                                nil 'local)))
  :config
  (setq org-checkbox-hierarchical-statistics nil))  ; Count all boxes, not just direct children

(provide 'core)
;;; core.el ends here
