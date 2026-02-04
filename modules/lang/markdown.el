;;; markdown.el --- Markdown support -*- lexical-binding: t; -*-
;;; Commentary:
;; Markdown editing configuration

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; Markdown mode
(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("README\\.md\\'" . gfm-mode))
  :init
  (setq markdown-command "multimarkdown")
  :config
  ;; Enable syntax highlighting for code blocks
  (setq markdown-fontify-code-blocks-natively t)
  ;; Use visual line mode for better text editing
  (add-hook 'markdown-mode-hook #'visual-line-mode)
  ;; Enable math rendering
  (setq markdown-enable-math t)
  ;; Header styling
  (setq markdown-header-scaling t)
  ;; Better list indentation
  (setq markdown-list-indent-width 2))

;;; Table of contents generation
(use-package markdown-toc
  :after markdown-mode
  :commands (markdown-toc-generate-toc
             markdown-toc-refresh-toc
             markdown-toc-generate-or-refresh-toc))

(provide 'markdown)
;;; markdown.el ends here
