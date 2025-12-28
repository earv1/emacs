;;; javascript.el --- JavaScript/TypeScript support -*- lexical-binding: t; -*-
;;; Commentary:
;; JavaScript and TypeScript development configuration

;;; Code:

;; JavaScript
;; (use-package js2-mode
;;   :mode "\\.js\\'"
;;   :hook (js2-mode . lsp-deferred)
;;   :config
;;   (setq js2-basic-offset 2))

;; TypeScript
;; (use-package typescript-mode
;;   :mode "\\.ts\\'"
;;   :hook (typescript-mode . lsp-deferred)
;;   :config
;;   (setq typescript-indent-level 2))

;; TSX support
;; (use-package tsx-mode
;;   :mode "\\.tsx\\'")

;; JSON
;; (use-package json-mode
;;   :mode "\\.json\\'")

;; Prettier formatter
;; (use-package prettier-js
;;   :hook ((js2-mode . prettier-js-mode)
;;          (typescript-mode . prettier-js-mode)))

;; Jest testing
;; (use-package jest
;;   :after (js2-mode typescript-mode))

(provide 'javascript)
;;; javascript.el ends here
