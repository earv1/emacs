;;; rust.el --- Rust support -*- lexical-binding: t; -*-
;;; Commentary:
;; Rust development configuration

;;; Code:

;; (use-package rust-mode
;;   :mode "\\.rs\\'"
;;   :hook (rust-mode . lsp-deferred)
;;   :config
;;   (setq rust-format-on-save t))

;; Cargo integration
;; (use-package cargo
;;   :hook (rust-mode . cargo-minor-mode))

;; Flycheck support for Rust
;; (use-package flycheck-rust
;;   :after flycheck
;;   :hook (rust-mode . flycheck-rust-setup))

(provide 'rust)
;;; rust.el ends here
