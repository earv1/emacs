;;; compile-config.el --- Byte compile configuration -*- lexical-binding: t; -*-
;;; Commentary:
;; Script to byte-compile configuration files
;; NOTE: We don't compile modules/ because they use use-package macros
;; that need straight.el at compile time

;;; Code:

(require 'bytecomp)

(defun compile-config ()
  "Byte-compile configuration files (excluding modules)."
  (interactive)
  (let ((files (directory-files-recursively user-emacs-directory "\\.el$")))
    (dolist (file files)
      ;; Skip: straight, eln-cache, compile-config, and modules directory
      (unless (string-match-p "\\(straight\\|eln-cache\\|compile-config\\|modules/\\)" file)
        (message "Compiling %s..." file)
        (byte-compile-file file)))))

(compile-config)
(message "Compilation complete!")
(message "NOTE: modules/ are intentionally not compiled to avoid use-package macro issues")

;;; compile-config.el ends here
