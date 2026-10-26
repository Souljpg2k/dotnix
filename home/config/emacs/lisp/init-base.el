;;; init-base.el --- base settings -*- lexical-binding: t; -*-

(setq inhibit-startup-message t
      ring-bell-function 'ignore
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      y-or-n-p-use-read-key t
      read-char-choice-use-read-key t)

(recentf-mode 1)
(save-place-mode 1)

(setq-default indent-tabs-mode nil
              tab-width 2
              fill-column 80
              truncate-lines t)

(delete-selection-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)

(provide 'init-base)
;;; init-base.el ends here
