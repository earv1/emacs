;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-
;;; Commentary:
;; A minimal Emacs configuration using straight.el

;;; Code:

;;; Performance: File handler optimization
;; Disable file handlers during startup for faster loading
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Restore file handlers after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist default-file-name-handler-alist)
            (makunbound 'default-file-name-handler-alist)))

;;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; Package management setup
;; Use straight.el for package management
(setq straight-use-package-by-default t)

;; Enable byte compilation and native compilation
(setq straight-disable-byte-compilation nil
      straight-disable-native-compilation nil
      straight-check-for-modifications '(check-on-save find-when-checking))

;; Use lockfile for reproducible builds
(setq straight-use-version-specific-build-dir t)

;; Install use-package
(straight-use-package 'use-package)

;; Configure use-package for lazy loading by default
(require 'use-package)
(setq use-package-always-defer t
      use-package-always-ensure nil  ; straight handles this
      use-package-expand-minimally nil  ; Keep full expansion for proper integration
      use-package-compute-statistics nil)

;;; Startup benchmark (comment out after tuning)
(use-package benchmark-init
  :demand t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

;;; Smart garbage collection
;; GCMH - the Garbage Collector Magic Hack
(use-package gcmh
  :demand t
  :config
  (setq gcmh-idle-delay 'auto  ; Default is 15s
        gcmh-auto-idle-delay-factor 10
        gcmh-high-cons-threshold (* 16 1024 1024))  ; 16MB
  (gcmh-mode 1))

;;; Load configuration modules
;; Add the modules directory to load path
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/lang" user-emacs-directory))

;; Ensure straight and use-package are available to all modules
(eval-and-compile
  (require 'straight)
  (require 'use-package))

;; Load core modules
(require 'core)       ; Core Emacs settings
(require 'editor)     ; Evil/Vim configuration
(require 'ui)         ; UI and themes
(require 'completion) ; Completion frameworks
(require 'tools)      ; Git, projectile, etc.
(require 'keybindings) ; Leader keybindings (SPC)

;; Load language support
(require 'lang)       ; General LSP/programming setup
;; (require 'python)     ; Python support
;; (require 'javascript) ; JavaScript/TypeScript support
;; (require 'rust)       ; Rust support
;; (require 'web)        ; Web development support

;; Note: GCMH now handles GC tuning, so we don't need manual reset

(provide 'init)
;;; init.el ends here
