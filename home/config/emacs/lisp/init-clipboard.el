;;; init-clipboard.el --- clipboard -*- lexical-binding: t; -*-

(setq select-enable-primary t
      select-enable-clipboard t)

(when (executable-find "wl-copy")
  (defun wl-copy (text)
    (let ((p (make-process :name "wl-copy"
                           :command '("wl-copy")
                           :connection-type 'pipe)))
      (process-send-string p text)
      (process-send-eof p)))
  (setq interprogram-cut-function 'wl-copy))

(provide 'init-clipboard)
;;; init-clipboard.el ends here
