;;; init-ui.el --- UI settings -*- lexical-binding: t; -*-

(menu-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(column-number-mode 1)

(setq catppuccin-flavor 'mocha)
(load-theme 'catppuccin :no-confirm)

(set-face-attribute 'default nil :background "unspecified-bg")

(provide 'init-ui)
;;; init-ui.el ends here
