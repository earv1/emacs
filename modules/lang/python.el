;;; python.el --- Python support -*- lexical-binding: t; -*-
;;; Commentary:
;; Python development configuration

;;; Code:

;; (use-package python-mode
;;   :mode "\\.py\\'"
;;   :hook (python-mode . lsp-deferred)
;;   :config
;;   (setq python-indent-offset 4))

;; Python virtual environment management
;; (use-package pyvenv
;;   :config
;;   (pyvenv-mode 1))

;; Poetry integration
;; (use-package poetry
;;   :hook (python-mode . poetry-tracking-mode))

;; Black formatter
;; (use-package python-black
;;   :after python
;;   :hook (python-mode . python-black-on-save-mode))

;; Pytest support
;; (use-package python-pytest
;;   :after python)

(provide 'python)
;;; python.el ends here
