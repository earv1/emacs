;;; completion.el --- Completion frameworks -*- lexical-binding: t; -*-
;;; Commentary:
;; Minibuffer completion, in-buffer completion, and snippets

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; Minibuffer completion (Vertico stack)
(use-package vertico
  :demand t
  :init
  (vertico-mode)
  :config
  (setq vertico-cycle t
        vertico-resize t))

;; Rich annotations in the minibuffer
(use-package marginalia
  :demand t
  :init
  (marginalia-mode)
  :config
  ;; Use heavy annotators to show detailed info including keybindings
  (setq marginalia-align 'right
        marginalia-align-offset -1
        marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  ;; Customize to make keybindings more prominent
  (setq marginalia-command-categories
        '((command-palette . command))))

;; Flexible completion style
(use-package orderless
  :demand t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Completion actions and more
(use-package consult
  :bind (;; Search & Navigation
         ("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ("C-x r b" . consult-bookmark)
         ("M-s d" . consult-find)
         ("M-s g" . consult-grep)
         ("M-s r" . consult-ripgrep)
         ;; Command search
         ("M-X" . consult-mode-command)  ; Commands for current mode
         ("C-h a" . consult-apropos)     ; Better apropos
         ;; Marks & Registers
         ("M-g m" . consult-mark)
         ("M-g M" . consult-global-mark)
         ("C-x r r" . consult-register))
  :config
  (setq consult-narrow-key "<"
        consult-preview-key 'any))

;; Embark - contextual actions
(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :config
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;;; In-buffer completion
(use-package company
  :demand t
  :config
  (global-company-mode)
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-require-match nil
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil))

;; Company Evil integration
(use-package company
  :after evil
  :config
  ;; Use C-j/C-k in company completion
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous))

;;; Snippets
(use-package yasnippet
  :demand t
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs '("~/.config/emacs/snippets")))

(use-package yasnippet-snippets
  :after yasnippet)

;;; Better help
(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key)
  ([remap describe-command] . helpful-command))

(provide 'completion)
;;; completion.el ends here
