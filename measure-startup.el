;;; measure-startup.el --- Measure startup time -*- lexical-binding: t; -*-

;; This script measures Emacs startup time
(let ((start-time (current-time)))
  (load (expand-file-name "init.el" user-emacs-directory))
  (let* ((end-time (current-time))
         (elapsed (float-time (time-subtract end-time start-time))))
    (message "")
    (message "====================================")
    (message "Emacs Startup Benchmark")
    (message "====================================")
    (message "Total time: %.3f seconds" elapsed)
    (message "Garbage collections: %d" gcs-done)
    (message "====================================")
    (kill-emacs 0)))

;;; measure-startup.el ends here
