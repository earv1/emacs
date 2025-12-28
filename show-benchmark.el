;;; show-benchmark.el --- Show benchmark results -*- lexical-binding: t; -*-

(require 'benchmark-init)

;; Wait for init to complete
(add-hook 'after-init-hook
          (lambda ()
            (message "")
            (message "====================================")
            (message "Top 15 Slowest Packages:")
            (message "====================================")

            ;; Get the benchmark data
            (let ((durations (benchmark-init/durations)))
              ;; Sort by duration (descending)
              (setq durations (sort durations
                                   (lambda (a b)
                                     (> (benchmark-init/node-duration-adjusted a)
                                        (benchmark-init/node-duration-adjusted b)))))

              ;; Print top 15
              (let ((count 0))
                (dolist (node durations)
                  (when (< count 15)
                    (let* ((name (benchmark-init/node-name node))
                           (duration (benchmark-init/node-duration-adjusted node))
                           (type (benchmark-init/node-type node)))
                      (when (> duration 0.001)  ; Only show items > 1ms
                        (message "%2d. %-40s %6.0f ms  [%s]"
                                (1+ count)
                                (truncate-string-to-width (format "%s" name) 40 nil nil t)
                                (* duration 1000)
                                type)
                        (setq count (1+ count))))))))

            (message "====================================")
            (message "")
            (kill-emacs 0)))

;;; show-benchmark.el ends here
