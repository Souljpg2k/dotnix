;;; init-clipboard.el --- clipboard -*- lexical-binding: t; -*-

;;; Selection
(setq select-enable-primary t
      select-enable-clipboard t)

;;; Wayland copy
(defun wl-copy (text)
  (let ((p (make-process :name "wl-copy"
                         :command '("wl-copy")
                         :connection-type 'pipe)))
    (process-send-string p text)
    (process-send-eof p)))

(when (executable-find "wl-copy")
  (setq interprogram-cut-function #'wl-copy))

(provide 'init-clipboard)
;;; init-clipboard.el ends here
