;;; web.el --- Web development support -*- lexical-binding: t; -*-
;;; Commentary:
;; HTML, CSS, and web development configuration

;;; Code:

;; Web mode for HTML/templating
;; (use-package web-mode
;;   :mode ("\\.html?\\'" "\\.jsx?\\'" "\\.tsx?\\'" "\\.vue\\'")
;;   :config
;;   (setq web-mode-markup-indent-offset 2
;;         web-mode-css-indent-offset 2
;;         web-mode-code-indent-offset 2
;;         web-mode-enable-auto-pairing t
;;         web-mode-enable-auto-closing t
;;         web-mode-enable-current-element-highlight t))

;; Emmet for HTML expansion
;; (use-package emmet-mode
;;   :hook (web-mode . emmet-mode)
;;   :config
;;   (setq emmet-expand-jsx-className? t))

;; CSS
;; (use-package css-mode
;;   :ensure nil  ; built-in
;;   :mode "\\.css\\'"
;;   :config
;;   (setq css-indent-offset 2))

;; SCSS/SASS
;; (use-package scss-mode
;;   :mode "\\.scss\\'"
;;   :config
;;   (setq scss-compile-at-save nil))

;; Tailwind CSS
;; (use-package tailwindcss-mode
;;   :hook (web-mode . tailwindcss-mode))

;; YAML
;; (use-package yaml-mode
;;   :mode "\\.ya?ml\\'")

;; Markdown
;; (use-package markdown-mode
;;   :mode "\\.md\\'"
;;   :config
;;   (setq markdown-command "multimarkdown"))

(provide 'web)
;;; web.el ends here
