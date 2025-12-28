;;; lang.el --- General language support -*- lexical-binding: t; -*-
;;; Commentary:
;; General programming settings and LSP configuration

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; General programming settings
;; Highlight current line in programming modes
(add-hook 'prog-mode-hook #'hl-line-mode)

;; Display fill column indicator
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(setq-default fill-column 80)

;;; Language Server Protocol (LSP)
;; Choose one of the following LSP implementations:

;; Option 1: lsp-mode (more features, heavier) - WITH PERFORMANCE OPTIMIZATIONS
;; (use-package lsp-mode
;;   :commands (lsp lsp-deferred)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :config
;;   ;; Performance optimizations
;;   (setq lsp-idle-delay 0.5                     ; Clangd is fast
;;         lsp-log-io nil                          ; Disable logging for speed
;;         lsp-completion-provider :capf
;;         lsp-prefer-flymake nil                  ; Use flycheck
;;         ;; Reduce UI updates
;;         lsp-headerline-breadcrumb-enable nil
;;         lsp-signature-auto-activate nil
;;         lsp-modeline-code-actions-enable nil
;;         lsp-modeline-diagnostics-enable nil
;;         lsp-eldoc-enable-hover nil
;;         lsp-signature-render-documentation nil
;;         ;; File watching optimization
;;         lsp-enable-file-watchers nil
;;         lsp-file-watch-threshold 2000
;;         ;; Reduce startup time
;;         lsp-semantic-tokens-enable nil
;;         lsp-enable-folding nil
;;         lsp-enable-imenu nil
;;         lsp-enable-snippet nil))

;; (use-package lsp-ui
;;   :commands lsp-ui-mode
;;   :config
;;   (setq lsp-ui-doc-enable nil              ; Disable doc popups (slow)
;;         lsp-ui-doc-position 'bottom
;;         lsp-ui-doc-show-with-cursor nil
;;         lsp-ui-doc-show-with-mouse nil
;;         lsp-ui-sideline-enable nil         ; Disable sideline (slow)
;;         lsp-ui-sideline-show-hover nil
;;         lsp-ui-sideline-show-diagnostics nil
;;         lsp-ui-peek-enable t               ; Keep peek (useful)
;;         lsp-ui-peek-show-directory t))

;; Option 2: eglot (simpler, built-in to Emacs 29+, better performance)
;; (use-package eglot
;;   :hook ((python-mode . eglot-ensure)
;;          (js-mode . eglot-ensure)
;;          (typescript-mode . eglot-ensure)
;;          (rust-mode . eglot-ensure)
;;          (go-mode . eglot-ensure))
;;   :config
;;   ;; Performance optimizations for eglot
;;   (setq eglot-events-buffer-size 0  ; Disable event logging
;;         eglot-sync-connect nil      ; Async connection
;;         eglot-autoshutdown t)       ; Shutdown unused servers
;;   ;; Increase read size for LSP responses
;;   (setq read-process-output-max (* 1024 1024)))  ; 1MB

;;; Debugging
;; (use-package dap-mode
;;   :after lsp-mode
;;   :config
;;   (dap-auto-configure-mode))

;;; Treesitter (Emacs 29+)
;; (use-package tree-sitter
;;   :config
;;   (global-tree-sitter-mode)
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; (use-package tree-sitter-langs)

(provide 'lang)
;;; lang.el ends here
