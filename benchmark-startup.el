;;; benchmark-startup.el --- Benchmark startup time -*- lexical-binding: t; -*-

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "===== Emacs Startup Complete =====")
            (message "Loaded in %s with %d garbage collections"
                     (emacs-init-time)
                     gcs-done)
            (message "==================================")
            ;; Show benchmark tree if available
            (when (fboundp 'benchmark-init/show-durations-tree)
              (benchmark-init/show-durations-tree)
              (switch-to-buffer "*benchmark-init results*"))
            ;; Kill emacs after 3 seconds
            (run-at-time 3 nil #'save-buffers-kill-emacs)))

;;; benchmark-startup.el ends here
