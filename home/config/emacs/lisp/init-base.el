;;; init-base.el --- base settings -*- lexical-binding: t; -*-

;;; Startup
(setq inhibit-startup-message t
      ring-bell-function 'ignore)

;;; Files
(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

(recentf-mode 1)
(save-place-mode 1)

;;; Indentation & display
(setq-default indent-tabs-mode nil
              tab-width 2
              fill-column 80
              truncate-lines t)

;;; Editing
(delete-selection-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)

(provide 'init-base)
;;; init-base.el ends here
