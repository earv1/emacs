;;; completion.el --- Completion frameworks -*- lexical-binding: t; -*-
;;; Commentary:
;; Minibuffer completion, in-buffer completion, and snippets

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; Minibuffer completion (Vertico stack)
;; (use-package vertico
;;   :init
;;   (vertico-mode)
;;   :config
;;   (setq vertico-cycle t))

;; Rich annotations in the minibuffer
;; (use-package marginalia
;;   :init
;;   (marginalia-mode))

;; Flexible completion style
;; (use-package orderless
;;   :custom
;;   (completion-styles '(orderless basic))
;;   (completion-category-overrides '((file (styles basic partial-completion)))))

;; Completion actions and more
;; (use-package consult
;;   :bind (("C-s" . consult-line)
;;          ("C-x b" . consult-buffer)
;;          ("C-x 4 b" . consult-buffer-other-window)
;;          ("M-y" . consult-yank-pop)
;;          ("M-g g" . consult-goto-line)))

;; Embark - contextual actions
;; (use-package embark
;;   :bind
;;   (("C-." . embark-act)
;;    ("C-;" . embark-dwim)))

;; (use-package embark-consult
;;   :after (embark consult))

;;; In-buffer completion
;; (use-package company
;;   :config
;;   (global-company-mode)
;;   (setq company-idle-delay 0.1
;;         company-minimum-prefix-length 1
;;         company-selection-wrap-around t))

;;; Snippets
;; (use-package yasnippet
;;   :config
;;   (yas-global-mode 1))

;; (use-package yasnippet-snippets
;;   :after yasnippet)

;;; Better help
;; (use-package helpful
;;   :bind
;;   ([remap describe-function] . helpful-callable)
;;   ([remap describe-variable] . helpful-variable)
;;   ([remap describe-key] . helpful-key)
;;   ([remap describe-command] . helpful-command))

(provide 'completion)
;;; completion.el ends here
