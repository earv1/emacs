;;; editor.el --- Evil/Vim configuration -*- lexical-binding: t; -*-
;;; Commentary:
;; Evil mode and all vim emulation packages

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'use-package)

;;; Evil mode and related packages
(use-package evil
  :demand t  ; Load immediately, it's core to our setup
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil
        evil-respect-visual-line-mode t
        evil-undo-system 'undo-tree)
  :config
  (evil-mode 1)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  ;; Set C-h to backspace in insert mode
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join))

;; Evil keybindings for many modes
(use-package evil-collection
  :after evil
  :demand t
  :config
  (setq evil-collection-mode-list '(dired ibuffer magit help vterm
                                     dashboard company elfeed
                                     calendar ace-window))
  (evil-collection-init))

;; Undo system for evil
(use-package undo-tree
  :demand t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

;; Surround text objects
(use-package evil-surround
  :after evil
  :demand t
  :config
  (global-evil-surround-mode 1))

;; 2-character search motion
(use-package evil-snipe
  :after evil
  :demand t
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

;; Escape with custom key sequence (jk, etc)
(use-package evil-escape
  :after evil
  :demand t
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "jk"
                evil-escape-delay 0.25))

;; Jump between matching tags/brackets
(use-package evil-matchit
  :after evil
  :commands (global-evil-matchit-mode)
  :config
  (global-evil-matchit-mode 1))

;; Search for visual selection with */#
(use-package evil-visualstar
  :after evil
  :commands (global-evil-visualstar-mode)
  :config
  (global-evil-visualstar-mode))

;; Alignment operator (gl/gL)
(use-package evil-lion
  :after evil
  :commands (evil-lion-mode))

;; Increment/decrement numbers
(use-package evil-numbers
  :commands (evil-numbers/inc-at-pt evil-numbers/dec-at-pt)
  :bind (:map evil-normal-state-map
              ("C-c +" . evil-numbers/inc-at-pt)
              ("C-c -" . evil-numbers/dec-at-pt)))

;; Text object for any block
(use-package evil-textobj-anyblock
  :commands (evil-textobj-anyblock-inner-block evil-textobj-anyblock-a-block)
  :init
  (with-eval-after-load 'evil
    (define-key evil-inner-text-objects-map "b" 'evil-textobj-anyblock-inner-block)
    (define-key evil-outer-text-objects-map "b" 'evil-textobj-anyblock-a-block)))

;; Text objects for function arguments
(use-package evil-args
  :commands (evil-inner-arg evil-outer-arg evil-forward-arg evil-backward-arg evil-jump-out-args)
  :init
  (with-eval-after-load 'evil
    ;; bind evil-args text objects
    (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
    (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
    ;; bind evil-forward/backward-args
    (define-key evil-normal-state-map "L" 'evil-forward-arg)
    (define-key evil-normal-state-map "H" 'evil-backward-arg)
    (define-key evil-motion-state-map "L" 'evil-forward-arg)
    (define-key evil-motion-state-map "H" 'evil-backward-arg)
    ;; bind evil-jump-out-args
    (define-key evil-normal-state-map "K" 'evil-jump-out-args)))

;; Indent text objects
(use-package evil-indent-plus
  :commands (evil-indent-plus-i-indent evil-indent-plus-a-indent
             evil-indent-plus-i-indent-up evil-indent-plus-a-indent-up)
  :init
  (with-eval-after-load 'evil
    (define-key evil-inner-text-objects-map "i" 'evil-indent-plus-i-indent)
    (define-key evil-outer-text-objects-map "i" 'evil-indent-plus-a-indent)
    (define-key evil-inner-text-objects-map "I" 'evil-indent-plus-i-indent-up)
    (define-key evil-outer-text-objects-map "I" 'evil-indent-plus-a-indent-up)))

;; Commenting
(use-package evil-nerd-commenter
  :commands (evilnc-comment-operator)
  :bind (:map evil-normal-state-map
              ("gc" . evilnc-comment-operator)
              :map evil-visual-state-map
              ("gc" . evilnc-comment-operator)))

;; Quick jumping (like easymotion)
(use-package evil-easymotion
  :commands (evilem-default-keybindings)
  :init
  (with-eval-after-load 'evil
    (evilem-default-keybindings "SPC")))

;; Exchange text regions
(use-package evil-exchange
  :commands (evil-exchange evil-exchange-cancel)
  :init
  (with-eval-after-load 'evil
    (evil-exchange-install)))

;;; Multiple cursors
(use-package evil-mc
  :after evil
  :demand t
  :config
  (global-evil-mc-mode 1)
  :bind (:map evil-normal-state-map
              ("C-n" . evil-mc-make-and-goto-next-match)
              ("C-p" . evil-mc-make-and-goto-prev-match)))

;;; Smart parentheses
(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil
        sp-highlight-wrap-overlay nil
        sp-highlight-wrap-tag-overlay nil))

;; Evil integration for smartparens
(use-package evil-smartparens
  :after (evil smartparens)
  :hook (smartparens-enabled . evil-smartparens-mode))

;;; Expand region intelligently
(use-package expand-region
  :bind (("C-=" . er/expand-region)
         ("C--" . er/contract-region)))

;;; Avy - jump to visible text
(use-package avy
  :bind (("C-'" . avy-goto-char-2)
         ("C-:" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)))

(provide 'editor)
;;; editor.el ends here
